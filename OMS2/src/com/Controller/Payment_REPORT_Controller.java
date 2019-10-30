package com.Controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DatabaseHandle.Report_PRINT;


@WebServlet("/Payment_REPORT_Controller")
public class Payment_REPORT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ResultSet rsp;
       
  
    public Payment_REPORT_Controller() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session_sou = request.getSession();
		rsp = (ResultSet)session_sou.getAttribute("report_payment");
		
		Report_PRINT rpay = new Report_PRINT(rsp);
		rpay.printpayment();
		
		response.sendRedirect(request.getContextPath() + "/Payment_Report.jsp");

		
		
		
	}

}
