<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js"></c:url>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style> 

input[type=text] {
    width: 30%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
}
</style>

</head>
<body class="bg-warning">
<div ng-app="app">
<div ng-controller="myController" ng-init="getProduct()">


Search: <input type="text" ng-model="searchCondition" placeholder="Search product">
<H1> List of Products</H1>
	<!--  use JSTL tags -->
	<!--  iterate list of objects -->
	<!--  For each product p in products -->
	<div class="container">
		<div class=table-responsive>
		
	<table border="0" class="table table-striped table-hover">
	<thead>
		<tr>
			<th>PID</th>
			<th>Image</th>
			<th>NAME</th>
			<th>CATEGORY NAME</th>
			<th>SUPPLIER NAME</th>
			<th>View</th>
			<security:authorize access="hasRole('ROLE_ADMIN')">
			<th>Edit</th>
			<th>Delete</th>
			</security:authorize>
		</tr>
</thead>
<tbody>
		<tr ng-repeat="p in products | filter:searchCondition">
		<c:url value="resources/images/{{p.PID}}.png" var="src" />
		<td>{{p.pid}}</td>
		<td><img src="<c:url value="/resources/images/{{p.pid }}.png" />" width="10%"/></td>
		<td>{{p.product_Name}}</td>
		<td>{{p.category.categoryName}}</td>
		<td>{{p.supplier.supplierName}}</td>
		<td><a href="getProductByPID/{{p.pid}}"> <span class="glyphicon glyphicon-info-sign"></span></a>
		<security:authorize access="hasRole('ROLE_ADMIN')">
		<td><a href="admin/delete/{{p.pid}}"> <span class="glyphicon glyphicon-trash"></span></a></td>
		<td><a href="admin/product/editProduct/{{p.pid}}"> <span class="glyphicon glyphicon-edit"></span></a></td>
		</security:authorize>
</tr>

</tbody>
</table>
</div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
