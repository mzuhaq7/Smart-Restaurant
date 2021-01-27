<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!-- For Session time out after 60 seconds -->
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
	<%  
	int t=(Integer) session.getAttribute("time");   
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
    Date date = new Date();
    int f=date.getMinutes();
    if(f-t>=1)
    {
    	response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
	%>

<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Place Order</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script>
	function submitreview(id){
		$("#"+id).submit();
	}
	function addcartdeals(name,price,qty,id){

		var qt = $("#"+id+"dealqty").val(); 
		var i;
		for (i = 0; i < qt; i++) {
			
			$(
					"<br><div class='h5 mb-0 font-weight-bold text-primary'><a href=#>"+name+"</a><p style='float:right;'>"+
				     price+"<sup>pkr</sup></p></div>"				
					).insertBefore($("#6868"));

		}

		ajaxdeal(name,qt);
	}	
	function ajaxdeal(name,qty,food){
		$.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/order/ajaxdeal",
		    data : {
		    "deal_name" : name,
		    "qty"	:	qty
		    },
		    success: function(data){
		    $('#total_price').text(data);
		    }
		});
	}
	function addcart(name,price,cost,qty,id){

		var qt = $("#"+id+"qty").val(); 
		var i;
		for (i = 0; i < qt; i++) {
			
			$(
					"<br><div class='h5 mb-0 font-weight-bold text-primary'><a href=#>"+name+"</a><p style='float:right;'>"+
				     price+"<sup>pkr</sup></p></div>"				
					).insertBefore($("#6868"));

		}

		ajaxcall(name,qt);
	}
	
	function ajaxcall(name,qty){
		$.ajax({
		    type : "POST",
		    url : "${pageContext.request.contextPath}/order/ajax",
		    data : {
		    "food_name" : name,
		    "qty"	:	qty
		    },
		    success: function(data){
		    $('#total_price').text(data);
		    }
		});
	}
	
	</script>
<style>
.rating {
  unicode-bidi: bidi-override;
  direction: rtl;
}
.rating > span {
  display: inline-block;
  position: relative;
  width: 1.1em;
}
.rating > span:hover:before,
.rating > span:hover ~ span:before {
   content: "\2605";
   position: absolute;
}
.center { 
  height: auto;
  position: relative;
}

.center #mytag {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
</style>
</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

<c:choose>
    <c:when test="${sessionScope.permission =='customer'}">
		<!-- Sidebar -->
		<ul class="navbar-nav bg-dark sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/FoodFamily/home">
				<div class="sidebar-brand-text mx-3">
					Food Family <sup>©</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseorder"
				aria-expanded="true" aria-controls="collapseTwo"> <span>Order</span>
			</a>
				<div id="collapseorder" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/FoodFamily/order/add">Place
							Order</a>
					</div>
				</div></li>
			<hr class="sidebar-divider d-none d-md-block">



			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsemenu"
				aria-expanded="true" aria-controls="collapseTwo"> <span>Menu</span>
			</a>
				<div id="collapsemenu" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="/FoodFamily/menu/">View
							Menu</a>
					</div>
				</div></li>

			<hr class="sidebar-divider d-none d-md-block">

			<li class="nav-item"><a class="nav-link collapsed"
				href="/FoodFamily/contact"> <span>Contact</span>
			</a></li>
			<hr class="sidebar-divider d-none d-md-block">

			<li class="nav-item"><a class="nav-link collapsed"
				href="/FoodFamily/aboutus"> <span>About Us</span>
			</a></li>
			

		</ul>
		<!-- End of Sidebar -->
        <br />
    </c:when>    
    <c:otherwise>
		<!-- Sidebar -->
		<ul class="navbar-nav bg-dark sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/FoodFamily/home">
				<div class="sidebar-brand-text mx-3">
					Food Family <sup>©</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseorder"
				aria-expanded="true" aria-controls="collapseTwo"> <span>Orders</span>
			</a>
				<div id="collapseorder" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded"> <a class="collapse-item" href="/FoodFamily/order/">View
							Orders</a>
					</div>
				</div></li>
			<hr class="sidebar-divider d-none d-md-block">



			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsemenu"
				aria-expanded="true" aria-controls="collapseTwo"> <span>Menu</span>
			</a>
				<div id="collapsemenu" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/FoodFamily/menu/add">Create
							Menu</a> <a class="collapse-item" href="/FoodFamily/menu/">View
							Menu</a>
					</div>
				</div></li>
			<hr class="sidebar-divider d-none d-md-block">

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsestaff"
				aria-expanded="true" aria-controls="collapseTwo"> <span>Staff</span>
			</a>
				<div id="collapsestaff" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/FoodFamily/staff/add">Add Staff</a> 
						<a class="collapse-item" href="/FoodFamily/staff/">Staff
							List</a>
					</div>
				</div></li>
			<hr class="sidebar-divider d-none d-md-block">

			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsereport"
				aria-expanded="true" aria-controls="collapseTwo"> <span>Contact</span>
			</a>
				<div id="collapsereport" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/FoodFamily/contact/list">View Queries</a>
					</div>
				</div></li>
				
				
				
			<hr class="sidebar-divider d-none d-md-block">

			<li class="nav-item"><a class="nav-link collapsed"
				href="/FoodFamily/customers"> <span>Customers</span>
			</a></li>
				
			<hr class="sidebar-divider d-none d-md-block">

			<li class="nav-item"><a class="nav-link collapsed"
				href="/FoodFamily/report"> <span>Reports</span>
			</a></li>
			<hr class="sidebar-divider d-none d-md-block">

			<li class="nav-item"><a class="nav-link collapsed"
				href="/FoodFamily/aboutus"> <span>About Us</span>
			</a></li>
			

		</ul>
		<!-- End of Sidebar -->
        <br />
    </c:otherwise>
</c:choose>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column"
			style="background-image:url('${pageContext.request.contextPath}/resources/pics/asa.jpg'); background-size:cover;">
		
			<!-- Main Content -->
			<div id="content">

				<input type="image"
					src="${pageContext.request.contextPath}/resources/pics/logout.svg"
					alt="Submit"
					style="margin-right: 3%; width: 5%; height: 5%; float: right; margin-top: 2%;">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div class="col-lg-6 " style="float: left;">
						<div class="p-5 ">

							<div class="text-center ">
								<h1 style="color: lightgray;">Tell Us Your Order</h1>
								<br>
							</div>
							<table id=" menuTable"
								class="table table-bordered table-striped ">
								<thead>
									<tr style="color: lightgray;">
										<th>ID</th>
										<th>Food</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${food}" var="m" varStatus="loop">
									    <tr style="color:lightgray; ">
									        <td><c:out value="${loop.count}"/></td>
									        <td><c:out value="${m.getFoodName()}"/></td>
									        <td><c:out value="${m.getRetailPrice()}"/></td>
									        <td>
									        <form id="${loop.count}edit" action="edit" method="get" style="text-decoration: underline;color: lightgrey;">
									        <input type="number" id="${loop.count}qty" min="1" max="${m.getQty()}" value=1>
									        <input value="${m.getFoodName()}" name="foodname" type="hidden">
									        </form>
									        
									        </td>
									        <td>
									        <a href="javascript: addcart('${m.getFoodName()}','${m.getRetailPrice()}','${m.getOriginalPrice()}','${m.getQty()}','${loop.count}')" style="text-decoration: underline;color: lightgrey;">Order</a><br>
									        </td>
									         
									    </tr>
									</c:forEach>
									
									
								<c:forEach items="${deallist}" var="m" varStatus="loop">
									    <tr style="color:lightgray; ">
									        <td><c:out value="${loop.count}"/></td>
									        <td><c:out value="${m.getName()}"/></td>
									        <td><c:out value="${m.getPrice()}"/></td>
									        <td>
									        <form id="${loop.count}edit" action="edit" method="get" style="text-decoration: underline;color: lightgrey;">
									        <input type="number" id="${loop.count}dealqty"  min="1" max=100  value=1>
									        <input value="${m.getName()}" name="dealname" type="hidden">
									        </form>
									        
									        </td>
									        <td>
									        <a href="javascript: addcartdeals('${m.getName()}','${m.getPrice()}',2,'${loop.count}')" style="text-decoration: underline;color: lightgrey;">Order</a><br>
									        </td>
									         
									    </tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
						</div>
					</div>

					<div class="col-xl-3 col-md-6 mb-4 "
						style="float: left; margin-top: 10%; margin-left: 15%;">
						<div class="card border-left-success shadow h-100 py-2 ">
							<div class="card-body " style="width: auto;">
								<div class="row no-gutters align-items-center ">
									<div class="col mr-2 ">
										<div
											class="font-weight-bold text-uppercase mb-4 text-primary "
											style="font-size: large; text-decoration: underline;">
											Current Order <i class="fas fa-shopping-bag fa-2x "
												style="float: right; color: #0275d8"></i>
										</div>
										<div class="col-auto "></div>
										
										<c:forEach items="${orderlist}" var="m" varStatus="loop">
										<div class="h5 mb-0 font-weight-bold text-primary" style="display: flex;justify-content: space-between;">
											<a href=#>${m.getFoodName()}</a>
											<p style="float: right;">${m.getRetailPrice()}<sup>pkr</sup></p>
										</div>
									</c:forEach>
										<hr class="sidebar-divider bg-dark " id="6868">
										<br>
										<div class="h5 mb-0 font-weight-bold border-left-success "
											style="color: #5cb85c;display: flex;justify-content: space-between;"><p>T. Price:</p>
											<p id="total_price">${orderprice}</p></div>
									</div>

								</div>
							</div>
						</div>
					</div>

					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->
			</div>
						<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-success btn-icon-split" style="margin-bottom: 20%;width: fit-content;margin-left:40%;" data-toggle="modal" data-target="#myModal">
					<span class="icon text-white-50"> 
								<i class="fas fa-star"></i>
								</span> 
								<span class="text">Leave Review&nbsp;&nbsp;</span>	
								
					</button>
					
					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title">Add Review</h4>
					      </div>
					      <div class="modal-body">
					      <form action="/FoodFamily/review" method="post" id="reviewForm">
					      <div style="display:flex;justify-content: space-between;">
					      <label for="stars">How would you rate us?</label>
					      <select id="stars" name="stars" class="form-control">
					      <option value=1>1</option>
					      <option value=1>2</option>
					      <option value=1>3</option>
					      <option value=1>4</option>
					      <option value=1>5</option>
					      </select>
					      </div>
					      <div>
					      <br>
									<textarea class="form-control" name="msg" style="border-radius: 25px;"
										rows="3" id="complaint"
										placeholder="Tell us about your experience...">
									</textarea>					      
							</div>
							</form>
							<br>
							<div style="display:flex;justify-content: space-between;">
					        <a id="mytag" href="javascript: submitreview('reviewForm');" class="btn btn-success btn-icon-split" >
								<span class="icon text-white-50"> 
								<i class="fas fa-heart"></i>
								</span> <span class="text">Submit Review&nbsp;&nbsp;</span>	
							</a>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
				
				  </div>
				</div>
								
								
				
				
				
				
				
				
				
			
			<!-- Footer -->
			<footer class="main-footer ">
				<!-- To the right -->
				<div align="center ">
					<strong>Copyrights <a href="# ">Company</a> <sup>©</sup>
					</strong> Food Family &nbsp;
				</div>
				<!-- Default to the left -->
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded " href="#page-top "> <i
		class="fas fa-angle-up "></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js "></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js "></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js "></script>

</body>

</html>