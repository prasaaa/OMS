package com.Controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_DELETE;
import com.Utilities.MySQLQueries;

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


		Inventory_DELETE selectItemIDByManufacturer = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_SELECT_ITEM_ID_BY_MANUFACTURER);

		Inventory_DELETE selectItemIDBySupplier = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_SELECT_ITEM_ID_BY_SUPPLIER);

		Inventory_DELETE selectItemIDByType = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_SELECT_ITEM_ID_BY_ITEM_TYPE);

		Inventory_DELETE deleteByBarcode = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_BARCODE);

		Inventory_DELETE selectStockIDByDate = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_SELECT_STOCK_ID_BY_DATE);

		Inventory_DELETE selectStockIDByBarcode = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_SELECT_STOCK_ID_BY_BARCODE);

		Inventory_DELETE deleteByItemType = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_ITEM_TYPE);

		Inventory_DELETE deleteByManuFacturer = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_MANUFACTURER);

		Inventory_DELETE deleteByModelName = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_MODEL_NAME);

		Inventory_DELETE deleteBySupplier = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_BY_SUPPLIER);

		Inventory_DELETE deleteStockByItemID = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_BY_ITEM_ID);

		Inventory_DELETE deleteStockByStockID = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_DELETE_STOCK_BY_STOCK_ID);

		Inventory_DELETE updateQuantity = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_UPDATE_QUANTITY);

		Inventory_DELETE getQuantity = new Inventory_DELETE(ConnectionManager.getConnection(),
				MySQLQueries.QUERY_GET_QUANTITY);

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

					String stockID = "";

					ResultSet resultStockID = selectStockIDByBarcode.retreiveID(queryValue);

					boolean bool = false;

					while (resultStockID.next()) {
						
						stockID = resultStockID.getString(1);
						int count1 = updateQuantity.updateQueryData(stockID);

						if (count1 > 0) {
							bool = true;

							int count2 = deleteByBarcode.deleteQueryData(queryValue);

							if (count2 > 0) {

								ResultSet quantityResult = getQuantity.retreiveID(stockID);

								if (quantityResult.first()) {
									long quantity = quantityResult.getLong(1);

									if (quantity == 0) {
										int count3 = deleteStockByStockID.deleteQueryData(stockID);

										if (count3 > 0)
											bool = true;
										else {
											bool = false;
											break;
										}
									}
								}

							} else {
								bool = false;
								break;
							}

						} else {
							bool = false;
							break;
						}

					}

					if (bool == true) {

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

					String itemID = "";

					ResultSet itemReslts = selectItemIDByManufacturer.retreiveID(queryValue);

					boolean bool = false;

					while (itemReslts.next()) {
						itemID = itemReslts.getString(1);

						int count = deleteStockByItemID.deleteQueryData(itemID);

						if (count > 0) {

							bool = true;
							int count2 = deleteByManuFacturer.deleteQueryData(queryValue);

							if (count2 > 0)
								bool = true;
							else {
								bool = false;
								break;
							}

						} else {
							bool = false;
							break;
						}

					}

					if (bool == true) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("sup")) {

					String itemID = "";

					ResultSet itemReslts = selectItemIDBySupplier.retreiveID(queryValue);

					boolean bool = false;

					while (itemReslts.next()) {
						itemID = itemReslts.getString(1);

						int count = deleteStockByItemID.deleteQueryData(itemID);

						if (count > 0) {
							bool = true;

								int count2 = deleteBySupplier.deleteQueryData(queryValue);

								if (count2 > 0)
									bool = true;
								else {
									bool = false;
									break;
								}


						} else {
							bool = false;
							break;
						}

					}

					if (bool == true) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("itype")) {

					String itemID = "";

					ResultSet itemReslts = selectItemIDByType.retreiveID(queryValue);

					boolean bool = false;

					while (itemReslts.next()) {
						itemID = itemReslts.getString(1);

						int count = deleteStockByItemID.deleteQueryData(itemID);

						if (count > 0) {
							bool = true;

							

								int count2 = deleteByItemType.deleteQueryData(queryValue);

								if (count2 > 0)
									bool = true;
								else {
									bool = false;
									break;
								}
							

						} else {
							bool = false;
							break;
						}

					}

					if (bool == true) {
						response.sendRedirect("Inventory_Servlet?status=deleteSuccess");
						return;
					} else {
						response.sendRedirect("Inventory_Servlet?status=deleteError");
						return;
					}

				} else if (queryType.equals("stockindate")) {

					String stockID = "";

					ResultSet stockReslts = selectStockIDByDate.retreiveID(queryValue);

					boolean bool = false;

					while (stockReslts.next()) {
						stockID = stockReslts.getString(1);

						int count =  deleteStockByStockID.deleteQueryData(stockID);

						if (count > 0) {
							
								bool = true;

							

						} else {
							bool = false;
							break;
						}

					}

					if (bool == true) {
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
