package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Customer_INSERT;


@WebServlet("/Customer_INSERT_Controller")
public class Customer_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String companyname;
	private String location;
	private String branch;
	private String queryci;

	private Connection conci;
       

    public Customer_INSERT_Controller() {
        super();
     
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		companyname =request.getParameter("name");
		location = request.getParameter("location");
		branch= request.getParameter("branch");
		conci = ConnectionManager.getConnection();
		
		queryci = "INSERT INTO customer_table(customer_Id,customer_Name,location,branch) VALUES(?,?,?,?)";
		Customer_INSERT ci =  new Customer_INSERT(conci, queryci,companyname,location,branch);
		ci.insert_customer_table();
		
		response.sendRedirect(request.getContextPath() + "/Customer_Details_Insert.jsp");
		
		
		
	}

}
