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


@WebServlet("/Order_Emp_Status_change")
public class Order_Emp_Status_change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String emp_id_selected;

	private Connection coni;
	private String query;
	
    public Order_Emp_Status_change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String customer_Order_Id = request.getParameter("customer_Order_Id");

		try {

			coni = ConnectionManager.getConnection();

			/*
			 * String query =
			 * "update omsdb_customer_order_table set order_Emp_Status ='Assign' where customer_Order_Id ='"
			 * + emp_id_selected+"'";
			 * 
			 * INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');
			 */
			
			String query = "update customer_order_table set order_Emp_Status ='Assign' where customer_Order_Id ='" + customer_Order_Id+"'";
			
			
			Statement stmt = coni.createStatement();

			int i = stmt.executeUpdate(query);
			if (i > 0) {

				response.sendRedirect(request.getContextPath() + "/IT_Manager_Assign_Emp.jsp");

			}
			coni.close();
		} catch (Exception e) {
			System.out.println("Try catch error "+e);
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
