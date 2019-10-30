package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Supplier_Order_DELETE;
import com.model.supplierorderdetails;


@WebServlet("/Supplier_Order_DELETE_Controller")
public class Supplier_Order_DELETE_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int firstand;
	private supplierorderdetails sodd= new supplierorderdetails();
	private String query,appendquery;
	private String id,order_Date,recieve_date,supplier_id,type;
    
    public Supplier_Order_DELETE_Controller() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session_pu =  request.getSession();
		System.out.println("in supplier order delete controller");

		firstand =0;
		sodd = new  supplierorderdetails();
		query = "DELETE FROM supplier_order_import_table where ";
		
	    id = (String) session_pu.getAttribute("supplier_Order_Id");
		order_Date = (String) session_pu.getAttribute("orderdate");
		recieve_date = (String) session_pu.getAttribute("recievedate") ;
		supplier_id = (String) session_pu.getAttribute("supid") ;
		type = (String) session_pu.getAttribute("type");
		
		
		sodd.setRecievedate(recieve_date);
		sodd.setOrderdate(order_Date);
		sodd.setSupplierid(supplier_id);
		sodd.setType(type);
		
		
		//adding the  session to where
		if(sodd.getOrderdate().length() >= 1)
		{
			
			query = query +" order_date = '"+order_Date+"' ";
			firstand++;
		}
		if(sodd.getRecievedate().length() >= 1)
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
		if(sodd.getSupplierid().length() >= 1)
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
		if(sodd.getType().length() >= 1)
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
		Supplier_Order_DELETE soud = new Supplier_Order_DELETE(consu, query);
		soud.delete_supplier_order_table();

		response.sendRedirect(request.getContextPath() + "/Supplier_Order_Delete.jsp");
		
	}

}
