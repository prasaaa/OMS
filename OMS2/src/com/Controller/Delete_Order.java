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


@WebServlet("/Delete_Order")
public class Delete_Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private String customer_Order_Id;

	private Connection coni;
	private String query,query_d;
    
    public Delete_Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;

		String customer_Order_Id = request.getParameter("customer_Order_Id");
		
		try {
			conn = ConnectionManager.getConnection();

			String query_d = "delete from customer_order_items_table where customer_Order_Id='" + customer_Order_Id+"'";
			Statement stmt = conn.createStatement();
			int x = stmt.executeUpdate(query_d);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		

		try {

			conn = ConnectionManager.getConnection();

			String query = "delete from customer_order_table where customer_Order_Id='" + customer_Order_Id+"'";

			Statement stmt = conn.createStatement();

			int i = stmt.executeUpdate(query);
			if (i > 0) {

				response.sendRedirect("Admin_Customer_Order_Conformation.jsp");

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
