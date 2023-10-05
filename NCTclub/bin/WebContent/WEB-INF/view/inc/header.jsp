<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/> 
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">    
	<link rel="stylesheet" type="text/css" href="${ctxPath}/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>        
</head>
<body class="pt-3" style="padding-bottom: 80px;">

	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="height: 80px;">
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	
		<div class="navbar-brand mx-auto order-md-1" style="position: absolute; left: 50%; transform: translateX(-50%);">
			<img alt="nct logo" src="${ctxPath}/resources/img/NCT-logo.jpg" style="width: 50px; height: 50px;">
		    <a href="${ctxPath}/user/main"  style="color: black;" >NCTclub</a>
		</div>
	
	
		<div class="navbar-collapse collapse order-3" id="navbarNav">
		    <ul class="navbar-nav ml-auto">
		        <c:choose>
		            <c:when test="${not empty sessionScope.loginDto}">
		                <li class="nav-item">
		                    <a class="nav-link" href="${ctxPath}/user/logout">Logout</a>
		                </li>
		            </c:when>
		            <c:otherwise>
		                <li class="nav-item active">
		                    <a class="nav-link" href="${ctxPath}/user/loginform">Login</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link" href="${ctxPath}/user/registerform">Register</a>
		                </li>
		            </c:otherwise>
		        </c:choose>
		    </ul>
		</div>
	</nav>
	
<!-- /Navbar -->
