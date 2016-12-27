<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js"></c:url>"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product By Id</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="bg-warning">
<div ng-app="app">
<center><H3> Product List</H3></center>
	<div class="container">

  <table class="table table-bordered">
  
   <thead>
       <tr class="success">
        <th style="width: 10%">Product ID</th>
        <th style="width: 30%">Image</th>
        <th style="width: 10%">Product Name</th>
        <th style="width: 10%">Price</th>
        <security:authorize access="hasRole('ROLE_USER')">
        <th style="width:10%">AddToCart</th>
        </security:authorize>
      </tr>
      </thead>
   
        <tr class="danger">
  		<td>
		<c:out value="${productObj.PID}"></c:out>
 		</td>
 		<td>
 		<img src="<c:url value="/resources/images/${productObj.PID }.png"/>" width="40%"/>
 		</td>
  		<td>
			 <c:out value="${productObj.product_Name }"></c:out>
 		</td>
 
         <td>
			 <c:out value="${productObj.price }"></c:out>
 		</td>
  		<td>
  		<c:url value="/cart/add/${productObj.PID}" var="url"></c:url>
        <div ng-controller="myController">
        <security:authorize access="hasRole('ROLE_USER')">
        <a href="#"  ng-click="addToCart(${productObj.PID})" class="btn btn-warning btn-large"> <span>AddTOCart</span></a>
        <br>
        <br>
        <a href="<c:url value="/productsListAngular"></c:url>" class="btn btn-danger btn-large">Back</a><br><br>
        <a href="<c:url value="/getAllCartItems"></c:url>" class="btn btn-danger btn-large">View Cart</a>
  		</security:authorize>
  		</td>
  		
		</tr>		
	</table>	
</div>

		<script src="<c:url value="/resources/js/controller.js"/>"></script>
		<%@include file="footer.jsp"%>
		</div>
</body>
</html>