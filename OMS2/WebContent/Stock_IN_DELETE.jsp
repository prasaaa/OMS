<%--suppress XmlDuplicatedId --%>

<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.DatabaseHandle.Inventory_SELECT"%>
<%@page import="com.Utilities.MySQLQueries" %>
<%@page import="java.sql.ResultSet"%>
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

							</div></li>
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
										<th>Item's<br>Model&nbsp;Name</th>
										<th>Manufacturer</th>
										<th>Supplier</th>
										<th>Item&nbsp;Type</th>
										<th>Received&nbsp;Date</th>
										<th>Number&nbsp;of<br>Working&nbsp;Items</th>
										<th>Number&nbsp;of<br>Fault&nbsp;Items</th>
										<th>Delete&nbsp;Stock</th>


									</tr>
									</thead>


									<tbody>
									<%
											if (session.getAttribute("results") != null) {

												ResultSet results = (ResultSet) session.getAttribute("results");

												do {
									%>
									<tr>
										<td><%=results.getString(1)%>
										</td>
										<td><%=results.getString(2)%>
										</td>
										<td><%=results.getString(3)%>
										</td>
										<td><%=results.getString(4)%>
										</td>
										<td><%=results.getString(5)%>
										</td>
										<td><%=results.getString(6)%>
										</td>
										<td><%=results.getInt(7)%>
										</td>
										<td><%=results.getInt(8)%>
										</td>
										<td>
											<form action="Inventory_DELETE_Controller" method="post">
												<input type="hidden" name="stock_in_id"
													   value="<%=results.getString(1) %>">
												<!-- <button type="submit" class="btn btn-outline-danger">Delete</button> -->


												<!-- Button trigger modal -->
												<input type="button" class="btn btn-outline-danger" data-toggle="modal"
													   data-target="#e<%out.print(results.getString(1));%>"
													   value="Delete">

												<!-- Modal -->
												<div class="modal fade" id="e<%out.print(results.getString(1));%>"
													 tabindex="-1" role="dialog"
													 aria-labelledby="<%=results.getString(1) %>" aria-hidden="true">
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
																<input type="button" class="btn btn-outline-secondary"
																	   data-dismiss="modal" value="Close">
																<input type="submit" class="btn btn-outline-danger"
																	   value="Delete">
															</div>
														</div>
													</div>
												</div>


											</form>
										</td>

									</tr>

									<%
										} while (results.next());

										session.removeAttribute("results");

									} else {

										ResultSet result;
										Inventory_SELECT si = new Inventory_SELECT(ConnectionManager.getConnection(),
												MySQLQueries.QUERY_GET_STOCK_TABLE);
										result = si.get_inventory_table();

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
										<td><%=result.getString(6)%>
										</td>
										<td><%=result.getInt(7)%>
										</td>
										<td><%=result.getInt(8)%>
										</td>
										<td>
											<form action="Inventory_DELETE_Controller" method="post">
												<input type="hidden" name="stock_in_id"
													   value="<%=result.getString(1) %>">
												<!-- <button type="submit" class="btn btn-outline-danger">Delete</button> -->


												<!-- Button trigger modal -->
												<input type="button" class="btn btn-outline-danger" data-toggle="modal"
													   data-target="#e<%out.print(result.getString(1));%>"
													   value="Delete">


												<!-- Modal -->
												<div class="modal fade" id="e<%out.print(result.getString(1));%>"
													 tabindex="-1" role="dialog"
													 aria-labelledby="<%=result.getString(1) %>" aria-hidden="true">
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
																<input type="button" class="btn btn-outline-secondary"
																	   data-dismiss="modal" value="Close">
																<input type="submit" class="btn btn-outline-danger"
																	   value="Delete">
															</div>
														</div>
													</div>
												</div>


											</form>
										</td>


									</tr>

									<%
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
		$("#menu-toggle").click(function(e) {
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

