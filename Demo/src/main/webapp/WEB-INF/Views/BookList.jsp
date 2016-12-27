<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<%@include file="header.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js"></c:url>"> </script>

<title>Product Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="bg-warning">
<div ng-app="app">
<div ng-controller="myController" ng-init="getProduct()">


<center>Search: <input type="text"  ng-model="searchCondition" placeholder="Search product"></center>

	
	<center><H1> List of PRODUCTS</H1></center>
		<div class="container">
		<div class=table-responsive>
		
  			<table border="0" class="table table-striped table-hover">
   				<thead>
       			<tr class="danger">
        			<th style="width: 10%">Product ID</th>
					<th style="width: 30%"> Image</th>
					<th style="width: 10%">Product Name</th>
					<th style="width: 10%">Category</th>
					<th style="width: 10%">View</th>
						 <security:authorize access="hasRole('ROLE_ADMIN')">
			        <th style="width: 10%">Edit Product</th>
			        <th style="width: 10%">Delete Product</th>  
			        </security:authorize>
      			</tr>
    			</thead>	
    			</tbody>
		<!--  for Each product b in products -->
		<!--<c:forEach items="${products}" var="b">-->
		<tr ng-repeat="b in products | filter:searchCondition">
        <c:url value="resources/images/{{b.PID}}.png" var="src"/>
		
		    <td>{{p.pid}}</td>
			<td>
			 	<img src="<c:url value="/resources/images/${b.PID }.png"/>" width="20%"/>
			 </td>
		
		
		<td>{{p.product_Name}}</td>
		<td>{{p.category.categoryName}}</td>
		<td><a href="getProductByPID/{{p.pid}}"> <span class="glyphicon glyphicon-info-sign"></span></a>
		<security:authorize access="hasRole('ROLE_ADMIN')">
		<a href="admin/delete/{{p.pid}}"> <span class="glyphicon glyphicon-trash"></span></a>
		<a href="admin/product/editProduct/{{p.pid}}"> <span class="glyphicon glyphicon-edit"></span></a>
		</security:authorize>
	<!--</c:forEach>-->
	</table>	
<%@ include file="footer.jsp"%>
</div>
</div>
</body>
</html>