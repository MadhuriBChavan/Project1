<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<%@include file="header.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Purchase</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="bg-warning">
	
	<center><H1> List of Purchased Items</H1></center>
		<div class="container">
		<div class=table-responsive>
		
  			<table class="table table-bordered">
   				<thead>
       			<tr class="danger">
        			<th style="width: 10%">Product Name</th>
					<th style="width: 30%">Quantity</th>
					<th style="width: 10%">Price</th>
					<th style="width: 10%">Total Price</th>
					<th style="width: 10%">Remove</th>
				</tr>
    			</thead>	
		<!--  for Each product b in products -->
		<c:forEach items="${cartItem}" var="CI">
		
			<tr class="info">
  			<td>
				 <c:out value="${CI.product.product_Name}"></c:out>
			</td>
			 <td>	
			 	<c:out value="${CI.quantity}"></c:out> 
			 </td>
			 <td>	
			 	<c:out value="${CI.product.price}"></c:out> 
			 </td>
			 <td><c:out value="${CI.totalPrice}"></c:out></td>
			 
			 <td><a href="cart/removecartitem/${CI.cartItemId}"> <span class="glyphicon glyphicon-trash"></span></a></td>
			</tr>
	</c:forEach>						
	</table>	
<%@ include file="footer.jsp"%>
</div>
</div>
</body>
</html>