
<%@page import="com.model.CurrentUser"%>
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
				<a href="Emp_Management.jsp"
				class="list-group-item list-group-item-action bg-light">Employee&nbsp;Management</a>
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

			<!--create the big table -->
			<table style="width: 100%; height: 80%;">
				<!--division of the first two big columns start here -->
				<tr>
					<!-- creating first column of the big table-->
					<td style="width: 80%;">
						<!--inside the first column -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">




							<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0"
								style="position: relative;">

						<%
						HttpSession ChangeSession =  request.getSession();
						ChangeSession.setAttribute("change", 0);
						ResultSet result;
						session.setAttribute("test", null);
						 
						if( (Integer) session.getAttribute("test")  != null)
						{
							
							System.out.println("came inside the test");
							Supplier_SELECT si2 = (Supplier_SELECT) request.getAttribute("ss");																									
							result =  si2.rs;																
							while(result.next())
							{
								
							%>

								<tr>
									<td><%= result.getString("uname") %></td>
									<td><%= result.getString("pass")  %></td>
									
								</tr>

								<% 
							}
							
						}
								
						
						 else	{
			 				Connection con = ConnectionManager.getConnection();
							Supplier_SELECT si = new Supplier_SELECT(con,"select * from login ");
							result = si.get_supplier_table();
							request.setAttribute("resultset", result);
									
							while(result.next())
							{
							%>

								<tr>
									<td><%= result.getString("uname") %></td>
									<td><%= result.getString("pass")  %></td>
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
								<td style="height: 60%;">
								
									<!-- form starts here  -->

										<div class="container">
										
											<form action="Supplier_Filter_Controller" method="post">
											
												<label>uname</label> <br> <input type="text"
													name="uname" placeholder="Your name.."> <br> <label>pass</label>
												<br> <input type="text" name="pass"	placeholder="Your Pass..">
													 <input type="submit" value="Filter">
											</form>
										
									</div> <!--  form ends here -->
									
								</td>
							</tr>
							
							<!-- notification two  -->
								<tr>
									<td>
											 <form action="Supplier_UPDATE_Controller" method="post">
											
												<label>uname</label> <br> 
												<input type="text"	name="uname" placeholder="Your name.."> <br> 
												<label>pass</label><br>
												 <input type="text" name="pass"	placeholder="Your Pass..">
												 <input type="submit" value="Update">
												 
											</form>
									</td>
								</tr>
							<!-- second column inside table end here -->
						</table>

					</td>
				</tr>

				<!-- end of the first table -->
			</table>

			<!--crud buttons -->
			<table style="width: 80%;">
				<tr>
					<th bgcolor="#4EA2AA"><font color="white" size="25">I </font></th>
					<th bgcolor="#4EA2AA"><font color="white" size="25">R </font></th>
					<th bgcolor="#4EA2AA"><font color="white" size="25">D </font></th>
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

