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


@WebServlet("/Emp_REPORT_PRINT")
public class Emp_REPORT_PRINT extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ResultSet rsprintemp;  
  
    public Emp_REPORT_PRINT() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("came to the print servlet");
		HttpSession session_e = request.getSession();
		rsprintemp = (ResultSet)session_e.getAttribute("report_emp");
		
		Report_PRINT rp = new Report_PRINT(rsprintemp);
		rp.printemp();
		
		response.sendRedirect(request.getContextPath() + "/Emp_REPORT.jsp");
	}

}
