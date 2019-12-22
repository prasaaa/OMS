package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_INSERT;
import com.DatabaseHandle.Inventory_UPDATE;
import com.Utilities.MySQLQueries;
import com.model.InventoryStockOUT;
import com.model.StockOUTItems;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

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



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String customerOrderID = "", itemID = "", stockOutDate = "", remarks = "";
		String[] barcodeList = {}, descriptionList = {};

		try {

			customerOrderID = request.getParameter("customerOrder").trim();
			itemID = request.getParameter("itemID").trim();
			stockOutDate = request.getParameter("stockoutdate").trim();
			remarks = request.getParameter("remarksStockOUT").trim().replaceAll("['][\"][\\e][\\\\][\\s][;:<>(){}]", "");
			barcodeList = request.getParameterValues("barcode");
			descriptionList = request.getParameterValues("description");

			InventoryStockOUT inventoryStockOUT = new InventoryStockOUT();

			inventoryStockOUT.setCustomerOrderID(customerOrderID);
			inventoryStockOUT.setItemID(itemID);
			inventoryStockOUT.setStockOUTDate(stockOutDate);
			inventoryStockOUT.setRemarks(remarks);

			inventoryStockOUT.setStockOUTID("STOCK_OUT_".concat(new Timestamp(new Date().getTime()).toString().trim().replaceAll("[\\s.:-]", "_")));

			StockOUTItems[] stockOUTItems = new StockOUTItems[barcodeList.length];

			for (int i = 0; i < barcodeList.length; i++) {
				stockOUTItems[i] = new StockOUTItems(inventoryStockOUT.getCustomerOrderID(), inventoryStockOUT.getItemID(), inventoryStockOUT.getStockOUTDate(), inventoryStockOUT.getRemarks(), inventoryStockOUT.getStockOUTID());

				stockOUTItems[i].setBarcodeNumber(barcodeList[i].trim());
				stockOUTItems[i].setDescription(descriptionList[i].trim().replaceAll("['][\"][\\e][\\\\][\\s][;:<>(){}]", ""));
			}

			inventoryStockOUT.setStockOUTItems(stockOUTItems);


			Inventory_INSERT inventory_insert = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_INSERT_STOCK_OUT);
			Inventory_UPDATE inventory_update = new Inventory_UPDATE(ConnectionManager.getConnection(), MySQLQueries.QUERY_UPDATE_STOCK_OUT_ID_IN_ITEM_LIST);

			boolean bool = true;

			bool = inventory_insert.InsertStockOUT(inventoryStockOUT.getStockOUTID(), inventoryStockOUT.getCustomerOrderID(), inventoryStockOUT.getItemID(), inventoryStockOUT.getStockOUTDate(), inventoryStockOUT.getRemarks());

			if (bool) {

				long itemsCount = 0;

				for (StockOUTItems items : inventoryStockOUT.getStockOUTItems()) {
					itemsCount = inventory_update.updateStock(items.getStockOUTID(), items.getDescription(), items.getItemID(), items.getBarcodeNumber());


					if (!(itemsCount > 0)) {
						bool = false;
						break;
					}
				}

				if (bool) {

					response.sendRedirect("Stock_OUT_Servlet?status=insertSuccess");


				} else {
					response.sendRedirect("Stock_OUT_Servlet?status=insertNotSuccess");
				}


			} else {
				response.sendRedirect("Stock_OUT_Servlet?status=insertFail");
			}

		} catch (Exception e) {
			response.sendRedirect("Stock_OUT_Servlet?status=insertError");
		}
	}

}
