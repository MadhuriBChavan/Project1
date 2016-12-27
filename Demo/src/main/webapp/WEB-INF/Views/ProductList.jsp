<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<%@include file="header.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Product Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="bg-warning">
	
	<center><H1> List of PRODUCTS</H1></center>
		<div class="container">
		<div class=table-responsive>
		
  			<table class="table table-bordered">
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
		<!--  for Each product b in products -->
		<c:forEach items="${products}" var="b">
		
			<tr class="info">
  			<td>
				 <c:out value="${b.PID}"></c:out>
			</td>
			<td>
			 	<img src="<c:url value="/resources/images/${b.PID }.png"/>" width="20%"/>
			 </td>
			 <td>	
			 	<c:out value="${b.product_Name}"></c:out> 
			 </td>
			 <td><c:out value="${b.category.categoryName }"></c:out></td>
			<td> 
			 <a href="getProductByPID/${b.PID}">
             <span class="glyphicon glyphicon-info-sign"></span> 
           </a>
              </td>
			 
			 <security:authorize access="hasRole('ROLE_ADMIN')">
			 <td>
				<a href="admin/product/editProduct/${b.PID }"><span class="glyphicon glyphicon-edit"></span></a>
			</td>
			<td>
				
 				<a href="delete/${b.PID }"><span class="glyphicon glyphicon-trash"></span></a>
 			</td>
  			</security:authorize>
		</tr>

	</c:forEach>
	</table>	
<%@ include file="footer.jsp"%>
</div>
</div>
</body>
</html>