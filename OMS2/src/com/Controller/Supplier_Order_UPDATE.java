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

import com.DatabaseHandle.Supplier_UPDATE;
import com.model.supplierorderdetails;


@WebServlet("/Supplier_Order_UPDATE")
public class Supplier_Order_UPDATE extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private supplierorderdetails sod ;
    private String id;
    private String query,appendquery;
    private String order_Date; 
    private String recieve_date;
    private String supplier_id;
    private String type;
    private int firstand ;
	 
   
    public Supplier_Order_UPDATE() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session_pu =  request.getSession();
		System.out.println("in supplier order update controller");
		System.out.println( session_pu.getAttribute("supplier_Order_Id"));
		
		
		firstand =0;
		sod = new  supplierorderdetails();
		sod.setRecievedate(request.getParameter("rec_date"));
		sod.setOrderdate(request.getParameter("ord_date"));
		sod.setSupplierid(request.getParameter("supplierselect"));
		sod.setType( request.getParameter("type_up"));
	
		if( sod.getOrderdate().length() < 1 && sod.getRecievedate().length() < 1 && sod.getSupplierid().length() < 1 && sod.getType().length() < 1)	
		{
			query = "SELECT * FROM supplier_order_import_table  set ";
		}
		else
		{
			
			query ="update supplier_order_import_table set ";
			
			
			if(sod.getOrderdate().length() >= 1)
			{
				
				appendquery = " order_date = '"+ sod.getOrderdate() +"' ";
				firstand++;	
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
					appendquery = " , recieve_date= '"+sod.getRecievedate()+"' ";
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
					appendquery = ",  supplier_id = '"+sod.getSupplierid()+"' ";
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
					appendquery = " , type = '"+sod.getType()+"' ";
				}
				query =  query + appendquery;
			}
		}
		
		query = query + " WHERE ";
		
		id = (String) session_pu.getAttribute("supplier_Order_Id");
		order_Date=(String) session_pu.getAttribute("orderdate");
		recieve_date =(String) session_pu.getAttribute("recievedate") ;
		supplier_id=(String) session_pu.getAttribute("supid") ;
		type =(String) session_pu.getAttribute("type");
		firstand =0;
		
		//adding the  session to where
		if(order_Date.length() >= 1)
		{
			
			query = query +" order_date = '"+order_Date+"' ";
			firstand++;
		}
		if(recieve_date.length() >= 1)
		{
			if(firstand == 0)
			{
				appendquery = "  recieve_date = '"+recieve_date+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND recieve_date = '"+recieve_date+"' ";
			}
			
			query =  query + appendquery ;
		}
		if(supplier_id.length() >= 1)
		{
			if(firstand ==  0)
			{
				appendquery = "   supplier_id = '"+supplier_id+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND   supplier_id = '"+ supplier_id +"' ";
			}
			
			
			query =  query +  appendquery; 
		}
		if(type.length() >= 1)
		{
			if(firstand == 0)
			{
				appendquery = " type = '"+type+"' ";
				firstand++;
			}
			else
			{
				appendquery = " AND type = '"+type+"' ";
			}
			
			
			query =  query + appendquery;
		}
	
		System.out.println("this is the query sub2 " + query );
		
		firstand =0;
		
		System.out.println("order date "+ order_Date);
		System.out.println("rcieve date "+ recieve_date);
		System.out.println("supplier id "+ supplier_id);
		System.out.println("type  "+ type);
		System.out.println("id "+ id);
		
		System.out.println("user input________________-----------");
		System.out.println("order date "+ order_Date);
		System.out.println("rcieve date "+ recieve_date);
		System.out.println("supplier id "+ supplier_id);
		System.out.println("type  "+ type);
		System.out.println("id "+ id);

	    Connection consu = ConnectionManager.getConnection();
		com.DatabaseHandle.Supplier_Order_UPDATE sou = new com.DatabaseHandle.Supplier_Order_UPDATE(consu, query);
		sou.update_supplier_order_table();

		response.sendRedirect(request.getContextPath() + "/Supplier_Order_UPDATE.jsp");
	}

}
