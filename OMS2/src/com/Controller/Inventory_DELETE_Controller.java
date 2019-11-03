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
import java.sql.ResultSet;

/**
 * Servlet implementation class Inventory_DELETE_Controller
 */
@WebServlet("/Inventory_DELETE_Controller")
public class Inventory_DELETE_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Inventory_DELETE_Controller() {
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

		Inventory_DELETE deleteByItemType = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_ITEM_TYPE);

		Inventory_DELETE deleteByManuFacturer = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_MANUFACTURER);

		Inventory_DELETE deleteByModelName = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_MODEL_NAME);

		Inventory_DELETE deleteBySupplier = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_SUPPLIER);

		Inventory_DELETE deleteStockByStockID = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_BY_STOCK_ID);
		
		Inventory_DELETE deleteByStockINDate = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_DATE);
		
		Inventory_DELETE deleteStockByBarcode = new Inventory_DELETE(ConnectionManager.getConnection(), 
				MySQLQueries.QUERY_DELETE_STOCK_BY_BARCODE);
		
		

		String queryType = null;
		String queryValue = null;

		if (request.getParameter("queryValue") != null && request.getParameter("queryType") != null) {
			queryValue = request.getParameter("queryValue");
			queryType = request.getParameter("queryType");

		}


		if (queryValue != null && queryType != null) {

			try {
				if (queryType.isEmpty() && queryValue.isEmpty()) {
					response.sendRedirect("Inventory_Servlet?status=warning");
					return;
				} else if (queryType.equals("bar")) {

						

						int rowCount = deleteStockByBarcode.deleteQueryData(queryValue);

						

						if (rowCount > 0) {

							response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
							return;

						} else {
							response.sendRedirect("Inventory_Servlet?status=deleteError");
							return;
						}

					

				} else if (queryType.equals("stockid")) {

					int count = deleteStockByStockID.deleteQueryData(queryValue);

					if (count > 0) {

						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;

					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("iname")) {

					int count = deleteByModelName.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("manu")) {

					int count = deleteByManuFacturer.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}
				} else if (queryType.equals("sup")) {

					int count = deleteBySupplier.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("itype")) {

					int count = deleteByItemType.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("stockindate")) {

					int count = deleteByStockINDate.deleteQueryData(queryValue);

					if (count > 0) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("Inventory_Servlet?status=deleteFail");
				return;
			}

		} else {
			response.sendRedirect("Inventory_Servlet?status=warning");
			return;
		}
	}

}
