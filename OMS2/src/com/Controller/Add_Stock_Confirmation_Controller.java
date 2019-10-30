package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Main_SELECT;
import com.model.Supplier_Order;


@WebServlet("/Add_Stock_Confirmation_Controller")
public class Add_Stock_Confirmation_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private String query;
    private String cus_order_id;
    private Connection cs;
    private ResultSet rs;
   
    public Add_Stock_Confirmation_Controller() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cus_order_id = request.getParameter("customer_Order_Id");
		//CUS00042019_10_01_11_47_10
		query =  "SELECT * FROM customer_order_items_table where customer_Order_Id ='"+cus_order_id+"' AND  need  IS NOT NULL";
		System.out.println("this is customer order id " + cus_order_id);
		cs= ConnectionManager.getConnection();
		Main_SELECT mss = new Main_SELECT(cs, query);
		Supplier_Order.setSr(mss.get_table());
		Supplier_Order.setInuse("use");
		Supplier_Order.setCustomer_order_id(cus_order_id);
		response.sendRedirect(request.getContextPath() + "/Supplier_Order_Insert.jsp");
	}

}
