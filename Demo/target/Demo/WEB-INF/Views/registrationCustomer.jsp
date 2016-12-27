<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="header.jsp"%>
<%@page isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

@import url(http://fonts.googleapis.com/css?family=Vibur);
.jumbotron {
    position: relative;
    background: #000 url("/resources/images/background.jpg") center center;
    width: 100%;
    height: 100%;
    background-size: cover;
    overflow: hidden;
    
  } 
  
* {
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  font-family:arial;
}



h1 {
  color:Green;
  text-align: center;
  font-family: 'Vibur', cursive;
  font-size: 50px;
}


h3 {
  color:Green;
  text-align: left;
  font-family: 'Vibur', cursive;
  font-size: 50px;
}

p {
  color:Green;
  text-align: left;
  font-family: 'Vibur', cursive;
  font-size: 50px;
}

.login-form {
  width: 350px;
  padding: 40px 30px;
  background: #eed;
  -moz-border-radius: 4px;
  -webkit-border-radius: 4px;
  border-radius: 4px;
  margin: auto;
  position: absolute;
  left: 50%;
  right: 0;
  top: 50%;
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}

.form-group {
  position: relative;
  margin-bottom: 15px;
}

.form-control {
  width: 30%;
  height: 35px;
  border: none;
  padding: 5px 7px 5px 15px;
  background: #fff;
  color: #666;
  border: 2px solid #ddd;
  -moz-border-radius: 4px;
  -webkit-border-radius: 4px;
  border-radius: 4px;
}
.form-control:focus, .form-control:focus + .fa {
  border-color: #10CE88;
  color: #10CE88;
}

.form-group .fa {
  position: absolute;
  right: 15px;
  top: 17px;
  color: #999;
}

.log-status.wrong-entry {
  -moz-animation: wrong-log 0.3s;
  -webkit-animation: wrong-log 0.3s;
  animation: wrong-log 0.3s;
}

.log-status.wrong-entry .form-control, .wrong-entry .form-control + .fa {
  border-color: #ed1c24;
  color: #ed1c24;
}

.log-btn {
  background: #FAC986;
  dispaly: inline-block;
  width: 10%;
  font-size: 16px;
  height: 35px;
  color: #fff;
  text-decoration: none;
  border: none;
  -moz-border-radius: 4px;
  -webkit-border-radius: 4px;
  border-radius: 4px;
}

.link {
  text-decoration: none;
  color: white;
  float: center;
  font-size: 12px;
  margin-bottom: 15px;
}
.link:hover {
  text-decoration: underline;
  color: #8C918F;
}

.alert {
  display: none;
  font-size: 12px;
  color: #f00;
  float: left;
} 
   
</style>

<title>Registration</title>  
</head>
<body class="bg-warning">

<div class="container">
<div class="page-header">
<center><h1><i>Sign UP Here</i>.....!</h1></center>

<p class="lead">Please fill in your information below:</p>
</div>
<h3>Basic Information</h3>
<section>
<div class="jumbotron" style="background-color:pink">
<div class="container">
 
<c:url value="/customer/registration" var="url"></c:url>
<form:form action="${url }" method="post" commandName="customer">

<div class="form-group">
<label for="name">Name</label>
<form:input path="customerName" class="form-Control"/><form:errors path="customerName" cssStyle="color: #ff0000"/>
</div>

<c:if test="${duplicateEmail!=null }">
        ${duplicateEmail }
</c:if>

<div class="form-group">
<label for="email">Email</label>
<form:input path="customerEmail" type="email" class="form-Control"/><form:errors path="customerEmail" cssStyle="color: #ff0000"/>
</div>

<div class="form-group">
<label for="phone">Phone</label>
<form:input path="customerPhone" type="tel" class="form-Control"/>
</div>

<c:if test="${duplicateUname!=null }">
			 ${duplicateUname }
</c:if>

<div class="form-group">
<label for="username">Username</label>
<form:input path="users.username" class="form-Control"/><form:errors path="users.username" cssStyle="color: #ff0000"/>
</div>

<div class="form-group">
<label for="password">Password</label>
<form:password path="users.password" class="form-Control"/><form:errors path="users.password" cssStyle="color: #ff0000"/>
</div>
</section>
<br/>

<h3>Shipping Address:</h3>
<section>
<div class="jumbotron">
<div class="container">
  
<div class="form-group">
<label for="billingStreet">Street Name</label>
<form:input path="billingAddress.streetName" class="form-Control"/><form:errors path="billingAddress.streetName" cssStyle="color: #ff0000"/>
</div>

<div class="form-group">
<label for="billingApartmentNumber">Apartment Number</label>
<form:input path="billingAddress.apartmentNumber" class="form-Control"/><form:errors path="billingAddress.apartmentNumber" cssStyle="color: #ff0000"/>
</div>

<div class="form-group">
<label for="billingCity">City</label>
<form:input path="billingAddress.city" class="form-Control"/><form:errors path="billingAddress.city" cssStyle="color: #ff0000"/>
</div>

<div class="form-group">
<label for="billingState">State</label>
<form:input path="billingAddress.state" class="form-Control" required="true"/><form:errors path="billingAddress.state" cssStyle="color: #ff0000"/>
</div>

<div class="form-group">
<label for="billingCountry">Country</label>
<form:input path="billingAddress.country" class="form-Control"/><form:errors path="billingAddress.country" cssStyle="color: #ff0000"/>
</div>

<div class="form-group">
<label for="billingZip">Zipcode</label>
<form:input path="billingAddress.zipcode" class="form-Control"/><form:errors path="billingAddress.zipcode" cssStyle="color: #ff0000"/>
</div>
</section>
<br/>

<br/><br/>

<input type="submit" value="Register" class="btn btn-success">
<a href="<c:url value="/home"/>" class="btn btn-danger">Cancel</a>

</form:form>
</div>
</div>
<%@include file="footer.jsp"%>
	
</body>
</html>