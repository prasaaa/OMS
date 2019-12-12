
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
<title>Insert title here</title>
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
			<table style="width: 100%; height: 90%;">
				<!--division of the first two big columns start here -->
				<tr>
					<!-- creating first column of the big table-->
					<td style="width: 50%;">
						<!--inside the first column -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">




							<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0" id ="myTable"
								style="position: relative;">





								<tr>
									<!-- <th>customer Id</th> -->
									<th>Customer Id</th>
									<th>Customer Name</th>
									<th>Location</th>
									<th>Branch</th>
									<th>Update</th>						
									<th>Delete</th>
									
								</tr>
								
								<%
								String customer_Id = request.getParameter("customer_Id");
									ResultSet result;
									Connection con = ConnectionManager.getConnection();

									Main_SELECT ei = new Main_SELECT(con, "select * from customer_table");
									
									result = ei.get_table();
									

									while (result.next()) {
								%>


						<tr>
									<td><%=result.getString("customer_Id")%></td>
									<td><%=result.getString("customer_Name")%></td>								
									<td><%=result.getString("location")%></td>
									<td><%=result.getString("branch")%></td>
									<td><a href="Customer_Details_update.jsp?customer_Id=<%=result.getString("customer_Id")%>"><button type="button" class="btn btn-outline-primary">Update</button></a></td>
									
									
									<% %>
									
									

									<td>
									<form action="Delete_Cus_Details" method="GET">
											
												<a href="Delete_Cus_Details?customer_Id=<%=result.getString("customer_Id") %>">
												<button type="button" class="btn btn-outline-danger">Delete</button></a>
										</form>
										
<!-- 										<script>
function EmpDelFunction() {
	
	
	 alert("Hello! I am an alert box!");
}
</script>
 -->
									</td>
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

									<div class="container">
									<form name="empForm" action = "Customer_INSERT_Controller" method = "post"  >
									
										
										 <label >Customer Name</label><br>
										 <input type="text"  name="name"  onkeypress="nameisString(event)" required><br>
										 
										 <label for="location">Location</label><br>
										 <input type="text"  name="location"  required>
										 
										 <label >Branch</label><br>
										 <input type="text"  name="branch" required><br>
										 
										 <input type="submit" onclick="myFunction()" value = "Submit" style ="background-color: #008CBA"><br>

									</form>
									
									
									
																	
<script>  
 function nameisString(evt) {
	var letters = String.fromCharCode(evt.which);
	if(!(/^[A-Za-z ]+$/.test(letters))){
			
			evt.preventDefault();
			alert('Please input alphabet characters only');
	}
	 
	
} 

function myFunction() {
	
	if(empForm.name.value==""){
	/* 	elem = document.getElementById('textid');
		 elem.innerHTML = text; */
		 alert("Customer name field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}
	
	if(empForm.location.value==""){
		alert("Customer Location field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}

	if(empForm.branch.value==""){
		alert("Customer branch field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}
	return true;
	}
	

</script>
									
									
									
									

									</div> <!--  form ends here -->

								</td>
							</tr>


							<!-- second column inside table end here -->
						</table>

					</td>
				</tr>

				<!-- end of the first table -->
			</table>

		





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