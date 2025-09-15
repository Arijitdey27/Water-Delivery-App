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
	<link rel="stylesheet" href="<c:url value='/resources/css/order.css'/>">
    <title>Our Products- Fast & Reliable Delivery</title>
  </head>
  <body>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar">
		<div class="container">
			<h2>WaterLife</h2>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
			    	<li class="nav-item active ml-3">
			        	<a class="nav-link" href="${pageContext.request.contextPath}/?id=${user.getId()}">Home <span class="sr-only">(current)</span></a>
			      	</li>
			      	<li class="nav-item active ml-3">
			        	<a class="nav-link" href="${pageContext.request.contextPath}/order?id=${user.getId()}">Order</a>
			      	</li>
			      	<li class="nav-item active ml-3">
			        	<a class="nav-link" href="${pageContext.request.contextPath}/about?id=${user.getId()}">About Us</a>
			      	</li>
			      	<li class="nav-item active ml-3">
			        	<a class="nav-link " href="${pageContext.request.contextPath}/contact?id=${user.getId()}">Contact</a>
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
  
    <header>
    	
    </header>
    <main>
    	<h1>Products:</h1>
    	<div class="container service">
    		<div class="card " >
				<img class="card-img-top" src='<c:out value="resources/images/waterLife.jpg"/>' alt="Water Can">
				 <div class="card-body p-2">
				   <h5 class="card-title text-center">WaterLife</h5>
				   <div class="desc">
				   	<p>Qty: <strong>&nbsp;20L</strong></p>
				   	<p>Price:<strong>&nbsp;&#8377;30</strong></p>
				   </div>
				   <div class="button">
				   	 <c:choose>
				        <c:when test="${cartProduct.contains('Water')}">
				            <a class="btn btn-primary text-light" href="cart?id=${user.getId()}">Go to Cart</a>
				        </c:when>
				        <c:otherwise>
				            <a class="btn btn-success text-light" href="addCart/1">Add to Cart</a>
				        </c:otherwise>
				    </c:choose>
				   	<a class="btn btn-success text-light" href="buyProduct/1">Buy Now</a>
				  </div>
				 </div>
				 
			</div>
			<div class="card" >
				<img class="card-img-top" src='<c:out value="resources/images/aquafina.jpg"/>' alt="Aquafina">
				<div class="card-body p-2">
					<h5 class="card-title text-center">Aquafina</h5>
					<div class="desc">
					   <p>Qty: <strong>&nbsp;20L</strong></p>
					   <p>Price:<strong>&nbsp;&#8377;90</strong></p>
					</div>
					  <div class="button">
						  <c:choose>
					        <c:when test="${cartProduct.contains('Aquafina')}">
					            <a class="btn btn-primary text-light" href="cart?id=${user.getId()}">Go to Cart</a>
					        </c:when>
					        <c:otherwise>
					            <a class="btn btn-success text-light" href="addCart/2">Add to cart</a>
					        </c:otherwise>
					    </c:choose>
					   	<a class="btn btn-success text-light" href="buyProduct/2">Buy Now</a>
					  </div>
				</div>
			</div>
			<div class="card" >
				<img class="card-img-top" src='<c:out value="resources/images/bislary.jpg"/>' alt="Bisleri">
				<div class="card-body p-2">
					<h5 class="card-title text-center">Bisleri</h5>
					<div class="desc">
					   <p>Qty: <strong>&nbsp;20L</strong></p>
					   <p>Price:<strong>&nbsp;&#8377;90</strong></p>
					</div>
				   	<div class="button">
					   	<a class="btn btn-success text-light" href="addCart/3">Add to cart</a>
					   	<a class="btn btn-success text-light" href="buyProduct/3">Buy Now</a>
					  </div>
				</div>
			</div>
			<div class="card" >
				<img class="card-img-top" src='<c:out value="resources/images/waterCanContainer.jpg"/>' alt="Water Container">
				<div class="card-body p-2">
					<h5 class="card-title text-center ">Water Container</h5>
					<div class="desc">
				   	<p>Qty: <strong>&nbsp;1</strong></p>
				   	<p>Price:<strong>&nbsp;&#8377;125</strong></p>
				   </div>
				   <div class="button">
				   	<a class="btn btn-success text-light" href="addCart/4">Add to cart</a>
				   	<a class="btn btn-success text-light" href="buyProduct/4">Buy Now</a>
				  </div>
				</div>
			</div>
			<div class="card" >
				<img class="card-img-top" src='<c:out value="resources/images/waterLife.jpg"/>' alt="waterCan">
				<div class="card-body p-2">
					<h5 class="card-title text-center">Water Can</h5>
					<div class="desc">
					   <p>Qty: <strong>&nbsp;1</strong></p>
					   <p>Price:<strong>&nbsp;&#8377;150</strong></p>
					</div>
					  <div class="button">
					   	<a class="btn btn-success text-light" href="addCart/5">Add to cart</a>
					   	<a class="btn btn-success text-light" href="buyProduct/5">Buy Now</a>
					  </div>
				</div>
			</div>
			<div class="card" >
				<img class="card-img-top" src='<c:out value="resources/images/eAccessories.jpg"/>' alt="Electric Accessories">
				<div class="card-body p-2">
					<h5 class="card-title text-center ">Electric Accessories</h5>
					<div class="desc">
				   	<p>Qty: <strong>&nbsp;1</strong></p>
				   	<p>Price:<strong>&nbsp;&#8377;200</strong></p>
				   </div>
				   <div class="button">
				   	<a class="btn btn-success text-light" href="addCart/6">Add to cart</a>
				   	<a class="btn btn-success text-light" href="buyProduct/6">Buy Now</a>
				  </div>
				</div>
			</div>
			<div class="card" >
				<img class="card-img-top" src='<c:out value="resources/images/aquafina_bottle.jpg"/>' alt="Bottle">
				<div class="card-body p-2">
					<h5 class="card-title text-center">Bottle</h5>
					<div class="desc">
				   	<p>Qty: <strong>&nbsp;24</strong></p>
				   	<p>Price:<strong>&nbsp;&#8377;220</strong></p>
				   </div>
				   <div class="button">
				   	<a class="btn btn-success text-light" href="addCart/7">Add to cart</a>
				   	<a class="btn btn-success text-light" href="buyProduct/7">Buy Now</a>
				  </div>
				</div>
			</div>
			
    	</div>
    </main>
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