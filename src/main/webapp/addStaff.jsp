<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
<title>Staff list</title>

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
					Food Family <sup>�</sup>
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
					Food Family <sup>�</sup>
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
					style="margin-right: 3%; width: 3%; height: 2%; float: right; margin-top: 2%;">

				<img
					src="${pageContext.request.contextPath}/resources/pics/createStaff.svg"
					style="width: 400px; height: 400px; float: right; margin-top: 8%; margin-right: 5%;" alt="Image Not Found">
				<div class="container-fluid">

					<h1 style="margin-top: 2%; color: lightgrey">Add Staff Members</h1>
					<hr class="sidebar-divider bg-dark "
						style="width: 30%; float: left;">
					<div class="dropdown mb-4">
						<div class="col-lg-6">
							<div class="p-5">
								<form class="user" action="add" method="post">
									<div class="form-group row">
										<input type="firstname" class="form-control form-control-user"
											style="border-radius: 25px;" name="fname"
											placeholder="First Name" required>
									</div>
									<div class="form-group row">
										<input type="lastname" style="border-radius: 25px;"
											class="form-control form-control-user" name="lname"
											placeholder="Last Name" required>
									</div>
									<div class="form-group row">
										<input type="username" class="form-control form-control-user"
											name="salary" placeholder="Salary"
											style="border-radius: 25px;" required>
									</div>
									<div class="form-group row">
										<input type="username" class="form-control form-control-user"
											name="username" placeholder="Username"
											style="border-radius: 25px;" required>
									</div>
									<div class="form-group row">
										<input type="email" class="form-control form-control-user"
											name="email" placeholder="Email Address"
											style="border-radius: 25px;" required>
									</div>
									<div class="form-group row">
										<input type="password" class="form-control form-control-user"
											name="password" placeholder="Password"
											style="border-radius: 25px;" required>
									</div>
									<div class="form-group row">
										<input type="contact" class="form-control form-control-user"
											name="contact" placeholder="Contact"
											style="border-radius: 25px;" required>
									</div>
									<button type="submit" class="btn btn-info btn-user btn-block row"
										style="border-radius: 25px;">Register</button>
								</form>
							</div>
						</div>
					</div>
					<!-- Begin Page Content -->



				</div>
				<!-- End of Main Content -->
				<br>
				<br>
				<br>
				<br>
				<!-- Footer -->
				<footer class="main-footer ">
					<!-- To the right -->
					<div align="center ">
						<strong>Copyrights <a href="# ">Company</a> <sup>�</sup>
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