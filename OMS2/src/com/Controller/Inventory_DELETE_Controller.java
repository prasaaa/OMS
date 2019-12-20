package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_DELETE;
import com.Utilities.MySQLQueries;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Inventory_DELETE_Controller
 */
@WebServlet("/Inventory_DELETE_Controller")
public class Inventory_DELETE_Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String stockInId = "";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inventory_DELETE_Controller() {
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

        Inventory_DELETE deleteByStockID = new Inventory_DELETE(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_DELETE_STOCK_BY_STOCK_ID);


        try {

            stockInId = request.getParameter("stock_in_id");

            if (deleteByStockID.deleteQueryData(stockInId) > 0) {
                response.sendRedirect("Inventory_Servlet?status=deleteSuccess");

            } else {
                response.sendRedirect("Inventory_Servlet?status=warning");

            }


        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Inventory_Servlet?status=deleteFail");

        }


    }

}
