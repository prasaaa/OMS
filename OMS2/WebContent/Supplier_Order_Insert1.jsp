<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.DatabaseHandle.Supplier_SELECT" %>
<%@page import="com.model.CurrentUser" %>
<%@page import="com.model.Supplier_Order" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Automated Barcode Solution</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/simple-sidebar4.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        #wgtmsr {
            width: 150px;
        }

        a:hover {
            background-color: #ddd;
        }
    </style>
    <title>Insert title here</title>
</head>
<body>
<% System.out.println("this is user " + CurrentUser.getUsername());
    if (CurrentUser.getUsername().equals("nouser") || CurrentUser.getUsername().equals("")) {
        response.sendRedirect("login.jsp");
    }


%>

<div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">

        <div class="sidebar-heading">Automated Barcode<br>Solution</div>
        <div class="list-group list-group-flush">
            <%if (CurrentUser.getUsername().equals("admin")) { %>
            <a href="Supplier_Order_Insert.jsp" class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a>
            <%} %>
            <%if (CurrentUser.getUsername().equals("admin") || CurrentUser.getUsername().equals("accountant") || CurrentUser.getUsername().equals("manager")) {%>
            <a
                    class="list-group-item list-group-item-action bg-light dropdown-toggle"
                    data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
                    aria-controls="collapseExample">Inventory&nbsp;Management</a>
            <div class="collapse" id="collapseExample">


                <a href="Stock_IN_MANAGE.jsp"
                   class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;IN</a>
                <a href="Stock_OUT_INSERT.jsp"
                   class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;OUT</a>


            </div>

            <a href="Payment_UPDATE.jsp"
               class="list-group-item list-group-item-action bg-light">Payment&nbsp;Management</a>

            <a href="Customer_Details_Insert.jsp" class="list-group-item list-group-item-action bg-light">Customer&nbsp;Management</a>
            <a href="Customer_Order_Insert.jsp"
               class="list-group-item list-group-item-action bg-light">Installation&nbsp;Management</a>
            <a href="Repair_INSERT.jsp"
               class="list-group-item list-group-item-action bg-light">Repair&nbsp;Management</a>
            <a href="Admin_Customer_Order_Conformation.jsp"
               class="list-group-item list-group-item-action bg-light">Customer Order &nbsp;Confirm</a>
            <a
                    class="list-group-item list-group-item-action bg-light dropdown-toggle"
                    data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false"
                    aria-controls="collapseExample2">Employee&nbsp;Management</a>
            <div class="collapse" id="collapseExample2">
                <a href="Emp_Management.jsp"
                   class="list-group-item list-group-item-action bg-secondary text-white">Employee&nbsp;Management</a>
                <a href="Emp_REPORT.jsp"
                   class="list-group-item list-group-item-action bg-secondary text-white">Employee&nbsp;Reports</a>
                <a href="IT_Manager_Assign_Emp.jsp"
                   class="list-group-item list-group-item-action bg-secondary text-white">Employee Assign &nbsp;Management</a>
            </div>

        </div>
        <%} %>
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

        <!--create the big table -->
        <table style="width: 100%; height: 85%;">
            <!--division of the first two big columns start here -->
            <tr>
                <!-- creating first column of the big table-->
                <td style="width: 63%;">
                    <!--inside the first column -->
                    <div class="table-wrapper-scroll-y my-custom-scrollbar"
                         style="height: 100%; position: relative;">


                        <!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                        <table class="table table-bordered table-striped mb-0"
                               style="position: relative;">
                            <tr>
                                <th>Supplier order ID</th>
                                <th>Order Date</th>
                                <th>Recieve Date</th>
                                <th>Supplier ID</th>
                                <th>Type</th>
                            </tr>


                            <%

                                ResultSet result;
                                ResultSet resultset_for_dropdown;
                                ResultSet resultset_for_items;

                                //used to store the item details to check whether lenth of item details not exceeding the needed length

                                String itemdetail, subitemdetails;
                                int cuttingnumbers, startindexofstring, endindexofstring;


                                //for the use of dropdown we use a hashmap
                                HashMap<String, Integer> dropdown_item_store = new HashMap<String, Integer>();
                                //to store the type of suppliers
                                HashMap<String, String> supplier_type_store = new HashMap<String, String>();


                                Connection con = ConnectionManager.getConnection();

                                Supplier_SELECT si = new Supplier_SELECT(con, "select * from supplier_order_import_table");
                                result = si.get_supplier_table();

                                //for the drop down customer select
                                Supplier_SELECT si2 = new Supplier_SELECT(con, "select * from supplier_table");
                                resultset_for_dropdown = si2.get_supplier_table();
                                HttpSession I_OR_L = request.getSession();

                                //for the drop down item select
                                Supplier_SELECT si4 = new Supplier_SELECT(con, "select item_id,item_details from item_details_table ");
                                resultset_for_items = si4.get_supplier_table();

                                while (result.next()) {
                            %>

                            <tr>
                                <td><%= result.getString("supplier_order_im_id") %>
                                </td>
                                <td><%= result.getString("order_date")  %>
                                </td>
                                <td><%= result.getString("recieve_date")  %>
                                </td>
                                <td><%= result.getString("supplier_id")  %>
                                </td>
                                <td><%= result.getString("type")  %>
                                </td>
                            </tr>

                            <% }%>

                        </table>


                    </div> <!--finish first column-->
                </td>
                <!-- start of the next notification column -->
                <td style="width: 100%; height: 100%;">
                    <!--creation of the notification table -->

                    <table style="height: 100%; width: 100%;">

                        <!-- notification one  -->

                        <tr>
                            <td style="height: 100%;">

                                <!-- form starts here  -->

                                <div class="container">


                                    <script>

                                        document.addEventListener('keydown', function (event) {
                                            if (event.keyCode == 13 || event.keyCode == 17 || event.keyCode == 74)
                                                event.preventDefault();
                                        });

                                        function myFunction() {

                                            //this is to check whether the item selected is null before adding to the table
                                            //to that we check if the items more details is empty then no item has selected
                                            if (document.getElementById("itemmoredetails").value == '') {
                                                alert("One Item Should Be Selected !");
                                                return false;
                                            }
                                            if (document.getElementById("item_quantity").value == '') {
                                                alert("Item Quantity Cannot be Empty !");
                                                return false;
                                            }
                                            if (sessionStorage.getItem("index_counter")) {
                                                var number = parseInt(sessionStorage.getItem("index_counter"));
                                            } else {

                                                sessionStorage.setItem("index_counter", 1);
                                                var number = parseInt(sessionStorage.getItem("index_counter"));

                                            }

                                            var table = document.getElementById("myTable");
                                            var selecteditem = document.getElementById("itemselect");
                                            var quantity = document.getElementById("item_quantity");
                                            var itemname = number + "item";
                                            var itemquantity = number + "quantity";

                                            table.insertRow(-1).innerHTML = '<tr><td style = " background-color:white;"><input style = "border:0;" value =' + selecteditem.value + ' name = "items"></td> <td style = " background-color:white;"><input style = "border:0;" style = "background-color:white;" name = "itemquantity" value = ' + quantity.value + '></td><td style = " background-color:white;"><button id = ' + number + ' class="btn" onclick="SomeDeleteRowFunction(this)" ><i class="fa fa-trash"></i></button></td></tr>';
                                            sessionStorage.setItem("index_counter", number + 1);
                                            //make itemselect and itemsmoredetails empty after the items added to the table
                                            document.getElementById("itemselect").value = "";
                                            document.getElementById("itemmoredetails").value = "";
                                            return true;

                                        }

                                        function Delete_Number_Session() {
                                            sessionStorage.removeItem("index_counter");
                                        }

                                        function validateForm() {

                                            //check whether the date is emplty
                                            var x = document.forms["myForm"]["date"].value;
                                            if (x == "") {
                                                alert("date must be filled out");
                                                return false;
                                            }

                                            //check whether the selected date is less than the current date
                                            var dateString = x;
                                            var myDate = new Date(dateString);
                                            var today = new Date();
                                            if (myDate < today) {
                                                alert("Estimated Date Should Be Greater than Or Equal To Current Date !");
                                                return false;
                                            }
                                            //checking whether the supplier name is correct ,that is whether it is selected is a item in drop down
                                            var optcounter = 0;
                                            var suppliername = document.getElementById('supplierselect').value;
                                            var supoptions = document.getElementById('suppliers');
                                            for (i = 0; i < supoptions.options.length; i++) {
                                                if (supoptions.options[i].value == suppliername) {
                                                    optcounter = 1;
                                                    break;
                                                }
                                            }
                                            if (optcounter == 0) {
                                                alert("You Must Select A Supplier From The DropDown !");
                                                return false;
                                            }


                                            return true;

                                        }

                                        function SomeDeleteRowFunction(o) {

                                            var p = o.parentNode.parentNode;
                                            p.parentNode.removeChild(p);
                                        }

                                        function SelectTheItem() {

                                            /* document.getElementById("itemmoredetails").value = document.getElementById("itemselect").value + document.getElementById("cctv_g17_miopt").value ; */
                                            var itemselected = document.getElementById("itemselect").value;
                                            document.getElementById("itemmoredetails").value = document.getElementById(itemselected).innerHTML;

                                        }

                                        function clear() {

                                            /* document.getElementById("itemmoredetails").value = document.getElementById("itemselect").value + document.getElementById("cctv_g17_miopt").value ; */
                                            var itemselected = document.getElementById("itemselect").value;
                                            document.getElementById("itemmoredetails").value = "";

                                        }

                                        //filter fucntion for the supplier
                                        function supplierfilterFunction() {
                                            var input, filter, ul, li, a, i;
                                            input = document.getElementById("suppliermyInput");
                                            filter = input.value.toUpperCase();
                                            div = document.getElementById("supplieritemdisplay");
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

                                        //filter fucntion for the Item Detail
                                        function itemdetailsitemdisplayfilterFunction() {
                                            var input, filter, ul, li, a, i;
                                            input = document.getElementById("itemdetailsmyInput");
                                            filter = input.value.toUpperCase();
                                            div = document.getElementById("itemdetailsitemdisplay");
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


                                        window.onclick = function (event) {


                                            var supplierx = document.getElementById("supplieritemdisplay");
                                            var itemx = document.getElementById("itemdetailsitemdisplay");

                                            if (event.target.id == "supplierdropitem") {

                                                supplierx.classList.toggle("show");
                                                itemx.classList.remove("show");

                                            } else if (event.target.id == "suppliermyInput") {


                                            } else if (event.target.id == "itemdetailsdropitem") {
                                                itemx.classList.toggle("show");
                                                supplierx.classList.remove("show");
                                            } else if (event.target.id == "itemdetailsmyInput") {

                                            } else {

                                                supplierx.classList.remove("show");
                                                itemx.classList.remove("show");

                                            }
                                        }


                                    </script>


                                    <form action="Supplier_Order_INSERT_Controller" method="post" name="myForm"
                                          onsubmit="return validateForm()">

                                        <label>Select Supplier</label><br>
                                        <div class="dropdown">
                                            <input type="text" id="supplierdropitem" value="dropdown" readonly>

                                            <div id="supplieritemdisplay" class="dropdown-content"
                                                 style="margin-top:-20px;width:100%;height:450%;overflow: auto;">

                                                <input type="text" id="suppliermyInput"
                                                       onkeyup="supplierfilterFunction()" autocomplete="off"
                                                       placeholder="Search here.." style="position:sticky;">
                                                <% while (resultset_for_dropdown.next()) { %>
                                                <a onclick="document.getElementById('dropitem').value = '<%=resultset_for_dropdown.getString("supplier_id")%>';"><%=resultset_for_dropdown.getString("supplier_id")%>
                                                </a>

                                                <%} %>

                                            </div>

                                        </div>


                                        <br>
                                        <label>Select Estimated Recieving Date</label><br>
                                        <input type="date" value="enter" id="date" name="date" style="width: 100%;
																													  padding: 12px;
																													  border: 1px solid #ccc;
																													  border-radius: 4px;
																													  box-sizing: border-box;
																													  margin-top: 6px;
																													  margin-bottom: 16px;
																													  resize: vertical;">
                                        <br>


                                        <label>Select Items</label><br>
                                        <div class="dropdown">
                                            <input type="text" id="itemdetailsdropitem" value="dropdown" readonly>

                                            <div id="itemdetailsitemdisplay" class="dropdown-content"
                                                 style="margin-top:-20px;width:100%;height : 450%;">
                                                <div style="position: sticky;top: -5px;margin:-5px;">
                                                    <input type="text" id="itemdetailsmyInput"
                                                           onkeyup="itemdetailsitemdisplayfilterFunction()"
                                                           autocomplete="off" placeholder="Search here..">
                                                </div>
                                                <div style="overflow: auto;">
                                                    <% while (resultset_for_items.next()) {%>
                                                    <a onclick="document.getElementById('dropitem').value = '<%=resultset_for_items.getString("item_id")%>';"><%=resultset_for_items.getString("item_id")%>
                                                        <br><%=resultset_for_items.getString("item_details")%>
                                                    </a>

                                                    <% } %>
                                                </div>
                                            </div>

                                        </div>


                                        <input list="itemslist" onchange="SelectTheItem()" name="itemselect"
                                               id="itemselect" placeholder="Press Arrow Down Button for more" style="width: 40%;
																																											  padding: 12px;
																																											  border: 1px solid #ccc;
																																											  border-radius: 4px;
																																											  box-sizing: border-box;
																																											  margin-top: 6px;
																																											  margin-bottom: 16px;
																																										  	  resize: vertical;">
                                        <datalist id="itemslist">
                                            <%
                                                String optcounter;
                                                while (resultset_for_items.next()) { %>

                                            <option id="<%=resultset_for_items.getString("item_id")%>"
                                                    value="<%=resultset_for_items.getString("item_id")%>"><%=resultset_for_items.getString("item_details")%>
                                            </option>


                                            <%--  <div class="tooltip">
                                             <option  title="TEST 0" value="<%=resultset_for_items.getString("item_id")%>">
                                             <span class="tooltiptext"><%=resultset_for_items.getString("item_details")%>&nbsp;dfdfdfd</span>


                                            </div>  --%>
                                            <%}%>

                                        </datalist>


                                        <input type="number" id="item_quantity" style="width: 23%;
																									  padding: 12px;
																									  border: 1px solid #ccc;
																									  border-radius: 4px;
																									  box-sizing: border-box;
																									  margin-top: 6px;
																									  margin-bottom: 16px;
																									  resize: vertical;"
                                               min="1" autocomplete="off" placeholder="Quantity">

                                        <input type="button" onclick="myFunction()" value="+" style="  background-color: #008CBA;
																														  border: none;
																														  width:10%;
																														  border-radius: 8px;
																														  color: white;
																														  padding: 10px;
																														  text-align: center;
																														  text-decoration: none;
																														  display: inline-block;
																														  font-size: 16px;
																														  margin: 4px 2px;
																														  cursor: pointer;">


                                        <br>

                                        <textarea id="itemmoredetails" name="itemmoredetails"
                                                  placeholder="Item Details Will Be Display Here..."
                                                  style="width: 100%; padding: 12px;border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; margin-top: 6px; margin-bottom: 16px;resize: vertical;"
                                                  readonly></textarea>
                                        <input type="submit" value="submit" onclick="Delete_Number_Session()"
                                               style=" width:100%; background-color: #008CBA; ">
                                        <p id="info"></p>
                                        <p id="itemdetails"></p>
                                        <div style="height:150px;overflow:auto;border: 1px solid black;">
                                            <table style="padding: 0px;border:1px solid black;" id="myTable" border="1">
                                                <%
                                                    if (Supplier_Order.getSr() != null) {
                                                        ResultSet crs = Supplier_Order.getSr();
                                                        int counter = 0;
                                                        while (crs.next()) {
                                                            counter++;
                                                %>
                                                <tr>
                                                    <td style=" background-color:white;"><input style="border:0;"
                                                                                                value=<%= crs.getString("item_Details_Id") %>  name= <% out.println(counter + "item" );  %>>
                                                    </td>
                                                    <td style=" background-color:white;"><input type="number"
                                                                                                style="border:0;"
                                                                                                value=<%= crs.getInt("need") %>  name= <% out.println(counter + "quantity" ); %>
                                                                                                min=<%= crs.getInt("need") %>>
                                                    </td>


                                                </tr>
                                                <%
                                                        }
                                                        Supplier_Order.setSr(null);
                                                    }
                                                %>


                                            </table>
                                        </div>
                                        <% I_OR_L.setAttribute("supplier_hash", supplier_type_store);
                                            System.out.println("this is the supplier hash  " + supplier_type_store);%>
                                    </form>

                                </div> <!--  form ends here -->


                            </td>
                        </tr>

                        <!-- notification two  -->

                        <!-- second column inside table end here -->
                    </table>

                </td>
            </tr>

            <!-- end of the first table -->
        </table>

        <!--crud buttons -->
        <table style="width: 100%;height:10%;">
            <tr>
                <td style="border:none;"><a href="Supplier_Order_Insert.jsp"
                                            class=" btn btn-dark btn-lg btn-block">Insert</a></td>

                <td style="border:none;"><a href="Supplier_Order_UPDATE.jsp"
                                            class=" btn btn-dark btn-lg btn-block">Update</a></td>
                <td style="border:none;"><a href="Supplier_Order_Delete.jsp"
                                            class=" btn btn-dark btn-lg btn-block">Delete</a></td>
                <td style="border:none;"><a href="Supplier_Report.jsp"
                                            class=" btn btn-dark btn-lg btn-block">Report</a></td>


            </tr>
        </table>

    </div>
    <!-- /#wrapper -->
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


</body>

</html>