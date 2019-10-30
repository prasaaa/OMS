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


@WebServlet("/Repair_REPORT_Controller")
public class Repair_REPORT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ResultSet rsprintrepair;
       
    
    public Repair_REPORT_Controller() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("came to the repair print servlet");
		HttpSession session_sou = request.getSession();
		rsprintrepair = (ResultSet)session_sou.getAttribute("report_repair");
		
		Report_PRINT rp = new Report_PRINT(rsprintrepair);
		rp.printrepairreport();
		
		response.sendRedirect(request.getContextPath() + "/Repair_REPORT.jsp");
	}

}
