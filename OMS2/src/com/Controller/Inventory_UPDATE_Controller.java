package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_DELETE;
import com.DatabaseHandle.Inventory_INSERT;
import com.DatabaseHandle.Inventory_UPDATE;
import com.Utilities.MySQLQueries;
import com.model.InventoryStock;
import com.model.Items;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Inventory_UPDATE_Controller")
public class Inventory_UPDATE_Controller extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String itemID, stockINDate, remarks = "";
        String[] workingBarcodeList = {}, stockOUTList = {}, faultBarcodeList = {}, workingListDescriptions = {}, faultListDescriptions = {};
        String stockInId;
        String index;

        try {

            stockInId = request.getParameter("stockINId");
            itemID = request.getParameter("itemID");
            stockINDate = request.getParameter("stockindate");
            index = request.getParameter("indexNumber");

            if (request.getParameter("remarks") != null)
                remarks = request.getParameter("remarks");


            if (request.getParameterValues("barcode") != null && request.getParameterValues("workingDescription") != null && request.getParameterValues("stockOUT") != null) {
                workingBarcodeList = request.getParameterValues("barcode");
                workingListDescriptions = request.getParameterValues("workingDescription");
                stockOUTList = request.getParameterValues("stockOUT");
            }

            if (request.getParameterValues("faultBarcode") != null && request.getParameterValues("faultDescription") != null) {
                faultBarcodeList = request.getParameterValues("faultBarcode");
                faultListDescriptions = request.getParameterValues("faultDescription");
            }


            InventoryStock stock = new InventoryStock();

            List<String> duplicateList = new ArrayList<>();

            stock.setDate(stockINDate.trim());
            stock.setRemarks(remarks.trim());


            stock.setStockID(stockInId);


            int totalItemsLength = workingBarcodeList.length + faultBarcodeList.length;

            Items[] items = new Items[totalItemsLength];

            stock.setItemID(itemID.trim());


            for (int i = 0; i < totalItemsLength; i++) {

                if (workingBarcodeList.length != 0 && faultBarcodeList.length != 0) {

                    if (i < workingBarcodeList.length) {
                        items[i] = new Items(stock.getItemID(), stock.getStockID(), stock.getDate(), stock.getRemarks());
                        items[i].setBarcode(workingBarcodeList[i].trim());
                        items[i].setDescription(workingListDescriptions[i].trim());
                        items[i].setStockOUTID(stockOUTList[i].trim());
                        items[i].setItemStatus("Working");
                    } else {
                        items[i] = new Items(stock.getItemID(), stock.getStockID(), stock.getDate(), stock.getRemarks());
                        items[i].setBarcode(faultBarcodeList[i - workingBarcodeList.length].trim());
                        items[i].setDescription(faultListDescriptions[i - workingBarcodeList.length].trim());
                        items[i].setItemStatus("faulty");

                    }

                } else if (workingBarcodeList.length == 0 && faultBarcodeList.length != 0) {
                    items[i] = new Items(stock.getItemID(), stock.getStockID(), stock.getDate(), stock.getRemarks());
                    items[i].setBarcode(faultBarcodeList[i].trim());
                    items[i].setDescription(faultListDescriptions[i].trim());
                    items[i].setItemStatus("faulty");


                } else if (workingBarcodeList.length != 0) {
                    items[i] = new Items(stock.getItemID(), stock.getStockID(), stock.getDate(), stock.getRemarks());
                    items[i].setBarcode(workingBarcodeList[i].trim());
                    items[i].setDescription(workingListDescriptions[i].trim());
                    items[i].setStockOUTID(stockOUTList[i].trim());
                    items[i].setItemStatus("Working");
                }


            }


            stock.setItems(items);


            Inventory_UPDATE inventory_update = new Inventory_UPDATE(ConnectionManager.getConnection(), MySQLQueries.QUERY_UPDATE_STOCK_IN_TABLE);
            Inventory_INSERT item_insert = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_INSERT_ITEM_LIST_FOR_UPDATE);

            Inventory_INSERT checkDuplicate = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_ALL_OTHER_ITEMS);

            Inventory_DELETE deleteByStockID = new Inventory_DELETE(ConnectionManager.getConnection(),
                    MySQLQueries.QUERY_DELETE_ITEMS_BY_STOCK_ID);


            boolean boolItemsList;
            for (Items i : stock.getItems()) {
                boolItemsList = checkDuplicate.checkAvailability(i.getBarcode(), i.getStockID());

                if (!boolItemsList) {
                    duplicateList.add(i.getBarcode());

                }

            }


            if (duplicateList.isEmpty()) {


                long updateRowCount = inventory_update.updateStock(stock.getDate(), stock.getRemarks(), stock.getItemID(), stock.getStockID());

                long count = 0;

                boolean boolItems = true;

                if (updateRowCount > 0) {

                    count = deleteByStockID.deleteQueryData(stock.getStockID());


                    if (count > 0) {


                        for (Items i : stock.getItems()) {
                            boolItems = item_insert.InsertItemList(i.getItemID(), i.getBarcode(), i.getItemStatus(), i.getDescription(), i.getStockID());

                            if (!boolItems)
                                break;

                        }
                    }
                }

                if (updateRowCount > 0 && count > 0 && boolItems) {
                    response.sendRedirect("Inventory_Servlet?status=updateSuccess");

                } else {

                    if (request.getSession(false) != null)
                        request.getSession(false).setAttribute("stockIN", stock);
                    else
                        request.getSession(true).setAttribute("stockIN", stock);

                    response.sendRedirect("Inventory_Servlet?status=updateNotSuccess");
                }
            } else {

                if (request.getSession(false) != null) {
                    request.getSession(false).setAttribute("stockIN", stock);
                    request.getSession(false).setAttribute("duplicates", duplicateList);
                    request.getSession(false).setAttribute("index", index);
                } else {
                    request.getSession(true).setAttribute("stockIN", stock);
                    request.getSession(true).setAttribute("duplicates", duplicateList);
                    request.getSession(true).setAttribute("index", index);
                }
                response.sendRedirect("Inventory_Servlet?status=duplicatesFound");
            }
        } catch (Exception e) {
            e.printStackTrace();


            response.sendRedirect("Inventory_Servlet?status=updateFail");

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
