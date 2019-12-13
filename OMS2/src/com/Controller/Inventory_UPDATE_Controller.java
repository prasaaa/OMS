package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_DELETE;
import com.DatabaseHandle.Inventory_INSERT;
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
import java.io.IOException;

@WebServlet("/Inventory_UPDATE_Controller")
public class Inventory_UPDATE_Controller extends HttpServlet {


    private String itemID = "", stockINDate = "", remarks = "";
    private String[] workingBarcodeList = {}, faultBarcodeList = {}, workingListDescriptions = {}, faultListDescriptions = {};
    private String stockInId = "";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {

            stockInId = request.getParameter("stockINId");
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

            stock.setDate(stockINDate.trim());
            stock.setRemarks(remarks.trim());


            stock.setStockID(stockInId);


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

            Inventory_UPDATE inventory_update = new Inventory_UPDATE(ConnectionManager.getConnection(), MySQLQueries.QUERY_UPDATE_STOCK_IN_TABLE);
            Inventory_INSERT item_insert = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_INSERT_ITEM_LIST);

            Inventory_INSERT checkDuplicate = new Inventory_INSERT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_ALL_OTHER_ITEMS);

            Inventory_DELETE deleteByStockID = new Inventory_DELETE(ConnectionManager.getConnection(),
                    MySQLQueries.QUERY_DELETE_ITEMS_BY_STOCK_ID);


            boolean boolItemsList = true;
            for (Items i : stock.getItemList().getItems()) {
                boolItemsList = checkDuplicate.checkAvailability(i.getBarcode(), stock.getStockID());

                if (!boolItemsList)
                    break;


            }

            if (boolItemsList) {


                long updateRowCount = inventory_update.updateStock(stock.getDate(), stock.getRemarks(), stock.getItemList().getItemID(), stock.getStockID());

                long count = 0;

                boolean boolItems = true;

                if (updateRowCount > 0) {

                    count = deleteByStockID.deleteQueryData(stock.getStockID());


                    if (count > 0) {


                        for (Items i : stock.getItemList().getItems()) {
                            boolItems = item_insert.InsertItemList(itemList.getItemID(), i.getBarcode(), i.getItemStatus(), i.getDescription(), stock.getStockID());

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

                if (request.getSession(false) != null)
                    request.getSession(false).setAttribute("stockIN", stock);
                else
                    request.getSession(true).setAttribute("stockIN", stock);

                response.sendRedirect("Inventory_Servlet?status=updateError");
            }
        } catch (Exception e) {
            e.printStackTrace();


            response.sendRedirect("Inventory_Servlet?status=updateFail");

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
