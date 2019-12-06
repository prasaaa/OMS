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

/**
 * Servlet implementation class Inventory_SELECT_Controller
 */
@WebServlet("/Inventory_SELECT_Controller")
public class Inventory_SELECT_Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inventory_SELECT_Controller() {
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

        Inventory_SELECT selectBarcode = new Inventory_SELECT(ConnectionManager.getConnection(),
                MySQLQueries.QUERY_SELECT_BY_BARCODE);

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
                response.sendRedirect("Inventory_Servlet?status=insertReset");
                return;
            } else if (request.getParameter("jspPage").equals("delete")) {
                response.sendRedirect("Inventory_Servlet?status=deleteReset");
                return;
            }
        } else if (queryType.equalsIgnoreCase("bar")) {
            results = selectBarcode.retreiveQueryData(queryValue);
        }


        try {
            if (results != null) {
                if (results.first()) {

                    session.setAttribute("results", results);
                    if (request.getParameter("jspPage").equals("insert")) {
                        response.sendRedirect("Inventory_Servlet?status=insertResultsFound");
                        return;
                    } else if (request.getParameter("jspPage").equals("delete")) {
                        response.sendRedirect("Inventory_Servlet?status=deleteResultsFound&queryValue=" + queryValue
                                + "&queryType=" + queryType);
                        return;
                    }

                } else {
                    session.removeAttribute("results");
                    if (request.getParameter("jspPage").equals("insert")) {
                        response.sendRedirect("Inventory_Servlet?status=noInsertResults");
                        return;
                    } else if (request.getParameter("jspPage").equals("delete")) {
                        response.sendRedirect("Inventory_Servlet?status=noDeleteResults");
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
