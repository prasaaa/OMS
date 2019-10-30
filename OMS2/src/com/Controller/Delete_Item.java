package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;

/**
 * Servlet implementation class Delete_Item
 */
@WebServlet("/Delete_Item")
public class Delete_Item extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String customer_Order_Id,item_Details_Id;
	
	
       
    
    public Delete_Item() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Connection conn = null;
		customer_Order_Id = request.getParameter("customer_Order_Id");
		item_Details_Id = request.getParameter("item_Details_Id");
		try {

			conn = ConnectionManager.getConnection();

			String query = "delete from customer_order_items_table where customer_Order_Id ='"+customer_Order_Id+"' and item_Details_Id = '"+item_Details_Id+"'" ;

			Statement stmt = conn.createStatement();

			int i = stmt.executeUpdate(query);
			if (i > 0) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ConformOrder_Update.jsp");
				dispatcher.forward(request, response);
				/* response.sendRedirect("ConformOrder_Update.jsp"); */

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
