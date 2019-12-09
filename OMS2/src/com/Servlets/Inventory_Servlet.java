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

        HttpSession currentSession = request.getSession(false);
        HttpSession session = request.getSession(false);

        String queryType = "";
        String queryValue = "";
        String message = "";
        String color = "";


        if (currentSession != null && currentSession.getAttribute("results") != null) {

            if (session == null) {
                session = request.getSession(true);
            }

            switch (request.getParameter("status")) {
                case "deleteResultsFound":

                    message = "Results Found!!";
                    color = "green";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    request.setAttribute("queryValue", queryValue);
                    request.setAttribute("queryType", queryType);
                    request.getRequestDispatcher("Stock_IN_DELETE.jsp").forward(request, response);
                    return;
                case "insertResultsFound":
                    message = "Results Found!!";
                    color = "green";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.reset();
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "noItems":
                    message = "Please Enter at Least One Item!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "noInsertResults":
                    message = "No Results!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.reset();
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "noDeleteResults":
                    message = "No Results!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.reset();
                    response.sendRedirect("Stock_IN_DELETE.jsp");
                    return;
                case "insertSuccess":
                    message = "Stock Inserted SuccessFully!!";
                    color = "green";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.reset();
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "insertNotSuccess":
                    message = "Stocks Insert Not Completed!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    currentSession.removeAttribute("results");
                    response.reset();
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "deleteSuccess":
                    message = "Stocks Deleted SuccessFully!!";
                    color = "green";
                    currentSession.removeAttribute("results");
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.reset();
                    response.sendRedirect("Stock_IN_DELETE.jsp");
                    return;
                case "insertFail":
                    message = "Failed to Insert Stock!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.reset();
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "insertError":
                    message = "An Item Already Exist in Stock!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    currentSession.removeAttribute("results");
                    response.reset();
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "deleteFail":
                    message = "Failed to Delete Stocks!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    currentSession.removeAttribute("results");
                    response.reset();
                    response.sendRedirect("Stock_IN_DELETE.jsp");
                    return;
                case "deleteError":
                    message = "Stocks Delete Not Completed!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    currentSession.removeAttribute("results");
                    response.reset();
                    response.sendRedirect("Stock_IN_DELETE.jsp");
                    return;
                case "warning":
                    message = "Nothing to Delete!!";
                    color = "red";
                    session.setAttribute("message", message);
                    session.setAttribute("color", color);
                    response.reset();
                    response.sendRedirect("Stock_IN_DELETE.jsp");
                    return;
                case "insertReset":
                    currentSession.removeAttribute("message");
                    currentSession.removeAttribute("color");
                    currentSession.removeAttribute("results");
                    response.reset();
                    response.sendRedirect("Stock_IN_INSERT.jsp");
                    return;
                case "deleteReset":
                    currentSession.removeAttribute("message");
                    currentSession.removeAttribute("color");
                    currentSession.removeAttribute("results");
                    response.reset();
                    response.sendRedirect("Stock_IN_DELETE.jsp");
                    return;
                default:
                    break;
            }
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
