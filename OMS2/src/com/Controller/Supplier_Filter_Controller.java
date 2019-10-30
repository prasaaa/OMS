package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Supplier_SELECT;
;


@WebServlet("/Supplier_Filter_Controller")
public class Supplier_Filter_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String uname ;
	private String pass ;
	private Connection consi;
	private String query;
	public ResultSet rsss;
	
 
    public Supplier_Filter_Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("came into filter");
		
		uname = request.getParameter("uname");
		
		pass= request.getParameter("pass");
		
		query = "select * from login where uname = '"+uname +"' OR pass = '" +pass + "'";
		consi =  ConnectionManager.getConnection();
		
		Supplier_SELECT ss =  new Supplier_SELECT(consi,query);
		
		rsss = ss.get_supplier_table();
		
		
		HttpSession session =  request.getSession();
		session.setAttribute("test", 1);

		request.setAttribute("ss", ss);
	
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Supplier_UPDATE.jsp");
        dispatcher.forward(request,response);
        
	
	}

}
