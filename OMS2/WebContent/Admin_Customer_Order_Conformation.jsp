

<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.DatabaseHandle.Main_SELECT"%>
<%@page import="com.model.CurrentUser" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<!-- Custom styles for this template -->
<link href="css/simple-sidebar2.css" rel="stylesheet">
<title>Automated Barcode Solution</title>
</head>
<body>
<% System.out.println("this is user " + CurrentUser.getUsername());
	if(CurrentUser.getUsername().equals("nouser") || CurrentUser.getUsername().equals(""))
	{
		response.sendRedirect("login.jsp");
	}
	
	
	%>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
		
			<div class="sidebar-heading">Automated Barcode<br>Solution</div>
			<div class="list-group list-group-flush">
			<%if(CurrentUser.getUsername().equals("admin")){ %>
				<a href="Supplier_Order_Insert.jsp" class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a> 
			<%} %>
			<%if(CurrentUser.getUsername().equals("admin") || CurrentUser.getUsername().equals("accountant") || CurrentUser.getUsername().equals("manager")) {%>
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

				<a href="Payment_UPDATE.jsp" class="list-group-item list-group-item-action bg-light">Payment&nbsp;Management</a>

				<a href="Customer_Details_Insert.jsp" class="list-group-item list-group-item-action bg-light">Customer&nbsp;Management</a>
				<a href="Customer_Order_Insert.jsp"
					class="list-group-item list-group-item-action bg-light">Installation&nbsp;Management</a>
					<a href="Repair_INSERT.jsp"
				class="list-group-item list-group-item-action bg-light">Repair&nbsp;Management</a>
				<a href="Admin_Customer_Order_Conformation.jsp"
				class="list-group-item list-group-item-action bg-light">Customer Order &nbsp;Confirm</a>
				<a
					class="list-group-item list-group-item-action bg-light dropdown-toggle"
					data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2">Employee&nbsp;Management</a>
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


						<!-- Search form -->
						<div class="md-form mt-0">
							<form action="searchEmp" method="post">
								<input class="form-control" type="search" placeholder="Search"
									aria-label="Search">

							</form>
						</div>


						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"	role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> User</a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="login.jsp">Log out</a> 
								<div class="dropdown-divider"></div>
								
							</div></li>
					</ul>
				</div>
			</nav>

			<!--create the big table -->
			<table style="width: 100%; height: 80%;">
				<!--division of the first two big columns start here -->
				<tr>
					<!-- creating first column of the big table-->
					<td style="width: 50%;">
						<!--inside the first column -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">




							<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0"
								style="position: relative;">





								<tr>
									<th>Customer Order Id</th>
									<!-- <th>customer_Id</th>
									<th>order_Date</th>
									<th>required_Data</th> -->
									<th>Order Status</th>
									<th>Order Type</th>
									<!-- <th>order_Emp_Status</th> -->
								</tr>

								<%
								ResultSet result;
								Connection con = ConnectionManager.getConnection();
								Main_SELECT ordertable = new Main_SELECT(con,"select * from customer_order_table WHERE order_Status='Confirm'");
								result = ordertable.get_table();
								while (result.next()) {
								%>



								<tr>
									<td><%=result.getString("customer_Order_Id")%></td>


									<%-- <td><%=result.getString("customer_Id")%></td>
									<td><%=result.getString("order_Date")%></td>
									<td><%=result.getString("required_Data")%></td> --%>
									<td><%=result.getString("order_Status")%></td>
									<td><%=result.getString("order_Type")%></td>
									<%-- <td><%=result.getString("order_Emp_Status")%></td> --%>

								</tr>

								<%
									}
								%>

							</table>
						</div> <!--finish first column-->
					</td>
					<!-- start of the next notification column -->
					<td style="width: 100%; height: 100%;">
						<!--creation of the notification table -->

						<table style="height: 100%; width: 100%;">

							<!-- notification one  -->

							<tr>
								<td style="height: 60%;">
									<!-- form starts here  -->

									

									<div class="table-wrapper-scroll-y my-custom-scrollbar"
										style="height: 100%; position: relative;">
										<table class="table table-bordered table-striped mb-0"
											style="position: relative;">

											<tr>
												<th>Customer Order Id</th>
												<!-- <th>customer_Id</th>
												<th>order_Date</th>
												<th>required_Data</th> -->
												
												<th>Order Type</th>


												<th>Confirm Order</th>
												<th>Delete Order</th>
												<th>Stock Status</th>


											</tr>

											<%
												Main_SELECT ordertable_pending = new Main_SELECT(con,
														"select * from customer_order_table WHERE order_Status IS NULL");
												
												result = ordertable_pending.get_table();

												while (result.next()) {
											%>



											<tr>
												<td><%=result.getString("customer_Order_Id")%></td>
												
												<td><%=result.getString("order_Type")%></td>

												<td>

													<form action="Order_Status_change" method="GET">
														<input type="hidden" name="customer_Order_Id"
															value="<%=result.getString("customer_Order_Id")%>">
														<button class="btn btn-outline-primary" type="submit" value="Confirm">Confirm</button>
													</form>

												</td>

												<td>
												

													<form action="Delete_Order" method="GET">
														<input type="hidden" name="customer_Order_Id"
															value="<%=result.getString("customer_Order_Id")%>">
															
														<button class="btn btn-outline-danger"  type="submit"
															onclick="myFunction()" value="Delete">Delete</button>
														<p id="demo"></p>
														<script>
															function myFunction() {
																var txt;
																if (confirm("Do you want Delete Order ??")) {
																	//txt = "You pressed OK!";
																} else {
																//	txt = "You pressed Cancel!";
																}
																/* //document
																		.getElementById("demo").innerHTML = txt; */
															}
														</script>
														
													</form>

												</td>
												<td>

													<form action="Add_Stock_Confirmation_Controller" method="post">
														<input type="hidden" name="customer_Order_Id"
															value="<%=result.getString("customer_Order_Id")%>">
															<%if(result.getString("item_status").equals("Not_enough"))
															{%>
																<button class="btn btn-outline-primary" type="submit" value="Add Stock">Order</button>
															<%}else{ %>
																<button class="btn "   type="submit" value="Add Stock" disabled>Available</button>
															<%} %>	
													</form>

												</td>
											</tr>

											<%
												}
											%>

										</table>
										<div>
									

								</td>
							</tr>


							<!-- second column inside table end here -->
						</table>

					</td>
				</tr>

				<!-- end of the first table -->
			</table>

			<!--crud buttons -->
			





		</div>
		<!-- /#wrapper -->

		<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Menu Toggle Script -->
		<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		</script>
</body>

</html>

