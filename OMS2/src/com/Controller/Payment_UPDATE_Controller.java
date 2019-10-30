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
import com.DatabaseHandle.Payment_INSERT;
import com.DatabaseHandle.Payment_SELECT;
import com.DatabaseHandle.Payment_UPDATE;
import com.DatabaseHandle.Report_PRINT;
import com.model.payment;
import com.mysql.cj.Session;


@WebServlet("/Payment_UPDATE_Controller")
public class Payment_UPDATE_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private payment pay ;   
	private String Customerorderid ;
    private String query;
    private Double Itemcost ;
    private Double Totalprice;
    
    
    public Payment_UPDATE_Controller() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conpu = ConnectionManager.getConnection();
		Itemcost = Double.parseDouble( request.getParameter("itemcost"));
		Customerorderid =  request.getParameter("customerorderid");
		Totalprice =  Itemcost + Double.parseDouble( request.getParameter("price_"));
		
		System.out.println("this is the next payment " + request.getParameter("next_pay_"));
		System.out.println("this is the tot " + Totalprice);
		pay =  new payment(request.getParameter("id_"), request.getParameter("price_"), "paid", request.getParameter("type_"),  request.getParameter("next_pay_"));
		if( pay.getDue_date().length() > 2)
		{
			
			query = "Update payment_table set total = "+Totalprice +",   pay_date = '"+pay.getPaydate()+"' , price = '"+ pay.getPrice()+"' , status = '"+ pay.getStatus()+"' , type = '"+ pay.getType()+"' , due_date = '"+pay.getDue_date()+"' where payment_Id = '"+pay.getPaymentid()+"'";
		}
		else
		{
			query = "Update payment_table set total = "+Totalprice +",   pay_date = '"+pay.getPaydate()+"' , price = '"+ pay.getPrice()+"' , status = '"+ pay.getStatus()+"' , type = '"+ pay.getType()+"'  where payment_Id = '"+pay.getPaymentid()+"'";

		}
		Payment_UPDATE pi = new Payment_UPDATE(conpu, query);
		
		pi.update_payment_table();
		Report_PRINT rp = new Report_PRINT();
		rp.PaymentInvoice(Customerorderid);
		response.sendRedirect(request.getContextPath() + "/Payment_UPDATE.jsp");

	}

}
