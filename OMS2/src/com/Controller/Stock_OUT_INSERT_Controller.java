package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_INSERT;
import com.DatabaseHandle.Inventory_SELECT;
import com.DatabaseHandle.Inventory_UPDATE;
import com.Utilities.MySQLQueries;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet implementation class Stock_OUT_INSERT_Controller
 */
@WebServlet("/Stock_OUT_INSERT_Controller")
public class Stock_OUT_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Stock_OUT_INSERT_Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("submitBtn") != null) {
			if (request.getParameter("submitBtn").equalsIgnoreCase("Add")) {
				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("customerOrderID", request.getParameter("custOrderID"));
					request.getSession(false).setAttribute("REFRESH", "TRUE");

				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("customerOrderID", request.getParameter("custOrderID"));
					session.setAttribute("REFRESH", "TRUE");

				}

				response.reset();
				response.sendRedirect("Stock_OUT_INSERT.jsp");
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
		if (request.getParameter("submitButton") != null) {
			if (request.getParameter("submitButton").trim().equalsIgnoreCase("Insert Stock")) {

				Inventory_INSERT insertStock = new Inventory_INSERT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_INSERT_STOCK_OUT);
				
				Inventory_INSERT getFaultyItems = new Inventory_INSERT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_GET_FAULTY_ITEMS);

				Inventory_UPDATE updateStatus = new Inventory_UPDATE(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_UPDATE_STOCK_OUT_ID);

				Inventory_INSERT selectStockOutID = new Inventory_INSERT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_SELECT_STOCK_OUT_ID);

				Inventory_INSERT getBarcodeList = new Inventory_INSERT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_SELECT_BARCODES_BY_ITEM_ID);

				String itemID = request.getParameter("itemID");
				String itemType = request.getParameter("itype");

				long quantity = 0;

				double sppitem = 0;

				if (request.getParameter("sppitem") != null) {

					if (!request.getParameter("sppitem").isEmpty())
						sppitem = Double.parseDouble(request.getParameter("sppitem"));
				}

				String date = request.getParameter("stockoutdate");

				String remarks = request.getParameter("remarks");

				String customerOrdID = request.getParameter("custOrdID");

				String[] barcodeList = request.getParameterValues("barcode");

				quantity = barcodeList.length;

				List<String> oldBarcodeList = getBarcodeList.getBarcodeList(itemID);

				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("stockOUTItemID", itemID);
					request.getSession(false).setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						request.getSession(false).setAttribute("sppitem", sppitem);

					request.getSession(false).setAttribute("stock_out_date", date);
					request.getSession(false).setAttribute("remarks", remarks);
				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("stockOUTItemID", itemID);
					session.setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						session.setAttribute("sppitem", sppitem);

					session.setAttribute("stock_out_date", date);
					session.setAttribute("remarks", remarks);

				}

				if (quantity == 0) {
					response.sendRedirect("Stock_OUT_Servlet?status=noQuantity");
					return;
				}

				boolean status = true;

				for (String str : oldBarcodeList) {
					for (String strNew : barcodeList) {
						if (strNew.equalsIgnoreCase(str)) {
							status = false;
							break;
						} else {
							status = true;
							continue;
						}

					}

					if (status == false) {
						break;
					} else {
						continue;
					}
				}

				if (status == true) {

					response.sendRedirect("Stock_OUT_Servlet?status=itemNotExists");
					return;

				} else {

					List <String> faultList = getFaultyItems.getBarcodeList(itemID);

					boolean status1 = true;
					
					for (String str : faultList) {
						for (String strNew : barcodeList) {
							if (strNew.equalsIgnoreCase(str)) {
								status1 = false;
								break;
							} else {
								status1 = true;
								continue;
							}

						}

						if (status1 == false) {
							break;
						} else {
							continue;
						}
					}

					if (status1 == true) {

						boolean bool = false;

						bool = insertStock.InsertStockOUT(date, remarks , quantity, sppitem, itemID, customerOrdID);

						if (bool == true) {

							String stockOutID = selectStockOutID.getStockID(itemID);

							if (!stockOutID.isEmpty()) {

								long count = 0;
								for (String str : barcodeList) {
									
									count = updateStatus.updateStatus(stockOutID, itemID, str);
									
									if (count == 0)
										break;
								}

								if (count > 0) {
									response.sendRedirect("Stock_OUT_Servlet?status=insertSuccess");
									return;
								} else {
									response.sendRedirect("Stock_OUT_Servlet?status=insertError");
									return;
								}
							} else {
								response.sendRedirect("Stock_OUT_Servlet?status=insertError");
								return;
							}

						} else {
							response.sendRedirect("Stock_OUT_Servlet?status=insertFail");
							return;
						}
					} else {
						response.sendRedirect("Stock_OUT_Servlet?status=faultItemExists");
						return;
					}

				}

			} else if (request.getParameter("submitButton").trim().equalsIgnoreCase("Add Item Info")) {

				String itemID = request.getParameter("itemID");
				String itemType = request.getParameter("itype");

				double sppitem = 0;

				if (request.getParameter("sppitem") != null) {

					if (!request.getParameter("sppitem").isEmpty())
						sppitem = Double.parseDouble(request.getParameter("sppitem"));
				}

				String date = request.getParameter("stockoutdate");

				String remarks = request.getParameter("remarks");

				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("stockOUTItemID", itemID);
					request.getSession(false).setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						request.getSession(false).setAttribute("sppitem", sppitem);

					request.getSession(false).setAttribute("stock_out_date", date);
					request.getSession(false).setAttribute("remarks", remarks);
				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("stockOUTItemID", itemID);
					session.setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						session.setAttribute("sppitem", sppitem);

					session.setAttribute("stock_out_date", date);
					session.setAttribute("remarks", remarks);

				}
				response.reset();
				response.sendRedirect("Stock_OUT_Item_SELECT.jsp");
				return;

			} else if (request.getParameter("submitButton").trim().equalsIgnoreCase("Change Item Info")) {

				String itemID = request.getParameter("itemID");
				String itemType = request.getParameter("itype");

				double sppitem = 0;

				if (request.getParameter("sppitem") != null) {

					if (!request.getParameter("sppitem").isEmpty())
						sppitem = Double.parseDouble(request.getParameter("sppitem"));
				}

				String date = request.getParameter("stockoutdate");

				String remarks = request.getParameter("remarks");

				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("stockOUTItemID", itemID);
					request.getSession(false).setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						request.getSession(false).setAttribute("sppitem", sppitem);

					request.getSession(false).setAttribute("stock_out_date", date);
					request.getSession(false).setAttribute("remarks", remarks);
				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("stockOUTItemID", itemID);
					session.setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						session.setAttribute("sppitem", sppitem);

					session.setAttribute("stock_out_date", date);
					session.setAttribute("remarks", remarks);

				}
				response.reset();
				response.sendRedirect("Stock_OUT_Item_SELECT.jsp");
				return;

			} else {
				String itemID = request.getParameter("itemID");
				String itemType = request.getParameter("itype");

				double sppitem = 0;

				if (request.getParameter("sppitem") != null) {

					if (!request.getParameter("sppitem").isEmpty())
						sppitem = Double.parseDouble(request.getParameter("sppitem"));
				}

				String date = request.getParameter("stockoutdate");

				String remarks = request.getParameter("remarks");

				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("stockOUTItemID", itemID);
					request.getSession(false).setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						request.getSession(false).setAttribute("sppitem", sppitem);

					request.getSession(false).setAttribute("stock_out_date", date);
					request.getSession(false).setAttribute("remarks", remarks);
				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("stockOUTItemID", itemID);
					session.setAttribute("stockoutitype", itemType);

					if (sppitem > 0)
						session.setAttribute("sppitem", sppitem);

					session.setAttribute("stock_out_date", date);
					session.setAttribute("remarks", remarks);

				}
				response.reset();
				response.sendRedirect("Customer_Order_SELECT.jsp");
				return;
			}
		} else if (request.getParameter("resetButton") != null) {

			if (request.getSession(false).getAttribute("customerOrderID") != null)
				request.getSession(false).removeAttribute("customerOrderID");

			if (request.getSession(false).getAttribute("remarks") != null)
				request.getSession(false).removeAttribute("remarks");

			if (request.getSession(false).getAttribute("stock_out_date") != null)
				request.getSession(false).removeAttribute("stock_out_date");

			if (request.getSession(false).getAttribute("stockOUTItemID") != null)
				request.getSession(false).removeAttribute("stockOUTItemID");

			if (request.getSession(false).getAttribute("sppitem") != null)
				request.getSession(false).removeAttribute("sppitem");

			if (request.getSession(false).getAttribute("stockoutitype") != null)
				request.getSession(false).removeAttribute("stockoutitype");

			response.reset();
			response.sendRedirect("Stock_OUT_INSERT.jsp");
			return;
		}
	}

}
