

<%@page import="com.model.CurrentUser"%>
<%@page import="com.DatabaseHandle.Main_SELECT"%>
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
			<script type="text/javascript">
			function run(){
				
			    document.getElementById('myTable').onclick = function(event){
			        event = event || window.event; //for IE8 backward compatibility
			        var target = event.target || event.srcElement; //for IE8 backward compatibility
			        while (target && target.nodeName != 'TR') {
			            target = target.parentElement;
			        }
			        var cells = target.cells; //cells collection
			        //var cells = target.getElementsByTagName('td'); //alternative
			        if (!cells.length || target.parentNode.nodeName == 'tr') { // if clicked row is within thead
			            return;
			        }
			        
			     
			        var f1 = document.getElementById('oder_id');			      
			        f1.value = cells[0].innerHTML;
			        
			        var f1 = document.getElementById('cus_id');				      
			        f1.value = cells[1].innerHTML;
			        
			        var f1 = document.getElementById('order_date');			      
			        f1.value = cells[2].innerHTML;
			        
			      /*   var f1 = document.getElementById('req_date');				      
			        f1.value = cells[3].innerHTML; */
			        
			        var f1 = document.getElementById('order_status');			      
			        f1.value = cells[4].innerHTML;
			        
			        var f1 = document.getElementById('order_type');				      
			        f1.value = cells[5].innerHTML;
			       
			    }
			}
			
			</script>

			<!--create the big table -->
			<table style="width: 100%; height: 80%;">
				<!--division of the first two big columns start here -->
				<tr>
					<!-- creating first column of the big table-->
					<td style="width: 50%;">
						<!--inside the first column -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">

							<script type="text/javascript">
							
								
							
							
							
							
							
							
							
							</script>


							<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0" id ="myTable"
								style="position: relative;">





								<tr>
									<th>Order Id</th>
									<th>Customer Id</th>
									<th>Order Date</th>
									<th>Required Data</th>
									<th>Order Status</th>
									<th>Order Type</th>
								</tr>

								<%	
								
									response.setIntHeader("Refresh", 60);
									
									
									ResultSet result,emp_result;
									Connection con = ConnectionManager.getConnection();
									Main_SELECT ordertable = new Main_SELECT(con,
											"select * from customer_order_table WHERE order_Status='Confirm' and order_Emp_Status IS NULL");
									
									result = ordertable.get_table();
									while (result.next()) {
								%>



								<tr onclick="run()" >
									<td><%=result.getString("customer_Order_Id")%></td>


									<td><%=result.getString("customer_Id")%></td>
									<td><%=result.getString("order_Date")%></td>
									<td><%=result.getString("required_Date")%></td>
									<td><%=result.getString("order_Status")%></td>
									<td><%=result.getString("order_Type")%></td>
								

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
									
									<form action="Order_Emp_Status_change" method="get">
										<input type="text" id ="oder_id" name="customer_Order_Id" placeholder="Please Click Order Id" onload="checkorderid()">
										<input type="text" id ="cus_id" name="cus_id" placeholder="Please Click Order Id" onload="checkcusid()">
										<input type="date" id ="order_date" name="order_date" placeholder="Please Click Order Id" style = "width: 30%;
																								  padding: 12px;
																								  border: 1px solid #ccc;
																								  border-radius: 4px;
																								  box-sizing: border-box;
																								  margin-top: 6px;
																								  margin-bottom: 16px;
																								  resize: vertical;">
										<input type="date" id ="req_date" name="req_date" placeholder="Please Click Order Id" style = "width: 30%;
																								  padding: 12px;
																								  border: 1px solid #ccc;
																								  border-radius: 4px;
																								  box-sizing: border-box;
																								  margin-top: 6px;
																								  margin-bottom: 16px;
																								  resize: vertical;">

											<button class="btn btn-outline-info" type="button"
												value="Check"
												style="background-color: #008CBA;border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;">Check</button>

											<%
												ResultSet resultEmpJob, emp_available_result;//resultset emp
												Connection coni = ConnectionManager.getConnection();
												Main_SELECT jobTable = new Main_SELECT(coni, "select * from job_table");
												resultEmpJob = jobTable.get_table();
											%>
									<select name="emp_id_selected">	
									<%
									while (resultEmpJob.next()) {
								%> 
								 <option value="<%=resultEmpJob.getString("emp_id")%>" ><%=resultEmpJob.getString("emp_id")%></option>
									<%
									}
									
								%>
											
								</select>
											
											
								<input type="text" id ="order_status" name="order_status" placeholder="Please Click Order Id">										
								<input type="text" id ="order_type" name="order_type" placeholder="Please Click Order Id">
								<button class="btn btn-outline-primary" type="submit" value="Submit" style="background-color: #008CBA;border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;">Submit</button>
							</form>

									</div> <!--  form ends here -->

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

