package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;

import com.DatabaseHandle.Update_ItemDetails;

/**
 * Servlet implementation class Update_Item_Controller
 */
@WebServlet("/Update_Item_Controller")
public class Update_Item_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String item_id, item_model_name, item_manufacturer, item_type, item_details,item_supplier;
	private Double buying_price,selling_price;
	private Connection coni;
	private String query;
       
   
    public Update_Item_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			
		item_id = request.getParameter("item_id");
		item_model_name = request.getParameter("item_model_name");
		item_manufacturer = request.getParameter("item_manufacturer");
		item_supplier = request.getParameter("item_supplier");
		item_type = request.getParameter("item_type");
		item_details = request.getParameter("item_details");	
		
			/*
			 * buying_price =Double.valueOf(request.getParameter("buying_price"));
			 * selling_price =Double.valueOf(request.getParameter("selling_price"));
			 */		

		coni = ConnectionManager.getConnection();
		query = "update item_details_table set item_model_name = ?,item_manufacturer= ?,item_supplier= ?, item_type =?, item_details = ? where item_id =?";
		
		Update_ItemDetails ei = new Update_ItemDetails(coni, query,item_model_name, item_manufacturer, item_supplier, item_type, item_details,item_id);
		ei.update_item_table();

		response.sendRedirect(request.getContextPath() + "/Items_Management.jsp");
	}
	}
}
