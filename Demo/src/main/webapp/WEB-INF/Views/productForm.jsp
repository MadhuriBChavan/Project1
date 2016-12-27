<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ include file="header.jsp"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>ADD New Product</title>
</head>
<body class="bg-warning">
<center><H3> Add New Product</H3></center>
	<c:url value="/admin/product/addProduct" var="url"></c:url>
	<form:form method="post" action="${url}" commandName="productFormObj" enctype="multipart/form-data">
	<table>
	<tr>
	<td><form:label path="PID"></form:label></td>
	<td><form:hidden path="PID"/> </td>
	</tr><br>
	<tr>
	<td><form:label path="product_Name">Product Name</form:label></td>
	<td><form:input path="product_Name"/> <form:errors path="product_Name" cssStyle="color: #ff0000"/></td><br>
	</tr><br>
	<tr>
	<td><form:label path="price">Price</form:label></td>
	<td><form:input path="price"/></td>
	</tr><br>
	<tr>
	<td><form:label path="category">CATEGORY</form:label></td>
	<td>
	<br><form:radiobutton path="category.CID" value="1"/>New Arrivals
	<br><form:radiobutton path="category.CID" value="2"/>Special Edition	
	<br><form:radiobutton path="category.CID" value="3"/>Discount Sale
	<br><form:radiobutton path="category.CID" value="4"/>General
	</td>
	</tr><br>
	
	<tr>
	<td><form:label path="supplier">Supplier</form:label></td>
	<td>
	<br><form:radiobutton path="supplier.SID" value="1"/>Ponds
	<br><form:radiobutton path="supplier.SID" value="2"/>Lorieal	
	<br><form:radiobutton path="supplier.SID" value="3"/>Addidas
	<br><form:radiobutton path="supplier.SID" value="4"/>Lotus
	</td>
	</tr><br>
	
	<tr>
	<td><form:label path="productImage">image</form:label></td>
	<td><form:input type="file" path="productImage"/></td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="AddProduct" class="btn btn-success"></td>
	</tr>
	</table>
	</form:form>
	<%@ include file="footer.jsp"%>
</div>
</div>
</body>
</html>