package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession currentSession = request.getSession(false);
		HttpSession session = request.getSession(false);
		
		String queryType = "";
		String queryValue = "";
		String message = "";
		String color = "";
		
		if (request.getParameter("queryValue") != null && request.getParameter("queryType") != null) {
			queryType = request.getParameter("queryType");
			queryValue = request.getParameter("queryValue");
		}
		
		if (currentSession != null && currentSession.getAttribute("results") != null && !queryValue.isEmpty() && !queryType.isEmpty()) {
			
			if (session == null) {
				session = request.getSession(true);
			}
			
			if (request.getParameter("status").equals("deleteResultsFound")) {

				message = "Results Found!!";
				color = "green";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				request.setAttribute("queryValue", queryValue);
				request.setAttribute("queryType", queryType);
				request.getRequestDispatcher("Stock_IN_DELETE.jsp").forward(request, response);
				return;
			} 
			

		}  else {
			
			if (session == null) {
				session = request.getSession(true);
			}

			

			if (request.getParameter("status").equals("insertResultsFound")) {
				message = "Results Found!!";
				color = "green";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_IN_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteResultsFound")) {
				response.reset();
				response.sendRedirect("Stock_IN_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("noInsertResults")) {
				message = "No Results!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_IN_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("noDeleteResults")) {
				message = "No Results!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_IN_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("insertSuccess")) {
				message = "Stock Inserted SuccessFully!!";
				color = "green";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_IN_INSERT.jsp");
				return;
			}  else if (request.getParameter("status").equals("insertNotSuccess")) {
				message = "Stocks Insert Not Completed!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_IN_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteSuccess")) {
				message = "Stocks Deleted SuccessFully!!";
				color = "green";
				currentSession.removeAttribute("results");
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_IN_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("insertFail")) {
				message = "Failed to Insert Stock!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_IN_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("insertError")) {
				message = "An Item Already Exist in Stock!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_IN_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteFail")) {
				message = "Failed to Delete Stocks!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_IN_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteError")) {
				message = "Stocks Delete Not Completed!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_IN_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("warning")) {
				message = "Nothing to Delete!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_IN_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("insertReset")) {
				currentSession.removeAttribute("message");
				currentSession.removeAttribute("color");
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_IN_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteReset")) {
				currentSession.removeAttribute("message");
				currentSession.removeAttribute("color");
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_IN_DELETE.jsp");
				return;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
