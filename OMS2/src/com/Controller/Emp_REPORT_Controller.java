package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Main_SELECT;


@WebServlet("/Emp_REPORT_Controller")
public class Emp_REPORT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String startdate,enddate,query;
	private ResultSet rsemp;
	private Connection conemp;
       
    
    public Emp_REPORT_Controller() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		startdate =  request.getParameter("startdate");
		enddate = request.getParameter("enddate");
		System.out.println("startdate " + startdate + " enddate " + enddate);
		query = "select * from job_table  WHERE (start_data  BETWEEN +'"+startdate+"' AND '"+enddate+"') AND (end_date BETWEEN  '"+startdate+"' AND '"+enddate+"')";
		 conemp = ConnectionManager.getConnection();
		
		Main_SELECT ms = new Main_SELECT(conemp, query);
		rsemp = ms.get_table();
		
		HttpSession session_emp = request.getSession();
		session_emp.setAttribute("karma", rsemp);
		session_emp.setAttribute("change", 1);
		
		response.sendRedirect(request.getContextPath() +"/Emp_REPORT.jsp");
		
		
	}

}
