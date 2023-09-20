<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/> 
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">    
    <style>
    	.navbar {
    		position: relative;
    		z-index: 2;  /* 다른 요소보다 위에 표시될 수 있도록 설정 */
		}
    	
    </style>
  
	  
</head>
<body class="d-flex flex-column vh-100">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="mx-auto order-0" >
    	<img alt="nct logo" src="${ctxPath}/resources/img/NCT-logo.jpg" style="width: 50px; height: 50px;">
        <a class="navbar-brand mx-auto" href="${ctxPath}/user/main">NCTclub</a>
    </div>

    <div class="navbar-collapse collapse order-3" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${ctxPath}/user/loginform">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${ctxPath}/user/registerform">Register</a>
            </li>
           
        </ul>
    </div>
</nav>
<!-- /Navbar -->
