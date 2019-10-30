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
import com.DatabaseHandle.Supplier_SELECT;
import com.model.supplierorderdetails;


@WebServlet("/Supplier_Order_Filter_Controller")
public class Supplier_Order_Filter_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private supplierorderdetails sod ;
    private int feature;
    private String checkupdel;
    private ResultSet rsco;
    private String query;
    private int firstand;
    private String appendquery;
    private Connection consou;
      
 
    public Supplier_Order_Filter_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		checkupdel = request.getParameter("updel");
		System.out.println("this is check " + checkupdel);

		firstand =0;
		sod = new supplierorderdetails(request.getParameter("sup_order_id"),request.getParameter("order_date"), request.getParameter("recieve_date"), request.getParameter("sup_id"), request.getParameter("type"));

		if(sod.getSupplier_order_id().length() < 1 && sod.getOrderdate().length() < 1 && sod.getRecievedate().length() < 1 && sod.getSupplierid().length() < 1 && sod.getType().length() < 1)
			
		{
			query = "SELECT * FROM supplier_order_import_table  ";
		}
		else
		{
			
			query = "SELECT * FROM supplier_order_import_table WHERE ";
			
			if(sod.getSupplier_order_id().length() >= 1)
			{
				
				query = query +" supplier_order_im_id = '"+sod.getSupplier_order_id()+"' ";
				firstand++;
			}
			if(sod.getOrderdate().length() >= 1)
			{
				if(firstand == 0)
				{
					appendquery = " order_date = '"+ sod.getOrderdate() +"' ";
					firstand++;
				}
				else
				{
					appendquery = " AND order_date = '"+ sod.getOrderdate()+"' ";
				}
				query =  query + appendquery ;
			}
			if(sod.getRecievedate().length() >= 1)
			{
				if(firstand == 0 )
				{
					appendquery = " recieve_date= '"+sod.getRecievedate()+"' ";
					firstand++;
				}
				else
				{
					appendquery = " AND recieve_date= '"+sod.getRecievedate()+"' ";
				}
				query =  query +  appendquery; 
			}
			if(sod.getSupplierid().length() >= 1)
			{
				if(firstand == 0 )
				{
					appendquery = " supplier_id = '"+sod.getSupplierid()+"' ";
					firstand++;
				}
				else
				{
					appendquery = " AND supplier_id = '"+sod.getSupplierid()+"' ";
				}
				query =  query + appendquery;
			}
			if(sod.getType().length() >= 1)
			{
				if(firstand == 0 )
				{
					appendquery = " type = '"+sod.getType()+"' ";
					firstand++;
				}
				else
				{
					appendquery = " AND type = '"+sod.getType()+"' ";
				}
				query =  query + appendquery;
			}
		}
		consou = ConnectionManager.getConnection();
		System.out.println("this is the query " + query);
		Supplier_SELECT sou = new Supplier_SELECT(consou, query);
		rsco = sou.get_supplier_table();
		
		//request.setAttribute("karma", rsco);
		
		System.out.println("came after karma");
		
		
		HttpSession session_sou = request.getSession();
		session_sou.setAttribute("karma", rsco);
		session_sou.setAttribute("change", 1);
		session_sou.setAttribute("supplier_Order_Id", sod.getSupplier_order_id());
		session_sou.setAttribute("orderdate", sod.getOrderdate());
		session_sou.setAttribute("recievedate", sod.getRecievedate());
		session_sou.setAttribute("supid",sod.getSupplierid());
		session_sou.setAttribute("type", sod.getType());

		
		if(checkupdel == null)
		{
			System.out.println("came to the if@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			response.sendRedirect(request.getContextPath() + "/Supplier_Order_UPDATE.jsp");
			
			
		}
		else if(checkupdel.equals("rep"))
		{
			response.sendRedirect(request.getContextPath() + "/Supplier_Report.jsp");
		}
		else {	
			response.sendRedirect(request.getContextPath() + "/Supplier_Order_Delete.jsp");
		
		}
		 
//		
//		RequestDispatcher dispatcher = getServletContext(). getRequestDispatcher("/Supplier_Order_UPDATE.jsp");
//        dispatcher.forward(request,response);
	}

}
