package com.Controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.*;
import com.model.InventoryStock;
import com.model.ItemList;
import com.model.Items;
import com.Utilities.MySQLQueries;

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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		InventoryStock stock = new InventoryStock();
		ItemList list = new ItemList();

		String iname = request.getParameter("iname");
		String manu = request.getParameter("manu");
		String supplier = request.getParameter("sup");

		String[] barcodeList = request.getParameter("barcode").split("\n");

		for (int i = 0; i < barcodeList.length; i++) {
			barcodeList[i] = barcodeList[i].trim();
		}

		HashSet<String> barcodeSet = new HashSet<>();

		for (String str : barcodeList) {
			barcodeSet.add(str);
		}

		Items[] item = new Items[barcodeSet.size()];

		String itype = "";
		if (request.getParameter("itype") != null)
			itype = request.getParameter("itype");

		String buy = request.getParameter("bppitem");
		String sell = request.getParameter("sppitem");
		double bppitem = 0;
		double sppitem = 0;
		long bquantity = barcodeSet.size();

		try {
			if (!buy.isEmpty())
				bppitem = Double.parseDouble(buy);
			if (!sell.isEmpty())
				sppitem = Double.parseDouble(sell);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} finally {
			list.setModel(iname);
			list.setManufacturer(manu);
			list.setSupplier(supplier);
			list.setType(itype);
			list.setBuyingPrice(bppitem);
			list.setSellingPrice(sppitem);

			int j = 0;

			for (String str : barcodeSet) {
				item[j] = new Items();
				item[j].setBarcode(str);
				j++;

			}

			list.setItems(item);

			String stockINDate = request.getParameter("stockindate");
			String remarks = request.getParameter("remarks");
			String button = request.getParameter("submitButton");

			stock.setDate(stockINDate);
			stock.setRemarks(remarks);
			stock.setQuantity(bquantity);

			stock.setItemList(list);

			if (!button.isEmpty()) {

				if (button.equalsIgnoreCase("Insert Stock")) {

					Inventory_INSERT insertItem = new Inventory_INSERT(ConnectionManager.getConnection(),
							MySQLQueries.QUERY_INSERT_ITEM);
					Inventory_INSERT selectItemID = new Inventory_INSERT(ConnectionManager.getConnection(),
							MySQLQueries.QUERY_SELECT_ITEM_ID);
					Inventory_INSERT insertModel = new Inventory_INSERT(ConnectionManager.getConnection(),
							MySQLQueries.QUERY_INSERT_ITEM_MODEL);

					Inventory_INSERT insertStock = new Inventory_INSERT(ConnectionManager.getConnection(),
							MySQLQueries.QUERY_INSERT_STOCK);
					Inventory_INSERT selectStockID = new Inventory_INSERT(ConnectionManager.getConnection(),
							MySQLQueries.QUERY_SELECT_STOCK_ID);
					Inventory_INSERT insertItemList = new Inventory_INSERT(ConnectionManager.getConnection(),
							MySQLQueries.QUERY_INSERT_ITEM_LIST);

					Inventory_INSERT selectBarcodes = new Inventory_INSERT(ConnectionManager.getConnection(),
							MySQLQueries.QUERY_SELECT_BARCODES_BY_ITEM_ID);

					boolean itemModelStatus = insertModel.InsertItemModel(list.getModel());

					if (itemModelStatus == true) {

						boolean itemStatus = insertItem.Insert_Item(list.getModel(), list.getManufacturer(),
								list.getSupplier(), list.getType(), list.getBuyingPrice(), list.getSellingPrice());

						if (itemStatus == true) {

							String itemID = selectItemID.getItemID(list.getModel(), list.getManufacturer(),
									list.getSupplier());

							if (!itemID.isEmpty()) {

								boolean itemListStatus = true;

								List<String> barcodes = selectBarcodes.getBarcodeList(itemID);

								if (!barcodes.isEmpty()) {

									for (String bar : barcodes) {

										for (Items barcode : item) {

											if (barcode.getBarcode().equalsIgnoreCase(bar)) {
												itemListStatus = false;
												break;
											} else {
												itemListStatus = true;
												continue;
											}

										}

										if (itemListStatus == false)
											break;
										else
											continue;
									}
								}

								if (itemListStatus == true) {

									boolean stockStatus = insertStock.InsertStock(itemID, stock.getQuantity(),
											stock.getDate(), stock.getRemarks());

									if (stockStatus == true) {

										String stockID = selectStockID.getStockID(itemID);

										if (!stockID.isEmpty()) {
											
											boolean status = true;
											
											for (Items barcode : item) {
												status = insertItemList.InsertItemList(itemID, stockID,
														barcode.getBarcode(), list.getModel());

												if (status == false)
													break;

											}

											if (status == true) {
												if (request.getSession(false) != null) {
													request.getSession(false).setAttribute("stock", stock);
												} else {
													HttpSession session = request.getSession(true);
													session.setAttribute("stock", stock);
												}
												response.sendRedirect("Inventory_Servlet?status=insertSuccess");
												return;
											} else {
												response.sendRedirect("Inventory_Servlet?status=insertNotSuccess");
												return;
											}

										} else {
											response.sendRedirect("Inventory_Servlet?status=insertFail");
											return;
										}

									} else {
										response.sendRedirect("Inventory_Servlet?status=insertFail");
										return;
									}

								} else {
									response.sendRedirect("Inventory_Servlet?status=insertError");
									return;
								}
							} else {
								response.sendRedirect("Inventory_Servlet?status=insertFail");
								return;
							}

						} else {
							response.sendRedirect("Inventory_Servlet?status=insertFail");
							return;
						}
					} else {
						response.sendRedirect("Inventory_Servlet?status=insertFail");
						return;
					}

				}

			}
		}
	}

}
