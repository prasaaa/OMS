package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_INSERT;
import com.DatabaseHandle.Inventory_SELECT;
import com.DatabaseHandle.Inventory_UPDATE;
import com.Utilities.MySQLQueries;
import com.model.InventoryStock;
import com.model.ItemList;
import com.model.Items;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/**
 * Servlet implementation class Inventory_INSERT_Controller
 */
@WebServlet("/Inventory_INSERT_Controller")
public class Inventory_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Inventory_INSERT_Controller() {
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
	                    request.getSession(false).setAttribute("itemID", request.getParameter("itemID"));
	                    request.getSession(false).setAttribute("supID", request.getParameter("supID"));
	                    request.getSession(false).setAttribute("itype", request.getParameter("itype"));
	                    request.getSession(false).setAttribute("REFRESH", "TRUE");

	                } else {
	                    HttpSession session = request.getSession(true);
	                    session.setAttribute("itemID", request.getParameter("itemID"));
	                    session.setAttribute("supID", request.getParameter("supID"));
	                    session.setAttribute("itype", request.getParameter("itype"));
	                    session.setAttribute("REFRESH", "TRUE");

	                }

	                response.reset();
	                response.sendRedirect("Stock_IN_INSERT.jsp");
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

		HttpSession session = request.getSession();
		
		String buy = request.getParameter("bppitem").trim();
		String stockINDate = request.getParameter("stockindate").trim();
		String remarks = request.getParameter("remarks").trim();


		String button = "";

		if (request.getParameter("resetButton") != null) {
			session.removeAttribute("itemID");
			session.removeAttribute("supID");
			session.removeAttribute("itype");
			session.removeAttribute("bppitem");
			session.removeAttribute("stock_in_date");
			session.removeAttribute("remarks");

			response.reset();
			response.sendRedirect("Stock_IN_INSERT.jsp");
			return;

		} else if (request.getParameter("submitButton") != null) {
			button = request.getParameter("submitButton").trim();

			if (button.equalsIgnoreCase("Add Item Info")) {
				
				
				session.setAttribute("bppitem", buy);
				session.setAttribute("stock_in_date", stockINDate);
				session.setAttribute("remarks", remarks);
				session.setAttribute("sessionStorage", "true");
				
				response.sendRedirect("Stock_IN_Item_SELECT.jsp");
                return;

			} else if (button.equalsIgnoreCase("Change Item Info")) {
				session.setAttribute("bppitem", buy);
				session.setAttribute("stock_in_date", stockINDate);
				session.setAttribute("remarks", remarks);
				session.setAttribute("sessionStorage", "true");
				
				response.sendRedirect("Stock_IN_Item_SELECT.jsp");
                return;
			} else {
				
				InventoryStock stock = new InventoryStock();
				ItemList list = new ItemList();


				String iname = request.getParameter("itemID").trim();
				String supplier = request.getParameter("supID").trim();
				
				String itype = "";
				if (request.getParameter("itype") != null)
					itype = request.getParameter("itype");

				String[] barcodeList = request.getParameterValues("barcode");
				String[] statusList = request.getParameterValues("status");

				if (barcodeList != null) {
					if (barcodeList.length == 0) {

						session.setAttribute("itemID", iname);
						session.setAttribute("supID", supplier);
						session.setAttribute("itype", itype);
						session.setAttribute("bppitem", buy);
						session.setAttribute("remarks", remarks);
						session.setAttribute("stock_in_date", stockINDate);
						session.setAttribute("REFRESH", "TRUE");
						response.sendRedirect("Inventory_Servlet?status=noItems");
						return;
					}
				} else {
					session.setAttribute("itemID", iname);
					session.setAttribute("supID", supplier);
					session.setAttribute("itype", itype);
					session.setAttribute("bppitem", buy);
					session.setAttribute("remarks", remarks);
					session.setAttribute("stock_in_date", stockINDate);
					session.setAttribute("REFRESH", "TRUE");
					response.sendRedirect("Inventory_Servlet?status=noItems");
					return;
				}

				Items[] item = new Items[barcodeList.length];

				for (int i = 0; i < barcodeList.length; i++) {
					item[i] = new Items();

					item[i].setBarcode(barcodeList[i]);
					item[i].setItemStatus(statusList[i]);
				}

				list.setItems(item);

				double bppitem = 0;

				try {
					if (!buy.isEmpty())
						bppitem = Double.parseDouble(buy);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} finally {

					list.setItemID(iname);
					list.setSupplier(supplier);
					list.setType(itype);
					list.setBuyingPrice(bppitem);

					stock.setDate(stockINDate);
					stock.setRemarks(remarks);

					stock.setItemList(list);

					if (!button.isEmpty()) {

						if (button.equalsIgnoreCase("Insert Stock")) {

							

							

							Inventory_INSERT insertStock = new Inventory_INSERT(ConnectionManager.getConnection(),
									MySQLQueries.QUERY_INSERT_STOCK);
							Inventory_INSERT selectStockID = new Inventory_INSERT(ConnectionManager.getConnection(),
									MySQLQueries.QUERY_SELECT_STOCK_ID);
							Inventory_INSERT insertItemList = new Inventory_INSERT(ConnectionManager.getConnection(),
									MySQLQueries.QUERY_INSERT_ITEM_LIST);
							
							Inventory_UPDATE updateItemQuantity = new Inventory_UPDATE(ConnectionManager.getConnection(), 
									MySQLQueries.QUERY_UPDATE_NEW_ITEM_QUANTITY);

							Inventory_INSERT getBarcodeList = new Inventory_INSERT(ConnectionManager.getConnection(),
									MySQLQueries.QUERY_SELECT_BARCODES_BY_ITEM_ID);

							List<String> oldBarcodeList = getBarcodeList.getBarcodeList(list.getItemID());

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

								boolean itemStatus = true;

								if (itemStatus == true) {

									

								

										boolean stockStatus = insertStock.InsertStock(stock.getDate(),
												stock.getRemarks(), stock.getQuantity() ,stock.getItemList().getBuyingPrice(), stock.getItemList().getItemID(), stock.getItemList().getSupplier());

										if (stockStatus == true) {

											String stockID = selectStockID.getStockID(stock.getItemList().getItemID());

											if (!stockID.isEmpty()) {

												stock.setStockID(stockID);
												
												System.out.println(stockID);

												boolean status1 = true;

												for (Items barcode : item) {
													status1 = insertItemList.InsertItemList(list.getItemID(), barcode.getBarcode(),
															barcode.getItemStatus(), stock.getStockID());

													if (status1 == false)
														break;

												}

												if (status1 == true) {

												
													long rowCount = updateItemQuantity.updateQuantity(stock.getQuantity(), 
															stock.getItemList().getItemID());

													if (rowCount != 0) {

														if (request.getSession(false) != null) {
															request.getSession(false).setAttribute("stock", stock);
														} else {
															session.setAttribute("stock", stock);
														}
														response.sendRedirect("Inventory_Servlet?status=insertSuccess");
														return;
													} else {

														session.setAttribute("itemID", iname);
														session.setAttribute("supID", supplier);
														session.setAttribute("itype", itype);
														session.setAttribute("bppitem", buy);
														session.setAttribute("remarks", remarks);
														session.setAttribute("stock_in_date", stockINDate);
														session.setAttribute("REFRESH", "TRUE");
														response.sendRedirect(
																"Inventory_Servlet?status=insertNotSuccess");
														return;
													}
												} else {

													session.setAttribute("itemID", iname);
													session.setAttribute("supID", supplier);
													session.setAttribute("itype", itype);
													session.setAttribute("bppitem", buy);
													session.setAttribute("remarks", remarks);
													session.setAttribute("stock_in_date", stockINDate);
													session.setAttribute("REFRESH", "TRUE");
													response.sendRedirect("Inventory_Servlet?status=insertNotSuccess");
													return;
												}

											} else {

												session.setAttribute("itemID", iname);
												session.setAttribute("supID", supplier);
												session.setAttribute("itype", itype);
												session.setAttribute("bppitem", buy);
												session.setAttribute("remarks", remarks);
												session.setAttribute("stock_in_date", stockINDate);
												session.setAttribute("REFRESH", "TRUE");
												response.sendRedirect("Inventory_Servlet?status=insertFail");
												return;
											}

										} else {

											session.setAttribute("itemID", iname);
											session.setAttribute("supID", supplier);
											session.setAttribute("itype", itype);
											session.setAttribute("bppitem", buy);
											session.setAttribute("remarks", remarks);
											session.setAttribute("stock_in_date", stockINDate);
											session.setAttribute("REFRESH", "TRUE");
											response.sendRedirect("Inventory_Servlet?status=insertFail");
											return;
										}
									

								} else {

									session.setAttribute("itemID", iname);
									session.setAttribute("supID", supplier);
									session.setAttribute("itype", itype);
									session.setAttribute("bppitem", buy);
									session.setAttribute("remarks", remarks);
									session.setAttribute("stock_in_date", stockINDate);
									session.setAttribute("REFRESH", "TRUE");
									response.sendRedirect("Inventory_Servlet?status=insertFail");
									return;
								}

							} else {

								session.setAttribute("itemID", iname);
								session.setAttribute("supID", supplier);
								session.setAttribute("itype", itype);
								session.setAttribute("bppitem", buy);
								session.setAttribute("remarks", remarks);
								session.setAttribute("stock_in_date", stockINDate);
								session.setAttribute("REFRESH", "TRUE");
								response.sendRedirect("Inventory_Servlet?status=insertError");
								return;
							}

						}

					}
				}
			}
		}
	}

}
