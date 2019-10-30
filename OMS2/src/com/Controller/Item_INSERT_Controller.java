package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Emp_INSERT;
import com.DatabaseHandle.Item_INSERT;


@WebServlet("/Item_INSERT_Controller")
public class Item_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String item_model_name, item_manufacturer, item_type, item_details,item_id,item_supplier;
	private Connection coni;
	private String query;

    public Item_INSERT_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		item_model_name = request.getParameter("item_model_name");
		item_manufacturer = request.getParameter("item_manufacturer");
		item_supplier= request.getParameter("item_supplier");
		item_type = request.getParameter("item_type");
		item_details = request.getParameter("item_details");
		
		
		item_id=item_type+"_"+item_model_name+"_"+item_manufacturer+"_"+item_supplier;

		coni = ConnectionManager.getConnection();
		query = "insert into item_details_table (item_id,item_model_name,item_manufacturer,item_supplier,item_type,item_details) values(?,?,?,?,?,?)";

		Item_INSERT ei = new Item_INSERT(coni, query,item_id,item_model_name, item_manufacturer, item_supplier, item_type, item_details);
		ei.insert_item_table();

		response.sendRedirect(request.getContextPath() + "/Items_Management.jsp");
		
	}

}
