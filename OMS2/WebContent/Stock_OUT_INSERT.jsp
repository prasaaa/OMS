
<%@page import="com.model.CurrentUser"%>
<%@page import="com.Utilities.MySQLQueries"%>
<%@page import="com.DatabaseHandle.Inventory_SELECT"%>
<%@page import="com.DBConnection.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
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
</head>



<body>
<% System.out.println("this is user " + CurrentUser.getUsername());
	if(CurrentUser.getUsername().equals("nouser") || CurrentUser.getUsername().equals(""))
	{
		response.sendRedirect("login.jsp");
	}
	
	
	%>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1 
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
		response.setDateHeader("Expires", 0);

		if (session.getAttribute("REFRESH") != null) {
			if (session.getAttribute("REFRESH").toString().equalsIgnoreCase("TRUE"))
				session.setAttribute("REFRESH", "FALSE");
			else {
				session.removeAttribute("REFRESH");
				session.removeAttribute("customerOrderID");

				if (session.getAttribute("remarks") != null)
					session.removeAttribute("remarks");

				if (session.getAttribute("stock_out_date") != null)
					session.removeAttribute("stock_out_date");

				if (session.getAttribute("quantity") != null)
					session.removeAttribute("quantity");

				if (session.getAttribute("model_name") != null)
					session.removeAttribute("model_name");
			}
		} else {
			session.removeAttribute("customerOrderID");

			if (session.getAttribute("remarks") != null)
				session.removeAttribute("remarks");

			if (session.getAttribute("stock_out_date") != null)
				session.removeAttribute("stock_out_date");

			if (session.getAttribute("quantity") != null)
				session.removeAttribute("quantity");

			if (session.getAttribute("model_name") != null)
				session.removeAttribute("model_name");
		}
		//prevents caching at the proxy server
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
					data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Inventory&nbsp;Management</a>
				<div class="collapse" id="collapseExample">

			
			
					<a href="Stock_IN_INSERT.jsp"
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
			<div style="top: 0">
				<table class="table table-bordered table-striped mb-0"
					style="width: 100%; height: 80%;">
					<!--division of the first two big columns start here -->
					<tr>
						<!-- creating first column of the big table-->
						<td style="width: 70%; padding: 0;">
							<!--inside the first column --> <!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

							<form action="Stock_OUT_SELECT_Controller?jspPage=insert"
								method="POST" id="searchForm" name="searchForm">
								<table class="table table-bordered table-striped mb-0"
									style="width: 100%;">
									<tr>
										<td style="padding-top: 0px; padding-bottom: 0px;"><input
											class="btn-block" name="queryValue" id="txtSearch"
											type="text" placeholder="Search Here..." required
											<%if (session.getAttribute("results") != null) {%> disabled
											<%}%>></td>
										<td style="padding-top: 0px; padding-bottom: 0px;"><select
											required class="btn-block" name="queryType" id="searchType"
											<%if (session.getAttribute("results") != null) {%> disabled
											<%}%>>
												<option value="" disabled selected>Search&nbsp;By...</option>
												<option value="bar">Barcode&nbsp;Number</option>
												<option value="stockoutid">Stock&nbsp;OUT&nbsp;ID</option>
												<option value="iname">Item&nbsp;Model</option>
												<option value="itype">Item&nbsp;Type</option>
												<option value="stockoutdate">STOCK&nbsp;OUT&nbsp;Date</option>
												<option value="customer">Customer</option>
												<option value="custOrder">Customer&nbsp;Order&nbsp;ID</option>
										</select></td>
										<td style="padding-top: 0px; padding-bottom: 0px;"><input
											name="search" type="submit" class="btn-block"
											<%if (session.getAttribute("results") != null) {%>
											value="Reset" id="resetBtn" formnovalidate <%} else {%>
											value="Search Stock" <%}%>></td>
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

										<div class="container" style="height: 525px; overflow: auto;">

											<form action="Stock_OUT_INSERT_Controller" method="post">

												<label for="iname">Item&nbsp;Model&nbsp;Name</label> <input
													type="text" name="iname" placeholder="Item Model.."
													required
													<%if (session.getAttribute("model_name") != null) {%>
													value="<%=session.getAttribute("model_name").toString()%>"
													<%} else {%> value="" <%}%>><br> <label
													for="quantity">Quantity</label> <input id="txtQuantity"
													type="text" name="quantity"
													placeholder="Number of Items to take..." required
													<%if (session.getAttribute("quantity") != null) {%>
													value="<%=session.getAttribute("quantity").toString()%>"
													<%} else {%> value="" <%}%>> <br> <label
													for="stockoutdate">Stock&nbsp;OUT&nbsp;Date</label> <input
													type="date" name="stockoutdate" required
													<%if (session.getAttribute("stock_out_date") != null) {%>
													value="<%=session.getAttribute("stock_out_date").toString()%>"
													<%} else {%> value="" <%}%>><br> <label
													for="remarks">Any&nbsp;other&nbsp;Informations</label>

												<%
													if (session.getAttribute("remarks") != null) {
												%>
												<textarea id="txtAreaRemarks" name="remarks" rows="4"
													cols="4" placeholder="Enter Stock Information Here..."><%=session.getAttribute("remarks").toString().trim()%></textarea>

												<%
													} else {
												%>
												<textarea id="txtAreaRemarks" name="remarks" rows="4"
													cols="4" placeholder="Enter Stock Information Here..."></textarea>

												<%
													}
												%>
												<br> <label for="custOrdID">Customer&nbsp;Order&nbsp;ID</label>
												<%
													if (session.getAttribute("customerOrderID") != null) {
												%>

												<input type="text" name="custOrdID"
													value="<%=session.getAttribute("customerOrderID").toString()%>"
													readonly="readonly">
												<button type="submit" formnovalidate="formnovalidate"
													name="submitButton"
													class=" btn btn-warning btn-lg btn-block"
													value="Change Customer Order ID">Change&nbsp;Customer&nbsp;Order&nbsp;ID</button>
												<%
													} else {
												%>

												<input type="text" name="custOrdID"
													placeholder="Enter Customer Order ID Here..." value=""
													required>
												<button type="submit" formnovalidate="formnovalidate"
													name="submitButton" class="btn btn-info btn-lg btn-block"
													value="Add Customer Order ID">Add&nbsp;Customer&nbsp;Order&nbsp;ID</button>
												<%
													}
												%>

												<input type="submit" id="submit-form" hidden="true"
													name="submitButton" value="Insert Stock"> <input
													type="submit" id="reset-form" hidden="true"
													formnovalidate="formnovalidate" name="resetButton"
													value="Reset Fields">

											</form>

										</div> <!--  form ends here -->

									</td>


								</tr>
								<tr>
									<td>
										<div style="width: 100%; display: flex; flex-direction: row;">
											<label for="submit-form"
												class="buttonLabel btn btn-success btn-block btn-lg">Insert&nbsp;Stock</label>
											<label id="rstBtn" for="reset-form"
												class=" buttonLabel btn btn-danger btn-block btn-lg">Reset&nbsp;Fields</label>
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


											<th>Stock&nbsp;OUT&nbsp;ID</th>
											<th>Item's&nbsp;Model&nbsp;Name</th>
											<th>Item&nbsp;Type</th>
											<th>Delivered&nbsp;Date</th>
											<th>Quantity</th>
											<th>Customer&nbsp;Order&nbsp;ID</th>



										</tr>
									</thead>
									<tbody>
										<%
											if (session.getAttribute("results") != null) {

												ResultSet results = (ResultSet) session.getAttribute("results");

												do {
										%>
										<tr>
											<td><%=results.getString(1)%></td>
											<td><%=results.getString(2)%></td>
											<td><%=results.getString(3)%></td>
											<td><%=results.getString(4)%></td>
											<td><%=results.getString(5)%></td>
											<td><%=results.getString(6)%></td>
										</tr>

										<%
											} while (results.next());

												session.removeAttribute("results");
												session.removeAttribute("resultType");

											} else {

												ResultSet result;

												Inventory_SELECT si = new Inventory_SELECT(ConnectionManager.getConnection(),
														MySQLQueries.QUERY_GET_ALL_STOCK_OUT);
												result = si.get_inventory_table();

												while (result.next()) {
										%>
										<tr>
											<td><%=result.getString(1)%></td>
											<td><%=result.getString(2)%></td>
											<td><%=result.getString(3)%></td>
											<td><%=result.getString(4)%></td>
											<td><%=result.getString(5)%></td>
											<td><%=result.getString(6)%></td>
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
					<!-- second column inside table end here -->
				</table>




				<!-- end of the first table -->

				<table style="width: 100%;">
					<tr>

						<td><a href="Stock_OUT_INSERT.jsp"
							class=" btn btn-dark btn-lg btn-block">Create&nbsp;Stocks</a></td>

						<td><a href="Stock_OUT_DELETE.jsp"
							class=" btn btn-dark btn-lg btn-block">Delete&nbsp;Stocks</a></td>
						

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
		%><%=session.getAttribute("message")%>
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

	<script>
		$(document).ready(
				function() {
					setInputFilter(document.getElementById("txtQuantity"),
							function(value) {
								return /^\d*$/.test(value);
							});
				});
	<%if (session.getAttribute("color") != null && session.getAttribute("message") != null) {%>
		myFunction(clearAll());
	<%}%>
		function clearAll() {
	<%session.removeAttribute("color");
			session.removeAttribute("message");%>
		}

		function logValue() {
			switch (this.value) {
			case "stockoutdate":
				document.getElementById("txtSearch").setAttribute('type',
						'date');
				break;
			default:
				document.getElementById("txtSearch").setAttribute('type',
						'text');
				break;
			}
		}

		var select = document.getElementById("searchType");
		select.addEventListener('change', logValue, false);
	</script>



</body>





</html>

