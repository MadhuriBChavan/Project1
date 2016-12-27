<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@include file="header.jsp"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edit Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
		<c:url value="/admin/supplier/editSupplier" var="url"></c:url>
	<form:form method="post" action="${url}" commandName="editSupplierObj">
	<table>
	<tr>
	<td><form:label path="SID">SID</form:label></td>
	<td><form:input path="SID" disabled="true"/>
	<td><form:hidden path="SID"/> </td>
	</tr>
	<tr>
	<td><form:label path="SupplierName">Product Name</form:label></td>
	<td><form:input path="SupplierName"/></td>
	</tr>
	<tr>
	<tr>
	<td colspan="2"><input type="submit" value="Edit Supplier"></td>
	</tr>
	</table>
	</form:form>
</body>
</html>