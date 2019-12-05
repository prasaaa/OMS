package com.Controller;

import com.model.InventoryStock;
import com.model.ItemList;
import com.model.Items;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Servlet implementation class Inventory_INSERT_Controller
 */
@WebServlet("/Inventory_INSERT_Controller")
public class Inventory_INSERT_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String itemID = "", stockINDate = "", remarks = "";
	private String[] workingBarcodeList = {}, faultBarcodeList = {}, workingListDescriptions = {}, faultListDescriptions = {};

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Inventory_INSERT_Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 * response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 * response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			itemID = request.getParameter("itemID");
			stockINDate = request.getParameter("stockindate");

			if (request.getParameter("remarks") != null)
				remarks = request.getParameter("remarks");


			if (request.getParameterValues("barcode") != null && request.getParameterValues("workingDescription") != null) {
				workingBarcodeList = request.getParameterValues("barcode");
				workingListDescriptions = request.getParameterValues("workingDescription");
			}

			if (request.getParameterValues("faultBarcode") != null && request.getParameterValues("faultDescription") != null) {
				faultBarcodeList = request.getParameterValues("faultBarcode");
				faultListDescriptions = request.getParameterValues("faultDescription");
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		InventoryStock stock = new InventoryStock();

		stock.setDate(stockINDate);
		stock.setRemarks(remarks);

		Date date = new Date();
		long time = date.getTime();

		Timestamp timestamp = new Timestamp(time);

		String stockID = "STOCK_IN_".concat(timestamp.toString().trim().replaceAll("[\\s.:-]", "_"));
		stock.setStockID(stockID);

		ItemList itemList = new ItemList();
		Items[] items = new Items[workingBarcodeList.length + faultBarcodeList.length];

		if (workingBarcodeList.length != 0) {
			for (int i = 0; i < workingBarcodeList.length; i++) {
				items[i] = new Items();
				items[i].setBarcode(workingBarcodeList[i]);
				items[i].setDescription(workingListDescriptions[i]);
				items[i].setItemStatus("Working");


			}
		}

		if (faultBarcodeList.length != 0) {
			for (int i = 0; i < faultBarcodeList.length; i++) {
				items[i] = new Items();
				items[i].setBarcode(faultBarcodeList[i]);
				items[i].setDescription(faultListDescriptions[i]);
				items[i].setItemStatus("Faulty");

			}
		}

		itemList.setItems(items);

		stock.setItemList(itemList);

		System.out.println(stock.getStockID());

		response.sendRedirect("Stock_IN_INSERT.jsp");


	}

}
