package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Payment_SELECT;


@WebServlet("/Payment_Filter_Delete_Controller")
public class Payment_Filter_Delete_Controller extends HttpServlet {
	 private String pid;
     private String date;
     private String query;
     private Connection conps;
     private ResultSet rsps;
    
    public Payment_Filter_Delete_Controller() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		pid = request.getParameter("id_");
		
		System.out.println(" this is pid" + pid);
		
		
		query = "SELECT * FROM payment_table WHERE payment_Id= ?";
		conps = ConnectionManager.getConnection();
		
		Payment_SELECT pi = new Payment_SELECT(conps, query);
		rsps = pi.get_payment_table();
		
		request.setAttribute("karma", rsps);
		
		HttpSession session_pi = request.getSession();
		session_pi.setAttribute("change", 1);
		session_pi.setAttribute("payment_id", pid);
		
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Payment_DELETE.jsp");
        dispatcher.forward(request,response);
	}

}