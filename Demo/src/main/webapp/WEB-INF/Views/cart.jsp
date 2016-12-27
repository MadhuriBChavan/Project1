<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp"%>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"> </script>
<script src="<c:url value="/resources/js/controller.js"></c:url>"> </script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		

</head>

<body >
	<div class="container-wrapper">
		<div class="container">
			<section>
				<div class="jumbotron">
					<div class="container">
						<h3>Cart</h3>
						<p>All the selected products in your shopping cart</p>
					</div>
				</div>
			</section>
			<section>
	<div ng-app="app" ng-controller="myController">
		<div ng-init="getCart(${cartId})">
			<br>
				List of products purchased
	<div>
		<a class="btn btn-danger pull-right" ng-click="clearCart()"> 
		<span class="glyphicon glyphicon-remove-sign"></span> Clear Cart</a>
		
		<c:url value="/order/${cartId}" var="url"></c:url>
		<a href="${url }" class="btn btn-success pull-left">Order</a>
	
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Product Name</th>
				<th>QUANTITY</th>
				<th>Price</th>
				<th>TOTAL PRICE</th>
			</tr>
		</thead>
			<tr ng-repeat="cartitem in cart.cartItem">
				<td>{{cartitem.product.product_Name}}</td>
				<td>{{cartitem.quantity}}</td>
				<td>{{cartitem.product.price}}</td>
				<td>{{cartitem.totalPrice}}</td>
				<td><a href="#" class="btn btn-danger pull-right" ng-click="removeFromCart(cartitem.cartItemId)">
				<span class="glyphicon glyphicon-remove"> </span>remove</a>
				</td>
			</tr>
	</table>
	</div>
	
	
	<section>
				<div class="jumbotron">
					<div class="container">
						<h3></h3>
						<p>shopping cart</p>
					</div>
				</div>
			</section>
			
	
	<c:url value="/productsListAngular" var="url"></c:url>
		<a href="${url }" class="btn btn-info pull-right">Continue shopping</a>
		
<div class="container">
 <div class="page-header">
   <h4><i>Grand Total</i></h4>
	</div>
	{{calculateGrandTotal()}}
	</div>
	</div>
	
</div>
</div>
</section>


</body>
</html>
