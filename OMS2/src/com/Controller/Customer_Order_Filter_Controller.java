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
import com.DatabaseHandle.Customer_Order_SELECT;
import com.DatabaseHandle.Main_SELECT;


@WebServlet("/Customer_Order_Filter_Controller")
public class Customer_Order_Filter_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String date1,date2;
    
    private ResultSet rsco;
    private String query;
    private Connection conps;
    
   
    public Customer_Order_Filter_Controller() {
        super();
  
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		date1 =  request.getParameter("date1");
		date2 =  request.getParameter("date2");
		
		query = "SELECT * FROM customer_order_table WHERE  order_Date between '"+date1+"' AND '"+date2+"'";
		conps = ConnectionManager.getConnection();
		
		Main_SELECT pi = new Main_SELECT(conps, query);
		rsco = pi.get_table();
		
		
		
		HttpSession session_pico = request.getSession();
		session_pico.setAttribute("change", 1);
		session_pico.setAttribute("karma", rsco);
		response.sendRedirect(request.getContextPath() + "/Customer_Order_Insert.jsp");
	}

}
