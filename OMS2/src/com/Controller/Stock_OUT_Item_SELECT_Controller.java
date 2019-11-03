package com.Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_SELECT;
import com.Utilities.MySQLQueries;

/**
 * Servlet implementation class Stock_OUT_Item_SELECT_Controller
 */
@WebServlet("/Stock_OUT_Item_SELECT_Controller")
public class Stock_OUT_Item_SELECT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stock_OUT_Item_SELECT_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("submitBtn") != null) {
			if (request.getParameter("submitBtn").equalsIgnoreCase("Add")) {
				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("stockOUTItemID", request.getParameter("itemID"));
                    request.getSession(false).setAttribute("stockoutitype", request.getParameter("itype"));
					request.getSession(false).setAttribute("REFRESH", "TRUE");

				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("stockOUTItemID", request.getParameter("itemID"));
                    session.setAttribute("stockoutitype", request.getParameter("itype"));
					session.setAttribute("REFRESH", "TRUE");

				}

				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
				return;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Inventory_SELECT selectModel = new Inventory_SELECT(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_GET_ITEM_BY_ITEM_MODEL);

		Inventory_SELECT selectManuFacturer = new Inventory_SELECT(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_GET_ITEM_BY_MANUFACTURER);

		Inventory_SELECT selectType = new Inventory_SELECT(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_GET_ITEM_BY_TYPE);

		String queryValue = "";
		String queryType = "";
		String type = "";

		if (request.getParameter("search") != null)
			type = request.getParameter("search");
		if (!type.equalsIgnoreCase("Reset")) {
			if (request.getParameter("queryValue") != null && request.getParameter("queryType") != null) {
				queryValue = request.getParameter("queryValue");
				queryType = request.getParameter("queryType");
			}
		}

		HttpSession session = request.getSession(false);

		if (session == null)
			session = request.getSession(true);

		ResultSet results = null;

		if (queryType.isEmpty() && queryValue.isEmpty()) {
			
			session.removeAttribute("results");
			response.reset();
			response.sendRedirect("Stock_OUT_Item_SELECT.jsp");
			return;
			
		} else if (queryType.equals("iname"))
			results = selectModel.retreiveQueryData(queryValue);
		else if (queryType.equals("manu"))
			results = selectManuFacturer.retreiveQueryData(queryValue);
		else if (queryType.equals("itype"))
			results = selectType.retreiveQueryData(queryValue);

		try {
			if (results != null) {
				
				
				String message = "";
				String color = "";
				
				if (results.first()) {
					message = "Results Found!!";
	                color = "green";
	                session.setAttribute("message", message);
	                session.setAttribute("color", color);
					session.setAttribute("results", results);
					response.reset();
					response.sendRedirect("Stock_OUT_Item_SELECT.jsp");
					return;

				} else {
					message = "No Results!!";
	                color = "red";
	                session.setAttribute("message", message);
	                session.setAttribute("color", color);
					session.removeAttribute("results");
					response.reset();
					response.sendRedirect("Stock_OUT_Item_SELECT.jsp");
					return;

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
