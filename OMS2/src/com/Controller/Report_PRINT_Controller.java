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




@WebServlet("/Report_PRINT_Controller")
public class Report_PRINT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ResultSet rsprint;  
  
    public Report_PRINT_Controller() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("came to the print servlet");
		HttpSession session_sou = request.getSession();
		rsprint = (ResultSet)session_sou.getAttribute("report");
		
		Report_PRINT rp = new Report_PRINT(rsprint);
		rp.printsupplierreport();
		
		response.sendRedirect(request.getContextPath() + "/Supplier_Report.jsp");

	}

}
