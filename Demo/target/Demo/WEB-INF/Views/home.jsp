<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"></c:url>"> </script>
<script src="<c:url value="/resources/js/bootstrap/bootstrap.min[1].css"></c:url>"> </script>
<script src="<c:url value="/resources/js/bootstrap/angular.min.js"></c:url>"> </script>
<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"></c:url>"> </script>
<head>
  <title> Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
   /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
	/* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body class="bg-warning">
               

<div id="myCarousel" class="carousel slide" >
  <!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarouse2" data-slide-to="1"></li>
		<li data-target="#myCarouse3" data-slide-to="2"></li>
		<li data-target="#myCarouse4" data-slide-to="3"></li>
	</ol>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarouse2" data-slide-to="1"></li>
		<li data-target="#myCarouse3" data-slide-to="2"></li>
		<li data-target="#myCarouse4" data-slide-to="3"></li>
	</ol>

  <!-- Wrapper for slides -->
<div class="carousel-inner" role="listbox">
	<div class="item active">
		<img src="<c:url value="/resources/images/I1.jpg" />" alt="Melencolia">
		<div class="carousel-caption">
			<h3><i>Lakme</i></h3>
			<p>Happy Shopping</p>
		</div>
    </div>
	<div class="item">
		<img src="<c:url value="/resources/images/I2.jpg" />" alt="Technlogy">
		<div class="carousel-caption">
			<h3><i>Lakme</i></h3>
			<p>Happy Shopping</p>
		</div>
	</div>

	<div class="item">
		<img src="<c:url value="/resources/images/I3.jpg" />" alt="Technlogy">
		<div class="carousel-caption">
			<h3><i>Lakme</i></h3>
			<p>Happy Shopping</p>
		</div>
	</div>

	<div class="item">
		<img src="<c:url value="/resources/images/I4.jpg" />" alt="Technlogy">
		<div class="carousel-caption">
			<h3><i>Lakme</i></h3>
			<p>Happy Shopping</p>		
			</div>
	</div>
	
	<div class="item">
		<img src="<c:url value="/resources/images/I5.JPG" />" alt="Technlogy">
		<div class="carousel-caption">
			<h3><i>Lakme</i></h3>
			<p>Happy Shopping</p>
		</div>
	</div>
 </div>
 </div>
 
 <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  

  
<div class="container text-center">
	<h3>SAMPLE</h3><br>
	<div class="row">
		<div class="col-sm-3">
			<p>Lakme</p>
			<img src="<c:url value="/resources/images/1.png" />" class="img-responsive" style="width:100%" alt="Image">
		</div>
    <div class="col-sm-3">
      <p>Lakme</p>
      <img src="<c:url value="/resources/images/16.jpg" />" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Lakme</p>
      <img src="<c:url value="/resources/images/3.png" />" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Lakme</p>
      <img src="<c:url value="/resources/images/18.jpg" />" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br>

<div class="container text-center">
  <div class="row">
    <div class="col-sm-3">
      <p>Lakme</p>
      <img src="<c:url value="/resources/images/img1.jpg" />" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Lakme</p>
      <img src="<c:url value="/resources/images/img10.jpg" />" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Lakme</p>
      <img src="<c:url value="/resources/images/img8.jpg" />" class="img-responsive" style="width:100%" alt="Image">
    </div>

<div class="col-sm-3">
      <p>Lakme</p>
      <img src="<c:url value="/resources/images/img9.jpg" />" class="img-responsive" style="width:100%" alt="Image">
    </div>




  </div>
</div><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>