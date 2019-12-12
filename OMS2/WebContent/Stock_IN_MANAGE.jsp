<%--suppress XmlDuplicatedId --%>
<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.DatabaseHandle.Inventory_SELECT" %>
<%@page import="com.DatabaseHandle.Main_SELECT" %>
<%@page import="com.Utilities.MySQLQueries" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
    <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>


    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>


    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar3.css" rel="stylesheet">


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


                        <a href="Stock_IN_INSERT.jsp"
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
                        <form action="Inventory_SELECT_Controller?jspPage=delete"
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
                                                onclick="window.location.replace(location.href);"
                                            <%} else {%>
                                                name="search" type="reset" class="btn btn-danger btn-block"
                                                value="Reset" id="resetBtn" onclick="clearTable()"
                                            <%}%>></td>
                                    <td style="padding-top: 8px;">

                                        <form id="mainForm" action="Inventory_INSERT_Controller" method="post">

                                            <input type="button" class="btn btn-success btn-block" data-toggle="modal"
                                                   data-target="#exampleModal" value="Create&nbsp;Stock">


                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl modal-lg modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Modal
                                                                title</h5>
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
                                                                        <tr>
                                                                            <td>
                                                                                <label for="itemdetailsdropitem"
                                                                                       id="stockItem">Stock&nbsp;Item</label><br>
                                                                                <div class="dropdown">
                                                                                    <div class="popup"
                                                                                         style="width:100%;">
                                                                                        <input type="text"
                                                                                               id="itemdetailsdropitem"
                                                                                               name="itemID"
                                                                                               style="cursor: default;"
                                                                                               placeholder="Click Here to Select an Item"
                                                                                               value="" required
                                                                                               autocomplete="off"
                                                                                               readonly
                                                                                               class="form-control"><i
                                                                                            class="fa fa-caret-down"
                                                                                            id="caret"></i><span
                                                                                            class="popuptext"
                                                                                            id="myPopup3"></span>
                                                                                    </div>
                                                                                    <div id="itemdetailsitemdisplay"
                                                                                         class="dropdown-content"
                                                                                         style="margin-top:-4%;width:100%;height : 450%;overflow-y:scroll;overflow-x:hidden;border:1px solid #538AC0;">
                                                                                        <div style="position: sticky;top:-6px;margin-top:-6px;padding:0">
                                                                                            <input tabindex="0"
                                                                                                   type="text"
                                                                                                   id="itemdetailsmyInput"
                                                                                                   onkeyup="itemdetailsitemdisplayfilterFunction()"
                                                                                                   autocomplete="off"
                                                                                                   placeholder="Search here.."><i
                                                                                                class="fa fa-search"
                                                                                                id="caretSearch"></i>
                                                                                        </div>

                                                                                        <div style="overflow-x:hidden;">


                                                                                            <%
                                                                                                try {
                                                                                                    while (resultset_for_items.next()) {%>
                                                                                            <a style="cursor: pointer;"
                                                                                               id='<%=resultset_for_items.getString("item_id") %>'
                                                                                               tabindex="0">Item&nbsp;Model&nbsp;Name&nbsp;:&nbsp;<b><%=resultset_for_items.getString("item_model_name")%>
                                                                                            </b><br>Item&nbsp;Type&nbsp;:&nbsp;<%=resultset_for_items.getString("item_type")%>
                                                                                                <br>Manufacturer&nbsp;:&nbsp;<%=resultset_for_items.getString("item_manufacturer")%>
                                                                                                <br>Supplier&nbsp;:&nbsp;<%=resultset_for_items.getString("item_supplier")%>
                                                                                                <br>Description&nbsp;:&nbsp;<%=resultset_for_items.getString("item_details")%>
                                                                                            </a>
                                                                                            <script>
                                                                                                document.getElementById('<%=resultset_for_items.getString("item_id") %>').addEventListener('click', function () {
                                                                                                    document.getElementById('itemdetailsdropitem').value = '<%=resultset_for_items.getString("item_id")%>';
                                                                                                    document.getElementById('iteminformation').innerHTML = '<p>' + document.getElementById('<%=resultset_for_items.getString("item_id") %>').innerHTML + '</p>';
                                                                                                    document.getElementById('itemdetailsmyInput').value = "";
                                                                                                });

                                                                                                document.getElementById('<%=resultset_for_items.getString("item_id") %>').addEventListener("keyup", function (e) {
                                                                                                    if (e.keyCode === 13) {
                                                                                                        e.preventDefault();
                                                                                                        document.getElementById('<%=resultset_for_items.getString("item_id") %>').click();
                                                                                                    }
                                                                                                });

                                                                                            </script>
                                                                                            <% }

                                                                                            } catch (Exception e) {
                                                                                                e.printStackTrace();
                                                                                            }%>

                                                                                        </div>


                                                                                    </div>

                                                                                </div>
                                                                                <div id="iteminformation"
                                                                                     style="width:100%; background-color: lightgrey; padding:0; height:auto; overflow-x:hidden;">
                                                                                    <p>Item&nbsp;Information&nbsp;Goes&nbsp;Here....</p>
                                                                                </div>
                                                                                <br>

                                                                                <label for="datePicker">Stock&nbsp;IN&nbsp;Date</label>
                                                                                <input type="date" name="stockindate"
                                                                                       id="datePicker" required
                                                                                       value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"><br>
                                                                                <label for="txtAreaRemarks">Any&nbsp;other&nbsp;Information's</label>

                                                                                <textarea id="txtAreaRemarks"
                                                                                          name="remarks"
                                                                                          rows="4"
                                                                                          cols="4"
                                                                                          placeholder="Enter Stock Information Here..."></textarea>
                                                                                <br>


                                                                                <label id="itemsList">Item&nbsp;List&nbsp;Details</label>
                                                                                <div class="popup" style="width:100%;">
                                                                                    <input style="width:100%;"
                                                                                           type="text"
                                                                                           id="txtBarcode"
                                                                                           name="barcodeNmber"
                                                                                           placeholder="Enter Barcode Here...">
                                                                                    <span class="popuptext"
                                                                                          id="myPopup1"></span>

                                                                                </div>

                                                                                <div class="popup" style="width:100%;">
                                                                                    <select style="width:100%;"
                                                                                            id="itemStatus">
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
                                                                                          id="myPopup4"></span>
                                                                                </div>
                                                                                <div class="popup"
                                                                                     style="width:100%;"><textarea
                                                                                        id="description"
                                                                                        placeholder="Enter Fault Description Here..."
                                                                                        cols="4"
                                                                                        rows="4"></textarea><span
                                                                                        class="popuptext"
                                                                                        id="myPopup2"></span>
                                                                                </div>
                                                                                <div style="width: 100%; display: flex; flex-direction: row;">
                                                                                    <button style="width:100%; margin-right:2.5px;"
                                                                                            class="btn btn-info"
                                                                                            type="button"
                                                                                            onclick="myFirstFunction();">
                                                                                        Add&nbsp;Item
                                                                                    </button>
                                                                                    <br>

                                                                                </div>

                                                                            </td>
                                                                            <td>

                                                                                <label for="txtBarcode"
                                                                                       id="workingItems">Working&nbsp;Item&nbsp;List</label><br>
                                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:150px;overflow:auto; overflow-x:hidden;"
                                                                                     id="workingList">
                                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                                           id="workingItemsTable"
                                                                                           border=1>


                                                                                    </table>


                                                                                </div>
                                                                                <br>
                                                                                <button style="width:100%"
                                                                                        class="btn btn-warning"
                                                                                        type="button"
                                                                                        onclick="deleteAllWorkingItemsRows();">
                                                                                    Clear&nbsp;All
                                                                                </button>
                                                                                <br>
                                                                                <br>
                                                                                <label for="txtBarcode">Fault
                                                                                    Item&nbsp;List</label><br>
                                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:150px;overflow:auto; overflow-x:hidden;">
                                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                                           id="faultTable"
                                                                                           border=1>


                                                                                    </table>


                                                                                </div>
                                                                                <br>
                                                                                <button style="width:100%"
                                                                                        class="btn btn-warning"
                                                                                        type="button"
                                                                                        onclick="deleteAllFaultItemsRows();">
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
                                                                        onclick="clearAllFields();">
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
                            </table>
                        </form>
                    </td>

                </tr>


                <!--division of the first two big columns start here -->
                <tr>
                    <!-- creating first column of the big table-->

                    <td colspan="2">
                        <!--inside the first column -->
                        <div class="table-wrapper-scroll-y my-custom-scrollbar"
                             style="height: 545px; position: relative; top: 0">


                            <!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                            <table id="mainTable"
                                   class="table table-bordered table-striped mb-0">
                                <thead>


                                <tr>
                                    <th>Stock&nbsp;ID</th>
                                    <th>Item&nbsp;ID</th>
                                    <th>Received&nbsp;Date</th>
                                    <th>Number&nbsp;of<br>Working&nbsp;Items</th>
                                    <th>Number&nbsp;of<br>Fault&nbsp;Items</th>
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

                                            int i = 0;

                                            while (results.next()) {

                                                i++;

                                                Inventory_SELECT itemSelect = new Inventory_SELECT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_WORKING_STOCK_BY_STOCK_ID);
                                                Inventory_SELECT faultItemSelect = new Inventory_SELECT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_FAULT_STOCK_BY_STOCK_ID);

                                                ResultSet workingResult = itemSelect.retreiveQueryData(results.getString("stock_in_id"));
                                                ResultSet faultResult = faultItemSelect.retreiveQueryData(results.getString("stock_in_id"));


                                %>
                                <tr>
                                    <td><%=results.getString("stock_in_id")%>
                                    </td>
                                    <td><%=results.getString("item_id")%>
                                    </td>
                                    <td hidden><%=results.getString("item_model_name")%>
                                    </td>
                                    <td hidden><%=results.getString("item_manufacturer")%>
                                    </td>
                                    <td hidden><%=results.getString("item_supplier")%>
                                    </td>
                                    <td hidden><%=results.getString("item_type")%>
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
                                                                    <tr style="background-color: #f7f7f7;">
                                                                        <td>

                                                                            <table>
                                                                                <col style="width:20%">
                                                                                <col style="width:80%">
                                                                                <tr>
                                                                                    <th colspan="2"><i>Stock&nbsp;Details</i>
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
                                                                                    <th>Item's&nbsp;Manufacturer/Supplier</th>
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
                                            <!-- <button type="submit" class="btn btn-outline-danger">Delete</button> -->


                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-outline-dark" data-toggle="modal"
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
                                                            <h5 class="modal-title" id="exampleModalLabel">Update&nbsp;Stock</h5>
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
                                                                        <tr>
                                                                            <td><label for="itemdetailsdropitem<%=i%>"
                                                                                       id="stockItem<%=i%>">Stock&nbsp;Item</label><br>
                                                                                <div class="dropdown">
                                                                                    <div class="popup"
                                                                                         style="width:100%;">
                                                                                        <input type="text"
                                                                                               id="itemdetailsdropitem<%=i%>"
                                                                                               name="itemID"
                                                                                               style="cursor: default;"
                                                                                               placeholder="Click Here to Select an Item"
                                                                                               value="" required
                                                                                               autocomplete="off"
                                                                                               readonly
                                                                                               class="form-control"><i
                                                                                            class="fa fa-caret-down"
                                                                                            id="caret<%=i%>"
                                                                                            style="border: none;background: none;position: absolute;top: 17px;right: 13px;"></i><span
                                                                                            class="popuptext"
                                                                                            id="myPopup3<%=i%>"></span>
                                                                                    </div>
                                                                                    <div id="itemdetailsitemdisplay<%=i%>"
                                                                                         class="dropdown-content"
                                                                                         style="margin-top:-4%;width:100%;height : 450%;overflow-y:scroll;overflow-x:hidden;border:1px solid #538AC0;">
                                                                                        <div style="position: sticky;top:-6px;margin-top:-6px;padding:0">
                                                                                            <input tabindex="0"
                                                                                                   type="text"
                                                                                                   id="itemdetailsmyInput<%=i%>"
                                                                                                   onkeyup="itemdetailsitemdisplayfilterFunction<%=i%>()"
                                                                                                   autocomplete="off"
                                                                                                   placeholder="Search here.."><i
                                                                                                class="fa fa-search"
                                                                                                id="caretSearch<%=i%>"
                                                                                                style="border: none;background: none;position: absolute;top: 17px;right: 13px;"></i>
                                                                                        </div>

                                                                                        <div style="overflow-x:hidden;">


                                                                                            <%
                                                                                                try {


                                                                                                    resultSet = si4.get_table();

                                                                                                    while (resultSet.next()) {%>
                                                                                            <a style="cursor: pointer;"
                                                                                               id='<%=resultSet.getString("item_id") %><%=i%>'


                                                                                               tabindex="0">Item&nbsp;Model&nbsp;Name&nbsp;:&nbsp;<b><%=resultSet.getString("item_model_name")%>
                                                                                            </b><br>Item&nbsp;Type&nbsp;:&nbsp;<%=resultSet.getString("item_type")%>
                                                                                                <br>Manufacturer&nbsp;:&nbsp;<%=resultSet.getString("item_manufacturer")%>
                                                                                                <br>Supplier&nbsp;:&nbsp;<%=resultSet.getString("item_supplier")%>
                                                                                                <br>Description&nbsp;:&nbsp;<%=resultSet.getString("item_details")%>
                                                                                            </a>
                                                                                            <script>


                                                                                                document.getElementById('<%=resultSet.getString("item_id")%><%=i%>').addEventListener('click', function () {
                                                                                                    document.getElementById('itemdetailsdropitem<%=i%>').value = '<%=resultSet.getString("item_id")%>';
                                                                                                    document.getElementById('iteminformation<%=i%>').innerHTML = '<p>' + document.getElementById('<%=resultSet.getString("item_id")%><%=i%>').innerHTML + '</p>';
                                                                                                    document.getElementById('itemdetailsmyInput<%=i%>').value = "";
                                                                                                });

                                                                                                document.getElementById('<%=resultSet.getString("item_id")%><%=i%>').addEventListener("keyup", function (e) {
                                                                                                    if (e.keyCode === 13) {
                                                                                                        e.preventDefault();
                                                                                                        document.getElementById('<%=resultSet.getString("item_id")%><%=i%>').click();
                                                                                                    }
                                                                                                });

                                                                                            </script>
                                                                                            <% }
                                                                                            } catch (Exception e) {
                                                                                                e.printStackTrace();
                                                                                            }%>

                                                                                        </div>


                                                                                    </div>

                                                                                </div>
                                                                                <div id="iteminformation<%=i%>"
                                                                                     style="width:100%; background-color: lightgrey; padding:0; height:auto; overflow-x:hidden;">
                                                                                    <p>Item&nbsp;Information&nbsp;Goes&nbsp;Here....</p>
                                                                                </div>
                                                                                <br>

                                                                                <label for="datePicker<%=i%>">Stock&nbsp;IN&nbsp;Date</label>
                                                                                <input type="date" name="stockindate"
                                                                                       id="datePicker<%=i%>" required
                                                                                       value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"><br>
                                                                                <label for="txtAreaRemarks<%=i%>">Any&nbsp;other&nbsp;Information's</label>

                                                                                <textarea id="txtAreaRemarks<%=i%>"
                                                                                          name="remarks" rows="4"
                                                                                          cols="4"
                                                                                          placeholder="Enter Stock Information Here..."></textarea>
                                                                                <br>


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
                                                                                        placeholder="Enter Fault Description Here..."
                                                                                        cols="4"
                                                                                        rows="4"></textarea><span
                                                                                        class="popuptext"
                                                                                        id="myPopup2<%=i%>"></span>
                                                                                </div>
                                                                                <div style="width: 100%; display: flex; flex-direction: row;">
                                                                                    <button style="width:100%; margin-right:2.5px;"
                                                                                            class="btn btn-info"
                                                                                            type="button"
                                                                                            onclick="myFirstFunction<%=i%>();">
                                                                                        Add&nbsp;Item
                                                                                    </button>
                                                                                    <br>

                                                                                </div>
                                                                            </td>
                                                                            <td><label for="txtBarcode<%=i%>"
                                                                                       id="workingItems<%=i%>">Working&nbsp;Item&nbsp;List</label><br>
                                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:150px;overflow:auto; overflow-x:hidden;"
                                                                                     id="workingList<%=i%>">
                                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                                           id="workingItemsTable<%=i%>"
                                                                                           border=1>


                                                                                    </table>


                                                                                </div>
                                                                                <br>
                                                                                <button style="width:100%"
                                                                                        class="btn btn-warning"
                                                                                        type="button"
                                                                                        onclick="deleteAllWorkingItemsRows<%=i%>();">
                                                                                    Clear&nbsp;All
                                                                                </button>
                                                                                <br>
                                                                                <br>
                                                                                <label for="txtBarcode<%=i%>">Fault Item&nbsp;List</label><br>
                                                                                <div style="width:100%; background-color: lightgrey; padding:0; height:150px;overflow:auto; overflow-x:hidden;">
                                                                                    <table style="width:100%; padding:0; border-spacing:0;"
                                                                                           id="faultTable<%=i%>"
                                                                                           border=1>


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


                                                                    var workingBarcodeItems = [];
                                                                    var faultBarcodeItems = [];
                                                                    var i = 0;
                                                                    var bool = true;
                                                                    var popup;
                                                                    var boolFault = true;


                                                                    var workingItemsTable = document.getElementById("workingItemsTable<%=i%>");
                                                                    var faultTable = document.getElementById("faultTable<%=i%>");


                                                                    if (sessionStorage.getItem("workingBarcodeItems<%=i%>")) {
                                                                        workingBarcodeItems = JSON.parse(sessionStorage.getItem("workingBarcodeItems<%=i%>"));
                                                                    } else {

                                                                        sessionStorage.setItem("workingBarcodeItems<%=i%>", JSON.stringify(workingBarcodeItems));
                                                                        workingBarcodeItems = JSON.parse(sessionStorage.getItem("workingBarcodeItems<%=i%>"));

                                                                    }

                                                                    if (sessionStorage.getItem("faultBarcodeItems<%=i%>")) {
                                                                        faultBarcodeItems = JSON.parse(sessionStorage.getItem("faultBarcodeItems<%=i%>"));
                                                                    } else {

                                                                        sessionStorage.setItem("faultBarcodeItems<%=i%>", JSON.stringify(faultBarcodeItems));
                                                                        faultBarcodeItems = JSON.parse(sessionStorage.getItem("faultBarcodeItems<%=i%>"));

                                                                    }

                                                                    for (i = 0; i < workingBarcodeItems.length; i++) {
                                                                        if (workingBarcodeItems[i] === barcodeText.value) {
                                                                            bool = false;
                                                                            break;
                                                                        }
                                                                    }

                                                                    for (i = 0; i < faultBarcodeItems.length; i++) {
                                                                        if (faultBarcodeItems[i] === barcodeText.value) {
                                                                            boolFault = false;
                                                                            break;
                                                                        }
                                                                    }

                                                                    if (bool === true && boolFault === true) {


                                                                        if (itemStatus.value.trim() === "working") {
                                                                            workingBarcodeItems.push(barcodeText.value);
                                                                            sessionStorage.setItem("workingBarcodeItems<%=i%>", JSON.stringify(workingBarcodeItems));
                                                                            if (itemDescription.value.trim() === "")
                                                                                workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td><td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="------" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                            else
                                                                                workingItemsTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "barcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="workingDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeWorkingItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                            resetItemDetails<%=i%>();
                                                                            autoFocus<%=i%>();

                                                                        } else if (itemStatus.value.trim() === "faulty" && itemDescription.value.trim() !== "") {
                                                                            faultBarcodeItems.push(barcodeText.value);
                                                                            sessionStorage.setItem("faultBarcodeItems<%=i%>", JSON.stringify(faultBarcodeItems));
                                                                            faultTable.insertRow(-1).innerHTML = '<tr style="padding:0;"><td style="padding:0;"><input type="text" readonly style = "margin:0;border:0;" value ="' + barcodeText.value + '" name = "faultBarcode"></td> <td style="padding:0;"><input type="text" style = "margin:0;border:0;" name="faultDescription" value="' + itemDescription.value + '" ></td><td style="padding:0;"><button style="margin:0;" type="button" class="btn btn-danger" onclick="removeFaultItemRow<%=i%>(this)"><i class="fa fa-trash"></i></button></td></tr>';
                                                                            resetItemDetails<%=i%>();
                                                                            barcodeText.focus();
                                                                            document.getElementById("faultTable<%=i%>").scrollIntoView();

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
                                                                            document.getElementById("itemsList<%=i%>").scrollIntoView();

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
                                                                    document.getElementById("itemsList<%=i%>").scrollIntoView();

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
                                                            }


                                                            function autoFocus<%=i%>() {
                                                                document.getElementById("txtBarcode<%=i%>").focus();
                                                                document.getElementById("itemsList<%=i%>").scrollIntoView();
                                                            }


                                                            function deleteAllWorkingItemsRows<%=i%>() {
                                                                document.getElementById("workingItemsTable<%=i%>").innerHTML = "";
                                                                sessionStorage.removeItem("workingBarcodeItems<%=i%>");
                                                                document.getElementById("txtBarcode<%=i%>").focus();
                                                                document.getElementById("workingItems<%=i%>").scrollIntoView();
                                                            }

                                                            function removeWorkingItemRow<%=i%>(input) {


                                                                var barcodeArray = JSON.parse(sessionStorage.getItem("workingBarcodeItems<%=i%>"));
                                                                var i = input.parentNode.parentNode.rowIndex;
                                                                document.getElementById("workingItemsTable<%=i%>").deleteRow(i);
                                                                barcodeArray.splice(i, 1);
                                                                sessionStorage.setItem("workingBarcodeItems<%=i%>", JSON.stringify(barcodeArray));
                                                                document.getElementById("txtBarcode<%=i%>").focus();
                                                                document.getElementById("workingItems<%=i%>").scrollIntoView();
                                                            }


                                                            function deleteAllFaultItemsRows<%=i%>() {
                                                                document.getElementById("faultTable<%=i%>").innerHTML = "";
                                                                sessionStorage.removeItem("faultBarcodeItems<%=i%>");
                                                                document.getElementById("txtBarcode<%=i%>").focus();
                                                                document.getElementById("faultTable<%=i%>").scrollIntoView();
                                                            }


                                                            function removeFaultItemRow<%=i%>(input) {
                                                                var barcodeArray = JSON.parse(sessionStorage.getItem("faultBarcodeItems<%=i%>"));
                                                                var i = input.parentNode.parentNode.rowIndex;
                                                                document.getElementById("faultTable<%=i%>").deleteRow(i);
                                                                barcodeArray.splice(i, 1);
                                                                sessionStorage.setItem("faultBarcodeItems<%=i%>", JSON.stringify(barcodeArray));
                                                                document.getElementById("txtBarcode<%=i%>").focus();
                                                                document.getElementById("faultTable<%=i%>").scrollIntoView();
                                                            }


                                                            function validateFormX<%=i%>() {

                                                                var popup;

                                                                var array = [];
                                                                var arrayFault = [];

                                                                if (JSON.parse(sessionStorage.getItem("workingBarcodeItems<%=i%>")) != null)
                                                                    array = JSON.parse(sessionStorage.getItem("workingBarcodeItems<%=i%>"));

                                                                if (JSON.parse(sessionStorage.getItem("faultBarcodeItems<%=i%>")) != null)
                                                                    arrayFault = JSON.parse(sessionStorage.getItem("faultBarcodeItems<%=i%>"));

                                                                if (document.getElementById('itemdetailsdropitem<%=i%>').value.trim() === "") {
                                                                    popup = document.getElementById("myPopup3<%=i%>");
                                                                    popup.innerHTML = "This is a Required Field!!";
                                                                    document.getElementById("itemdetailsdropitem<%=i%>").focus();
                                                                    document.getElementById("stockItem<%=i%>").scrollIntoView();

                                                                    if (!popup.classList.contains("show")) {
                                                                        popup.classList.add("show");

                                                                        setTimeout(function () {
                                                                            popup.classList.remove("show");
                                                                        }, 3000);
                                                                    }
                                                                } else if (array.length === 0 && arrayFault.length === 0) {
                                                                    popup = document.getElementById("myPopup1<%=i%>");
                                                                    popup.innerHTML = "Please Enter at least one Item!!!";
                                                                    document.getElementById("txtBarcode<%=i%>").focus();
                                                                    document.getElementById('itemsList<%=i%>').scrollIntoView();

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


                                                            function clearAllFields<%=i%>() {

                                                                document.getElementById('iteminformation<%=i%>').innerHTML = 'Item&nbsp;Information&nbsp;Goes&nbsp;Here...';
                                                                document.getElementById("workingItemsTable<%=i%>").innerHTML = "";
                                                                document.getElementById("faultTable<%=i%>").innerHTML = "";

                                                            }


                                                            document.getElementById('itemdetailsdropitem<%=i%>').addEventListener('keyup', function (event) {
                                                                if (event.keyCode === 13) {
                                                                    document.getElementById('itemdetailsitemdisplay<%=i%>').classList.toggle('show');
                                                                }
                                                            });


                                                            //filter fucntion for the Item Detail
                                                            function itemdetailsitemdisplayfilterFunction<%=i%>() {
                                                                var input, filter, ul, li, a, i, div;
                                                                input = document.getElementById("itemdetailsmyInput<%=i%>");
                                                                filter = input.value.toUpperCase();
                                                                div = document.getElementById("itemdetailsitemdisplay<%=i%>");
                                                                a = div.getElementsByTagName("a");

                                                                for (i = 0; i < a.length; i++) {
                                                                    txtValue = a[i].textContent || a[i].innerText;
                                                                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                                        a[i].style.display = "";
                                                                    } else {
                                                                        a[i].style.display = "none";
                                                                    }
                                                                }
                                                            }


                                                            window.addEventListener('click', function (event) {


                                                                var itemx = document.getElementById("itemdetailsitemdisplay<%=i%>");


                                                                if (event.target.id === "itemdetailsdropitem<%=i%>" || event.target.id === "caret<%=i%>") {
                                                                    itemx.classList.toggle("show");

                                                                } else if (event.target.id === "itemdetailsmyInput<%=i%>") {

                                                                } else {


                                                                    itemx.classList.remove("show");

                                                                }
                                                            });


                                                            $(document).ready(function () {
                                                                document.getElementById("txtBarcode<%=i%>").addEventListener(
                                                                    'keydown',
                                                                    function (event) {
                                                                        if ((event.ctrlKey && event.key === "j")
                                                                            || (event.ctrlKey && event.key === "b")
                                                                            || (event.ctrlKey && event.key === "i")
                                                                            || (event.keyCode === 13))
                                                                            event.preventDefault();

                                                                    });


                                                            });


                                                        </script>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-outline-secondary"
                                                                   data-dismiss="modal" value="Close">
                                                            <input type="reset" class="btn btn-outline-danger"
                                                                   data-dismiss="modal" value="Reset"
                                                                   onclick="clearAllFields<%=i%>()">
                                                            <input type="button" class="btn btn-outline-success"
                                                                   onclick="validateForm<%=i%>()"
                                                                   value="Update">
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
            <table style="width: 100%;">
                <tr>

                    <td><a href="Stock_IN_INSERT.jsp"
                           class=" btn btn-dark btn-lg btn-block">Create&nbsp;Stocks</a></td>

                    <td><a href="Stock_IN_MANAGE.jsp"
                           class=" btn btn-dark btn-lg btn-block">Manage&nbsp;Stocks</a></td>


                </tr>

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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!-- Menu Toggle Script -->

<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

<script src="${pageContext.request.contextPath}/js/WebScript.js"></script>
<%
    if (session.getAttribute("color") != null && session.getAttribute("message") != null) {
%>
<script>
    myFunction();
</script>
<%
    session.removeAttribute("results");
    session.removeAttribute("color");
    session.removeAttribute("message");
%>
<%
    }
%>


</body>


</html>

