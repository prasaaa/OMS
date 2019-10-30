<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.DatabaseHandle.Main_SELECT"%>
<%@page import="com.model.CurrentUser"%>
<%@page import="com.DBConnection.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DatabaseHandle.Supplier_SELECT"%>
<%@page import="java.util.HashMap"%>
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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Automated Barcode Solution</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/simple-sidebar2.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
td:hover {
  -ms-transform: scale(1.1); 
  -webkit-transform: scale(1.1); 
  transform: scale(1.1); 
}
/* width */
::-webkit-scrollbar {
  width: 2px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: white; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: white; 
}
</style>
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
		<div id="page-content-wrapper" >

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light text-white border-bottom" >
				<button class="btn btn-primary text-white " id="menu-toggle" >Menu</button>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						
						</a></li>
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
			
			<%
			ResultSet rsinstallation,rspayment,rsstocklow,rstotalearning ;
			Connection condash = ConnectionManager.getConnection();
			
			Main_SELECT dashms = new Main_SELECT(condash,"SELECT * FROM customer_order_table where order_Type = 'Installation' or  order_Type = 'Repair'");
			rsinstallation = dashms.get_table();
			
			Main_SELECT dashpaysup =  new Main_SELECT(condash,"SELECT *  FROM payment_table where status = 'pending'");
			rspayment = dashpaysup.get_table();
			
			Main_SELECT dashstock =  new Main_SELECT(condash,"SELECT item_id,COUNT(*) FROM items_list_table group by(item_id) ");
			rsstocklow =  dashstock.get_table();
			
			Main_SELECT dashtotal = new Main_SELECT(condash,"SELECT sum(price) FROM payment_table where pay_date between date_add(NOW(),interval -DAY(NOW())+1 DAY) AND LAST_DAY(NOW())");
			rstotalearning =  dashtotal.get_table();
			String timeStamp = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

			long diff;
			%>

			<!--create the big table -->
			
			<table style="width: 100%; height: 90%;border-collapse: separate;  border-spacing: 35px;border-color:white;background-color:white;" >
				
				<tr style="width: 100%;">
					<!-- creating first column  first row-->
					
					<td  style="position:relative;width: 40%;height:30%;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);border-radius: 0px;background-color:#E5E7E9  ; border-style: solid;
  					border-color: ;"> 
					<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 90%; position: relative;">
							<table style="width :90%;position:absolute;top:0%;margin: 0 auto;"  class="table table-bordered table-striped mb-0 ">
								
								<tr>
									<th style = "padding: 15px;border-color: #E5E7E9  ;background-color:#E5E7E9  ;font-size: 150%;color:blue;" colspan = "3"><pre style = "-moz-tab-size: 4;color:#34495E;" >Pending Orders <i class='far fa-calendar-check'style='font-size:48px;color:#34495E;float:right;'></i></pre></th>
									
	
								</tr>
								<tr>
									<th style = "text-align:center;padding: 15px;border-color: #E5E7E9  ;background-color:#E5E7E9  ;color:#34495E;">Cus Order ID</th>
									<th style = "text-align:center;padding: 15px;border-color: #E5E7E9  ;background-color:#E5E7E9  ;color:#34495E;">Cust ID</th>
									<th style = "text-align:center;padding: 15px;border-color: #E5E7E9  ;background-color:#E5E7E9  ;color:#34495E;">Days</th>
	
								</tr>
								<%
								while(rsinstallation.next())
								{%>
								<tr>
									<td style = "background-color:#E5E7E9  ;padding: 15px;border-color:#E5E7E9  ;"><b><font color="#34495E" ><%= rsinstallation.getString("customer_Order_Id") %> </font> </td>
									<td style = "background-color:#E5E7E9  ;padding: 15px;border-color: #E5E7E9  ;"><b><font color="#34495E"><%= rsinstallation.getString("customer_Id") %> </font> </td>
									
									<%
									SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
									Date d1 = format.parse(rsinstallation.getString("required_Date"));
									Date d2 = format.parse(timeStamp);
								    diff = d1.getTime() - d2.getTime();
								     
									%>
									<td style = "background-color:#E5E7E9 ;padding: 15px;border-color: #E5E7E9 ;"><b><font color="#34495E"><%= String.valueOf( diff / (24 * 60 * 60 * 1000)) %></font></b>  </td>
									
								</tr>
								<%}%>
								
							</table>
						</div>
						

					</td>
					
				
					<!-- end of the first column first row -->
					
					<!-- creating second column  first row-->	
					
					
					<td style="position:relative;width: 40%;height:30%;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);border-radius: 0px;background-color:#34495E ; border-style: solid;
  					border-color: ;" >
						
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 90%; position: relative;">
							<table style="width :100%;position:absolute;top:0%;margin: 0 auto;"  >
								<tr>
									<th style = "padding: 15px;border-color: #34495E;background-color:#34495E;font-size: 150%;color:#34495E ;" colspan = "3"><pre style = "-moz-tab-size: 4;color:white;" >Pending Payments<i class='fas fa-funnel-dollar' style='font-size:48px;color:white;float:right;'></i></pre></th>
									
	
								</tr>
								<tr>
									<th style = "text-align:center;padding: 15px;background-color:#34495E ;border-color:#34495E ;color:white;">Pay ID</th>
									<th style = "text-align:center;padding: 15px;background-color:#34495E ;border-color: #34495E ;color:white;">Price</th>
									
	
								</tr>
								<%
								
								while(rspayment.next())
								{%>
								<tr>
									<td style = "background-color:#34495E ;border-color: #34495E ;padding: 15px;color:white;"><b><font color="white" ><%= rspayment.getString("payment_Id") %> </font> </td>
									<td style = "background-color:#34495E ;border-color: #34495E ;padding: 15px;color:white;"><b><font color="white"><%= rspayment.getString("price") %> </font> </td>

								</tr>
								<%}%>
								
							</table>
							</div>

					</td>
					
				
					<!-- end of the second column first row -->
					
					
					</tr>
					<tr style="width: 100%;">
					
					<!-- start of the second row -->
					
					<!-- creating first column  second row-->
					<td style="position:relative;width: 40%;height:30%;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);border-radius: 0px;background-color:#34495E; border-style: solid;
  					border-color: ;" class="table table-bordered table-striped mb-0 " >
						
						
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 90%; position: relative;">
							<table style="width :90%;position:absolute;top:0%;margin: 0 auto;"  >
								<tr>
									<th style = "padding: 15px;border-color: #34495E;background-color:#34495E;font-size: 150%;color :#D4AC0D ;" colspan = "3"><pre style = "-moz-tab-size: 4;color:white;"" >Stock Status<i class='fas fa-cart-arrow-down' style='font-size:48px;color:white;float:right;'></i></pre></th>
									
	
								</tr>
								<tr>
									<th style = "text-align:center;padding: 15px;background-color:#34495E;border-color: #34495E;color:white;">Item ID</th>
									<th style = "text-align:center;padding: 15px;background-color:#34495E;border-color: #34495E;color:white;">No</th>
									
								</tr>
								<%
								
								while(rsstocklow.next())
								{%>
					
								<tr>
									
									<td style = "text-align:center;background-color:#34495E;padding: 15px;border-color: #34495E;color:white;"><b><font color="white" ><%= rsstocklow.getString("item_id") %> </font> </td>
									<td style = "text-align:center;background-color:#34495E;padding: 15px;border-color: #34495E;color:white;"><b><font color="white" ><%= rsstocklow.getString(2) %> </font> </td>
									<td style = "text-align:center;background-color:#34495E;padding: 15px;border-color: #34495E;color:white;" >
									
									
									<input type= "submit" value="Order" style="width:100%;height:80%;background-color: white;color:black;" >
									
									</td>
								
								</tr>
								
								<%}%>
								
							</table>
							</div>

					</td>
					<!-- end of the first column second row -->
					
				<!-- 	<!-- creating second column  second row-->	
					<td style="width: 33%;height:30%;background-color:#E5E7E9  ;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);;border-radius: 0px;">
						<h1 style = "text-align:center;font-family:Sans-serif;color:#34495E;">Total Earning For This Month <i class='fas fa-dollar-sign'></i></h1>
						<%while(rstotalearning.next()){ %>
							
							<h1 style = "text-align:center;color:#34495E;"><%= "Rs. " + rstotalearning.getString(1) %></h1>
							
							
							
						<%  } %>
						<h1></h1>
					</td>
					<!-- end of the second column second row -->
					
				


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