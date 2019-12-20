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

			<table style="width: 100%; height: 90%;">
			<td style="width: 100%;">
			<div class="table-wrapper-scroll-y my-custom-scrollbar" style="height: 100%; position: relative;">
				
<%
String item_id = request.getParameter("item_id");
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
Connection con = ConnectionManager.getConnection();
statement=con.createStatement();
String sql ="select * from item_details_table where item_id='"+item_id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<form name="itemForm" onsubmit="return validateForm()" action="Update_Item_Controller" method="post">

<input type="hidden" name="item_id" value="<%=resultSet.getString("item_id") %>">
<label style="margin: 10px;" >Item ID : </label>
<input type="text" value="<%=resultSet.getString("item_id") %>" disabled>
<label style="margin: 10px;" >Item Model Name :</label>
<input type="text" name="item_model_name" value="<%=resultSet.getString("item_model_name") %>">
<label style="margin: 10px;" >Item Manufacturer :</label>
<input type="text" name="item_manufacturer" value="<%=resultSet.getString("item_manufacturer") %>"onkeypress="nameisString(event)">
<label style="margin: 10px;" >Item Supplier :</label>
<input type="text" name="item_supplier" value="<%=resultSet.getString("item_supplier") %>"onkeypress="nameisString(event)">
<label style="margin: 10px;" >Item Type :</label>
<input type="text" name="item_type" value="<%=resultSet.getString("item_type") %>">
<label style="margin: 10px;" >Item Details :</label>
<input type="text" name="item_details" value="<%=resultSet.getString("item_details") %>">


<div class="modal-footer">
	<a href="Items_Management.jsp"><button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button></a>
    <button  onclick="myFunction()" type="submit" class="btn btn-outline-primary">Update</button>
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
	
	if(itemForm.item_model_name.value==""){
	/* 	elem = document.getElementById('textid');
		 elem.innerHTML = text; */
		 alert("Model name field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
	}
	
	if(itemForm.item_manufacturer.value==""){
		alert("Manufacturer field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}
	if(itemForm.item_supplier.value==""){
		alert("Supplier name field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}

	if(itemForm.item_type.value==""){
		alert("Item Type field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}
	
	if(itemForm.item_details.value==""){
		alert("Item Details field is empty !!! Please check and submit the form");
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
							
							

	</div>	
	</td>
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

