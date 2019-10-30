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

/**
 * Servlet implementation class Delete_Cus_Details
 */
@WebServlet("/Delete_Cus_Details")
public class Delete_Cus_Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String customer_Id;
	private String  query;
	private Connection coni;
	private Statement stmt;
	//private String query;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_Cus_Details() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Connection conn = null;
		
		customer_Id = request.getParameter("customer_Id");

		try {

			conn = ConnectionManager.getConnection();
			
		
			query = "delete  from customer_order_table where customer_Id = '"+customer_Id+"'";
			 stmt = conn.createStatement();
			  stmt.executeUpdate(query);
			 
			query = "delete from customer_table where customer_Id='" + customer_Id+"'";
			 stmt = conn.createStatement();
			

			int i = stmt.executeUpdate(query);
			if (i > 0) {

				response.sendRedirect("Customer_Details_Insert.jsp");

			}
			conn.close();
		} catch (Exception e) {
			System.out.println("Try catch error");
			e.printStackTrace();
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
		
	}

}
