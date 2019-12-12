

<%@page import="com.DBConnection.ConnectionManager"%>
<%@page import="com.DatabaseHandle.Emp_SELECT" %>
<%@page import="java.sql.Connection"%>
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

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/simple-sidebar2.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%-- <% System.out.println("this is user " + CurrentUser.getUsername());
	if(CurrentUser.getUsername().equals("nouser") || CurrentUser.getUsername().equals(""))
	{
		response.sendRedirect("login.jsp");
	}
	
	
	%> --%>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
		
			<div class="sidebar-heading">Automated Barcode<br>Solution</div>
			<div class="list-group list-group-flush">
			<//%if(CurrentUser.getUsername().equals("admin")){ %>
				<a href="Supplier_Order_Insert.jsp" class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a> 
			<%//} %>
			<%//if(CurrentUser.getUsername().equals("admin") || CurrentUser.getUsername().equals("accountant") || CurrentUser.getUsername().equals("manager")) {%>
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
			<%//} %>
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
			
					
					
<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add Employee</button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<form name="empForm" onsubmit="return validateForm()" action="Emp_INSERT_Controller" method="post">




<input type="text" name="emp_name" placeholder="Full Name" onkeypress="nameisString(event)" required >
<input type="text" name="emp_address" placeholder="Address " required>
<div class="select-list">
	<select name="emp_gender" type="text" id="course_type" required>
		<option slected value="">Gender</option>
		<option value="Male">Male</option>
		<option value="Female">Female</option>
	</select>
</div>
<input type="date" name="emp_birth" placeholder="Date of Birth" required> 
<input type="text" id="numb" onkeypress="phoneisNumber(event)" name="emp_phone" minlength ="10" maxlength="10" placeholder="Phone" required>
<div class="select-list">
	<select name="emp_type" type="text" id="course_type"required>
		<option slected value="">Employee Type</option>
		<option value="Admin">Admin</option>
		<option value="Manager">Manager</option>
		<option value="Accountant">Accountant</option>
	</select>
</div>
<input type="email" name="emp_email" placeholder="Email"required>
<input type="password" name="emp_password" placeholder="Password"required>
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
    var button = $(event.relatedTarget); // Button that triggered the modal
    var recipient = button.data('whatever');
    var modal = $(this);
    modal.find('.modal-title').text('New message to ' + recipient);
	  modal.find('.modal-body input').val(recipient)
	})
</script>
				</div>
			</nav>

			<!--create the big table -->
			<table style="width: 100%; height: 90%;">
				<!--division of the first two big columns start here -->
				<tr>
					<!-- creating first column of the big table-->
					<td style="width: 60%;">
						<!--inside the first column -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">




							<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0"
								style="position: relative;">
								<tr>
									<th>ID</th>
									<th>Full Name</th>
									<th>Address</th>
									<!-- <th>Gender</th> -->
									<th>Date of Birth</th>
									<th>Phone</th>
									<th>Employee Type</th>
									<th>Email</th>
									<th>View</th>
									<th>Update</th>
									<th>Remove</th>
								</tr>
								
								<%
								String emp_id = request.getParameter("emp_id");
									ResultSet result;
									Connection con = ConnectionManager.getConnection();

									Emp_SELECT ei = new Emp_SELECT(con, "select * from emp");
									
									result = ei.get_Emp_table();
									

									while (result.next()) {
								%>

								<tr>
									<td><%=result.getString("emp_id")%></td>
									
									<td><%=result.getString("emp_name")%></td>								
									<td><%=result.getString("emp_address")%></td>
									<%-- <td><%=result.getString("emp_gender")%></td> --%>
									<td><%=result.getString("emp_birth")%></td>
									<td><%=result.getString("emp_phone")%></td>
									<td><%=result.getString("emp_type")%></td>
									<td><%=result.getString("emp_email")%></td>
									<!-- <td><button type="button" class="btn btn-outline-secondary">View</button></td> -->
									<td><a href="Emp_view.jsp?emp_id=<%=result.getString("emp_id")%>"><button type="button" class="btn btn-outline-secondary">View</button></a></td>
									<td><a href="Emp_update.jsp?emp_id=<%=result.getString("emp_id")%>"><button type="button" class="btn btn-outline-primary">Update</button></a></td>
									
									<% %>
									
									

									<td>
									<form action="Delete_Emp" method="GET">
											
												<a href="Delete_Emp?emp_id=<%=result.getString("emp_id") %>">
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
					<!-- <!-- start of the next notification column -->
					<!-- <td style="width: 100%; height: 100%;">
						creation of the notification table

						<table style="height: 100%; width: 100%;">

							notification one 

							<tr>
								<td style="height: 60%;">
									form starts here 

									<div class="container">

										<form name="empForm" onsubmit="return validateForm()" action="Emp_INSERT_Controller" method="post">




											<input type="text" name="emp_name" placeholder="Full Name" required >
											<input type="text" name="emp_address" placeholder="Address "required>
											<input type="text" name="emp_gender" placeholder="Gender">
											<div class="select-list">
												<select name="emp_gender" type="text" id="course_type" required>
													<option slected value="">Gender</option>
													<option value="Male">Male</option>
													<option value="Female">Female</option>
												</select>
											</div>
											<input type="date" name="emp_birth" placeholder="Date of Birth" required> 
												<input type="text" id="numb" onkeypress="phoneisNumber(event)" name="emp_phone" minlength ="10" maxlength="10" placeholder="Phone" required>
												
<p id="demo"></p>
											<input type="text" name="emp_type" placeholder="Employee Type">
											<div class="select-list">
												<select name="emp_type" type="text" id="course_type"required>
													<option slected value="">Employee Type</option>
													<option value="Admin">Admin</option>
													<option value="Manager">Manager</option>
												</select>
											</div>
											<input type="email" name="emp_email" placeholder="Email"required>
											<br>

											<input onclick="myFunction()" type="submit" value="Submit">
										</form> --> 


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
	
	if(empForm.emp_name.value==""){
	/* 	elem = document.getElementById('textid');
		 elem.innerHTML = text; */
		 alert("Employee name field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
	}
	
	if(empForm.emp_address.value==""){
		alert("Employee address field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}

	if(empForm.emp_phone.value==""){
		alert("Employee phone number field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}
	
	if(empForm.emp_email.value==""){
		alert("Employee email field is empty !!! Please check and submit the form");
		 empForm.emp_phone.focus();
		 return false;
	}
	
	if(isNaN(empForm.emp_phone.value)){
		
		 alert("Please enter a valid Phone number");
		 empForm.emp_phone.focus();
		 return false;
		
	}
	
if((empForm.emp_phone.value).length < 10){
		
		alert("Phone not valid");
		 empForm.emp_phone.focus();
		 return false;
	
	}
	return true;
	}
</script>

						
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

