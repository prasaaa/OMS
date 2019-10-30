package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Payment_DELETE;



@WebServlet("/Payment_DELETE_Controller")
public class Payment_DELETE_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private String payment_Id;
     private String query;
     private String sessionname;
       
    
    public Payment_DELETE_Controller() {
        super();
        
    }

	
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session_pu =  request.getSession();
		System.out.println("in payment delete controller");
		System.out.println( session_pu.getAttribute("payment_id"));
		
		sessionname = (String) session_pu.getAttribute("payment_Id");
		
		query = "DELETE FROM payment_table WHERE payment_Id= ?";
		Connection conpu = ConnectionManager.getConnection();
		
		Payment_DELETE pi = new Payment_DELETE(conpu,query,sessionname);
		
		pi.delete_payment_table();
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Payment_DELETE.jsp");
        dispatcher.forward(request,response);
		
	}

}
