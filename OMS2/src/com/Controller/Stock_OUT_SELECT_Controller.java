package com.Controller;

import com.DBConnection.ConnectionManager;
import com.DatabaseHandle.Inventory_SELECT;
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
import java.util.LinkedList;

/**
 * Servlet implementation class Stock_OUT_SELECT_Controller
 */
@WebServlet("/Stock_OUT_SELECT_Controller")
public class Stock_OUT_SELECT_Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stock_OUT_SELECT_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Inventory_SELECT selectByBarcode = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_BARCODE);
        Inventory_SELECT selectByID = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_ID);

        Inventory_SELECT selectByModel = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_MODEL);
        
        Inventory_SELECT selectByManu = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_MANUFACTURER);

        Inventory_SELECT selectByType = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_TYPE);

        Inventory_SELECT selectByDate = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_DATE);

        Inventory_SELECT selectByCustomer = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_CUSTOMER);

        Inventory_SELECT selectByOrder = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_STOCK_OUT_BY_ORDER);

        Inventory_SELECT selectOrderByID = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_ORDER_BY_ID);

        Inventory_SELECT selectOrderByCustomer = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_ORDER_BY_CUSTOMER);

        Inventory_SELECT selectOrderByOrderDate = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_ORDER_BY_ORDER_DATE);

        Inventory_SELECT selectOrderByRequiredDate = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_ORDER_BY_REQ_DATE);

        Inventory_SELECT selectOrderByStatus = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_ORDER_BY_STATUS);

        Inventory_SELECT selectOrderByType = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_ORDER_BY_TYPE);

        String queryValue = "";
        String queryType = "";
        String type = "";

        if (request.getParameter("search") != null)
            type = request.getParameter("search");
        if (!type.equalsIgnoreCase("Reset")) {
            if (request.getParameter("queryValue") != null && request.getParameter("queryType") != null) {
                queryValue = request.getParameter("queryValue");
                queryType = request.getParameter("queryType");
            }
        }

        HttpSession session = request.getSession(false);

        if (session == null)
            session = request.getSession(true);

        ResultSet results = null;

        if (queryType.isEmpty() && queryValue.isEmpty()) {
            if (request.getParameter("jspPage").equals("insert")) {
                response.sendRedirect("Stock_OUT_Servlet?status=insertReset");
                return;
            } else if (request.getParameter("jspPage").equals("delete")) {
                response.sendRedirect("Stock_OUT_Servlet?status=deleteReset");
                return;
            } else if (request.getParameter("jspPage").equals("search")) {
                response.sendRedirect("Stock_OUT_Servlet?status=searchReset");
                return;
            }

        } else {

            if (request.getParameter("jspPage").equals("search")) {

                if (queryType.equals("custOrder"))
                    results = selectOrderByID.retreiveQueryData(queryValue);
                else if (queryType.equals("custName"))
                    results = selectOrderByCustomer.retreiveQueryData(queryValue);
                else if (queryType.equals("orderdate"))
                    results = selectOrderByOrderDate.retreiveQueryData(queryValue);
                else if (queryType.equals("reqdate"))
                    results = selectOrderByRequiredDate.retreiveQueryData(queryValue);
                else if (queryType.equals("ordStatus"))
                    results = selectOrderByStatus.retreiveQueryData(queryValue);
                else if (queryType.equals("ordType"))
                    results = selectOrderByType.retreiveQueryData(queryValue);

            } else {

                if (queryType.equals("bar"))
                    results = selectByBarcode.retreiveQueryData(queryValue);
                else if (queryType.equals("stockoutid"))
                    results = selectByID.retreiveQueryData(queryValue);
                else if (queryType.equals("iname"))
                    results = selectByModel.retreiveQueryData(queryValue);
                else if (queryType.equals("manu"))
                    results = selectByManu.retreiveQueryData(queryValue);
                else if (queryType.equals("itype"))
                    results = selectByType.retreiveQueryData(queryValue);
                else if (queryType.equals("stockoutdate"))
                    results = selectByDate.retreiveQueryData(queryValue);
                else if (queryType.equals("customer"))
                    results = selectByCustomer.retreiveQueryData(queryValue);
                else if (queryType.equalsIgnoreCase("custOrder"))
                    results = selectByOrder.retreiveQueryData(queryValue);
            }
        }

        try {
            if (results != null) {
                if (results.first()) {

                    session.setAttribute("results", results);
                    if (request.getParameter("jspPage").equals("insert")) {
                        response.sendRedirect("Stock_OUT_Servlet?status=insertResultsFound");
                        return;
                    } else if (request.getParameter("jspPage").equals("delete")) {
                        response.sendRedirect("Stock_OUT_Servlet?status=deleteResultsFound&queryValue=" + queryValue
                                + "&queryType=" + queryType);
                        return;
                    } else if (request.getParameter("jspPage").equals("search")) {
                        response.sendRedirect("Stock_OUT_Servlet?status=searchResultsFound");
                        return;
                    }

                } else {
                    session.removeAttribute("results");
                    if (request.getParameter("jspPage").equals("insert")) {
                        response.sendRedirect("Stock_OUT_Servlet?status=noInsertResults");
                        return;
                    } else if (request.getParameter("jspPage").equals("delete")) {
                        response.sendRedirect("Stock_OUT_Servlet?status=noDeleteResults");
                        return;
                    } else if (request.getParameter("jspPage").equals("search")) {
                        response.sendRedirect("Stock_OUT_Servlet?status=noSearchResults");
                        return;
                    }
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
        
     
    }

}
