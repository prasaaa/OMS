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

import com.DatabaseHandle.Repair_INSERT;


@WebServlet("/Repair_INSERT")
public class Repair_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 
        

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		String query;
		String customerid;
		String error;
	
		Connection conii;
		
		customerid = request.getParameter("customerselect");

		error = request.getParameter("error");

		conii = ConnectionManager.getConnection();
		

		query = "INSERT INTO repair_table(repair_Id, order_Date,error, customer_Id) VALUES(?,?,?,?)";
		
		Repair_INSERT ri = new Repair_INSERT(conii, query, customerid, error);
		
		ri.insert_repair_table();
		
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Repair_INSERT.jsp");
        dispatcher.forward(request,response);
        
		
		doGet(request, response);
	}

       
 

}
