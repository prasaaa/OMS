<%@page import="com.DatabaseHandle.Main_SELECT"%>
<%@page import="com.DBConnection.ConnectionManager"%>
<%@page import="com.model.Supplier_Order"%>
<%@page import="com.model.CurrentUser"%>

<%@page import="java.sql.Connection"%>
<%@page import="com.DatabaseHandle.Supplier_SELECT"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Automated Barcode Solution</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/simple-sidebar2.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
#wgtmsr{
 width:150px;   
}
a:hover {background-color: #ddd;}
</style>
<title>Insert title here</title>
</head>
<body>

	
	
	

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
		
			<div class="sidebar-heading">Automated Barcode<br>Solution</div>
			<div class="list-group list-group-flush">
			
				<a href="Supplier_Order_Insert.jsp" class="list-group-item list-group-item-action bg-light">Supplier&nbsp;Management</a> 
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
			<table style="width: 100%; height: 85%;">
				<!--division of the first two big columns start here -->
				<tr>
					<!-- creating first column of the big table-->
					<td style="width: 50%;">
						<!--inside the first column -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar"
							style="height: 100%; position: relative;">




							<!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<table class="table table-bordered table-striped mb-0"
								style="position: relative;">
								<tr>
									<th>Cus Order ID </th>
									<th> Cus ID</th>
									<th>Ord Date</th>
									<th>Req Date</th>									
									<th>Type</th>
									
								
								</tr>
								

						<%
						
						ResultSet result;
						ResultSet resultset_for_dropdown;
						ResultSet resultset_for_items ;
						
						//used to store the item details to check whether lenth of item details not exceeding the needed length
						
						String itemdetail,subitemdetails;
						int cuttingnumbers,startindexofstring,endindexofstring;
						
						
						//for the use of dropdown we use a hashmap
						HashMap<String,Integer> dropdown_item_store = new HashMap<String,Integer>();
						//to store the type of suppliers
						HashMap<String,String> supplier_type_store = new HashMap<String,String>();
								
						 
						
			 				Connection con = ConnectionManager.getConnection();
			 				
			 				Main_SELECT si = new Main_SELECT(con,"select * from Customer_Order_Table");
							result = si.get_table();
							
													
							//for the drop down customer select
							Main_SELECT si2 = new Main_SELECT(con,"select * from customer_table");
							resultset_for_dropdown = si2.get_table();
									
							HttpSession I_OR_L =  request.getSession();

							//for the drop down item select
							Main_SELECT si4 = new Main_SELECT(con,"select item_id,item_details,buying_price from item_details_table ");
							resultset_for_items = si4.get_table();
									
							while(result.next())
							{
							%>

								<tr>
									<td><%= result.getString("customer_Order_Id") %></td>
									<td><%= result.getString("customer_Id")  %></td>
									<td><%= result.getString("order_Date")  %></td>
									<td><%= result.getString("required_Date")  %></td>
									<td><%= result.getString("order_Type")  %></td>
									
								</tr>

								<% }%>
						
							</table>





						</div> <!--finish first column-->
					</td>
					<!-- start of the next notification column -->
					<td style="width: 100%; height: 100%;">
						<!--creation of the notification table -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar" style="width: 100%; height: 100%;">
						<table style="height: 100%; width: 100%;position: relative;" class="table table-bordered table-striped mb-0">

							<!-- notification one  -->
							
							<tr>
								<td style="height: 100%;background-color:white;">
								
									<!-- form starts here  -->
									
									
										<div class="container">
										
										
											<script>
											//to store item and the price
												var itemmap = new Map();
											//to store item and the quantity
												var itemquantity = new Map();
												document.addEventListener('keydown', function(event) {
												    if( event.keyCode == 13 || event.keyCode == 17 || event.keyCode == 74 )
												      event.preventDefault();
												});
												
												function myFunction() {
													
													//this is to check whether the item selected is null before adding to the table
													//to that we check if the items more details is empty then no item has selected
													
													
													if(document.getElementById("itemdetailsdropitem").value ==  'Select The Item')
														{
															alert("One Item Should Be Selected !");
															return false;
														}
													if(document.getElementById("item_quantity").value ==  '')
													{
														alert("Item Quantity Cannot be Empty !");
														return false;
													}
																									  
												  var table = document.getElementById("myTable");
												  var selecteditem = document.getElementById("itemdetailsdropitem");
												  var quantity =  document.getElementById("item_quantity");
												  var c = itemmap.get(selecteditem.value); //to get the price of the item
												  
												  table.insertRow(-1).innerHTML = '<tr><td style = " background-color:white;" >'+selecteditem.value+'<input name="items" value ='+selecteditem.value+' hidden></td> <td style = " background-color:white;" >'+quantity.value+'<input name="itemquantity" value ='+quantity.value+' hidden></td> <td style = " background-color:white;" >'+c+'</td> <td style = " background-color:white;" >'+c * quantity.value +'</td><td style = " background-color:white;"><button id = '+ selecteditem.value  + ' class="btn" onclick="SomeDeleteRowFunction(this)" ><i class="fa fa-trash"></i></button></td></tr>';
												  itemquantity.set(selecteditem.value, quantity.value);	
												 
												  //that tag is hidden so its only in the code ,this is used only to get the quantity of the item

	 											  document.getElementById("total").value = +document.getElementById("total").value + (c * quantity.value);
												  document.getElementById('itemdetailsdropitem').value = 'Select The Item';
												  document.getElementById("item_quantity").value = "Quantity";

												  return true;
												  
												}

											   
												  
											    function validateForm() {
											    	
											    //select whether the 
											      if(document.getElementById('customerdropitem').value == 'Select The Customer')
														{
															alert("Select A Customer");
															return false;
														}
											    //check whether the date is emplty	
												  if( document.forms["myForm"]["date"].value == "") 
												  		{												  
												    		alert("Date Must Be Filled Out");
												    		return false;
												 		}												  
												  
												  //check whether the selected date is less than the current date
											        var dateString = x;
											        var myDate = new Date(dateString);
											        var today = new Date();
											        if ( myDate < today ) { 
											            alert("Estimated Date Should Be Greater than Or Equal To Current Date !")
											            return false;
											        }
											        //checking whether the supplier name is correct ,that is whether it is selected is a item in drop down
											        var optcounter = 0;
											        var suppliername =  document.getElementById('customerselect').value;
											        var supoptions = document.getElementById('customer');
											        for (i = 0; i < supoptions.options.length; i++) {
											           if(supoptions .options[i].value == suppliername )
											        	{
											        	   optcounter =  1;
											        	   break;
											        	}
											        }
											        if(optcounter == 0)
											        	{
											        		alert("You Must Select A Customer From The DropDown !");
											        		return false;
											        	}
											        

											        
											        return true;
  
												}
												  
											    function SomeDeleteRowFunction(o) {
													     
											    	 var p=o.parentNode.parentNode;
												     p.parentNode.removeChild(p);	
												     //pass values to edittotal to substarct from the price 
													 edittotal(o.id); 
												}
											    
											    function edittotal(clickid)
											    {
											    	//get the price of item 
											    	
											    	var itemprice = itemmap.get(clickid);
											    	
											    	//get the quantity of the item
											    	
												    var itemq = itemquantity.get(clickid);
												    
											    	//substract the current value from the total
												    document.getElementById("total").value = +document.getElementById("total").value - ( +(itemprice * itemq));
											    }
												  
											    //reset button function
											    function clearall(){
											    	
											    	document.getElementById("myForm").reset();
											    	
											    	//clear the items table
											    	var x = document.getElementById("myTable").rows.length;
												    for(var i = x-1 ; i > 0;i--)
												    {
												    	
												    		
											  				document.getElementById("myTable").deleteRow(i);
												    		
												    }
	
											    }
											  
											   
											    
											    //filter fucntion for the supplier
											    function customerfilterFunction() {
											    	  var input, filter, ul, li, a, i;
											    	  input = document.getElementById("customermyInput");
											    	  filter = input.value.toUpperCase();
											    	  div = document.getElementById("customeritemdisplay");
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
											    
											  //filter fucntion for the Item Detail
											    function itemdetailsitemdisplayfilterFunction() {
											    	  var input, filter, ul, li, a, i;
											    	  input = document.getElementById("itemdetailsmyInput");
											    	  filter = input.value.toUpperCase();
											    	  div = document.getElementById("itemdetailsitemdisplay");
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
											
											    
											    
											    window.onclick = function(event) {
											    	
											    	
													var customerx = document.getElementById("customeritemdisplay");
													var itemx = document.getElementById("itemdetailsitemdisplay");
													var orderx = document.getElementById("orderitemdisplay");
													
													if (event.target.id == "customerdropitem") {
														
														customerx.classList.toggle("show");	
														itemx.classList.remove("show");	
														orderx.classList.remove("show");

													} else if (event.target.id == "customermyInput") {
														
														
														
													}else if(event.target.id == "itemdetailsdropitem"){
														itemx.classList.toggle("show");	
														customerx.classList.remove("show");	
														orderx.classList.remove("show");	
													}
													else if(event.target.id == "itemdetailsmyInput"){
														
													}
													else if (event.target.id == "orderdropitem") {
														
														customerx.classList.remove("show");	
														itemx.classList.remove("show");	
														orderx.classList.toggle("show");	
													}
													
													else {
														
														customerx.classList.remove("show");	
														itemx.classList.remove("show");	
														orderx.classList.remove("show");	
													}
												}
											   
  	
											</script>
											
											
											<form action="Customer_Order_Insert_Controller" method="post" name="myForm" id = "myForm" onsubmit="return validateForm()" >
											
											 <label>Select Customer</label><br>
												<div class="dropdown">
													<input type = "text" id = "customerdropitem"  name = "customerdropitem" value = "Select The Customer" readonly>
													
														<div  id = "customeritemdisplay" class="dropdown-content" style = "margin-top:-4%;width:100%;max-height : 450%;overflow-y:scroll;overflow-x:hidden;">
															<div style="position: sticky;top: -4%;margin-top:-1%;">
																<input type="text" id = "customermyInput" onkeyup="customerfilterFunction()" autocomplete = "off" placeholder = "Search here.." style = "position:sticky;">
															</div>
															<div  style = "overflow-x:hidden;">
																<% while(resultset_for_dropdown.next())
																{ %>
																<a  onclick = "document.getElementById('customerdropitem').value = '<%=resultset_for_dropdown.getString("customer_Id")%>';"><%=resultset_for_dropdown.getString("customer_Id")%></a>
																
																<%
																} %>
															</div>
														</div>
												
												</div>
												
												

													
											 <label>Select Required Date</label><br>
												<input type = "date" value = "enter" id ="date"  name = "date" style = "width: 100%;
																													  padding: 12px;
																													  border: 1px solid #ccc;
																													  border-radius: 4px;
																													  box-sizing: border-box;
																													  margin-top: 6px;
																													  margin-bottom: 16px;
																													  ">
												<br> 
												
												<label>Select Order Type</label><br>
												<div class="dropdown">
													<input type = "text" id = "orderdropitem"  name = "orderdropitem" value = "Select The Order Type" readonly>
													
														<div  id = "orderitemdisplay" class="dropdown-content" style = "margin-top:-4%;width:100%;max-height : 450%;overflow-y:scroll;overflow-x:hidden;">
															<div style="position: sticky;top: -4%;margin-top:-1%;">
																
															</div>
															<div  style = "overflow-x:hidden;">
																
																<a  onclick = "document.getElementById('orderdropitem').value = 'Installation';">Installation</a>
																<a  onclick = "document.getElementById('orderdropitem').value = 'Items';">Items</a>
																
															</div>
														</div>
												
												</div>
												
												
													
												
												<div style = "border:1px solid black;padding:2%;">
												
												 <label>Place the Items needed to Order Here</label><br>
												<div class="dropdown" >
													<input type = "text" id = "itemdetailsdropitem" value = "Select The Item" readonly>
													
														<div  id = "itemdetailsitemdisplay" class="dropdown-content" style = "margin-top:-4%;width:100%;height : 450%;overflow-y:scroll;overflow-x:hidden;border:1px solid #538AC0;">
															<div style="position: sticky;top: -4%;margin-top:-2%;">
																<input type="text" id = "itemdetailsmyInput" onkeyup="itemdetailsitemdisplayfilterFunction()" autocomplete = "off" placeholder = "Search here.." >
															</div>
															<div  style = "overflow-x:hidden;">
																<% while(resultset_for_items.next())
															       {%>
																		<a id = '<%=resultset_for_items.getString("item_id") %>' onclick = "document.getElementById('itemdetailsdropitem').value = '<%=resultset_for_items.getString("item_id")%>';" ><b><%=resultset_for_items.getString("item_id")%></b><br><%=resultset_for_items.getString("item_details")%><br>Price :&nbsp; <span id="itemprice"><%=resultset_for_items.getDouble("buying_price")%></span></a>
																		<script>
																			itemmap.set('<%=resultset_for_items.getString("item_id") %>', '<%=resultset_for_items.getDouble("buying_price")%>');
																		
																		</script>														
																<% } %>
															</div>
														</div>
												
													</div>

													<input type = "number"  id = "item_quantity" style = "width: 35%;
																									  padding: 12px;
																									  border: 1px solid #ccc;
																									  border-radius: 4px;
																									  box-sizing: border-box;
																									  margin-top: 6px;
																									  margin-bottom: 16px;
																									  resize: vertical;" min = "1"  autocomplete = "off" placeholder = "Quantity">
																									  
													<input type ="button" onclick="myFunction()" value = "+" style = "  background-color: #008CBA; 
																														  border: none;
																														  width:60%;
																														  border-radius: 8px;
																														  color: white;
																														  padding: 10px;
																														  text-align: center;
																														  text-decoration: none;
																														  display: inline-block;
																														  font-size: 16px;
																														  margin: 4px 2px;
																														  cursor: pointer;">
																														  
												
													
													
													<p>Estimated Total : &nbsp; Rs.<input id = "total" name = "total" style = "border:none;color:red;" value ="0" readonly>
													 
													<p id = "info"></p>
													<p id = "itemdetails"></p>
													<div style = "height:300px;overflow-y:scroll;overflow-x:hidden;border: 1px solid black;scroll-behavior: smooth;width:100%;">	
													<table style = "border:1px solid black;width:100%;" id="myTable" border ="1">
													<tr>
														<th>Item</th>
														<th>Quantity</th>
														<th>Unit</th>
														<th>Total</th>
														<th>Del</th>
														
													
													
													</tr>
												 
													
													</table>
													
													</div>
													</div>
													
												    <input type ="button" onclick="clearall()" value = "Reset" style = "background-color: #ef4b4b;width:48.5%;border:none;
																													  border-radius: 8px;
																													  color: white;
																													  padding: 10px;
																													  text-align: center;
																													  text-decoration: none;
																													  display: inline-block;
																													  font-size: 16px;
																													  margin: 4px 2px;
																													  cursor: pointer;">
													
													<input type = "submit" value ="Add"  style = " width:100%; width:48.5%;border-radius: 8px; ">
											</form>
	
									</div> <!--  form ends here -->
									
									
								</td>
							</tr>
							
							<!-- notification two  -->
								
							<!-- second column inside table end here -->
						</table>
						</div>

					</td>
				</tr>

				<!-- end of the first table -->
			</table>

			<!--crud buttons -->
			<table style="width: 100%;height:10%;">
				<tr>
					<td style ="border:none;"><a href="Supplier_Order_Insert.jsp"
							class=" btn btn-dark btn-lg btn-block">Insert</a></td>

					<td style ="border:none;"><a href="Supplier_Order_UPDATE.jsp"
							class=" btn btn-dark btn-lg btn-block">Update</a></td>
					<td style ="border:none;"><a href="Supplier_Order_Delete.jsp"
							class=" btn btn-dark btn-lg btn-block">Delete</a></td>
					<td style ="border:none;"><a href="Supplier_Report.jsp"
							class=" btn btn-dark btn-lg btn-block">Report</a></td>

						
				</tr>
			</table>

		</div>
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