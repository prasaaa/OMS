<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.model.CurrentUser" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
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
					  <input class="form-control" type="search" placeholder="Search" aria-label="Search">
					 
					  </form>
					</div>
					
					
						<li class="nav-item active"><a class="nav-link" href="#">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Dropdown </a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<!--create the big table -->
			<table style="width: 100%; height: 80%;">
				<!--division of the first two big columns start here -->
				<tr>
					<!-- creating first column of the big table-->
					
					<!-- start of the next notification column -->
					<td style="width: 100%; height: 100%;">
						<!--creation of the notification table -->

						
<%
String customer_Id = request.getParameter("customer_Id");



Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
	Connection con = ConnectionManager.getConnection();
statement=con.createStatement();
String sql ="select * from customer_table where customer_Id='"+customer_Id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
		<!-- <form name="empForm" action="Update_Emp" onsubmit="return validateForm()" method="post"> -->
									
		<form name="empForm" action="Update_Cus_Details" method="post">
									
			<input type="hidden" name="customer_Id" value="<%=resultSet.getString("customer_Id") %>">
			<label >Customer Name</label><br>
			<input type="text" name="customer_Name" value="<%=resultSet.getString("customer_Name") %>" onkeypress="nameisString(event)" required>
			 <label for="location">Location</label><br>
			<input type="text" name="location" value="<%=resultSet.getString("location") %>" required>
			 <label >Branch</label><br>
			<input type="text" name="branch" value="<%=resultSet.getString("branch") %>"  required>
			
			<div class="modal-footer">
											 
      <a href="Customer_Details_Insert.jsp"><button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button></a>
        <button onclick="myFunction()" type="submit" class="btn btn-outline-primary">Update</button>
      </div>
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
	
	if(empForm.customer_Name.value==""){
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
										
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


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

