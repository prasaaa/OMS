package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;

@WebServlet("/Delete_Emp")
public class Delete_Emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String emp_id;

	private Connection coni;
	private String query;

	public Delete_Emp() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Connection conn = null;

		int emp_id = Integer.parseInt(request.getParameter("emp_id"));

		try {

			conn = ConnectionManager.getConnection();

			String query = "delete from emp where emp_id=" + emp_id;

			Statement stmt = conn.createStatement();

			int i = stmt.executeUpdate(query);
			if (i > 0) {

				response.sendRedirect("Emp_Management.jsp");

			}
			conn.close();
		} catch (Exception e) {
			System.out.println("Try catch error");
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
