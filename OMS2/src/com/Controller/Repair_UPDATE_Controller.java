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

import com.DatabaseHandle.Repair_UPDATE;

@WebServlet("/Repair_UPDATE_Controller")
public class Repair_UPDATE_Controller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	 
	private String cusOrdId;
	private String repairId;
	private String orderdate;
	private  String error;
	private String sessionName;
	private String sessionrepId;
	private String sessiondate;
	private String sessionerror;
	private String sessioncusid;
	private String appendquery;
    private String query;   
    private Connection coniu;
    private  int firstand = 0;
     
    
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("came to the servlet update");
		HttpSession session_iu = request.getSession();
		 System.out.println("came to the servlet update part 2");
	 
		 cusOrdId = request.getParameter("customerselect");
		 orderdate =  request.getParameter("date");
		 error = request.getParameter("error");
		 
		 query = "UPDATE repair_table  set ";
		if(cusOrdId.length() >= 1)
		{
				
			query = query +" customer_Id = '"+cusOrdId+"' ";
			firstand++;
			
		}
		if(orderdate.length() >= 1)
		{
			if(firstand == 0)
			{
				query = query + "  order_Date =  '"+orderdate+"' ";
				firstand++;
			}
			else
			{
				query = query + " , order_Date = ' "+ orderdate+"' ";
			}
			

		}
		if(error.length() >= 1)
		{
			if(firstand ==0)
			{
				query = query + "  error= '"+error+"' ";
			}
			else
			{
				query = query + " , error= '" + error+"' ";
			}

		}
		 query = query +" WHERE ";
	System.out.println("this is the sub q1 " + query);
		
		sessionrepId = (String) session_iu.getAttribute("repairid") ;
		sessiondate = (String) session_iu.getAttribute("orderdate");
		sessionerror = (String) session_iu.getAttribute("error");
		sessioncusid = (String) session_iu.getAttribute("customerid");
		firstand = 0;
		
		if(sessionrepId.length() >= 1)
		{
			
			query = query +" repair_Id = '"+sessionrepId+"' ";
			firstand++;
		}
		if(sessiondate.length() >= 1)
		{
			if(firstand == 0)
			{
				appendquery = "  order_Date = '"+sessiondate+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND order_Date = '"+sessiondate+"' ";
			}
			
			query =  query + appendquery ;
		}
		if(sessionerror.length() >= 1)
		{
			if(firstand ==  0)
			{
				appendquery = "  error= '"+sessionerror+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND  error= '"+sessionerror+"' ";
			}
			
			
			query =  query +  appendquery; 
		}
		if(sessioncusid.length() >= 1)
		{
			if(firstand == 0)
			{
				appendquery = " customer_Id = '"+sessioncusid+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND customer_Id = '"+sessioncusid+"' ";
			}
			
			
			query =  query + appendquery;
		}
	
		System.out.println("this is the query sub2 " + query );
		
		firstand =0;
		coniu = ConnectionManager.getConnection();
		
		Repair_UPDATE iu = new Repair_UPDATE(coniu,query,orderdate,error,cusOrdId);
		iu.update_repair_table();
		
		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Repair_UPDATE.jsp");
		dispatcher.forward(request,response);
		
		
		
		
		
		
	}

}
