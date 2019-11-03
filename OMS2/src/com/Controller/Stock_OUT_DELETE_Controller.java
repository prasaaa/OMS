package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_DELETE;
import com.Utilities.MySQLQueries;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Stock_OUT_DELETE_Controller
 */
@WebServlet("/Stock_OUT_DELETE_Controller")
public class Stock_OUT_DELETE_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Stock_OUT_DELETE_Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Inventory_DELETE deleteByModel = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_MODEL);
		Inventory_DELETE deleteByManu = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_MANUFACTURER);
		Inventory_DELETE deleteByType = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_TYPE);
		Inventory_DELETE deleteByID = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_ID);
		Inventory_DELETE deleteByDate = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_DATE);
		Inventory_DELETE deleteByCustomer = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_CUSTOMER);
		Inventory_DELETE deleteByOrder = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_ORDER);
		Inventory_DELETE updateItem = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_UPDATE_ITEM_BY_BARCODE);
		Inventory_DELETE updateQuantity = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_UPDATE_STOCK_OUT_QUANTITY);
		Inventory_DELETE deleteByBarcode = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_OUT_BY_BARCODE);

		String queryType = null;
		String queryValue = null;

		if (request.getParameter("queryValue") != null && request.getParameter("queryType") != null) {
			queryValue = request.getParameter("queryValue");
			queryType = request.getParameter("queryType");

		}

		if (queryValue != null && queryType != null) {

			try {
				if (queryType.isEmpty() && queryValue.isEmpty()) {
					response.sendRedirect("Stock_OUT_Servlet?status=warning");
					return;
				} else if (queryType.equals("bar")) {

					int count1 = deleteByBarcode.deleteQueryData(queryValue);

					if (count1 > 0) {

						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;

					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("stockoutid")) {

					int count = deleteByID.deleteQueryData(queryValue);

					if (count > 0) {

						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;

					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("iname")) {

					int count = deleteByModel.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("manu")) {

					int count = deleteByType.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("itype")) {

					int count = deleteByType.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("stockoutdate")) {

					int count = deleteByDate.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("customer")) {

					int count = deleteByCustomer.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("custOrder")) {

					int count = deleteByOrder.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=deleteError");
						return;
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("Stock_OUT_Servlet?status=deleteFail");
				return;
			}

		} else {
			response.sendRedirect("Stock_OUT_Servlet?status=warning");
			return;
		}

	}

}
