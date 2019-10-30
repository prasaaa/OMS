package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Supplier_SELECT;
import com.DatabaseHandle.Supplier_UPDATE;
import com.mysql.cj.Session;


@WebServlet("/Supplier_UPDATE")
public class Supplier_UPDATE_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String uname ;
	private String pass ;
	private Connection consi;
	private String query;
       
  
    public Supplier_UPDATE_Controller() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("came into update controller");
		
		uname = request.getParameter("uname");		
		
		query = "UPDATE login set uname = '"+uname +"' , pass = '" +pass + "'";
		consi =  ConnectionManager.getConnection();
		
		Supplier_UPDATE su =  new Supplier_UPDATE(consi,query);
		
		HttpSession session_update = request.getSession();
		session_update.setAttribute("session_update", 1);
		
		RequestDispatcher dispatcher_update = getServletContext(). getRequestDispatcher("/Supplier_UPDATE.jsp");
        dispatcher_update.forward(request,response);
		
		
		
		
	}

}
