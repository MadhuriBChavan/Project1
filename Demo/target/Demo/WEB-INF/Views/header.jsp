
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@page isELIgnored="false" %>

  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"></c:url>"> </script>
<script src="<c:url value="/resources/js/bootstrap/bootstrap.min[1].css"></c:url>"> </script>
<script src="<c:url value="/resources/js/bootstrap/angular.min.js"></c:url>"> </script>
<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"></c:url>"> </script>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Beauty Product</title>
</head>
<body  class="bg-warning">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
      <a class="navbar-brand" href="#">Beauty</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
  			<ul class="nav navbar-nav ">
				<li class="active"><a href="<c:url value="/home"/>"> Home</a></li>
				<li><a href="<c:url value="/about"/>"> About us</a></li>
				<li><a href="<c:url value="/contact-us"/>">Contact-Us</a></li>
				</ul>
				
				<security:authorize access="hasAnyRole('ROLE_ADMIN,ROLE_USER')">
				<ul class="nav navbar-nav ">
				  <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Product <span class="caret"></span></a>
          </security:authorize>
          <ul class="dropdown-menu">
          	<c:if test="${pageContext.request.userPrincipal.name!=null}">
		        	<security:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="<c:url value="/admin/product/addProduct"/>"> Add New Product</a></li>
            </security:authorize>
            </c:if>    
            <li><a href="<c:url value="/productsListAngular" />" > Browse All Product</a></li>
          </ul>
        </li>
      
      
      <security:authorize access="hasAnyRole('ROLE_ADMIN,ROLE_USER')">
		 <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
          </security:authorize>
          <ul class="dropdown-menu">
          	<c:if test="${pageContext.request.userPrincipal.name!=null}">
		        	<security:authorize access="hasRole('ROLE_ADMIN')">
           <li><a href="<c:url value="/admin/category/addCategory"/>"> Add New Category</a></li>
            </security:authorize>
            </c:if>    
            <li><a href="<c:url value="/getAllCategories" />" > Browse All Category</a></li>
          </ul>
        </li>
       
     	<security:authorize access="hasAnyRole('ROLE_ADMIN,ROLE_USER')">
	   <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">supplier <span class="caret"></span></a>
          </security:authorize>
          <ul class="dropdown-menu">
          	<c:if test="${pageContext.request.userPrincipal.name!=null}">
		        	<security:authorize access="hasRole('ROLE_ADMIN')">
           <li><a href="<c:url value="/admin/supplier/addSupplier"/>"> Add New Supplier</a></li>
            </security:authorize>
            </c:if>    
            <li><a href="<c:url value="/getAllSuppliers" />" > Browse All Supplier</a></li>
          </ul>
        </li>
        </ul>
        
				<!--<c:if test="${pageContext.request.userPrincipal.name!=null}">
		        	<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="<c:url value="/admin/product/addProduct"/>"> Add New Product</a></li>
						<li><a href="<c:url value="/admin/category/addCategory"/>"> Add New Category</a></li>
						<li><a href="<c:url value="/admin/supplier/addSupplier"/>"> Add New Supplier</a></li>
					</security:authorize>
				<li><a href="<c:url value="/productsListAngular" />" > Browse All Product</a></li>
				<li><a href="<c:url value="/getAllCategories" />" > Browse All Category</a></li>
		      	<li><a href="<c:url value="/getAllSuppliers" />" > Browse All Supplier</a></li>
		      	</c:if>
		      	</ul>-->
		      	
		      	<ul class="nav navbar-nav navbar-right">
				<c:if test="${pageContext.request.userPrincipal.name!=null}">
				<security:authorize access="hasRole('ROLE_USER')">
				<li><a href=<c:url value="/cart/getCartId"/>> <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
				</security:authorize>
				<li><a>Welcome ${pageContext.request.userPrincipal.name }</a></li>	
			   <li><a href="<c:url value="/j_spring_security_logout"/>">logout</a></li>			  
		      	</c:if>
		      	</ul>
				
		<c:if test="${pageContext.request.userPrincipal.name==null}">
			<ul class="nav navbar-nav navbar-right">
      			<li><a href="<c:url value="/customer/registration"/>"> <span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      			<li><a href="<c:url value="/login"/>"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    		</ul>
   	 </c:if>
	</div>
	</div>
</nav>
</body>
</html>