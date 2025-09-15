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
    <title>Have Questions? Contact Us</title>
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
    	
    	<div class="container h-100">
    		<div class="row h-100 align-items-center ">
    			<div class="col-md-6 offset-md-3 text-center">
    				<h1>Contact Us>></h1>
    				<P style="font-size: 18px;">Feel free to reach out with any questions, feedback, or ideas we're here and happy to help!</P>
    			</div>
    		</div>
    	</div>
    </header>
    <main style="background-image: linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.3)), linear-gradient(#ffccff, #ff80ff);">
    	<div class="container text-dark" style=" justify-content: center;">
    		<div class="row">
    			<div class="col-md-6 offset-md-3">
    				<form action="query" method="post">
    				  <input type="hidden" name="id" value="${user.getId()}"/>
    				  <div class="form-group">
					    <label for="InputName">Your Name: </label>
					    <input type="text" class="form-control" name="name" id="exampleFormControlInput1" placeholder="Enter Here!" required>
					  </div>
					  <div class="form-group">
					    <label for="InputEmail">Your Email</label>
					    <input type="email" class="form-control" name="email" id="exampleFormControlInput1" placeholder="name@example.com" required>
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleFormControlTextarea1">Your Query</label>
					    <textarea class="form-control" name="query" id="exampleFormControlTextarea1" rows="3" required></textarea>
					  </div>
					  <div class="text-center">
					  	<button class="btn btn-success text-white">Submit</button>
					  </div>
					</form>
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