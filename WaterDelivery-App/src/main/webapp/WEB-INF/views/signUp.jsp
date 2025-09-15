<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="./base.jsp" %>
<meta charset="UTF-8">
<title>Join Us | Fresh Water at Your Doorstep</title>
<link rel="stylesheet" href='<c:url value="resources/css/login.css"/>'>
</head>
<body>
	<div class="container" >
		<div class="row">
			<div class="col-md-6 offset-md-3 mt-5 text-white p-3">
				<form action="registration" method="post">
				    <div class="form-group">
				      <label for="inputname">Name</label>
				      <input type="text" class="form-control" name="name" id="inputEmail4" placeholder="Enter Name" required>
				    </div>
				    <div class="form-group">
				      <label for="inputEmail4">Mobile No.</label>
				      <input type="tel" class="form-control" name="mobile" id="inputEmail4" pattern="[0-9]{10}" maxlength="10" placeholder="Enter 10 digit Mobile No." required>
				    	<c:if test="${not empty mobile}">
						   <small class="text-danger">${mobile}</small>
						</c:if>
				    </div>
				    <div class="form-group">
				      <label for="inputPassword4">Password</label>
				      <input type="password" class="form-control" name="password" id="inputPassword4" placeholder="Password" required
				         pattern="^(?=.*[0-9]).{8,}$"
				         title="Password must be at least 8 characters long and contain at least one number">
				    </div>
				    <div class="form-group">
				      <label for="inputEmail4">Email</label>
				      <input type="email" class="form-control" name="email" id="inputEmail4" placeholder="Email" required>
				    	<c:if test="${not empty email}">
						   <small class="text-danger">${email}</small>
						</c:if>
				    </div>
				  <div class="form-group">
				    <label for="inputAddress">Address</label>
				    <input type="text" class="form-control" name="buldingNo" id="inputAddress" placeholder="Building No, Road No." required>
				  </div>
				  <div class="form-row">
					  <div class="form-group col-md-6">
					     <label for="inputCity">City</label>
					     <input type="text" class="form-control" name="city" id="inputCity" required>
					   </div>
					    <div class="form-group col-md-6">
					      <label for="inputState">State</label>
					      <input type="text" class="form-control" name="state" id="inputState" required>
					    </div>
					    <div class="form-group col-md-6">
					      <label for="inputZip">Pin No.</label>
					      <input type="text" class="form-control" name="pin" id="inputZip" pattern="[0-9]{6}" maxlength="6" placeholder="Enter 6-digit PIN" required>

					    </div>
					 </div>
					 <div class="text-center mt-3">
						 <a class="btn btn-danger m-3" href="login">Back</a>
						 <button type="submit" class="btn btn-success text-white m-3">Sign Up</button>
					 </div>
				  </form>
			</div>
		</div>
	</div>
</body>
</html>