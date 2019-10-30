package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Cus_Details_Update;


/**
 * Servlet implementation class Update_Cus_Details
 */
@WebServlet("/Update_Cus_Details")
public class Update_Cus_Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String customer_Id, customer_Name, location, branch;
	private Connection coni;

	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;
    public Update_Cus_Details() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			customer_Id = request.getParameter("customer_Id");
			customer_Name = request.getParameter("customer_Name");
			location = request.getParameter("location");
			branch = request.getParameter("branch");
			


			coni = ConnectionManager.getConnection();
			query = "update customer_table set customer_Name = ?,location= ?, branch =? where customer_Id =?";
			
			
			Cus_Details_Update cu = new Cus_Details_Update(coni, query, customer_Name, location, branch, customer_Id);
			cu.update_Cus_Details_table();
			
			System.out.println("updated");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Customer_Details_Insert.jsp");
			dispatcher.forward(request, response);

		
	}}
}