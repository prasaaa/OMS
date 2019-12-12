<%@page import="com.DBConnection.ConnectionManager" %>
<%@page import="com.DatabaseHandle.Main_SELECT" %>
<%@page import="com.model.CurrentUser" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
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
		<script type="text/javascript">
		
		function run(){
			
		    document.getElementById('myTablepayment').onclick = function(event){
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
		        
		     
		        var f1 = document.getElementById('id');			      
		        f1.value = cells[0].innerHTML;

		      
		        
		        var f1 = document.getElementById('type');			      
		        f1.value = cells[4].innerHTML;

		        var f1 = document.getElementById('order_id');			      
		        f1.value = cells[6].innerHTML;
		        
		        var f1 = document.getElementById('name');			      
		        f1.value = cells[7].innerHTML;
		        
		        var f1 = document.getElementById('itemcost');			      
		        f1.value = cells[2].innerHTML;
		        //customerorderid
		        var f1 = document.getElementById('customerorderid');			      
		        f1.value = cells[6].innerHTML;
		        
		    }
		}
		
		
		</script>

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
							<table class="table table-bordered table-striped mb-0" id ="myTablepayment"
								style="position: relative;">
								
								<tr>
									<th>Payment ID</th>
									<th>Pay Date</th>
									<th>Item Prices</th>
									<th>Status</th>
									<th>Type</th>
									<th>Next Payment</th>
									<th>Order ID</th>
									<th>Name</th>
									
								
								</tr>

						<%
						
						
						ResultSet result,rs_order_id;
						Main_SELECT customerid_ms;
						Connection con = ConnectionManager.getConnection();
						String querycutomerid  = "";
						
			 				Main_SELECT si =  new Main_SELECT(con,"select * from payment_Table");
							result = si.get_table();
						
									
							while(result.next())
							{
							%>

								<tr onclick = "run()">
									
									<td><%= result.getString("payment_Id")%></td>
									
									<td><%= result.getString("pay_date")%></td>
									<td><%= result.getString("price")%></td>
									<td><%= result.getString("status")%></td>
									<td><%= result.getString("type")%></td>
									<td><%= result.getString("due_date")%></td>
									<!-- to get  customer id and customer name for resultset -->
									<%
									if(result.getString("type").equals("supplier_import") || result.getString("type").equals("supplier_local") )
									{
										querycutomerid = "SELECT p.supplier_order_im_id,s.supplier_id  FROM supplier_payment_import_table as p,supplier_order_import_table as s where p.payment_Id = '"+result.getString("payment_Id")+"'  AND  p.supplier_order_im_id = s.supplier_order_im_id ";
									}

									customerid_ms =  new Main_SELECT(con,querycutomerid);
									rs_order_id =  customerid_ms.get_table();
									while(rs_order_id.next())
									{%>
									
									<td><%= rs_order_id.getString("supplier_order_im_id")%></td>
									<td><%= rs_order_id.getString("supplier_id")%></td>
									<%} %>
								</tr>

								<% }%>
						
							</table>


						</div> <!--finish first column-->
					</td>
					<!-- start of the next notification column -->
					<td style="width: 100%; height: 100%;">
						<!--creation of the notification table -->
						
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">
						<table style="height: 100%; width: 100%;" class="table table-bordered table-striped mb-0">

							<!-- notification one  -->
							
							<tr>
								<td style="height: 60%;background-color:white;">
								
									<!-- form starts here  -->

										<div class="container">
										
											<form action="Payment_UPDATE_Controller" method="post" >
												<input type="hidden" id="itemcost" name="itemcost" >
												<input type="hidden" id="customerorderid" name="customerorderid" >
												<label>Payment ID</label> 
												<br> <input type="text"	name="id_" placeholder="Your name.." id = "id" readonly> <br>
												
												<label>Labour Cost</label> <br> 
												<input type="number" name="price_" placeholder="Price.." id = "price" min = "1"   style = "width: 100%;
																																  padding: 12px;
																																  border: 1px solid #ccc;
																																  border-radius: 4px;
																																  box-sizing: border-box;
																																  margin-top: 6px;
																																  margin-bottom: 16px;
																																  resize: vertical;" > <br>
												
												<label>Type</label> <br> 
												<input type="text"	name="type_" placeholder="Price.." id = "type" readonly> <br>
												
												<label>Next Payment (Optional)</label> <br> 
												<input type="date"	name="next_pay_" placeholder="Price.." id = "next_payment" style = "width: 100%;
																								  padding: 12px;
																								  border: 1px solid #ccc;
																								  border-radius: 4px;
																								  box-sizing: border-box;
																								  margin-top: 6px;
																								  margin-bottom: 16px;
																								  resize: vertical;" readonly> <br>
												
												<label>Order ID</label> <br> 
												<input type="text"	name="ordid_" placeholder="Price.." id = "order_id" readonly> <br>
												
												<label>Name</label> <br> 
												<input type="text"	name="name_" placeholder="Price.." id = "name" readonly> <br>
												
												<br>
												 <input type="submit" value="Update" style = " width:100%; background-color: #008CBA; " >
												 
											</form>
										</div>
									</td>
								</tr>
							<!-- second column inside table end here -->
						</table>
						</div>
					</td>
				</tr>

				<!-- end of the first table -->
			</table>

			<!--crud buttons -->
			<table style="width: 100%;height:18%;border-color:white;">
				<tr style="border-color:white;">
					<td><a href="Payment_UPDATE.jsp"
							class=" btn btn-dark btn-lg btn-block">Invoice</a></td>

					
					<td style="border-color:white;"><a href="Payment_Report.jsp"
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

