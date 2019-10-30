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
 * Servlet implementation class Delete_Item_Controller
 */
@WebServlet("/Delete_Item_Controller")
public class Delete_Item_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String item_id;

	private Connection coni;
	private String query;
  
    public Delete_Item_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		item_id = request.getParameter(item_id);
		try {
			item_id = request.getParameter("item_id");
			System.out.println("id eka nane bn" + item_id);
			coni = ConnectionManager.getConnection();

			query = "delete from item_details_table where item_id='"+item_id+"'";

			Statement stmt = coni.createStatement();

			int i = stmt.executeUpdate(query);
			if (i > 0) {

				response.sendRedirect("Items_Management.jsp");

			}
			coni.close();
		} catch (Exception e) {
			System.out.println("Try catch error");
			e.printStackTrace();
		}

	}}