package com.Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class Inventory_Servlet
 */
@WebServlet("/Inventory_Servlet")
public class Inventory_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inventory_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        String message = "";
        String color = "";


        if (session == null) {
            session = request.getSession(true);
        }

        switch (request.getParameter("status")) {
            case "deleteResultsFound":

                message = "Results Found!!";
                color = "green";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;


            case "noDeleteResults":
                message = "No Results!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "insertSuccess":
                message = "Stock Inserted SuccessFully!!";
                color = "green";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "insertNotSuccess":
                message = "Stocks Insert Not Completed!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "deleteSuccess":
                message = "Stocks Deleted SuccessFully!!";
                color = "green";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "insertFail":
                message = "Failed to Insert Stock!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "updateFail":
                message = "Failed to Update Stock!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "insertError":
            case "updateError":
                message = "An Item Already Exist in Stock!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "deleteFail":
                message = "Failed to Delete Stocks!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "warning":
                message = "Nothing to Delete!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "updateSuccess":
                message = "Item Updated SuccessFully!!";
                color = "green";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;
            case "updateNotSuccess":
                message = "Stocks Update Not Completed!!";
                color = "red";
                session.setAttribute("message", message);
                session.setAttribute("color", color);
                response.reset();
                response.sendRedirect("Stock_IN_MANAGE.jsp");
                return;

            default:
                break;
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
