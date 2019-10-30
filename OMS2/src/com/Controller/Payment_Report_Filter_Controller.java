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
import com.DatabaseHandle.Payment_INSERT;
import com.DatabaseHandle.Payment_SELECT;
import com.model.payment;


@WebServlet("/Payment_Report_Filter_Controller")
public class Payment_Report_Filter_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private String date1,date2,type,query;
     private Connection conps;
     private ResultSet rsps;
    
    public Payment_Report_Filter_Controller() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		date1 = request.getParameter("date1");
		date2 = request.getParameter("date2");
		type = request.getParameter("type");
		
		query = "SELECT * FROM payment_table WHERE pay_date between '"+date1+"' AND '"+date2+"'  AND  type = '" +type+"'"   ;
		conps = ConnectionManager.getConnection();
		
		Payment_SELECT pi = new Payment_SELECT(conps, query);
		rsps = pi.get_payment_table();
		
		
		
		HttpSession session_pi = request.getSession();
		session_pi.setAttribute("karma", rsps);
		session_pi.setAttribute("change", 1);
		
		response.sendRedirect(request.getContextPath() + "/Payment_Report.jsp");
//		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Payment_UPDATE.jsp");
//        dispatcher.forward(request,response);
	}

}
