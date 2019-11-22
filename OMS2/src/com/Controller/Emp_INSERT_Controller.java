package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Emp_INSERT;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;


@WebServlet("/Emp_INSERT_Controller")
public class Emp_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String emp_name, emp_address, emp_gender, emp_birth, emp_phone, emp_type, emp_email,emp_password;
	private Connection coni;
	private String query;

	public Emp_INSERT_Controller() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		emp_name = request.getParameter("emp_name");
		emp_address = request.getParameter("emp_address");
		emp_gender = request.getParameter("emp_gender");
		emp_birth = request.getParameter("emp_birth");
		emp_phone = request.getParameter("emp_phone");
		emp_type = request.getParameter("emp_type");
		emp_email = request.getParameter("emp_email");
		emp_password = request.getParameter("emp_password");

		coni = ConnectionManager.getConnection();
		query = "insert into emp (emp_name,emp_address,emp_gender,emp_birth,emp_phone,emp_type,emp_email,emp_password) values(?,?,?,?,?,?,?,?)";

		Emp_INSERT ei = new Emp_INSERT(coni, query, emp_name, emp_address, emp_gender, emp_birth, emp_phone, emp_type,
				emp_email,emp_password);
		ei.insert_Emp_table();

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Emp_Management.jsp");
		dispatcher.forward(request, response);
	}

}
