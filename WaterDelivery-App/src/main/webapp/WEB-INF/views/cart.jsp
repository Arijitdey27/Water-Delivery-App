<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="<c:url value='/resources/css/home.css'/>">
    <title>Your Cart - Review & Checkout Water Orders</title>
  </head>
  <body>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar">
		<div class="container">
			<h2>WaterLife</h2>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
			    	<li class="nav-item active ml-3">
			        	<a class="nav-link" href="${pageContext.request.contextPath}/?id=${user.id}">Home <span class="sr-only">(current)</span></a>
			      	</li>
			      	<li class="nav-item active ml-3">
			        	<a class="nav-link" href="${pageContext.request.contextPath}/order?id=${user.getId()}">Order</a>
			      	</li>
			      	<li class="nav-item active ml-3">
			        	<a class="nav-link" href="${pageContext.request.contextPath}/about?id=${user.getId()}">About Us</a>
			      	</li>
			      	<li class="nav-item active ml-3">
			        	<a class="nav-link" href="${pageContext.request.contextPath}/contact?id=${user.getId()}">Contact</a>
			      	</li>
			      	
			    </ul>
			    <ul class="navbar-nav ml-auto">
			    	<li class="nav-item active mr-4">
			        	<a class="nav-link " href="${pageContext.request.contextPath}/cart?id=${user.getId()}" style="font-size: 20px;"><i class="bi bi-cart3">&nbsp;&nbsp;Cart</i></a>
			        <c:choose>
			        	<c:when test="${not empty user}">
			        		<li class="nav-item dropdown">
					            <a class="nav-link dropdown-toggle active" id="userDropdown" role="button"
					               data-toggle="dropdown" aria-expanded="false" style="font-size: 20px;">
					                <i class="bi bi-person-fill"></i>&nbsp;&nbsp;${user.getName()}
					            </a>
					            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
					                <li><a class="dropdown-item" href="orderHistory">Order History</a></li>
					                <li><a class="dropdown-item" href="logout">Logout</a></li>
					            </ul>
					        </li>
			        	</c:when>
			        	<c:otherwise>
			        		<li class="nav-item active">
					        	<a class="nav-link " href="${pageContext.request.contextPath}/login?id=${user.getId()}" style="font-size: 20px;"><i class="bi bi-person-fill">&nbsp;&nbsp;Login</i></a>
					      	</li>
			        	</c:otherwise>
			      	</c:choose>
			    </ul>
			  </div>
		  </div>
		</nav>
  
    <header class="header" style="height:90vh;">
    	<div class="container h-100 ">
  		<div class="row h-100">
  			<div class="col-md-8 offset-md-2" >
  				<c:choose>
	  				<c:when test="${not empty cart}">
		  				<div class="pb-3" style="background: #e2e2e2;">
		  					<table class="table table-striped text-center mt-5 p-4" style="background: white; color:black;">
							  <thead class="text-dark" style="background: #00FFFF;">
							    <tr>
							      <th scope="col">Qty</th>
							      <th scope="col">product</th>
							      <th scope="col">Price</th>
							      <th scope="col">Action</th>
							    </tr>
							  </thead>
							  <tbody>
							  		<c:forEach items="${cart}" var="c">
								    <tr>
								      <th scope="row">
								      	<a href="decProduct/${c.cartId.serialId}"><i class="fa-solid fa-minus text-dark pr-3"></i></a>
								      	 ${c.qty}
								      	 <a href="incProduct/${c.cartId.serialId}"><i class="fa-solid fa-plus text-dark pl-3"></i></a>
								      </th>
								      <td>${c.product}</td>
								      <td>&#8377;${c.price}</td>
								      <td>
								      	<a href="removeProductFromCart/${c.cartId.serialId}"><i class="fa-solid fa-trash text-danger" style="font-size: 25px;" ></i></a>      	
								      </td>
								    </tr>
							    </c:forEach>
							  </tbody>
							</table>
							<div class="container mt-3 d-flex justify-content-between">
								<a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/order?id=${user.getId()}" >Add More Product</a>
								<a class="btn btn-success btn-lg" href="buyCartProduct">Buy Now</a>
							</div>
		  				</div>
	  				</c:when>
	  				<c:otherwise>
				        <div class="text-center mt-5 p-5" style="background: linear-gradient(rgba(0,0,0,.6),rgba(0,0,0,.4)), #e2e2e2;">
				            <h1>Your Cart is Empty !!</h1>
				            <a href="${pageContext.request.contextPath}/order?id=${user.getId()}" style="font-size: 25px; text-decoration: none;">Buy product</a>
				        </div>
				    </c:otherwise>
			    </c:choose>
  			</div>
  		</div>
  	</div>
    </header>
    
		<!-- Bootstrap 4 Footer -->
	<footer class="bg-dark text-white pt-5 pb-4">
	  <div class="container text-md-left">
	    <div class="row">
	
	      <!-- About Section -->
	      <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
	        <h5 class="text-uppercase mb-4 font-weight-bold">About Us</h5>
			<p>With reliable delivery, flexible subscription plans, and real-time tracking, AquaSwift is redefining hydration convenience. We partner with trusted local suppliers to ensure every drop meets the highest standards of purity and taste.</p>
	      </div>
	
	      <!-- Quick Links -->
	      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
	        <h5 class="text-uppercase mb-4 font-weight-bold">Services</h5>
	        <p>Daily water delivery from 8 AM to 10 PM. Flexible plans, doorstep convenience, and eco-friendly packaging.</p>
	      </div>
	
	      <!-- Social Media -->
	      <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
	        <h5 class="text-uppercase mb-4 font-weight-bold">Need Help?</h5>
	        <p>Email: <a href="mailto:info@qeducation.com" >&nbsp; info@waterlife.com</a></p>
      		<p>Phone: <a href="tel:+1234567890">&nbsp;+1 234 567 890</a></p>
	      </div>
	
	    </div>
	
	    <!-- Footer Bottom -->
	    <div class="row mt-3">
	      <div class="col-md-12 text-center" style="font-weight: bold; color: #191970; background-color: #A9A9A9;">
	        <p class="mb-0">&copy; 2025 WaterLife. All rights reserved.</p>
	        <p>Designed By Arijit</p>
	      </div>
	    </div>
	  </div>
	</footer>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>