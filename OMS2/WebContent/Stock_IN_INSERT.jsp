<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.DatabaseHandle.Inventory_SELECT" %>
<%@page import="com.DatabaseHandle.Main_SELECT" %>
<%@page import="com.Utilities.MySQLQueries" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
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

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>


    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar3.css" rel="stylesheet">

    <style>
        i#caret {
            border: none;
            background: none;
            position: absolute;
            top: 17px;
            right: 13px;
        }

        i#caretSearch {
            border: none;
            background: none;
            position: absolute;
            top: 17px;
            right: 13px;
        }


    </style>


    <script>
        function clearSessions() {
            sessionStorage.clear();
        }
    </script>


</head>


<body onload="clearSessions();">
<%
    if (session.getAttribute("REFRESH") != null) {
        if (session.getAttribute("REFRESH").toString().equalsIgnoreCase("TRUE"))
            session.setAttribute("REFRESH", "FALSE");
        else {
            session.removeAttribute("REFRESH");
            if (session.getAttribute("itemID") != null)
                session.removeAttribute("itemID");
            if (session.getAttribute("bppitem") != null)
                session.removeAttribute("bppitem");
            if (session.getAttribute("remarks") != null)
                session.removeAttribute("remarks");
            if (session.getAttribute("stock_in_date") != null)
                session.removeAttribute("stock_in_date");
            if (session.getAttribute("supID") != null)
                session.removeAttribute("supID");
            if (session.getAttribute("itype") != null)
                session.removeAttribute("itype");
        }
    } else {
        if (session.getAttribute("itemID") != null)
            session.removeAttribute("itemID");
        if (session.getAttribute("bppitem") != null)
            session.removeAttribute("bppitem");
        if (session.getAttribute("remarks") != null)
            session.removeAttribute("remarks");
        if (session.getAttribute("stock_in_date") != null)
            session.removeAttribute("stock_in_date");
        if (session.getAttribute("supID") != null)
            session.removeAttribute("supID");
        if (session.getAttribute("itype") != null)
            session.removeAttribute("itype");
    }
%>
<%-- System.out.println("this is user " + CurrentUser.getUsername());
    if (CurrentUser.getUsername().equals("nouser") || CurrentUser.getUsername().equals("")) {
        response.sendRedirect("login.jsp");
    }
--%>

<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>


<div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">

        <div class="sidebar-heading">Automated Barcode<br>Solution</div>
        <div class="list-group list-group-flush">

            <a href="Supplier_Order_Insert.jsp" class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a>

            <a
                    class="list-group-item list-group-item-action bg-light dropdown-toggle"
                    data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
                    aria-controls="collapseExample">Inventory&nbsp;Management</a>
            <div class="collapse" id="collapseExample">


                <a href="Stock_IN_INSERT.jsp"
                   class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;IN</a>
                <a href="Stock_OUT_INSERT.jsp"
                   class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;OUT</a>


            </div>

            <a href="" class="list-group-item list-group-item-action bg-light">Payment&nbsp;Management</a>

            <a href="Customer_Details_Insert.jsp" class="list-group-item list-group-item-action bg-light">Customer&nbsp;Management</a>
            <a href="Customer_Order_Insert.jsp"
               class="list-group-item list-group-item-action bg-light">Installation&nbsp;Management</a>
            <a href="Repair_INSERT.jsp"
               class="list-group-item list-group-item-action bg-light">Repair&nbsp;Management</a>
            <a href="Admin_Customer_Order_Conformation.jsp"
               class="list-group-item list-group-item-action bg-light">Customer Order &nbsp;Confirm</a>

            <a href="Emp_Management.jsp"
               class="list-group-item list-group-item-action bg-light">Employee&nbsp;Management</a>
            <a href="Emp_REPORT.jsp"
               class="list-group-item list-group-item-action bg-light">Employee&nbsp;Reports</a>
            <a href="IT_Manager_Assign_Emp.jsp"
               class="list-group-item list-group-item-action bg-light">Employee Assign &nbsp;Management</a>
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
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
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

        <!-- fetching necessary item fro the items drop down -->
        <%
            //for the drop down item select
            ResultSet resultset_for_items;
            Main_SELECT si4 = new Main_SELECT(ConnectionManager.getConnection(), MySQLQueries.QUERY_GET_ALL_ITEM_DETAILS);
            resultset_for_items = si4.get_table();

        %>
        <!-- necessary js fro the items drop down -->


        <!--create the big table -->
        <div style="top: 0">
            <table class="table table-bordered table-striped mb-0"
                   style="width: 100%; height: 80%;">
                <!--division of the first two big columns start here -->
                <tr>
                    <!-- creating first column of the big table-->
                    <td style="width: 70%; padding: 0;">
                        <!--inside the first column -->
                        <!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

                        <form action="Inventory_SELECT_Controller?jspPage=insert"
                              method="POST" id="searchForm" name="searchForm">
                            <table class="table table-bordered table-striped mb-0"
                                   style="width: 100%;">
                                <tr>
                                    <td style="padding-top: 0px; padding-bottom: 0px;"><input
                                            class="btn-block" name="queryValue" id="txtSearch"
                                            type="text" placeholder="Type Here to Search..." required
                                        <%if (session.getAttribute("results") != null) {%> disabled
                                        <%}%>></td>
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
                                    <td style="padding-top: 0; padding-bottom: 0;">
                                        <input

                                            <%if (session.getAttribute("results") != null) {%>
                                                name="search" type="reset" class="btn-block"
                                                value="Reset" id="resetBtn1"
                                            <%} else {%>
                                                name="search" type="reset" class="btn-block"
                                                value="Reset" id="resetBtn"
                                            <%}%>></td>
                                </tr>
                            </table>

                        </form>

                    </td>


                    <!-- start of the next notification column -->
                    <td rowspan="2"
                        style="padding: 0; top: 0; width: 100%; height: 100%;">
                        <!--creation of the notification table -->
                        <table style="height: 100%; width: 100%;">

                            <!-- notification one  -->

                            <tr>
                                <td style="height: 60%;">
                                    <!-- form starts here  -->

                                    <div class="container" style="height: 525px; overflow-y: auto; overflow-x: hidden">

                                        <form id="mainForm" action="Inventory_INSERT_Controller" method="post">

                                            <label for="itemdetailsdropitem" id="stockItem">Stock&nbsp;Item</label><br>
                                            <div class="dropdown">
                                                <div class="popup" style="width:100%;">
                                                    <input type="text" id="itemdetailsdropitem" name="itemID"
                                                           style="cursor: default;"
                                                           placeholder="Click Here to Select an Item" value="" required
                                                           autocomplete="off" readonly class="form-control"><i
                                                        class="fa fa-caret-down" id="caret"></i><span
                                                        class="popuptext"
                                                        id="myPopup3"></span>
                                                </div>
                                                <div id="itemdetailsitemdisplay" class="dropdown-content"
                                                     style="margin-top:-4%;width:100%;height : 450%;overflow-y:scroll;overflow-x:hidden;border:1px solid #538AC0;">
                                                    <div style="position: sticky;top:-6px;margin-top:-6px;padding:0">
                                                        <input tabindex="0" type="text" id="itemdetailsmyInput"
                                                               onkeyup="itemdetailsitemdisplayfilterFunction()"
                                                               autocomplete="off" placeholder="Search here.."><i
                                                            class="fa fa-search" id="caretSearch"></i>
                                                    </div>

                                                    <div style="overflow-x:hidden;">

                                                        <% while (resultset_for_items.next()) {%>
                                                        <a style="cursor: pointer;"
                                                           id='<%=resultset_for_items.getString("item_id") %>'
                                                           tabindex="0">Item&nbsp;Model&nbsp;Name&nbsp;:&nbsp;<b><%=resultset_for_items.getString("item_model_name")%>
                                                        </b><br>Item&nbsp;Type&nbsp;:&nbsp;<%=resultset_for_items.getString("item_type")%>
                                                            <br>Manufacturer&nbsp;:&nbsp;<%=resultset_for_items.getString("item_manufacturer")%>
                                                            <br>Supplier&nbsp;:&nbsp;<%=resultset_for_items.getString("supplier_name")%>
                                                            <br>Description&nbsp;:&nbsp;<%=resultset_for_items.getString("item_details")%>
                                                        </a>
                                                        <script>
                                                            document.getElementById('<%=resultset_for_items.getString("item_id") %>').addEventListener('click', function () {
                                                                document.getElementById('itemdetailsdropitem').value = '<%=resultset_for_items.getString("item_id")%>';
                                                                document.getElementById('iteminformation').innerHTML = '<p>' + document.getElementById('<%=resultset_for_items.getString("item_id") %>').innerHTML + '</p>';
                                                                document.getElementById("supplier_id").value = '<%=resultset_for_items.getString("supplier_id")%>';
                                                                document.getElementById('itemdetailsmyInput').value = "";
                                                            });

                                                            document.getElementById('<%=resultset_for_items.getString("item_id") %>').addEventListener("keyup", function (e) {
                                                                if (e.keyCode === 13) {
                                                                    e.preventDefault();
                                                                    document.getElementById('<%=resultset_for_items.getString("item_id") %>').click();
                                                                }
                                                            });

                                                        </script>
                                                        <% } %>

                                                    </div>


                                                </div>

                                            </div>
                                            <div id="iteminformation"
                                                 style="width:100%; background-color: lightgrey; padding:0; height:auto; overflow-x:hidden;">
                                                <p>Item&nbsp;Information&nbsp;Goes&nbsp;Here....</p>
                                            </div>
                                            <br>
                                            <input type="text" hidden id="supplier_id" name="supplier" value="">
                                            <label for="datePicker">Stock&nbsp;IN&nbsp;Date</label>
                                            <input type="date" name="stockindate" id="datePicker" required
                                                   value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"><br>
                                            <label for="txtAreaRemarks">Any&nbsp;other&nbsp;Information's</label>

                                            <textarea id="txtAreaRemarks" name="remarks" rows="4"
                                                      cols="4"
                                                      placeholder="Enter Stock Information Here..."></textarea>
                                            <br>


                                            <label id="itemsList">Item&nbsp;List&nbsp;Details</label>
                                            <div class="popup" style="width:100%;">
                                                <input style="width:100%;" type="text" id="txtBarcode"
                                                       name="barcodeNmber" placeholder="Enter Barcode Here...">
                                                <span class="popuptext" id="myPopup1"></span>

                                            </div>

                                            <div class="popup" style="width:100%;">
                                                <select style="width:100%;" id="itemStatus">
                                                    <option selected disabled value="">Select&nbsp;Item&nbsp;Type
                                                    </option>
                                                    <option value="working">Working</option>
                                                    <option value="faulty">Faulty</option>
                                                </select>
                                                <span class="popuptext" id="myPopup4"></span>
                                            </div>
                                            <div class="popup" style="width:100%;"><textarea id="description"
                                                                                             placeholder="Enter Fault Description Here..."
                                                                                             cols="4"
                                                                                             rows="4"></textarea><span
                                                    class="popuptext"
                                                    id="myPopup2"></span>
                                            </div>
                                            <div style="width: 100%; display: flex; flex-direction: row;">
                                                <button style="width:100%; margin-right:2.5px;" class="btn btn-info"
                                                        type="button" onclick="myFirstFunction();">Add&nbsp;Item
                                                </button>
                                                <br>

                                            </div>

                                            <br>

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
                                            <button style="width:100%" class="btn btn-warning"
                                                    type="button" onclick="deleteAllWorkingItemsRows();">Clear&nbsp;All
                                            </button>
                                            <br>
                                            <br>
                                            <label for="txtBarcode">Fault Item&nbsp;List</label><br>
                                            <div style="width:100%; background-color: lightgrey; padding:0; height:150px;overflow:auto; overflow-x:hidden;">
                                                <table style="width:100%; padding:0; border-spacing:0;" id="faultTable"
                                                       border=1>


                                                </table>


                                            </div>
                                            <br>
                                            <button style="width:100%" class="btn btn-warning"
                                                    type="button" onclick="deleteAllFaultItemsRows();">Clear&nbsp;All
                                            </button>
                                            <br>
                                            <br>
                                            <input type="button" id="submit-form"
                                                   hidden="hidden" onclick="validateFormX()" name="submitButton"
                                                   value="Insert Stock">
                                            <input type="reset" hidden="hidden" id="reset-form"
                                                   onclick="clearAllFields();"
                                                   name="resetButton" value="Reset Fields">

                                        </form>

                                    </div> <!--  form ends here -->

                                </td>


                            </tr>
                            <tr>
                                <td>
                                    <div style="width: 100%; display: flex; flex-direction: row;">
                                        <button
                                                onclick="document.getElementById('submit-form').click()"
                                                class="buttonLabel btn btn-success btn-block btn-lg">Insert&nbsp;Stock
                                        </button>
                                        <button id="rstBtn"
                                                onclick="document.getElementById('reset-form').click()"
                                                class=" buttonLabel btn btn-danger btn-block btn-lg">Reset&nbsp;Fields
                                        </button>
                                    </div>

                                </td>
                            </tr>
                        </table>
                </tr>
                <tr>
                    <td>
                        <div class="table-wrapper-scroll-y my-custom-scrollbar"
                             style="height: 525px; position: relative;">

                            <table class="table table-bordered table-striped mb-0">
                                <thead>
                                <tr>
                                    <th>Stock&nbsp;IN&nbsp;ID</th>
                                    <th>Item&nbsp;ID</th>
                                    <th>Supplier</th>
                                    <th>Item&nbsp;Type</th>
                                    <th>Received&nbsp;Date</th>
                                    <th>Quantity</th>


                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    ResultSet result;
                                    Inventory_SELECT si = new Inventory_SELECT(ConnectionManager.getConnection(),
                                            MySQLQueries.QUERY_SELECT_ALL);
                                    result = si.get_inventory_table();
                                    try {
                                        while (result.next()) {
                                %>
                                <tr>
                                    <td><%=result.getString(1)%>
                                    </td>
                                    <td><%=result.getString(2)%>
                                    </td>
                                    <td><%=result.getString(3)%>
                                    </td>
                                    <td><%=result.getString(4)%>
                                    </td>
                                    <td><%=result.getString(5)%>
                                    </td>
                                    <td><%=result.getDouble(6)%>
                                    </td>
                                    <td><%=result.getLong(7)%>
                                    </td>
                                </tr>

                                <%
                                        }
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }


                                %>
                                </tbody>
                            </table>

                        </div> <!--finish first column-->
                    </td>
                </tr>
                <!-- second column inside table end here -->
            </table>


            <!-- end of the first table -->

            <table style="width: 100%;">
                <tr>

                    <td><a href="Stock_IN_INSERT.jsp"
                           class=" btn btn-dark btn-lg btn-block">Create&nbsp;Stocks</a></td>

                    <td><a href="Stock_IN_DELETE.jsp"
                           class=" btn btn-dark btn-lg btn-block">Delete&nbsp;Stocks</a></td>
                    <td><a href="Stock_Report.jsp"
                           class=" btn btn-dark btn-lg btn-block">Generate&nbsp;Reports</a></td>

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
    %>      <%=session.getAttribute("message")%>
    <%
        }
    %>
</div>


<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Menu Toggle Script -->

<script>
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

<script src="${pageContext.request.contextPath}/js/WebScript.js"></script>

<script>

</script>


<%if (session.getAttribute("color") != null && session.getAttribute("message") != null) {%>
<script>
    myFunction();
</script>
<%
    session.removeAttribute("color");
    session.removeAttribute("message");
%>
<%}%>


</body>


</html>

