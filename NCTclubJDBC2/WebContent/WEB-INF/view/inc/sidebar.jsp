<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/> 

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/styles.css">
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">    
  
<body class="d-flex flex-column vh-100">

<!-- Navbar -->
<div class="container-fluid">
    <div class="row">
        <!-- 왼쪽 사이드바 -->
        <nav id="sidebar" class="sidebar col-md-3 col-lg-2 d-md-block text-white sidebar">
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


<script>
// 페이지 로드 시 사이드바 높이 설정
function setSidebarHeight() {
    const sidebar = document.getElementById("sidebar");
    const windowHeight = window.innerHeight;
    const navbarHeight = document.querySelector(".navbar").offsetHeight;
    const sidebarHeight = windowHeight - navbarHeight;
    sidebar.style.height = `${sidebarHeight}px`;
}

// 페이지 로드 및 리사이즈 이벤트에 대한 이벤트 핸들러 등록
window.addEventListener("load", setSidebarHeight);
window.addEventListener("resize", setSidebarHeight);
</script>
