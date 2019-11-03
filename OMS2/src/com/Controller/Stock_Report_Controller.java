package com.Controller;

import com.DatabaseHandle.Report_PRINT;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;


@WebServlet("/Stock_Report_Controller")
public class Stock_Report_Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ResultSet rsprintstock;

    public Stock_Report_Controller() {
        super();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("came to the stock print servlet");
        HttpSession session_sou = request.getSession();
        rsprintstock = (ResultSet) session_sou.getAttribute("report_stock");

        Report_PRINT rp = new Report_PRINT(rsprintstock);
        boolean status = rp.printstockreport();
        
        String message = "";
        String color = "";
        
        if (status) {
			message = "Report Generated SuccuessFully!!";
		    color = "green";
		    session_sou.setAttribute("message", message);
		    session_sou.setAttribute("color", color);
		} else {
			message = "Failed to Generate Report!!";
            color = "red";
            session_sou.setAttribute("message", message);
            session_sou.setAttribute("color", color);
            session_sou.removeAttribute("results");
		}
        

        response.sendRedirect(request.getContextPath() + "/Stock_Report.jsp");
        return;

    }

}
