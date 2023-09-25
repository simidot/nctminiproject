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
    <style type = "text/css">
    	.navbar {
    		position: relative;
    		z-index: 2;  /* 다른 요소보다 위에 표시될 수 있도록 설정 */
    		background-color: #DAE594 !important;
		}
		.navbar-brand a {
        color: #006400; /* 원하는 색상으로 변경하세요 */
        text-decoration: none; /* 링크 밑줄 제거 */
        font-size: 24px; /* 원하는 글자 크기로 변경하세요 */
        font-weight: bold; 
    	}
    .sidebar a {
        text-decoration: none; /* 링크 밑줄 제거 */
        font-size: 22px; /* 원하는 글자 크기로 변경하세요 */
        font-weight: bold; /* 굵게 만들고 싶으면 bold로 설정하세요 */
    }
    </style>
	  
</head>
<body class="d-flex flex-column vh-100">

<!-- Navbar -->
<div class="container-fluid">
    <div class="row">
        <!-- 왼쪽 사이드바 -->
        <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block text-white sidebar" style="background-color: #DCDCDC;">
            <div class="position-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="${ctxPath}/user/main" style="color: black;">
                            엔시티 멤버 보기
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctxPath}/admin/userlist" style="color: black;">
                            회원 정보 보기
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

</nav>
<!-- /Navbar -->
