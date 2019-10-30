package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Customer_order_INSERT;
import com.DatabaseHandle.Main_SELECT;


@WebServlet("/Customer_Order_Insert_Controller")
public class Customer_Order_Insert_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String customer_Id;
	private String required_Date;
	private String order_type;
	private String item_name ;
	private int item_quantity;
	private int counter; // to get the counter of the input tags
	private HashMap<String, Integer> store_item_details = new HashMap<String, Integer>();
	private ResultSet item_resultset;
	private double buying_price;
       
    
    public Customer_Order_Insert_Controller() {
        super();
        
    }
    
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		customer_Id = request.getParameter("customerselect");
		required_Date = request.getParameter("date");
		order_type =  request.getParameter("order_type"); 
		Connection ccoic = ConnectionManager.getConnection();
		counter = 1;
		item_name = request.getParameter(String.valueOf(counter)+"item");
		if(request.getParameter(String.valueOf(counter)+"quantity") != null)
		{
			item_quantity =  Integer.parseInt(request.getParameter(String.valueOf(counter)+"quantity"));
		}
		
		while(item_name != null)
		{
			if(! store_item_details.containsKey(item_name))
			{
				store_item_details.put(item_name,item_quantity);
			}
			else {
				store_item_details.put(item_name, store_item_details.get(item_name) + item_quantity);
			}
			Main_SELECT mssoi = new Main_SELECT(ccoic,"SELECT selling_price,buying_price from item_details_table where item_id ='"+ item_name+"'");
			item_resultset = mssoi.get_table();
			try {
			while(item_resultset.next())
			{
			
				buying_price =  item_resultset.getDouble("buying_price");
				
			}
			}catch (Exception e) {
				
				System.out.println("error in fetching item details " + e);
			}
			counter++;
			item_name = request.getParameter(String.valueOf(counter)+"item");
			if(request.getParameter(String.valueOf(counter)+"quantity") != null)
			{
				item_quantity =  Integer.parseInt(request.getParameter(String.valueOf(counter)+"quantity"));
			}
			
			
		}
		System.out.println(store_item_details);
		
		
		Customer_order_INSERT coi = new Customer_order_INSERT(ccoic, customer_Id, required_Date, store_item_details,order_type,buying_price);
		
		coi.insert_customer_order_table();
		store_item_details.clear();
		
		response.sendRedirect(request.getContextPath() + "/Customer_Order_Insert.jsp" );
		
	}

}
