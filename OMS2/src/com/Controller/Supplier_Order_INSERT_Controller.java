package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Main_SELECT;
import com.DatabaseHandle.Supplier_CONFIRM_STOCK;
import com.DatabaseHandle.Supplier_Order_INSERT;
import com.model.Supplier_Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;


@WebServlet("/Supplier_Order_INSERT_Controller")
public class Supplier_Order_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String supplier_Id;
	private String estimated_Date;
	private double buying_price;
	private double buying_totalprice =0 ;
	private String item_name ;
	private int item_quantity;
	private double item_quantity_double;
	private int counter; // to get the counter of the input tags
	private HashMap<String, Integer> store_item_details = new HashMap<String, Integer>();  
	private HashMap<String, String> supplier_type_hashmap = new HashMap<String, String>(); 
	private String supplier_type;
	private ResultSet item_resultset;
	
	
   
    public Supplier_Order_INSERT_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection csoi = ConnectionManager.getConnection();
		 buying_totalprice =0 ;
		 
		supplier_Id = request.getParameter("supplierselect");
		estimated_Date = request.getParameter("date");
		HttpSession I_OR_L_get =  request.getSession();
		supplier_type_hashmap =(HashMap)  I_OR_L_get.getAttribute("supplier_hash");
		supplier_type =  supplier_type_hashmap.get(supplier_Id);

		counter = 1;
        item_name = request.getParameter(counter + "item");
        if (request.getParameter(counter + "quantity") != null) {
            item_quantity = Integer.parseInt(request.getParameter(counter + "quantity"));
            item_quantity_double = Double.parseDouble(request.getParameter(counter + "quantity"));
			
		}
		
		while(item_name != null)
		{
			//check wther the item is already in the hashmap otherwise old value will be replae by the new quanitty
			if(! store_item_details.containsKey(item_name))
			{
				store_item_details.put(item_name,item_quantity);
			}
			else
			{
				store_item_details.put(item_name,store_item_details.get(item_name) + item_quantity);
			}
			store_item_details.put(item_name,item_quantity);
			Main_SELECT mssoi = new Main_SELECT(csoi,"SELECT selling_price,buying_price from item_details_table where item_id ='"+ item_name+"'");
			item_resultset = mssoi.get_table();
			try {
			while(item_resultset.next())
			{
			
				buying_price =  item_resultset.getDouble("buying_price");
				
			}
			}catch (Exception e) {
				
				System.out.println("error in fetching item details " + e);
			}
			System.out.println("this is the price of "+ item_name + " this is the selling price " +   " and buying price " + buying_price );
			
			buying_totalprice =  buying_totalprice + buying_price * item_quantity_double;
			counter++;
            item_name = request.getParameter(counter + "item");
            if (request.getParameter(counter + "quantity") != null)
			{
                item_quantity = Integer.parseInt(request.getParameter(counter + "quantity"));
                item_quantity_double = Double.parseDouble(request.getParameter(counter + "quantity"));
			}
			
			
		}
		
		System.out.println(store_item_details);
		System.out.println(supplier_type_hashmap);
		System.out.println("this is sup type " + supplier_type);
		System.out.println("this is the buying tot price " + buying_totalprice);
		
		
		Supplier_Order_INSERT so = new Supplier_Order_INSERT(csoi, supplier_Id, estimated_Date, store_item_details,buying_totalprice,supplier_type);	
		so.insert_supplier_order_table();
		
		if(Supplier_Order.getInuse().equals("use"))
		{
			Supplier_Order.setInuse("");
			
			Supplier_CONFIRM_STOCK scs =  new Supplier_CONFIRM_STOCK(csoi, store_item_details, Supplier_Order.getCustomer_order_id());
			scs.updatesuplierorderimportitemstable();
			Supplier_Order.setSr(null);
			Supplier_Order.setCustomer_order_id("");
			store_item_details.clear();
			response.sendRedirect(request.getContextPath() +"/Admin_Customer_Order_Conformation.jsp" );
		}
		else
		{
			store_item_details.clear();
			response.sendRedirect(request.getContextPath() +"/Supplier_Order_Insert.jsp" );
		}
		
	}

}
