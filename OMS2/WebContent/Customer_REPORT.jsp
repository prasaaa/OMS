
<%@page import="com.model.CurrentUser"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.DatabaseHandle.Supplier_SELECT"%>
<%@page import="com.DBConnection.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
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

<!-- Custom styles for this template -->
<link href="css/simple-sidebar2.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<% /* System.out.println("this is user " + CurrentUser.getUsername());
	if(CurrentUser.getUsername().equals("nouser") || CurrentUser.getUsername().equals(""))
	{
		response.sendRedirect("login.jsp");
	} */
	
	
	%>

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
		
			<div class="sidebar-heading">Automated Barcode<br>Solution</div>
			<div class="list-group list-group-flush">
			<%//if(CurrentUser.getUsername().equals("admin")){ %>
				<a href="Supplier_Order_Insert.jsp" class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a> 
			<%//} %>
			<%//if(CurrentUser.getUsername().equals("admin") || CurrentUser.getUsername().equals("accountant") || CurrentUser.getUsername().equals("manager")) {%>
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
					<td style="width: 70%;">
						<!--inside the first column -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">




							<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0"
								style="position: relative;">
								<tr>
									<th> Cutomer Order ID</th>
									<th> Customer ID</th>
									<th>Order Date</th>
									<th>Required Date</th>									
									<th>Order Type</th>
									<th>Order Status</th>
								
								</tr>
						

						<%
						HttpSession ChangeSession =  request.getSession();
						ChangeSession.setAttribute("change", 0);
						ResultSet result;
						ResultSet resultset_for_dropdown;
						ResultSet resultset_for_items ;
						//for the use of dropdown we use a hashmap
						HashMap<String,Integer> dropdown_item_store = new HashMap<String,Integer>();
								
						 
						if( session.getAttribute("change") != null)
						{
							System.out.println("came inside the test");
							Supplier_SELECT si2 = (Supplier_SELECT) request.getAttribute("ss");	
							Connection con = ConnectionManager.getConnection();
							//for the drop down customer select
							Supplier_SELECT si3 = new Supplier_SELECT(con,"select * from Customer_Order_Table");
							resultset_for_dropdown = si3.get_supplier_table();
							//for the drop down for item select
							Supplier_SELECT si4 = new Supplier_SELECT(con,"select item_details_id from item_details_table ");
							resultset_for_items = si4.get_supplier_table();
							
							
							result =(ResultSet) session.getAttribute("karma"); 		
							
																						
							while(result.next())
							{
								
							%>

								<tr>
									<td><%= result.getString("customer_Order_Id") %></td>
									<td><%= result.getString("customer_Id")  %></td>
									<td><%= result.getString("order_Date")  %></td>
									<td><%= result.getString("required_Date")  %></td>									
									<td><%= result.getString("order_Type")  %></td>
									<td><%= result.getString("order_Status")  %></td>
								</tr>

								<% 
							}
							session.setAttribute("test", null);
						}
								
						
						 else	{
			 				Connection con = ConnectionManager.getConnection();
			 				
							Supplier_SELECT si = new Supplier_SELECT(con,"select * from Customer_Order_Table");
							result = si.get_supplier_table();
							
							//for the drop down customer select
							Supplier_SELECT si2 = new Supplier_SELECT(con,"select * from customer_table");
							resultset_for_dropdown = si2.get_supplier_table();
							request.setAttribute("resultset", result);
							
							//for the drop down item select
							Supplier_SELECT si4 = new Supplier_SELECT(con,"select item_id from item_details_table ");
							resultset_for_items = si4.get_supplier_table();
									
							while(result.next())
							{
							%>

								<tr>
									<td><%= result.getString("customer_Order_Id") %></td>
									<td><%= result.getString("customer_Id")  %></td>
									<td><%= result.getString("order_Date")  %></td>
									<td><%= result.getString("required_Date")  %></td>
									<td><%= result.getString("order_Type")  %></td>
									<td><%= result.getString("order_Status")  %></td>
								</tr>

								<% }
						}%>
						
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
											
											
											  document.addEventListener('keydown', function(event) {
											    if( event.keyCode == 13 || event.keyCode == 17 || event.keyCode == 74 )
											      event.preventDefault();
											  });
											
											function myFunction() {
												
												if(sessionStorage.getItem("index_counter"))	
													{
											  			var number = parseInt (sessionStorage.getItem("index_counter"));
													}
												else
													{
														
														sessionStorage.setItem("index_counter", 1);
														var number =parseInt( sessionStorage.getItem("index_counter")) ;
														
													}
											  
											  var table = document.getElementById("myTable");
											  var selecteditem = document.getElementById("itemselect");
											  var quantity =  document.getElementById("item_quantity");
											  var itemname =  number + "item";
											  var itemquantity =  number + "quantity";
											  
											  table.insertRow(-1).innerHTML = '<tr><td style = "background-color:white;"><input style = "border:0;" value ='+selecteditem.value+' name = '+itemname+'></td> <td style = "background-color:white;"><input style = "border:0;"  name = '+itemquantity+' value = '+quantity.value+'></td>';
											  sessionStorage.setItem("index_counter",number + 1);
											}
											
											  function Delete_Number_Session() {
											  		sessionStorage.removeItem("index_counter");   
											    }
											</script>
											
											<script>
													function validateForm() {
													  var x = document.forms["myForm"]["date"].value;
													  if (x == "") {
													    alert("date must be filled out");
													    return false;
													  }
													
													}
											</script>
											<form name="myForm" action="Customer_Order_Filter_Controller" method="post" onsubmit="return validateForm()">
											
												<label>Select Your Date Range</label><br>
												<input type = "date" value = "enter" name = "date1" style = "width: 100%;
																								  padding: 12px;
																								  border: 1px solid #ccc;
																								  border-radius: 4px;
																								  box-sizing: border-box;
																								  margin-top: 6px;
																								  margin-bottom: 16px;
																								  resize: vertical;"   id = "date" >
												<br>
												<label>Select Required Date</label><br>
												<input type = "date" value = "enter" name = "date2" style = "width: 100%;
																								  padding: 12px;
																								  border: 1px solid #ccc;
																								  border-radius: 4px;
																								  box-sizing: border-box;
																								  margin-top: 6px;
																								  margin-bottom: 16px;
																								  resize: vertical;"  id = "date" >
												<br>
												<input type = "submit" value ="submit"  style = "background-color:#008CBA;width :100%;"> 
												<form action = ""></form>
												
										

											  <br>
											 
												
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
			<table style="width: 100%;height:18%;">
				<tr>
					<td style ="border:none;"><a href="Payment_UPDATE.jsp"
							class=" btn btn-dark btn-lg btn-block">Update</a></td>

					
					
					<td style ="border:none;"><a href="Repair_REPORT.jsp"
							class=" btn btn-dark btn-lg btn-block">Report</a></td>

						
				</tr>
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

