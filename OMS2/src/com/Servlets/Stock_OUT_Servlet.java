package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Stock_OUT_Servlet
 */
@WebServlet("/Stock_OUT_Servlet")
public class Stock_OUT_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stock_OUT_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				request.getRequestDispatcher("Stock_OUT_DELETE.jsp").forward(request, response);
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
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteResultsFound")) {
				
				response.reset();
				response.sendRedirect("Stock_OUT_DELETE.jsp");
				return;
			}  else if (request.getParameter("status").equals("searchResultsFound")) {
				message = "Results Found!!";
				color = "green";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Customer_Order_SELECT.jsp");
				return;
			} else if (request.getParameter("status").equals("noInsertResults")) {
				message = "No Results!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("noDeleteResults")) {
				message = "No Results!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_OUT_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("noSearchResults")) {
				message = "No Results!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Customer_Order_SELECT.jsp");
				return;
			}  else if (request.getParameter("status").equals("insertSuccess")) {
				
				
				if (request.getSession(false).getAttribute("customerOrderID") != null)
					request.getSession(false).removeAttribute("customerOrderID");
				
				if (request.getSession(false).getAttribute("remarks") != null)
					request.getSession(false).removeAttribute("remarks");
				
				if (request.getSession(false).getAttribute("stock_out_date") != null)
					request.getSession(false).removeAttribute("stock_out_date");
				
				if (request.getSession(false).getAttribute("quantity") != null)
					request.getSession(false).removeAttribute("quantity");
				
				if (request.getSession(false).getAttribute("model_name") != null)
					request.getSession(false).removeAttribute("model_name");
				
				message = "Stock Inserted SuccessFully!!";
				color = "green";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteSuccess")) {
				message = "Stocks Deleted SuccessFully!!";
				color = "green";
				currentSession.removeAttribute("results");
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_OUT_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("insertFail")) {
				message = "Failed to Insert Stock!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				session.setAttribute("REFRESH","TRUE");
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			}  else if (request.getParameter("status").equals("noQuantity")) {
				message = "Please Enter Quantity Greater than Zero!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				session.setAttribute("REFRESH","TRUE");
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			}  else if (request.getParameter("status").equals("invalidCustOrdID")) {
				message = "Invalid Customer Order ID!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				session.setAttribute("REFRESH","TRUE");
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			}  else if (request.getParameter("status").equals("invalidModel")) {
				message = "Item Model not Exist!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				session.setAttribute("REFRESH","TRUE");
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("insufficientQuantity")) {
				message = "Insufficient Stock Quantity!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				session.setAttribute("REFRESH","TRUE");
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("insertError")) {
				message = "Stock Insert not Completed!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				currentSession.removeAttribute("results");
				session.setAttribute("REFRESH","TRUE");
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteFail")) {
				message = "Failed to Delete Stocks!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_OUT_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteError")) {
				message = "Stocks Delete Not Completed!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_OUT_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("warning")) {
				message = "Nothing to Delete!!";
				color = "red";
				session.setAttribute("message", message);
				session.setAttribute("color", color);
				response.reset();
				response.sendRedirect("Stock_OUT_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("insertReset")) {
				currentSession.removeAttribute("message");
				currentSession.removeAttribute("color");
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			} else if (request.getParameter("status").equals("deleteReset")) {
				currentSession.removeAttribute("message");
				currentSession.removeAttribute("color");
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Stock_OUT_DELETE.jsp");
				return;
			} else if (request.getParameter("status").equals("searchReset")) {
				currentSession.removeAttribute("message");
				currentSession.removeAttribute("color");
				currentSession.removeAttribute("results");
				response.reset();
				response.sendRedirect("Customer_Order_SELECT.jsp");
				return;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
