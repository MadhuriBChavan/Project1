<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
    <%@ include file="header.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body background="<c:url value="/resources/images/bg1.jpg" />">
<div class="container">
<div class="form-group">
  <label for="usr"><font color="black">Name:</font></label>
  <input type="text" class="form-control" id="usr">
</div>

<div class="form-group">
  <label for="email" class="text-primary">Email</label>
  <input type="text" class="form-control" id="email">
</div>

<div class="form-group">
  <label for="contact" class="text-primary">Contact</label>
  <input type="text" class="form-control" id="contact">
</div>

<div class="form-group">
  <label for="address" class="text-primary">Address:</label>
  <textarea class="form-control"  id="address"></textarea>
</div>
  
<div class="container">
  
  <form>
  <label for="address" class="text-primary">Gender:</label>
    <div class="radio">
      <label><input type="radio" name="optradio">Male</label>
    </div>
    <div class="radio">
      <label><input type="radio" name="optradio">Female</label>
    </div>
    
  </form>
</div>

</div>

<div class="container">
<button type="submit" class="btn btn-success" >Create My Account</button>

</div>
</body>

</html>