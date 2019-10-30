

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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Automated Barcode Solution </title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/simple-sidebar2.css" rel="stylesheet">
<title>Insert title here</title>

<style>

.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
 
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {

  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a :hover {background-color: #ddd;}

.show {display: block;}



</style>
</head>
<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Company Name</div>
      <div class="list-group list-group-flush">
        <a href="Supplier_Order_Insert.jsp" class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a> <a
					class="list-group-item list-group-item-action bg-light dropdown-toggle"
					data-toggle="collapse" href="#collapseExample" role="button"
					aria-expanded="false" aria-controls="collapseExample">Inventory&nbsp;Management</a>
				<div class="collapse" id="collapseExample">


					<a href="Stock_IN_INSERT.jsp"
						class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;IN</a>
					<a href="Stock_OUT_INSERT.jsp"
						class="list-group-item list-group-item-action bg-secondary text-white">&nbsp;&nbsp;&nbsp;&nbsp;Stock&nbsp;OUT</a>


				</div>

				<a href="" class="list-group-item list-group-item-action bg-light">Payment&nbsp;Management</a> 
				<a href="" class="list-group-item list-group-item-action bg-light">Customer&nbsp;Management</a> 
				<a href="Customer_Order_Insert.jsp"
					class="list-group-item list-group-item-action bg-light">Installation&nbsp;Management</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
	  
	  <!--create the big table -->
	  
	  <table style = "width : 100%;height:80%;">
	  
	  <!--division of the first two big columns start here -->
		<tr>
			<!-- creating first column of the big table-->			
			<td style = "width:80%;" >
			<!--inside the first column -->
			<div class="table-wrapper-scroll-y my-custom-scrollbar" style = "height:100%;position:relative;" > 
			
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
											  
											  table.insertRow(-1).innerHTML = '<tr><td style = " background-color:white;"><input style = "border:0;" value ='+selecteditem.value+' name = '+itemname+'></td> <td style = " background-color:white;"><input style = "border:0;" style = "background-color:white;" name = '+itemquantity+' value = '+quantity.value+'></td>';
											  sessionStorage.setItem("index_counter",number + 1);
											}
											
											  function Delete_Number_Session() {
											  		sessionStorage.removeItem("index_counter");   
											    }
											  function validateForm() {
												  var x = document.forms["myForm"]["date"].value;
												  if (x == "") {
												    alert("date must be filled out");
												    return false;
												  }
												}
											 
											  function reply_click(clicked_id) {
													
												    document.getElementById("selectedvalue").value = document.getElementById(clicked_id).innerHTML;
												  
												}
											  
											 

												function filterFunction() {
												  var input, filter, ul, li, a, i;
												  input = document.getElementById("myInput");
												  filter = input.value.toUpperCase();
												  div = document.getElementById("myDropdown");
												  a = div.getElementsByTagName("a");
												  for (i = 0; i < a.length; i++) {
												    txtValue = a[i].textContent || a[i].innerText;
												    if (txtValue.toUpperCase().indexOf(filter) > -1) {
												      a[i].style.display = "";
												    } else {
												      a[i].style.display = "none";
												    }
												  }
												}
												

											</script>
											
											<script>
											 function showdropdown() {
												 div = document.getElementById("myDropdown");
												  div.sty
												}
											
											</script>
			
			
			<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			
			<!--%%%%%%%%%%%%%%%%% code from here   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
			
				<table class="table table-bordered table-striped mb-0" style = "position:relative;" >

				
					</table>
					

			</div>
			
			<!--finish first column-->
			</td>
			<!-- start of the next notification column -->
			<td style = "width:100%;height : 100%;">
				<!--creation of the notification table -->
				
				<table style = "height : 100%;width : 100%;">
										
					 <!-- notification one  -->
					<tr>
						<td>  
						<form  class="dropdown" >
						<div >

											      
						<button onclick="showdropdown()" class="dropbtn" style ="height:100%;">Dropdown</button>
					
					  <div id="myDropdown" class="dropdown-content">
					    <input autocomplete="off" type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
					    <a id = "1" href="#about" onClick="reply_click(this.id)" >About</a>
					    <a id = "2" href="#base" onClick="reply_click(this.id)" >Base</a>
					    <a id = "3" href="#blog" onClick="reply_click(this.id)" >eye scanner</a>
					    <a id = "4" href="#contact" onClick="reply_click(this.id)" >finger print</a>
					    <a id = "5" href="#custom" onClick="reply_click(this.id)" >Custom</a>
					    <a id = "6" href="#support" onClick="reply_click(this.id)" >Support</a>
					    <a id = "7" href="#tools" onClick="reply_click(this.id)" >Tools</a>
					  </div>
					</div>

						</form>
						</td>
					</tr>
					<!-- notification two  -->
					<tr>
						<td bgcolor="#D3803A" ><font color = "white" size = "25"> new msge</td>
					</tr>
				<!-- second column inside table end here -->
				</table>

			</td>
		</tr>
		
	<!-- end of the first table -->
	  </table>	
		
		<!--crud buttons -->
		<table style = "width : 80%;">
			<tr>
				<th bgcolor="#4EA2AA"><font color = "white" size = "25">I </font></th>
				<th bgcolor="#4EA2AA"><font color = "white" size = "25">R </font></th>
				<th bgcolor="#4EA2AA"><font color = "white" size = "25">D </font></th>
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

