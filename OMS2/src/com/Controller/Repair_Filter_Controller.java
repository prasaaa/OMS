package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Repair_SELECT_Main;
import com.model.Repairdetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;


/**
 * Servlet implementation class Repair_Filter_Controller
 */
@WebServlet("/Repair_Filter_Controller")
public class Repair_Filter_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private Repairdetails rd ;
     private String query;
     private Integer firstand = 0;
     private String appendquery;
    public Repair_Filter_Controller() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		rd =  new Repairdetails(request.getParameter("repairid"), request.getParameter("orderdate"), request.getParameter("error"), request.getParameter("customerid"));

		query = "SELECT * FROM  repair_table WHERE  ";
		
		if(rd.getRepairid().length() >= 1)
		{
			
			query = query +" repair_Id = '"+rd.getRepairid()+"' ";
			firstand++;
		}
		if(rd.getOrderdate().length() >= 1)
		{
			if(firstand == 0)
			{
				appendquery = " order_Date = '"+rd.getOrderdate()+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND order_Date = '"+rd.getOrderdate()+"' ";
			}
			query =  query + appendquery ;
		}
		if(rd.getError().length() >= 1)
		{
			if(firstand == 0 )
			{
				appendquery = " error= '"+rd.getError()+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND error= '"+rd.getError()+"' ";
			}
			query =  query +  appendquery; 
		}
		if(rd.getCustomerid().length() >= 1)
		{
			if(firstand == 0 )
			{
				appendquery = " customer_Id = '"+rd.getCustomerid()+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND customer_Id = '"+rd.getCustomerid()+"' ";
			}
			query =  query + appendquery;
		}
		 System.out.println("this is the query " + query); 
		Connection conps = ConnectionManager.getConnection();
		Repair_SELECT_Main pi = new Repair_SELECT_Main(conps, query);
		ResultSet rsps = pi.get_repair_table();
	
	    //request.setAttribute("karma", rsps);
		
		HttpSession session_pi = request.getSession();
		session_pi.setAttribute("karma", rsps);
		session_pi.setAttribute("change", 1);
		session_pi.setAttribute("repairid", rd.getRepairid());
		session_pi.setAttribute("orderdate", rd.getOrderdate());
		session_pi.setAttribute("error", rd.getError());
		session_pi.setAttribute("customerid", rd.getCustomerid());
		firstand = 0;
		response.sendRedirect(request.getContextPath() + "/Repair_UPDATE.jsp");
		
		
	}

}
