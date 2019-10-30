package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Emp_INSERT;
import com.DatabaseHandle.Emp_Update;

@WebServlet("/Update_Emp")
public class Update_Emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String emp_id;
	private String emp_name, emp_address, emp_gender, emp_birth, emp_phone, emp_type, emp_email;
	private Connection coni;

	public ResultSet rs;
	private PreparedStatement ps = null;
	private String query;

	public Update_Emp() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			emp_id = request.getParameter("emp_id");
			emp_name = request.getParameter("emp_name");
			emp_address = request.getParameter("emp_address");
			emp_gender = request.getParameter("emp_gender");
			emp_birth = request.getParameter("emp_birth");
			emp_phone = request.getParameter("emp_phone");
			emp_type = request.getParameter("emp_type");
			emp_email = request.getParameter("emp_email");


			coni = ConnectionManager.getConnection();
			query = "update emp set emp_name = ?,emp_address= ?, emp_gender =?, emp_birth = ?,emp_phone= ?, emp_type =?, emp_email =? where emp_id =?";
			
			
			Emp_Update eu = new Emp_Update(coni, query, emp_name, emp_address, emp_gender, emp_birth, emp_phone, emp_type,emp_email,Integer.parseInt( emp_id));
			eu.update_Emp_table();
			
			System.out.println("updated");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Emp_Management.jsp");
			dispatcher.forward(request, response);

		
	}}
}
