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
	<link rel="stylesheet" href="<c:url value='/resources/css/home.css'/>">
    <title>WaterLife- Learn About WaterLife & Our Mission</title>
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
  
    <header class="header">
    	<div class="container h-100 text-center" >
    		<div class="row h-100 align-items-center">
    			<div class="col-md-6 pr-5">
    				<img class="img-fluid  rounded waterCan" alt="about" src="${pageContext.request.contextPath}/resources/images/about.jpg">
    			</div>
    			<div class="col-md-6">
    				<h2 style="font-size: 28px; font-weight: bold;">About Us</h2><br>
    				<p class="text-left pl-5 p-1">India's No 1. Water Delivery App!</p>
    				<a class="btn btn-primary btn-lg pl-4 pr-4" href="#story">Visit</a>
    			</div>
    		</div>
    	</div>
    </header>
    <main>
    	<div id="story" class="container text-dark" style="height: 50vh; justify-content: center;">
    		
    		<h2 class="text-dark">Our Story:</h2>
    		<div class="row">
    			<div class="col md-6 offset-md-2">
    				<p class="text-left pl-5">
	    				<strong>Waterlife is a tech-driven enterprise based in India, specializing in the distribution of packaged drinking water. Through our innovative app, we connect vendors and distributors, enabling seamless access to clean water even in the most remote corners of the country.

						Customers can conveniently order 20 litre water containers from trusted brands like Bisleri,Aquafine etc.
						
						With flexible scheduling and location-based booking, Agua ensures doorstep delivery within 24 to 48 hours of placing your order.</strong>
    				</p>
    			</div>
    		</div>
    		<br>
    		<h2 class="text-dark">Our Goal:</h2>
	    	<div class="row">
	    		<div class="col md-6 offset-md-2">
	    			<p>
			    		<strong>At WaterLife, our goal is simple:<br> to make clean, safe, and reliable drinking water accessible to everyone, anytime, anywhere. We believe that staying hydrated should be effortless  whether you're at home, at work, or on the go. By combining fast delivery, eco-friendly practices, and top-quality water, we aim to build a healthier, more sustainable future, one bottle at a time.</strong>
			    	</p>
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