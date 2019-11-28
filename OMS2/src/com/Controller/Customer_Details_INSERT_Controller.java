package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Customer_INSERT;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;



@WebServlet("/Customer_Details_INSERT_Controller")
public class Customer_Details_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String cus_name ;
	private String cus_address ;
	private String cus_phone;
	private Connection coni;
	private String query;
    
    
    public Customer_Details_INSERT_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		cus_name=request.getParameter("cus_name");
		cus_address=request.getParameter("cus_address");
		cus_phone=request.getParameter("cus_phone");
		
		System.out.println("came dopost");
		
		coni = ConnectionManager.getConnection();
		
		System.out.println("con");
		
		query = "insert into current_customer(cus_name,cus_address,cus_phone) values(?,?,?)";
		
		System.out.println("q ava");
		
		Customer_INSERT ei =new Customer_INSERT(coni,query,cus_name,cus_address,cus_phone);
        ei.insert_customer_table();

        System.out.println("came dopost");
		
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Customer_Details_INSERT.jsp");
        dispatcher.forward(request,response);
	}

}
