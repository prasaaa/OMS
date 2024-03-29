

<%@page import="com.model.CurrentUser"%>
<%@page import="com.DatabaseHandle.Emp_SELECT"%>
<%@page import="com.DBConnection.ConnectionManager"%>
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
					data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Inventory&nbsp;Management</a>
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
			
					
					
<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add Item</button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Item</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<form name="itemForm" onsubmit="return validateForm()" action="Item_INSERT_Controller" method="post">
			<input type="text" name="item_model_name" placeholder="Model Name"  required >
			<input type="text" name="item_manufacturer" placeholder="Manufacturer Name"onkeypress="nameisString(event)" required>
			<input type="text" name="item_supplier" placeholder="Supplier Name "onkeypress="nameisString(event)" required>
			<input type="text" name="item_type" placeholder="Item Type" required> 
			<input type="text" name="item_details" placeholder="Item Details"required>
			<div class="modal-footer">					 
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
        <button type="reset" class="btn btn-outline-secondary">Reset</button>
        <button onclick="myFunction()" type="submit" class="btn btn-outline-primary">Submit</button>
      </div>
			</form>
      </div>
     
    </div>
  </div>
</div>

<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever')
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
</script>
				</div>
			</nav>

			<table style="width: 100%; height: 90%;">
			<td style="width: 100%;">
			<div class="table-wrapper-scroll-y my-custom-scrollbar" style="height: 100%; position: relative;">

<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0"
								style="position: relative;">
								<tr>
									<th>Item ID</th>
									<th>Model Name</th>
									<th>Manufacturer</th>
									<th>Supplier</th>
									<th>Type</th>
									<!-- <th>Details</th> -->
									<th>View</th>
									<th>Details</th>
									<th>Update</th>
									<th>Remove</th>
								</tr>
								
								<%
								String item_id = request.getParameter("item_id");
									ResultSet result;
									Connection con = ConnectionManager.getConnection();
									Emp_SELECT ei = new Emp_SELECT(con, "select * from item_details_table");									
									result = ei.get_Emp_table();
									while (result.next()) {
								%>

								<tr>
									<td><%=result.getString("item_id")%></td>									
									<td><%=result.getString("item_model_name")%></td>								
									<td><%=result.getString("item_manufacturer")%></td>
									<td><%=result.getString("item_supplier")%></td>								
									<td><%=result.getString("item_type")%></td>
									<%-- <td><%=result.getString("item_details")%></td> --%>
									<td><a href="Item_view.jsp?item_id=<%=result.getString("item_id")%>"><button type="button" class="btn btn-outline-secondary">View</button></a></td>
									<td><a href="Item_stockDetails_view.jsp?item_id=<%=result.getString("item_id")%>"><button type="button" class="btn btn-outline-info">Details</button></a></td>
									<td><a href="Item_Details_Update.jsp?item_id=<%=result.getString("item_id")%>"><button type="button" class="btn btn-outline-primary">Update</button></a></td>
									
									<% %>
									<td>
									<form action="Delete_Item_Controller" method="get">
									<a href="Delete_Item_Controller?item_id=<%=result.getString("item_id") %>">
									<button type="button" class="btn btn-outline-danger">Delete</button></a>
									</form>
										
									</td>
								</tr>
								<%}%>
								</table>
								</div> <!--finish first column-->
								</td>
<script> 
function nameisString(evt) {
	var letters = String.fromCharCode(evt.which);
	if(!(/^[A-Za-z ]+$/.test(letters))){
			evt.preventDefault();
			alert('Please input alphabet characters only');
	}
} 

function phoneisNumber(evt) {
	var ch = String.fromCharCode(evt.which);
	if(!(/[0-9]/.test(ch))){
			evt.preventDefault();
	}
}

function myFunction() {
	
	if(itemForm.item_model_name.value==""){
		 alert("Model name field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
	}
	
	if(itemForm.item_manufacturer.value==""){
		alert("Manufacturer name field is empty !!! Please check and submit the form");
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
			</tr>
</table>

		
		</div>
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		</script>
</body>

</html>

