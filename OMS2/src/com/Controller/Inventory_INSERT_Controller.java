package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_INSERT;
import com.Utilities.MySQLQueries;
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
import java.util.ArrayList;
import java.util.Date;
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

        String itemID = "", stockINDate = "", remarks = "";
        String[] workingBarcodeList = {}, faultBarcodeList = {}, workingListDescriptions = {}, faultListDescriptions = {};

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


            InventoryStock stock = new InventoryStock();

            List<String> duplicateList = new ArrayList<>();

            stock.setDate(stockINDate.trim());
            stock.setRemarks(remarks.trim());

            String stockID = "STOCK_IN_".concat(new Timestamp(new Date().getTime()).toString().trim().replaceAll("[\\s.:-]", "_"));
            stock.setStockID(stockID);

            System.out.println("working : " + workingBarcodeList.length);
            System.out.println("faulty : " + faultBarcodeList.length);

            int totalItemsLength = workingBarcodeList.length + faultBarcodeList.length;

            ItemList itemList = new ItemList();
            Items[] items = new Items[totalItemsLength];

            itemList.setItemID(itemID.trim());


            for (int i = 0; i < totalItemsLength; i++) {

                if (workingBarcodeList.length != 0 && faultBarcodeList.length != 0) {

                    if (i < workingBarcodeList.length) {
                        items[i] = new Items();
                        items[i].setBarcode(workingBarcodeList[i].trim());
                        items[i].setDescription(workingListDescriptions[i].trim());
                        items[i].setItemStatus("Working");
                    } else {
                        items[i] = new Items();
                        items[i].setBarcode(faultBarcodeList[i - workingBarcodeList.length].trim());
                        items[i].setDescription(faultListDescriptions[i - workingBarcodeList.length].trim());
                        items[i].setItemStatus("faulty");

                    }

                } else if (workingBarcodeList.length == 0 && faultBarcodeList.length != 0) {
                    items[i] = new Items();
                    items[i].setBarcode(faultBarcodeList[i].trim());
                    items[i].setDescription(faultListDescriptions[i].trim());
                    items[i].setItemStatus("faulty");


                } else if (workingBarcodeList.length != 0) {
                    items[i] = new Items();
                    items[i].setBarcode(workingBarcodeList[i].trim());
                    items[i].setDescription(workingListDescriptions[i].trim());
                    items[i].setItemStatus("Working");
                }


            }


            itemList.setItems(items);

            stock.setItemList(itemList);

            Inventory_INSERT inventory_insert = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_INSERT_STOCK);
            Inventory_INSERT item_insert = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_INSERT_ITEM_LIST);

            Inventory_INSERT checkDuplicate = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_SELECT_ITEM_BY_BARCODE);

            boolean boolItemsList;
            for (Items i : stock.getItemList().getItems()) {
                boolItemsList = checkDuplicate.checkAvailability(i.getBarcode());

                if (!boolItemsList) {
                    duplicateList.add(i.getBarcode());

                }

            }

            if (duplicateList.isEmpty()) {
                boolean boolStock = inventory_insert.InsertStock(stock.getStockID(), stock.getDate(), stock.getRemarks(), stock.getItemList().getItemID());

                boolean boolItems = true;
                for (Items i : items) {
                    boolItems = item_insert.InsertItemList(itemList.getItemID(), i.getBarcode(), i.getItemStatus(), i.getDescription(), stock.getStockID());

                    if (!boolItems)
                        break;


                }

                if (boolStock && boolItems) {
                    response.sendRedirect("Inventory_Servlet?status=insertSuccess");

                } else {

                    if (request.getSession(false) != null)
                        request.getSession(false).setAttribute("stock", stock);
                    else
                        request.getSession(true).setAttribute("stock", stock);
                    response.sendRedirect("Inventory_Servlet?status=insertNotSuccess");
                }
            } else {

                if (request.getSession(false) != null) {
                    request.getSession(false).setAttribute("stock", stock);
                    request.getSession(false).setAttribute("duplicateList", duplicateList);
                } else {
                    request.getSession(true).setAttribute("stock", stock);
                    request.getSession(true).setAttribute("duplicateList", duplicateList);
                }
                response.sendRedirect("Inventory_Servlet?status=insertError");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Inventory_Servlet?status=insertFail");

        }


    }

}
