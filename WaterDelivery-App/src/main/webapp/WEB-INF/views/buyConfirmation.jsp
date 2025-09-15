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
    <title>WaterLife- Complete Your Order & Buy Fresh Water Online</title>
  </head>
  <body style="background: #e2e2e2;">
  	
	<div class="container mt-5 text-center ">
		<div class="row">
			<div class="col-md-6 offset-md-3" style="background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.4)), #66ffff;">
				<h1 class="text-left">Order Summary :</h1>

				<table class="table mt-3">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Qty</th>
				      <th scope="col">Product</th>
				      <th scope="col">Price</th>
				    </tr>
				  </thead>
				  <tbody class="text-dark" style="background: #c9debd; font-weight: bolder; ">
					<c:choose>
				        <c:when test="${not empty cart}">
				            <c:forEach items="${cart}" var="c">
				                <tr>
				                    <th scope="row">${c.qty}</th>
				                    <td>${c.product}</td>
				                    <td>${c.price}</td>
				                </tr>
				            </c:forEach>
				        </c:when>
				
				        <c:when test="${not empty product}">
				            <tr>
				                <th scope="row">1</th>
				                <td>${product.product}</td>
				                <td>${product.price}</td>
				            </tr>
				        </c:when>
				    </c:choose>
				  </tbody>
				  </table>
				<div style="padding-right: 30px;">
					<h6 class="text-dark text-right pr-1">Delivery Fee : &nbsp;&#8377; 0.00 </h6>
					<h4 class="text-dark text-right">Total :&nbsp;&#8377; ${total}</h4>
				</div>
				<div class="container m-3 d-flex">
					<div class="d-flex">
						<div class="text-left">
							<small id="errorMsg" class=" mt-2" style="display:none; color: #b52400; font-weight: bolder; ">
								<i class="fa-solid fa-circle-info"></i>You must select a payment method
							</small>
						  <div class="dropdown mr-1">
						  	
						    <button id="payBtn" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false" data-offset="10,20">
						      Pay Now
						    </button>
						    <div class="dropdown-menu">
						      <a class="dropdown-item  pay-option">COD</a>
						      
						    </div>
						  </div>
						</div>
					</div>
					<div class="ml-auto pr-4">
						<a id="confirmBtn" class="btn bg-warning text-light text-center" href="confirm">Confirm Order</a>	
					</div>	
				</div>
				
			</div>
		</div>
	</div>
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	<script src="<c:url value='/resources/js/buyConfirmation.js'/>"></script>
  </body>
</html>