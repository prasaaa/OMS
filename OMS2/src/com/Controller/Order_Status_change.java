package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;


@WebServlet("/Order_Status_change")
public class Order_Status_change extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String customer_Order_Id;

	private Connection coni;
	private String query;
    
    public Order_Status_change() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());Connection conn = null;

		 customer_Order_Id = request.getParameter("customer_Order_Id");

		try {

			coni = ConnectionManager.getConnection();

			 query = "update customer_order_table set order_Status ='Confirm' where customer_Order_Id ='" + customer_Order_Id+"'";
			
			
			Statement stmt = coni.createStatement();

			int i = stmt.executeUpdate(query);
			if (i > 0) {

				response.sendRedirect("Admin_Customer_Order_Conformation.jsp");

			}
			coni.close();
		} catch (Exception e) {
			System.out.println("Try catch error "+e);
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
