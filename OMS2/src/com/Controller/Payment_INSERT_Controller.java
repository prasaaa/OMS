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
import com.DatabaseHandle.Payment_INSERT;


@WebServlet("/Payment_INSERT_Controller")
public class Payment_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Payment_INSERT_Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("came to severlet");
		String id;
		String date;
		String query;
		Connection conpi;
		
		id = request.getParameter("pid");
		date = request.getParameter("date");
		System.out.println("came after getting values");
		conpi = ConnectionManager.getConnection();
		
		query = "INSERT INTO payment_table(payment_Id,date) VALUES(?,?)";
		System.out.println("came after query");
		//Payment_INSERT pi = new Payment_INSERT(conpi, query,id,date);
		System.out.println("came after pi");
		//pi.insert_payment_table();
		System.out.println("came after insert payment");
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Payment_Insert.jsp");
        dispatcher.forward(request,response);
	}

}
