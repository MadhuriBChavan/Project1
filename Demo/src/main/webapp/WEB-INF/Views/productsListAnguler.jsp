<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
    <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js"></c:url>">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div ng-app="app">
<div ng-controller="myController" ng-init="getProduct()">


Search: <input type="text" ng-model="searchCondition" placeholder="Search Cars">
<H1> List of Products</H1>
	<!--  use JSTL tags -->
	<!--  iterate list of objects -->
	<!--  For each book b in books -->
	<table border="0" class="table table-striped table-hover">
	<thead>
		<tr class="bg-danger">
		<th>Image</th>
			<th>ID</th>
			<th>TITLE</th>
			<th>CATEGORY NAME</th>
			<th>View/edit/delete</th>
		</tr>
</thead>
<tbody>
<tr ng-repeat="p in products | filter:searchCondition">
<c:url value="resources/images/${p.PID}.png" var="src" />
		<td ><img src="${src }" style="width: 30%" align="middle"/></td>
		<td>{{p.PID}}</td>
		<td>{{p.product_Name}}</td>
		<td>{{p.category.categoryName}}</td>
		<td><a href="getProductByPID/{{p.PID}}"><span class="glyphicon glyphicon-info-sign"></span></a>
		<security:authorize  access="hasRole('ROLE_ADMIN')">
		<a href="admin/delete/{{p.PID}}"><span class="glyphicon glyphicon-trash"></span></a>
		<a href="admin/product/editProduct/{{p.PID}}"><span class="glyphicon glyphicon-edit"></span></a>
		</security:authorize>
</tr>

</tbody>
</table>
</div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
