<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="./base.jsp" %>
<meta charset="UTF-8">
<title>Access Your Account- Fast & Reliable Water Delivery</title>
<link rel="stylesheet" href='<c:url value="/resources/css/login.css"/>'>
</head>
<body>
	<div class="notification text-dark">
	    <c:if test="${not empty send}">
			<div class="toast">
				<i class="bi bi-x"></i>
			    <span>${send}</span>
			 </div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="toast text-light bg-success">
			    <span>${msg}</span>
			 </div>
		</c:if>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3 mt-5 text-white p-3">
				<div class="div-1">
					<form action="userLogin" >
						<div class="form-group">
					      <label for="inputEmail4">Mobile No.</label>
					      <input type="tel" class="form-control" id="inputEmail4" min="10" maxlength="10" 
					      	name="mobile" placeholder="Enter 10 digit Mobile No." required>
					    </div>
					    <div class="form-group">
					      <label for="inputPassword4">Password</label>
					      <input type="password" class="form-control" id="inputPassword4" 
					      	name="password" placeholder="Enter Password" required>
					    </div>
						<div class="text-center mt-5">
						 <button type="submit" class="btn btn-primary text-white">Login</button>
						</div>
					</form>
					<p class="text-center">
						Don't Have an Account?
						<a href="signUp">&nbsp; Sign Up</a>
					</p>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>