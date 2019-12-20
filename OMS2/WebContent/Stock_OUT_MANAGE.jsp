<%--suppress ALL --%>
<%--suppress XmlDuplicatedId --%>
<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.DatabaseHandle.Inventory_SELECT" %>
<%@page import="com.DatabaseHandle.Main_SELECT" %>
<%@page import="com.Utilities.MySQLQueries" %>
<%-- page import="com.model.CurrentUser" --%>
<%@ page import="com.model.InventoryStock" %>
<%@ page import="com.model.Items" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Automated Barcode Solution</title>

    <link rel="stylesheet"
          href="vendor/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link
            href="vendor/bootstrap/4.3.1/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">


    <link rel="stylesheet"
          href="/vendor/fontawesome-free-5.12.0-web/css/all.min.css">

    <script src="${pageContext.request.contextPath}/vendor/fontawesome-free-5.12.0-web/js/all.js" crossorigin="anonymous" ></script>

    <link href="vendor/select2-4.0.12/dist/css/select2.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar3.css" rel="stylesheet">

    <noscript class="noscript">
        <div id="div100">
            Please enable javascript in your browser ....
        </div>
    </noscript>

    <style>
        body {
            position: relative;
        }

        .noscript {
            width: 100%;
            height: 100%; /* will cover the text displayed when javascript is enabled*/
            z-index: 100000; /* higher than other z-index */
            position: absolute;
        }

        .noscript #div100 {
            display: block;
            height: 100%;
            background-color: white;
        }
    </style>

</head>
<body>
<%--
    System.out.println("this is user " + CurrentUser.getUsername());
    if (CurrentUser.getUsername().equals("nouser") || CurrentUser.getUsername().equals("")) {
        response.sendRedirect("login.jsp");
    }

--%>


<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server


    ResultSet resultset_for_items, resultSet;
    Main_SELECT si4 = new Main_SELECT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_ALL_ITEM_DETAILS);
    resultset_for_items = si4.get_table();

%>
<div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
        <div class="list-group list-group-flush">
            <div class="bg-light border-right" id="sidebar-wrapper">

                <div class="sidebar-heading">
                    Automated Barcode<br>Solution
                </div>
                <div class="list-group list-group-flush">
                    <%--
                        if (CurrentUser.getUsername().equals("admin")) {
                    --%>
                    <a href="Supplier_Order_Insert.jsp"
                       class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a>
                    <%--
                        }
                    --%>
                    <%--
                        if (CurrentUser.getUsername().equals("admin") || CurrentUser.getUsername().equals("accountant")
                                || CurrentUser.getUsername().equals("manager")) {
                    --%>
                    <a
                            class="list-group-item list-group-item-action bg-light dropdown-toggle"
                            data-toggle="collapse" href="#collapseExample" role="button"
                            aria-expanded="false" aria-controls="collapseExample">Inventory&nbsp;Management</a>
                    <div class="collapse" id="collapseExample">


                        <a href="Stock_IN_MANAGE.jsp"
                           class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;IN</a>
                        <a href="Stock_OUT_INSERT.jsp"
                           class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;OUT</a>


                    </div>

                    <a href="" class="list-group-item list-group-item-action bg-light">Payment&nbsp;Management</a>

                    <a href="Customer_Details_Insert.jsp"
                       class="list-group-item list-group-item-action bg-light">Customer&nbsp;Management</a>
                    <a href="Customer_Order_Insert.jsp"
                       class="list-group-item list-group-item-action bg-light">Installation&nbsp;Management</a>
                    <a href="Repair_INSERT.jsp"
                       class="list-group-item list-group-item-action bg-light">Repair&nbsp;Management</a>
                    <a href="Admin_Customer_Order_Conformation.jsp"
                       class="list-group-item list-group-item-action bg-light">Customer
                        Order &nbsp;Confirm</a> <a href="Emp_Management.jsp"
                                                   class="list-group-item list-group-item-action bg-light">Employee&nbsp;Management</a>
                    <a href="Emp_REPORT.jsp"
                       class="list-group-item list-group-item-action bg-light">Employee&nbsp;Reports</a>
                    <a href="IT_Manager_Assign_Emp.jsp"
                       class="list-group-item list-group-item-action bg-light">Employee
                        Assign &nbsp;Management</a>
                </div>
                <%--
                    }
                --%>
            </div>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <nav
                class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            <button class="btn btn-primary" id="menu-toggle">Menu</button>

            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> User</a>
                        <div class="dropdown-menu dropdown-menu-right"
                             aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="login.jsp">Log out</a>
                            <div class="dropdown-divider"></div>

                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <!--create the big table -->
        <div style="top: 0">
            <table class="table table-bordered table-striped mb-0"
                   style="width: 100%; height: 80%;">
                <tr>
                    <td style="padding: 0px 0px 0px 0px;">
                        <form action="Inventory_SELECT_Controller"
                              method="POST" id="searchForm" name="searchForm">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="padding-top: 0px; padding-bottom: 0px;"><select
                                            required class="btn-block" name="queryType" id="searchType"
                                            <%if (session.getAttribute("results") != null) {%> disabled
                                            <%}%>>

                                        <option value="" disabled selected>Search&nbsp;By...</option>
                                        <option value="bar">Barcode&nbsp;Number</option>
                                        <option value="stockid">Stock&nbsp;ID</option>
                                        <option value="iname">Item&nbsp;Model</option>
                                        <option value="manu">Manufacturer</option>
                                        <option value="sup">Supplier</option>
                                        <option value="itype">Item&nbsp;Type</option>
                                        <option value="stockindate">Stock&nbsp;IN&nbsp;Date</option>
                                    </select></td>
                                    <td style="padding-top: 0px; padding-bottom: 0px;"><input
                                            class="btn-block" name="queryValue" id="txtSearch"
                                            oninput="searchfunction()"
                                            type="text" placeholder="Type Here to Search..." required
                                        <%if (session.getAttribute("results") != null) {%> disabled
                                        <%}%>></td>

                                    <td style="padding-top: 8px;">
                                        <input

                                            <%if (session.getAttribute("results") != null) {%>
                                                name="search" type="reset" class="btn btn-danger btn-block"
                                                value="Reset" id="resetBtn1"
                                                onclick="window.location.replace(location.origin + location.pathname);"
                                            <%} else {%>
                                                name="search" type="reset" class="btn btn-danger btn-block"
                                                value="Reset" id="resetBtn" onclick="clearTable()"
                                            <%}%>></td>
                                </tr>
                            </table>
                        </form>
                    </td>
                    <td style="padding-top: 8px;">
                        <% if (session.getAttribute("insertConfirm") != null && session.getAttribute("stockInsert") != null) { %>

                        <div class="modal" id="exampleModalX" tabindex="-1" role="dialog">
                            <form action="Inventory_INSERT_Controller?parameterStatus=Confirm" method="post">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Confirm&nbsp;Insert</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <%
                                                List<String> stringList = (ArrayList<String>) session.getAttribute("insertConfirm");
                                                InventoryStock inventoryStock = (InventoryStock) session.getAttribute("stockInsert");

                                            %>

                                            <div class="container-fluid">
                                                <div class="row">
                                                    <table style="width: 100%">

                                                        <tr hidden>
                                                            <td>
                                                                <input type="text" name="itemID"
                                                                       value="<%=inventoryStock.getItemID()%>">
                                                                <input type="text" name="stockindate"
                                                                       value="<%=inventoryStock.getDate()%>">
                                                                <input type="text" name="remarks"
                                                                       value="<%=inventoryStock.getRemarks()%>">

                                                                <% for (Items items : inventoryStock.getItems()) { %>

                                                                <% if (items.getItemStatus().equalsIgnoreCase("Working")) { %>
                                                                <input type="text" name="barcode"
                                                                       value="<%=items.getBarcode()%>">
                                                                <input type="text" name="workingDescription"
                                                                       value="<%=items.getDescription()%>">
                                                                <% } else if (items.getItemStatus().equalsIgnoreCase("Faulty")) { %>
                                                                <input type="text" name="faultBarcode"
                                                                       value="<%=items.getBarcode()%>">
                                                                <input type="text" name="faultDescription"
                                                                       value="<%=items.getDescription()%>">
                                                                <% }
                                                                } %>
                                                            </td>
                                                        </tr>


                                                        <tr style="background-color: #cacaca;">
                                                            <td>
                                                                <div>
                                                                    <p style="color:<%if (session.getAttribute("color") != null) {%><%=session.getAttribute("color")%><%}%>">
                                                                        <%
                                                                            if (session.getAttribute("message") != null) {
                                                                        %>
                                                                        <%=session.getAttribute("message")%>
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr style="background-color: #e9e9e9;">
                                                            <td>
                                                                <div>

                                                                    <table>
                                                                        <%
                                                                            for (String string : stringList) {
                                                                        %>
                                                                        <tr>
                                                                            <td>
                                                                                <p style="color:<%if (session.getAttribute("color") != null) {%><%=session.getAttribute("color")%><%}%>">
                                                                                    <%=string.toString()%>
                                                                                </p>
                                                                            </td>
                                                                        </tr>
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </table>

                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr style="background-color: #cacaca;">
                                                            <td>
                                                                <div>
                                                                    <p>Are&nbsp;you&nbsp;Sure&nbsp;you&nbsp;want&nbsp;to&nbsp;Continue?</p>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-outline-success">Yes,&nbsp;Re-Insert
                                            </button>
                                            <button type="button" class="btn btn-outline-danger" data-dismiss="modal">
                                                No,&nbsp;Cancel
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <% } %>
                        <form id="mainForm" action="Inventory_INSERT_Controller" method="post">

                            <button type="button" class="btn btn-success btn-block" data-toggle="modal"
                                    data-target="#exampleModal" onclick="clearAllFieldsV()"><i class="fa fa-plus"></i>&nbsp;Create&nbsp;Stock
                            </button>

                            <%

                                InventoryStock stock = null;

                                if (session.getAttribute("stock") != null) {

                                    stock = (InventoryStock) session.getAttribute("stock");
                                }

                                InventoryStock inventoryStock = null;

                                if (session.getAttribute("stockIN") != null) {
                                    inventoryStock = (InventoryStock) session.getAttribute("stockIN");
                                }


                                List<String> duplicateList = null;
                                if (session.getAttribute("duplicateList") != null) {
                                    duplicateList = (ArrayList<String>) session.getAttribute("duplicateList");
                                }

                                List<String> duplicates = null;
                                if (session.getAttribute("duplicates") != null) {
                                    duplicates = (ArrayList<String>) session.getAttribute("duplicates");
                                }

                            %>


                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-xl modal-lg modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Create&nbsp;Stock</h5>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <table style="width: 100%">
                                                        <col style="width: 50%">
                                                        <col style="width: 50%">

                                                        <% if (session.getAttribute("stock") != null) { %>
                                                        <tr id="ErrorMessage" style="background-color: #cacaca;">
                                                            <td colspan="2">
                                                                <div>
                                                                    <p style="color:<%if (session.getAttribute("color") != null) {%><%=session.getAttribute("color")%><%}%>">
                                                                        <%
                                                                            if (session.getAttribute("message") != null) {
                                                                        %>
                                                                        <%=session.getAttribute("message")%>
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <% } %>
                                                        <tr style="background-color: #e9e9e9;">
                                                            <td>
                                                                <label for="itemdetailsdropitemv"
                                                                       id="stockItemv">Stock&nbsp;Item</label><br>
                                                                <div class="dropdown">
                                                                    <div class="popup"
                                                                         style="width:100%;">
                                                                        <input type="text"
                                                                               id="itemdetailsdropitemv"
                                                                               name="itemID"
                                                                               style="cursor: default;"
                                                                               placeholder="Click Here to Select an Item"
                                                                               value="" required
                                                                               autocomplete="off"
                                                                               readonly
                                                                               class="form-control"><i
                                                                            class="fa fa-caret-down"
                                                                            id="caretv"></i><span
                                                                            class="popuptext"
                                                                            id="myPopup3v"></span>
                                                                    </div>
                                                                    <div id="itemdetailsitemdisplayv"
                                                                         class="dropdown-content"
                                                                         style="margin-top:-4%;width:100%;height : 450%;overflow-y:scroll;overflow-x:hidden;border:1px solid #538AC0;">
                                                                        <div style="position: sticky;top:-6px;margin-top:-6px;padding:0">
                                                                            <input tabindex="0"
                                                                                   type="text"
                                                                                   id="itemdetailsmyInputv"
                                                                                   onkeyup="itemdetailsitemdisplayfilterFunctionV()"
                                                                                   autocomplete="off"
                                                                                   placeholder="Search here.."><i
                                                                                class="fa fa-search"
                                                                                id="caretSearchv"></i>
                                                                        </div>

                                                                        <div style="overflow-x:hidden;">


                                                                            <%
                                                                                try {
                                                                                    while (resultset_for_items.next()) {%>
                                                                            <a style="cursor: pointer;"
                                                                               id='<%=resultset_for_items.getString("item_id") %>v'
                                                                               tabindex="0">Item&nbsp;Model&nbsp;Name&nbsp;:&nbsp;<b><%=resultset_for_items.getString("item_model_name")%>
                                                                            </b><br>Item&nbsp;Type&nbsp;:&nbsp;<%=resultset_for_items.getString("item_type")%>
                                                                                <br>Manufacturer&nbsp;:&nbsp;<%=resultset_for_items.getString("item_manufacturer")%>
                                                                                <br>Supplier&nbsp;:&nbsp;<%=resultset_for_items.getString("item_supplier")%>
                                                                                <br>Description&nbsp;:&nbsp;<%=resultset_for_items.getString("item_details")%>
                                                                            </a>
                                                                            <script>
                                                                                document.getElementById('<%=resultset_for_items.getString("item_id") %>v').addEventListener('click', function () {
                                                                                    document.getElementById('itemdetailsdropitemv').value = '<%=resultset_for_items.getString("item_id")%>';
                                                                                    document.getElementById('iteminformationv').innerHTML = '<p>' + document.getElementById('<%=resultset_for_items.getString("item_id") %>v').innerHTML + '</p>';
                                                                                    document.getElementById('itemdetailsmyInputv').value = "";
                                                                                });

                                                                                document.getElementById('<%=resultset_for_items.getString("item_id") %>v').addEventListener("keyup", function (e) {
                                                                                    if (e.keyCode === 13) {
                                                                                        e.preventDefault();
                                                                                        document.getElementById('<%=resultset_for_items.getString("item_id") %>v').click();
                                                                                    }
                                                                                });

                                                                            </script>

                                                                            <%
                                                                                if (stock != null) {
                                                                                    if (resultset_for_items.getString("item_id").equalsIgnoreCase(stock.getItemID())) {


                                                                            %>

                                                                            <script>
                                                                                window.addEventListener('load', function () {
                                                                                    document.getElementById('itemdetailsdropitemv').value = '<%=resultset_for_items.getString("item_id")%>';
                                                                                    document.getElementById('iteminformationv').innerHTML = '<p>' + document.getElementById('<%=resultset_for_items.getString("item_id") %>v').innerHTML + '</p>';
                                                                                    document.getElementById('itemdetailsmyInputv').value = "";
                                                                                });


                                                                            </script>

                                                                            <% }
                                                                            }
                                                                            }

                                                                            } catch (Exception e) {
                                                                                e.printStackTrace();
                                                                            }%>

                                                                        </div>


                                                                    </div>

                                                                </div>
                                                                <div id="iteminformationv"
                                                                     style="width:100%; background-color: lightgrey; padding:0; height:auto; overflow-x:hidden;">
                                                                    <p>Item&nbsp;Information&nbsp;Goes&nbsp;Here....</p>
                                                                </div>
                                                                <br>

                                                                <select style="width: 100%" name="custOrder"
                                                                        class="select-select2"
                                                                        data-placeholder="Please choose one or more"
                                                                        data-allow-clear="true"
                                                                        data-close-on-select="false" multiple
                                                                        id="custOrder">
                                                                    <option>Lorem</option>
                                                                    <option>ipsum</option>
                                                                    <option>dolor</option>
                                                                    <option>sit amet</option>
                                                                    <option>consectetur</option>
                                                                    <option>adipisicing</option>
                                                                    <option>elit sed</option>
                                                                    <option>do eiusmod</option>
                                                                    <option>tempor</option>
                                                                    <option>incididunt</option>
                                                                    <option>ut labore</option>
                                                                    <option>et dolore</option>
                                                                    <option>magna aliqua</option>
                                                                    <option>Ut enim ad</option>
                                                                </select>

                                                                <label for="datePickerv">Stock&nbsp;IN&nbsp;Date</label>
                                                                <input type="date" name="stockindate"
                                                                       id="datePickerv" required

                                                                    <% if (stock != null) { %>
                                                                       value="<%= stock.getDate() %>"
                                                                    <% } else {%>
                                                                       value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>">
                                                                <% } %>
                                                                <br>
                                                                <label for="txtAreaRemarksv">Any&nbsp;other&nbsp;Information's</label>

                                                                <textarea id="txtAreaRemarksv"
                                                                          name="remarks"
                                                                          rows="4"
                                                                          cols="4"
                                                                          placeholder="Enter Stock Information Here..."><% if (stock != null) { %><%= stock.getRemarks() %><%}%></textarea>
                                                                <br>
                                                            </td>
                                                            <td>
                                                                <label id="itemsListv">Item&nbsp;List&nbsp;Details</label>
                                                                <div class="popup" style="width:100%;">
                                                                    <input style="width:100%;"
                                                                           type="text"
                                                                           id="txtBarcodev"
                                                                           name="barcodeNmber"
                                                                           placeholder="Enter Barcode Here...">
                                                                    <span class="popuptext"
                                                                          id="myPopup1v"></span>

                                                                </div>

                                                                <div class="popup" style="width:100%;">
                                                                    <select style="width:100%;"
                                                                            id="itemStatusv">
                                                                        <option selected disabled
                                                                                value="">
                                                                            Select&nbsp;Item&nbsp;Type
                                                                        </option>
                                                                        <option value="working">
                                                                            Working
                                                                        </option>
                                                                        <option value="faulty">Faulty
                                                                        </option>
                                                                    </select>
                                                                    <span class="popuptext"
                                                                          id="myPopup4v"></span>
                                                                </div>
                                                                <div class="popup"
                                                                     style="width:100%;"><textarea
                                                                        id="descriptionv"
                                                                        placeholder="Enter Fault Description Here..."
                                                                        cols="4"
                                                                        rows="4"></textarea><span
                                                                        class="popuptext"
                                                                        id="myPopup2v"></span>
                                                                </div>
                                                                <div style="width: 100%; display: flex; flex-direction: row;">
                                                                    <button style="width:50%; margin-right:2.5px;"
                                                                            class="btn btn-info"
                                                                            type="button"
                                                                            onclick="myFirstFunctionV();">
                                                                        Add&nbsp;Item
                                                                    </button>
                                                                    <button style="width:50%; margin-right:2.5px;"
                                                                            class="btn btn-warning"
                                                                            type="button"
                                                                            onclick="resetItemDetailsV();">
                                                                        Reset
                                                                    </button>
                                                                    <br>

                                                                </div>

                                                            </td>
                                                        </tr>
                                                        <tr style="background-color: #cacaca;">

                                                            <td>

                                                                <label for="txtBarcodev"
                                                                       id="workingItemsv">Working&nbsp;Item&nbsp;List</label><br>
                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:300px;overflow:auto; overflow-x:hidden;"
                                                                     id="workingListv">
                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                           id="workingItemsTablev"
                                                                           border=1>

                                                                        <%

                                                                            if (stock != null) {
                                                                                for (Items items : stock.getItems()) {

                                                                                    String color = "";
                                                                                    if (items.getItemStatus().equalsIgnoreCase("Working")) {
                                                                                        for (String list : duplicateList) {
                                                                                            if (list.equalsIgnoreCase(items.getBarcode())) {
                                                                                                color = "red";
                                                                                                break;
                                                                                            }
                                                                                        }

                                                                        %>
                                                                        <tr style="padding:0;">
                                                                            <td style="padding:0;"><input type="text"
                                                                                                          readonly
                                                                                <% if (color.equalsIgnoreCase("red")) {%>
                                                                                                          style="margin:0;border:0;color: red"
                                                                                <%} else {%>
                                                                                                          style="margin:0;border:0;color: black"
                                                                                <%}%>
                                                                                                          value="<%= items.getBarcode() %>"
                                                                                                          name="barcode">
                                                                            </td>
                                                                            <td style="padding:0;"><input type="text"
                                                                                                          style="margin:0;border:0;"
                                                                                                          name="workingDescription"
                                                                                                          value="<%= items.getDescription() %>">
                                                                            </td>
                                                                            <td style="padding:0;">
                                                                                <button style="margin:0;" type="button"
                                                                                        class="btn btn-danger"
                                                                                        onclick="removeWorkingItemRowV(this)">
                                                                                    <i class="fa fa-trash"></i></button>
                                                                            </td>
                                                                        </tr>
                                                                        <%
                                                                                    }
                                                                                }

                                                                            } %>

                                                                    </table>


                                                                </div>
                                                                <br>
                                                                <button style="width:100%"
                                                                        class="btn btn-warning"
                                                                        type="button"
                                                                        onclick="deleteAllWorkingItemsRowsV();">
                                                                    Clear&nbsp;All
                                                                </button>

                                                            </td>
                                                            <td>
                                                                <label for="txtBarcodev">Fault
                                                                    Item&nbsp;List</label><br>
                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:300px;overflow:auto; overflow-x:hidden;">
                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                           id="faultTablev"
                                                                           border=1>
                                                                        <%

                                                                            if (stock != null) {
                                                                                for (Items items : stock.getItems()) {


                                                                                    if (items.getItemStatus().equalsIgnoreCase("Faulty")) {

                                                                                        String color = "";
                                                                                        for (String list : duplicateList) {
                                                                                            if (list.equalsIgnoreCase(items.getBarcode())) {
                                                                                                color = "red";
                                                                                                break;
                                                                                            }
                                                                                        }
                                                                        %>
                                                                        <tr style="padding:0;">
                                                                            <td style="padding:0;"><input type="text"
                                                                                                          readonly

                                                                                <% if (color.equalsIgnoreCase("red")) {%>
                                                                                                          style="margin:0;border:0;color: red"
                                                                                <%} else {%>
                                                                                                          style="margin:0;border:0;color: black"
                                                                                <%}%>
                                                                                                          value="<%= items.getBarcode() %>"
                                                                                                          name="faultBarcode">
                                                                            </td>
                                                                            <td style="padding:0;"><input type="text"
                                                                                                          style="margin:0;border:0;"
                                                                                                          name="faultDescription"
                                                                                                          value="<%= items.getDescription() %>">
                                                                            </td>
                                                                            <td style="padding:0;">
                                                                                <button style="margin:0;" type="button"
                                                                                        class="btn btn-danger"
                                                                                        onclick="removeFaultItemRowV(this)">
                                                                                    <i class="fa fa-trash"></i></button>
                                                                            </td>
                                                                        </tr>
                                                                        <% }
                                                                        }

                                                                        } %>

                                                                    </table>


                                                                </div>
                                                                <br>
                                                                <button style="width:100%"
                                                                        class="btn btn-warning"
                                                                        type="button"
                                                                        onclick="deleteAllFaultItemsRowsV();">
                                                                    Clear&nbsp;All
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="btn-group btn-block" role="group"
                                                 aria-label="Basic example">
                                                <button type="reset"
                                                        class="btn btn-outline-danger btn-lg"
                                                        onclick="clearAllFieldsV();">
                                                    Reset&nbsp;Fields
                                                </button>
                                                <button type="button"
                                                        class="btn btn-outline-success btn-lg"
                                                        onclick="validateFormX()">Insert&nbsp;Stock
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </td>
                </tr>


                <!--division of the first two big columns start here -->
                <tr>
                    <!-- creating first column of the big table-->

                    <td colspan="2">
                        <!--inside the first column -->
                        <div class="table-wrapper-scroll-y my-custom-scrollbar"
                             style="height: 600px; position: relative; top: 0">


                            <!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                            <table id="mainTable"
                                   class="table table-bordered table-striped mb-0">
                                <thead>


                                <tr>
                                    <th>Stock&nbsp;IN&nbsp;ID</th>
                                    <th hidden>Item&nbsp;ID</th>
                                    <th>Model</th>
                                    <th>Manufacturer</th>
                                    <th>Supplier</th>
                                    <th>Type</th>
                                    <th>Received&nbsp;Date</th>
                                    <th>Workings</th>
                                    <th>Faults</th>
                                    <th>View</th>
                                    <th>Update</th>
                                    <th>Delete</th>


                                </tr>
                                </thead>


                                <tbody>
                                <%
                                    ResultSet results;
                                    if (session.getAttribute("results") != null) {

                                        results = (ResultSet) session.getAttribute("results");
                                        try {
                                            results.beforeFirst();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    } else {
                                        Inventory_SELECT si = new Inventory_SELECT(ConnectionManager.getConnection(),
                                                MySQLQueries.QUERY_GET_STOCK_TABLE);
                                        results = si.get_inventory_table();
                                    }

                                    if (results != null) {

                                        try {

                                            int i = 1;

                                            while (results.next()) {

                                                ResultSet workingResult = new Inventory_SELECT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_WORKING_STOCK_BY_STOCK_ID).retreiveQueryData(results.getString("stock_in_id"));
                                                ResultSet faultResult = new Inventory_SELECT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_FAULT_STOCK_BY_STOCK_ID).retreiveQueryData(results.getString("stock_in_id"));


                                %>

                                <tr>
                                    <td><%=results.getString("stock_in_id")%>
                                    </td>
                                    <td hidden><%=results.getString("item_id")%>
                                    </td>
                                    <td><%=results.getString("item_model_name")%>
                                    </td>
                                    <td><%=results.getString("item_manufacturer")%>
                                    </td>
                                    <td><%=results.getString("item_supplier")%>
                                    </td>
                                    <td><%=results.getString("item_type")%>
                                    </td>
                                    <td><%=results.getString("stock_in_date")%>
                                    </td>
                                    <td><%=results.getInt("workingCount")%>
                                    </td>
                                    <td><%=results.getInt("faultCount")%>
                                    </td>
                                    <td>


                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-outline-info" data-toggle="modal"
                                                data-target="#v<%out.print(results.getString("stock_in_id"));%>"
                                        ><i class="material-icons">info</i></button>


                                        <!-- Modal -->
                                        <div class="modal  fade"
                                             id="v<%out.print(results.getString("stock_in_id"));%>"
                                             tabindex="-1" role="dialog"
                                             aria-labelledby="v<%=results.getString("stock_in_id") %>"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-xl modal-lg modal-lg" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Stock&nbsp;Item&nbsp;Information</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="container-fluid">
                                                            <div class="row">

                                                                <table style="width:100%">
                                                                    <col style="width:50%">
                                                                    <col style="width:50%">
                                                                    <tr style="background-color: #f7f7f7;">
                                                                        <td>

                                                                            <table>
                                                                                <col style="width:20%">
                                                                                <col style="width:80%">
                                                                                <tr>
                                                                                    <th colspan="2">
                                                                                        <i>Stock&nbsp;Details</i>
                                                                                    </th>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>Stock&nbsp;IN&nbsp;ID</th>
                                                                                    <td><%= results.getString("stock_in_id")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>Stock&nbsp;IN&nbsp;Date</th>
                                                                                    <td><%= results.getString("stock_in_date")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>Stock&nbsp;Remarks</th>
                                                                                    <td><%= results.getString("remarks")%>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>

                                                                        </td>
                                                                        <td>

                                                                            <table>
                                                                                <col style="width:20%">
                                                                                <col style="width:80%">
                                                                                <tr>
                                                                                    <th colspan="2">
                                                                                        <i>Item&nbsp;Details</i>
                                                                                    </th>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>Item&nbsp;ID</th>
                                                                                    <td><%=results.getString("item_id")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>
                                                                                        Item's&nbsp;Model&nbsp;Name
                                                                                    </th>
                                                                                    <td><%= results.getString("item_model_name")%>
                                                                                    </td>
                                                                                </tr>


                                                                                <% if (results.getString("item_manufacturer").trim().compareToIgnoreCase(results.getString("item_supplier").trim()) >= 0) { %>

                                                                                <tr>
                                                                                    <th>Item's&nbsp;Manufacturer/Supplier
                                                                                    </th>
                                                                                    <td><%=results.getString("item_supplier")%>
                                                                                    </td>
                                                                                </tr>

                                                                                <%} else {%>
                                                                                <tr>
                                                                                    <th>Item's&nbsp;Manufacturer
                                                                                    </th>
                                                                                    <td><%=results.getString("item_manufacturer")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>Item's&nbsp;Supplier</th>
                                                                                    <td><%=results.getString("item_supplier")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <%}%>

                                                                                <tr>
                                                                                    <th>Item&nbsp;Type</th>
                                                                                    <td><%=results.getString("item_type")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th>Item's&nbsp;Description</th>
                                                                                    <td><%=results.getString("item_details")%>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>

                                                                        </td>
                                                                    </tr>


                                                                    <tr style="background-color: #f7f7f7;">
                                                                        <td>

                                                                            <table>
                                                                                <col style="width:20%">
                                                                                <col style="width:80%">
                                                                                <tr>
                                                                                    <th colspan="2">
                                                                                        <i>Working&nbsp;Item&nbsp;List</i>
                                                                                    </th>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Barcode&nbsp;Number</b>
                                                                                    </td>
                                                                                    <td><b>Description</b></td>
                                                                                </tr>
                                                                                <% while (workingResult.next()) { %>
                                                                                <tr>
                                                                                    <td><%=workingResult.getString("barcode_number")%>
                                                                                    </td>
                                                                                    <td><%=workingResult.getString("description")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <%}%>
                                                                            </table>

                                                                        </td>
                                                                        <td>

                                                                            <table>
                                                                                <col style="width:20%">
                                                                                <col style="width:80%">
                                                                                <tr>
                                                                                    <th colspan="2"><i>Fault&nbsp;Item&nbsp;List</i>
                                                                                    </th>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><b>Barcode&nbsp;Number</b>
                                                                                    </td>
                                                                                    <td><b>Description</b></td>
                                                                                </tr>
                                                                                <% while (faultResult.next()) { %>
                                                                                <tr>
                                                                                    <td><%=faultResult.getString("barcode_number")%>
                                                                                    </td>
                                                                                    <td><%=faultResult.getString("description")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <%}%>
                                                                            </table>

                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                            </div>
                                                        </div>
                                                        <br>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="button" class="btn btn-outline-secondary"
                                                               data-dismiss="modal" value="Close">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </td>
                                    <td>
                                        <form action="Inventory_UPDATE_Controller" method="post"
                                              id="mainForm<%=i%>">
                                            <input type="hidden" name="stock_in_id"


                                                   value="<%=results.getString("stock_in_id") %>">

                                            <input type="hidden" name="indexNumber"


                                                   value="<%=i%>">
                                            <!-- <button type="submit" class="btn btn-outline-danger">Delete</button> -->


                                            <!-- Button trigger modal -->
                                            <button type="button" onclick="clearAllFields<%=i%>()"
                                                    class="btn btn-outline-dark" data-toggle="modal"
                                                    data-target="#u<%out.print(results.getString("stock_in_id"));%>"
                                            ><i class="material-icons">update</i></button>


                                            <!-- Modal -->
                                            <div class="modal fade"
                                                 id="u<%out.print(results.getString("stock_in_id"));%>"
                                                 tabindex="-1" role="dialog"
                                                 aria-labelledby="u<%=results.getString("stock_in_id") %>"
                                                 aria-hidden="true">
                                                <div class="modal-dialog modal-xl modal-lg modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">
                                                                Update&nbsp;Stock</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <table style="width: 100%">
                                                                        <col style="width: 50%">
                                                                        <col style="width: 50%">

                                                                        <% if (session.getAttribute("stockIN") != null) { %>
                                                                        <tr id="ErrorMessage<%=i%>"
                                                                            style="background-color: #cacaca;">
                                                                            <td colspan="2">
                                                                                <div>
                                                                                    <p style="color:<%if (session.getAttribute("color") != null) {%><%=session.getAttribute("color")%><%}%>">
                                                                                        <%
                                                                                            if (session.getAttribute("message") != null) {
                                                                                        %>
                                                                                        <%=session.getAttribute("message")%>
                                                                                        <%
                                                                                            }
                                                                                        %>
                                                                                    </p>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <% } %>
                                                                        <tr style="background-color: #e9e9e9;">
                                                                            <td>
                                                                                <label for="stockID<%=i%>">Stock&nbsp;IN&nbsp;ID</label>
                                                                                <input id="stockID<%=i%>" type="text"
                                                                                       name="stockINId"
                                                                                       style="width:100%;display: block"
                                                                                       value="<%=results.getString("stock_in_id")%>"
                                                                                       readonly>
                                                                                <label for="itemdetailsdropitem<%=i%>"
                                                                                       id="stockItem<%=i%>">Stock&nbsp;Item</label><br>
                                                                                <div class="dropdown">

                                                                                    <input type="text"
                                                                                           id="itemdetailsdropitem<%=i%>"
                                                                                           name="itemID"
                                                                                           style="cursor: default;"
                                                                                           placeholder="Click Here to Select an Item"
                                                                                           value="<%= results.getString("item_id")%>"
                                                                                           required
                                                                                           autocomplete="off"
                                                                                           readonly
                                                                                           class="form-control"><i
                                                                                        class="fa fa-caret-down"
                                                                                        id="caret<%=i%>"
                                                                                        style="border: none;background: none;position: absolute;top: 17px;right: 13px;"></i>


                                                                                </div>
                                                                                <div id="iteminformation<%=i%>"
                                                                                     style="width:100%; background-color: lightgrey; padding:0; height:auto; overflow-x:hidden;">
                                                                                    <p>Item&nbsp;Model&nbsp;Name&nbsp;:&nbsp;<b><%=results.getString("item_model_name")%>
                                                                                    </b><br>Item&nbsp;Type&nbsp;:&nbsp;<%=results.getString("item_type")%>
                                                                                        <br>Manufacturer&nbsp;:&nbsp;<%=results.getString("item_manufacturer")%>
                                                                                        <br>Supplier&nbsp;:&nbsp;<%=results.getString("item_supplier")%>
                                                                                        <br>Description&nbsp;:&nbsp;<%=results.getString("item_details")%>
                                                                                    </p>

                                                                                </div>

                                                                                <br>

                                                                                <label for="datePicker<%=i%>">Stock&nbsp;IN&nbsp;Date</label>
                                                                                <input type="date" name="stockindate"
                                                                                       id="datePicker<%=i%>" required


                                                                                       value="<%= results.getString("stock_in_date") %>"><br>
                                                                                <label for="txtAreaRemarks<%=i%>">Any&nbsp;other&nbsp;Information's</label>

                                                                                <textarea id="txtAreaRemarks<%=i%>"
                                                                                          name="remarks" rows="4"
                                                                                          cols="4"
                                                                                          placeholder="Enter Stock Information Here..."><% if (results.getString("remarks") != null) {%><%=results.getString("remarks")%><%}%></textarea>


                                                                            </td>
                                                                            <td>

                                                                                <label id="itemsList<%=i%>">Item&nbsp;List&nbsp;Details</label>
                                                                                <div class="popup" style="width:100%;">
                                                                                    <input style="width:100%;"
                                                                                           type="text"
                                                                                           id="txtBarcode<%=i%>"
                                                                                           name="barcodeNmber"
                                                                                           placeholder="Enter Barcode Here...">
                                                                                    <span class="popuptext"
                                                                                          id="myPopup1<%=i%>"></span>

                                                                                </div>

                                                                                <div class="popup" style="width:100%;">
                                                                                    <select style="width:100%;"
                                                                                            id="itemStatus<%=i%>">
                                                                                        <option selected disabled
                                                                                                value="">Select&nbsp;Item&nbsp;Type
                                                                                        </option>
                                                                                        <option value="working">
                                                                                            Working
                                                                                        </option>
                                                                                        <option value="faulty">Faulty
                                                                                        </option>
                                                                                    </select>
                                                                                    <span class="popuptext"
                                                                                          id="myPopup4<%=i%>"></span>
                                                                                </div>
                                                                                <div class="popup"
                                                                                     style="width:100%;"><textarea
                                                                                        id="description<%=i%>"
                                                                                        placeholder="Enter Description Here..."
                                                                                        cols="4"
                                                                                        rows="4"></textarea><span
                                                                                        class="popuptext"
                                                                                        id="myPopup2<%=i%>"></span>
                                                                                </div>
                                                                                <div style="width: 100%; display: flex; flex-direction: row;">
                                                                                    <button style="width:50%; margin-right:2.5px;"
                                                                                            class="btn btn-info"
                                                                                            type="button"
                                                                                            onclick="myFirstFunction<%=i%>();">
                                                                                        Add&nbsp;Item
                                                                                    </button>
                                                                                    <button style="width:50%; margin-right:2.5px;"
                                                                                            class="btn btn-warning"
                                                                                            type="button"
                                                                                            onclick="resetItemDetails<%=i%>();">
                                                                                        Reset
                                                                                    </button>
                                                                                    <br>

                                                                                </div>
                                                                                <br><br>
                                                                                <div><p style="text-align: justify-all">
                                                                                    ***Changing the Working Items that
                                                                                    are Reserved for Stock OUT Disabled
                                                                                    for Security Purpose....
                                                                                </p></div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>

                                                                                <label for="txtBarcode<%=i%>"
                                                                                       id="workingItems<%=i%>">Working&nbsp;Item&nbsp;List</label><br>
                                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:300px;overflow:auto; overflow-x:hidden;"
                                                                                     id="workingList<%=i%>">
                                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                                           id="workingItemsTable<%=i%>"
                                                                                           border=1>

                                                                                        <% workingResult.beforeFirst();
                                                                                            while (workingResult.next()) { %>


                                                                                        <tr style="padding:0;">
                                                                                            <td style="padding:0;">
                                                                                                <input type="text"
                                                                                                       readonly
                                                                                                       style="margin:0;border:0;"
                                                                                                       value="<%= workingResult.getString("barcode_number") %>"
                                                                                                       name="barcode">
                                                                                            </td>
                                                                                            <td style="padding:0;">
                                                                                                <input type="text"
                                                                                                       style="margin:0;border:0;"
                                                                                                       name="workingDescription"
                                                                                                       value="<%=workingResult.getString("description")%>">
                                                                                            </td>
                                                                                            <td style="padding:0;">
                                                                                                <% if (workingResult.getString("stock_out_id") != null) { %>
                                                                                                <input type="text"
                                                                                                       name="stockOUT"
                                                                                                       value="<%=workingResult.getString("stock_out_id")%>"
                                                                                                       hidden>
                                                                                                <% } else { %>
                                                                                                <input type="text"
                                                                                                       name="stockOUT"
                                                                                                       value="NULL"
                                                                                                       hidden>
                                                                                                <% } %>
                                                                                                <button style="margin:0;"
                                                                                                        type="button"
                                                                                                        class="btn btn-danger"
                                                                                                        onclick="removeWorkingItemRow<%=i%>(this)"
                                                                                                        <% if (workingResult.getString("stock_out_id") != null) { %>
                                                                                                        disabled
                                                                                                        <% } %>>
                                                                                                    <i class="fa fa-trash"></i>
                                                                                                </button>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <% } %>

                                                                                    </table>


                                                                                </div>
                                                                                <br>
                                                                                <button style="width:100%"
                                                                                        class="btn btn-warning"
                                                                                        type="button"
                                                                                        onclick="deleteAllWorkingItemsRows<%=i%>();">
                                                                                    Clear&nbsp;All
                                                                                </button>
                                                                            </td>
                                                                            <td>
                                                                                <label for="txtBarcode<%=i%>">Fault Item&nbsp;List</label><br>
                                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:300px;overflow:auto; overflow-x:hidden;">
                                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                                           id="faultTable<%=i%>"
                                                                                           border=1>

                                                                                        <% faultResult.beforeFirst();
                                                                                            while (faultResult.next()) { %>

                                                                                        <tr style="padding:0;">
                                                                                            <td style="padding:0;">
                                                                                                <input type="text"
                                                                                                       readonly
                                                                                                       style="margin:0;border:0;"
                                                                                                       value="<%= faultResult.getString("barcode_number") %>"
                                                                                                       name="barcode">
                                                                                            </td>
                                                                                            <td style="padding:0;">
                                                                                                <input type="text"
                                                                                                       style="margin:0;border:0;"
                                                                                                       name="workingDescription"
                                                                                                       value="<%=faultResult.getString("description")%>">
                                                                                            </td>
                                                                                            <td style="padding:0;">
                                                                                                <button style="margin:0;"
                                                                                                        type="button"
                                                                                                        class="btn btn-danger"
                                                                                                        onclick="removeFaultItemRow<%=i%>(this)">
                                                                                                    <i class="fa fa-trash"></i>
                                                                                                </button>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <% } %>


                                                                                    </table>


                                                                                </div>
                                                                                <br>
                                                                                <button style="width:100%"
                                                                                        class="btn btn-warning"
                                                                                        type="button"
                                                                                        onclick="deleteAllFaultItemsRows<%=i%>();">
                                                                                    Clear&nbsp;All
                                                                                </button>

                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <script>


                                                            function myFirstFunction<%=i%>() {

                                                                let barcodeText = document.getElementById("txtBarcode<%=i%>");
                                                                let itemStatus = document.getElementById("itemStatus<%=i%>");
                                                                let itemDescription = document.getElementById("description<%=i%>");

                                                                if (barcodeText.value.trim() !== "" && itemStatus.value.trim() !== "") {


                                                                    let i = 0;
                                                                    let bool = true;
                                                                    var popup;
                                                                    let boolFault = true;


                                                                    var workingItemsTable = document.getElementById("workingItemsTable<%=i%>");
                                                                    var faultTable = document.getElementById("faultTable<%=i%>");

                                                                    let rows = workingItemsTable.getElementsByTagName('tr');

                                                                    for (let i = 0; rows[i] !== undefined; i++) {
                                                                        if (rows[i].getElementsByTagName('td')[0].getElementsByTagName('input')[0].value.trim() === barcodeText.value.trim()) {
                                                                            bool = false;
                                                                            break;
                                                                        }
                                                                    }

                                                                    let rowsFault = faultTable.getElementsByTagName('tr');

                                                                    for (let i = 0; rowsFault[i] !== undefined; i++) {
                                                                        if (rowsFault[i].getElementsByTagName('td')[0].getElementsByTagName('input')[0].value.trim() === barcodeText.value.trim()) {
                                                                            boolFault = false;
                                                                            break;
                                                                        }
                                                                    }


                                                                    if (bool === true && boolFault === true) {


                                                                        if (itemStatus.value.trim() === "working") {


                                                                            if (itemDescription.value.trim() === "")
                                                                                workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="------" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="NULL" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                            else
                                                                                workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="NULL" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                            resetItemDetails<%=i%>();
                                                                            autoFocus<%=i%>();

                                                                        } else if (itemStatus.value.trim() === "faulty" && itemDescription.value.trim() !== "") {


                                                                            faultTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "faultBarcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="faultDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                            resetItemDetails<%=i%>();
                                                                            autoFocus<%=i%>();

                                                                        } else {
                                                                            popup = document.getElementById("myPopup2<%=i%>");
                                                                            popup.innerHTML = "This is a Required Field!!";
                                                                            if (!popup.classList.contains("show")) {
                                                                                popup.classList.add("show");

                                                                                setTimeout(function () {
                                                                                    popup.classList.remove("show");
                                                                                }, 3000);
                                                                            }

                                                                            itemDescription.focus();
                                                                            window.scrollTop;

                                                                        }


                                                                    } else {
                                                                        popup = document.getElementById("myPopup1<%=i%>");
                                                                        popup.innerHTML = "Duplicate Barcode Number!!";
                                                                        if (!popup.classList.contains("show")) {
                                                                            popup.classList.add("show");

                                                                            setTimeout(function () {
                                                                                popup.classList.remove("show");
                                                                            }, 3000);
                                                                        }
                                                                        barcodeText.value = "";
                                                                        autoFocus<%=i%>();
                                                                    }


                                                                } else if (itemStatus.value.trim() === "" && barcodeText.value.trim() !== "") {

                                                                    popup = document.getElementById("myPopup4<%=i%>");
                                                                    popup.innerHTML = "Please Select the Item Status!!";
                                                                    if (!popup.classList.contains("show")) {
                                                                        popup.classList.add("show");

                                                                        setTimeout(function () {
                                                                            popup.classList.remove("show");
                                                                        }, 3000);
                                                                    }
                                                                    itemStatus.focus();
                                                                    window.scrollTop;

                                                                } else {
                                                                    popup = document.getElementById("myPopup1<%=i%>");
                                                                    popup.innerHTML = "Please Enter a Barcode Number!!";
                                                                    if (!popup.classList.contains("show")) {
                                                                        popup.classList.add("show");

                                                                        setTimeout(function () {
                                                                            popup.classList.remove("show");
                                                                        }, 3000);
                                                                    }
                                                                    autoFocus<%=i%>();
                                                                }

                                                            }


                                                            function resetItemDetails<%=i%>() {

                                                                let barcodeText = document.getElementById("txtBarcode<%=i%>");
                                                                let itemStatus = document.getElementById("itemStatus<%=i%>");
                                                                let itemDescription = document.getElementById("description<%=i%>");

                                                                barcodeText.value = "";
                                                                itemStatus.getElementsByTagName("option").item(0).selected = true;
                                                                itemDescription.value = "";
                                                                autoFocus<%=i%>();
                                                            }


                                                            function autoFocus<%=i%>() {
                                                                document.getElementById("txtBarcode<%=i%>").focus();
                                                                window.scrollTop;
                                                            }


                                                            function deleteAllWorkingItemsRows<%=i%>() {
                                                                document.getElementById("workingItemsTable<%=i%>").innerHTML = "";
                                                                document.getElementById("txtBarcode<%=i%>").focus({
                                                                    preventScroll: true
                                                                });

                                                                <%
                                                                workingResult.beforeFirst();
                                                                while (workingResult.next()) {
                                                                    if (workingResult.getString("stock_out_id") != null) {
                                                                %>
                                                                document.getElementById('workingItemsTable<%=i%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: black" value ="<%=workingResult.getString("barcode_number")%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=workingResult.getString("description")%>" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="<%=workingResult.getString("stock_out_id")%>" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=i%>(this)" disabled><i class="fa fa-trash"></i></button></td></tr>';
                                                                <%}}%>

                                                            }

                                                            function removeWorkingItemRow<%=i%>(input) {


                                                                var i = input.parentNode.parentNode.rowIndex;
                                                                let workingTable = document.getElementById("workingItemsTable<%=i%>");

                                                                workingTable.deleteRow(i);

                                                                let rows = workingTable.getElementsByTagName('tr');

                                                                if (rows.length === 0)
                                                                    workingTable.innerHTML = "";


                                                                document.getElementById("txtBarcode<%=i%>").focus({
                                                                    preventScroll: true
                                                                });
                                                            }


                                                            function deleteAllFaultItemsRows<%=i%>() {
                                                                document.getElementById("faultTable<%=i%>").innerHTML = "";
                                                                document.getElementById("txtBarcode<%=i%>").focus({
                                                                    preventScroll: true
                                                                });
                                                            }


                                                            function removeFaultItemRow<%=i%>(input) {
                                                                var i = input.parentNode.parentNode.rowIndex;
                                                                let faultTable = document.getElementById("faultTable<%=i%>");
                                                                faultTable.deleteRow(i);

                                                                let rowsFault = faultTable.getElementsByTagName('tr');

                                                                if (rowsFault.length === 0)
                                                                    faultTable.innerHTML = "";

                                                                document.getElementById("txtBarcode<%=i%>").focus({
                                                                    preventScroll: true
                                                                });
                                                            }


                                                            function validateFormXV<%=i%>() {

                                                                var popup;


                                                                if (document.getElementById("faultTable<%=i%>").innerHTML.trim().replace(/^\s+|\s+$/, '') === "" && document.getElementById("workingItemsTable<%=i%>").innerHTML.trim().replace(/^\s+|\s+$/, '') === "") {
                                                                    popup = document.getElementById("myPopup1<%=i%>");
                                                                    popup.innerHTML = "Please Enter at least one Item!!!";
                                                                    document.getElementById("txtBarcode<%=i%>").focus();
                                                                    window.scrollTop;

                                                                    if (!popup.classList.contains("show")) {
                                                                        popup.classList.add("show");

                                                                        setTimeout(function () {
                                                                            popup.classList.remove("show");
                                                                        }, 3000);
                                                                    }
                                                                } else {
                                                                    document.getElementById('mainForm<%=i%>').submit();
                                                                }
                                                            }

                                                            let workingTable<%=i%> = "";
                                                            let faultyTable<%=i%> = "";
                                                            let itemInfo<%=i%> = "";
                                                            let itemID<%=i%> = "";


                                                            window.addEventListener('load', function () {


                                                                workingTable<%=i%> = document.getElementById("workingItemsTable<%=i%>").innerHTML;
                                                                faultyTable<%=i%> = document.getElementById("faultTable<%=i%>").innerHTML;
                                                                itemInfo<%=i%> = document.getElementById('iteminformation<%=i%>').innerHTML;
                                                                itemID<%=i%> = document.getElementById('itemdetailsdropitem<%=i%>').value;


                                                            });


                                                            function clearAllFields<%=i%>() {
                                                                document.getElementById('itemdetailsdropitem<%=i%>').value = itemID<%=i%>;
                                                                document.getElementById('iteminformation<%=i%>').innerHTML = itemInfo<%=i%>;

                                                                if (document.getElementById("ErrorMessage<%=i%>") !== null)
                                                                    document.getElementById("ErrorMessage<%=i%>").hidden = true;
                                                                document.getElementById('faultTable<%=i%>').innerHTML = "";
                                                                document.getElementById('workingItemsTable<%=i%>').innerHTML = "";
                                                                <%
                                                                faultResult.beforeFirst();
                                                                while (faultResult.next()){%>
                                                                document.getElementById('faultTable<%=i%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: black" value ="<%=faultResult.getString("barcode_number")%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=faultResult.getString("description")%>" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                <%} %>

                                                                <%
                                                                workingResult.beforeFirst();
                                                                while (workingResult.next()) {

                                                                    if (workingResult.getString("stock_out_id") != null) {%>
                                                                document.getElementById('workingItemsTable<%=i%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: black" value ="<%=workingResult.getString("barcode_number")%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=workingResult.getString("description")%>" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="<%=workingResult.getString("stock_out_id")%>" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=i%>(this)" disabled><i class="fa fa-trash"></i></button></td></tr>';
                                                                <% } else {%>
                                                                document.getElementById('workingItemsTable<%=i%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: black" value ="<%=workingResult.getString("barcode_number")%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=workingResult.getString("description")%>" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="NULL" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                <%}}%>

                                                                window.scrollTop;

                                                            }


                                                            document.getElementById("txtBarcode<%=i%>").addEventListener(
                                                                'keydown',
                                                                function (event) {
                                                                    if ((event.ctrlKey && event.key === "j")
                                                                        || (event.ctrlKey && event.key === "b")
                                                                        || (event.ctrlKey && event.key === "i")
                                                                        || (event.keyCode === 13))
                                                                        event.preventDefault();

                                                                });


                                                        </script>
                                                        <div class="modal-footer">
                                                            <div class="btn-group btn-block" role="group"
                                                                 aria-label="Basic example">
                                                                <button type="reset" class="btn btn-outline-danger"
                                                                        onclick="clearAllFields<%=i%>()">Reset&nbsp;Fields
                                                                </button>
                                                                <button type="button" class="btn btn-outline-success"
                                                                        onclick="validateFormXV<%=i%>()">Update&nbsp;Stock
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </form>
                                    </td>
                                    <td>
                                        <form action="Inventory_DELETE_Controller" method="post">
                                            <input type="hidden" name="stock_in_id"
                                                   value="<%=results.getString("stock_in_id") %>">
                                            <!-- <button type="submit" class="btn btn-outline-danger">Delete</button> -->


                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-outline-danger" data-toggle="modal"
                                                    data-target="#d<%out.print(results.getString("stock_in_id"));%>"
                                            ><i class="material-icons">delete_forever</i></button>

                                            <!-- Modal -->
                                            <div class="modal fade"
                                                 id="d<%out.print(results.getString("stock_in_id"));%>"
                                                 tabindex="-1" role="dialog"
                                                 aria-labelledby="d<%=results.getString("stock_in_id") %>"
                                                 aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Confirm&nbsp;Delete</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p></p>
                                                            Are you Sure you want to delete this record?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-outline-success"
                                                                   data-dismiss="modal" value="No, Close">
                                                            <input type="submit" class="btn btn-outline-danger"
                                                                   value="Yes, Delete">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </form>
                                    </td>

                                </tr>

                                <%

                                                ++i;

                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }
                                %>
                                </tbody>
                            </table>

                        </div> <!--finish first column-->
                    </td>
                </tr>
                <!-- start of the next notification column -->

                <!-- second column inside table end here -->
            </table>


        </div>

    </div>
</div>
<!-- /#wrapper -->
<div id="snackbar"
     style="color:<%if (session.getAttribute("color") != null) {%><%=session.getAttribute("color")%><%}%>">
    <%
        if (session.getAttribute("message") != null) {
    %>
    <%=session.getAttribute("message")%>
    <%
        }
    %>
</div>

<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/vendor/select2-4.0.12/dist/js/select2.js"></script>


<!-- Menu Toggle Script -->

<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

<% if (session.getAttribute("stockIN") != null) {%>
<script>

    $('#u<%=inventoryStock.getStockID()%>').modal('show');
</script>

<% } %>

<%

    if (session.getAttribute("stockIN") != null && session.getAttribute("index") != null && session.getAttribute("duplicates") != null) {
        String index = session.getAttribute("index").toString();
%>
<script>
    document.getElementById('itemdetailsdropitem<%=index%>').value = '<%=inventoryStock.getItemID()%>';
    document.getElementById('iteminformation<%=index%>').innerHTML = '<p>' + document.getElementById('<%=inventoryStock.getItemID()%><%=index%>').innerHTML + '</p>';
    document.getElementById('itemdetailsmyInput<%=index%>').value = "";

    document.getElementById('datePicker<%=index%>').value = '<%=inventoryStock.getDate()%>';
    document.getElementById('description<%=index%>').value = '<%=inventoryStock.getRemarks()%>';
    document.getElementById('workingItemsTable<%=index%>').innerHTML = "";
    document.getElementById('faultTable<%=index%>').innerHTML = "";


</script>

<% for (Items items : inventoryStock.getItems()) {


    if (items.getItemStatus().equalsIgnoreCase("working")) {
        boolean bool = true;

        for (String workingItems : duplicates) {
            if (workingItems.equalsIgnoreCase(items.getBarcode())) {
                bool = false;
%>
<script>
    document.getElementById('workingItemsTable<%=index%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: red" value ="<%=items.getBarcode()%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=items.getDescription()%>" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="NULL" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=index%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
</script>
<%

        }

    }

    if (bool) {

        if (items.getStockOUTID().equalsIgnoreCase("NULL")) {

%>
<script>
    document.getElementById('workingItemsTable<%=index%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: black" value ="<%=items.getBarcode()%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=items.getDescription()%>" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="<%=items.getStockOUTID()%>" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=index%>(this)"><i class="fa fa-trash"></i></button></td></tr>';

</script>
<%
} else {
%>
<script>
    document.getElementById('workingItemsTable<%=index%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: black" value ="<%=items.getBarcode()%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=items.getDescription()%>" ></td><td style="padding:0;"><input type="text" name="stockOUT" value="<%=items.getStockOUTID()%>" hidden><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=index%>(this)"><i class="fa fa-trash"></i></button></td></tr>';

</script>
<%
        }
    }
} else if (items.getItemStatus().equalsIgnoreCase("faulty")) {
    boolean bool = true;
    for (String faultyItems : duplicates) {
        if (faultyItems.equalsIgnoreCase(items.getBarcode())) {
            bool = false;


%>
<script>
    document.getElementById('faultTable<%=index%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: red" value ="<%=items.getBarcode()%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=items.getDescription()%>" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRow<%=index%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
</script>
<%

        }
    }

    if (bool) {%>

<script>
    document.getElementById('faultTable<%=index%>').insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;color: black" value ="<%=items.getBarcode()%>" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="<%=items.getDescription()%>" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRow<%=index%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
</script>
<%
                }
            }
        }
    }
%>

<script src="${pageContext.request.contextPath}/js/WebScript.js"></script>

<%
    if (session.getAttribute("color") != null && session.getAttribute("message") != null) {

        if (session.getAttribute("stock") != null) {
%>
<script>

    $('#exampleModal').modal('show');

</script>
<% } else if (session.getAttribute("insertConfirm") != null && session.getAttribute("stockInsert") != null) {
%>

<script>
    $('#exampleModalX').modal('show');
</script>
<%
} else { %>
<script>
    myFunction();
</script>
<% }
    if (session.getAttribute("results") != null) {
        session.removeAttribute("results");
    }

    if (session.getAttribute("stockInsert") != null) {
        session.removeAttribute("stockInsert");
    }

    if (session.getAttribute("insertConfirm") != null) {
        session.removeAttribute("insertConfirm");
    }

    session.removeAttribute("color");
    session.removeAttribute("message");

    if (session.getAttribute("stock") != null) {
        session.removeAttribute("stock");
    }

    if (session.getAttribute("stockIN") != null) {
        session.removeAttribute("stockIN");
    }

    if (session.getAttribute("index") != null) {
        session.removeAttribute("index");
    }

    if (session.getAttribute("duplicateList") != null) {
        session.removeAttribute("duplicateList");
    }

    if (session.getAttribute("duplicates") != null) {
        session.removeAttribute("duplicates");
    }

%>
<%
    }
%>

<script>
    $(document).ready(function () {
        $('#custOrder').select2();
    });
</script>

</body>


</html>

