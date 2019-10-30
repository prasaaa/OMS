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
import com.DatabaseHandle.Inventory_INSERT;
import com.DatabaseHandle.Inventory_SELECT;
import com.DatabaseHandle.Inventory_UPDATE;
import com.Utilities.MySQLQueries;

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

				Inventory_SELECT selectQuantity = new Inventory_SELECT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_GET_ITEM_QUANTITY);

				Inventory_SELECT validateCustomerOrderID = new Inventory_SELECT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_VALIDATE_CUSTOMER_ORDER_ID);

				Inventory_SELECT validateModelName = new Inventory_SELECT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_VALIDATE_ITEM_MODEL);

				Inventory_UPDATE updateStatus = new Inventory_UPDATE(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_UPDATE_STOCK_OUT_ID);

				Inventory_INSERT selectStockOutID = new Inventory_INSERT(ConnectionManager.getConnection(),
						MySQLQueries.QUERY_SELECT_STOCK_OUT_ID);

				String model_name = request.getParameter("iname");

				long quantity = 0;

				if (!request.getParameter("quantity").isEmpty())
					quantity = Long.parseLong(request.getParameter("quantity"));

				String date = request.getParameter("stockoutdate");

				String remarks = request.getParameter("remarks");

				String customerOrdID = request.getParameter("custOrdID");

				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("model_name", model_name);
					request.getSession(false).setAttribute("quantity", quantity);
					request.getSession(false).setAttribute("stock_out_date", date);
					request.getSession(false).setAttribute("remarks", remarks);
				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("model_name", model_name);
					session.setAttribute("quantity", quantity);
					session.setAttribute("stock_out_date", date);
					session.setAttribute("remarks", remarks);

				}

				ResultSet resultModel = validateModelName.retreiveQueryData(model_name);
				if (resultModel != null) {
					try {

						if (!resultModel.first()) {
							response.sendRedirect("Stock_OUT_Servlet?status=invalidModel");
							return;
						}

					} catch (SQLException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					} finally {
						try {
							resultModel.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

				} else {
					response.sendRedirect("Stock_OUT_Servlet?status=invalidModel");
					return;
				}

				if (quantity == 0) {
					response.sendRedirect("Stock_OUT_Servlet?status=noQuantity");
					return;
				}

				ResultSet resultCustomerOrdID = validateCustomerOrderID.retreiveQueryData(customerOrdID);

				if (resultCustomerOrdID != null) {
					try {

						if (!resultCustomerOrdID.first()) {
							response.sendRedirect("Stock_OUT_Servlet?status=invalidCustOrdID");
							return;
						}

					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} finally {
						try {
							resultCustomerOrdID.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

				} else {
					response.sendRedirect("Stock_OUT_Servlet?status=invalidCustOrdID");
					return;
				}

				long remainingQuantity = 0;

				ResultSet resultQuantity = selectQuantity.retreiveQueryData(model_name);

				if (resultQuantity != null) {

					try {
						if (resultQuantity.next()) {
							remainingQuantity = resultQuantity.getLong(1);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				if (quantity <= remainingQuantity && remainingQuantity != 0) {

					boolean bool = false;

					bool = insertStock.InsertStock(model_name, quantity, date, customerOrdID, remarks);

					if (bool == true) {

						String stockOutID = selectStockOutID.getStockID(model_name);

						if (!stockOutID.isEmpty()) {

							long count = updateStatus.updateStatus(stockOutID, model_name, quantity);

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
					response.sendRedirect("Stock_OUT_Servlet?status=insufficientQuantity");
					return;
				}

			} else {
				String model_name = request.getParameter("iname");

				long quantity = 0;

				if (!request.getParameter("quantity").isEmpty())
					quantity = Long.parseLong(request.getParameter("quantity"));

				String date = request.getParameter("stockoutdate");

				String remarks = request.getParameter("remarks");

				if (request.getSession(false) != null) {
					request.getSession(false).setAttribute("model_name", model_name);
					request.getSession(false).setAttribute("quantity", quantity);
					request.getSession(false).setAttribute("stock_out_date", date);
					request.getSession(false).setAttribute("remarks", remarks);
				} else {
					HttpSession session = request.getSession(true);
					session.setAttribute("model_name", model_name);
					session.setAttribute("quantity", quantity);
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

			if (request.getSession(false).getAttribute("quantity") != null)
				request.getSession(false).removeAttribute("quantity");

			if (request.getSession(false).getAttribute("model_name") != null)
				request.getSession(false).removeAttribute("model_name");

			response.reset();
			response.sendRedirect("Stock_OUT_INSERT.jsp");
			return;
		}
	}

}
