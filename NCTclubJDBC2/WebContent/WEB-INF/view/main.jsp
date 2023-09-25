<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header html -->
<%@ include file="inc/header.jsp" %>
<c:if test="${sessionScope.loginDto.userrole.name() == 'ADMIN'}">
<%@ include file="inc/sidebar.jsp" %>
</c:if>

<!-- main html -->

	<div class = "container">
		<h2 class = "mb-3">전체 멤버 보기</h2>
		<table class="table">
		    <c:forEach var="nctmember" items="${nctmemberList}" varStatus="status">
		        <c:if test="${status.index % 4 == 0}">
		            <!-- 새로운 줄 시작 -->
		            <tr>

		        </c:if>
		        
		        <td style = "text-align: center; vertical-align: middle;">
		            <img src="${ctxPath}/resources/file_repo/${nctmember.IMAGE}" width="150" height="150">
		            <br>
		            <span style = "margin-top: 50px;">${nctmember.NAME}</span>
		            <a href="${ctxPath}/user/detail?memberId=${nctmember.MEMBERID}">
		            <button type="button" class="btn btn-secondary btn-sm">상세보기</button>
		        </td>
		
		        		<c:if test="${status.index % 4 == 3 or status.last}">
		            <!-- 줄 끝 -->
		            </tr>
		        </c:if>
		    </c:forEach>
		</table>
	</div>

    <!-- Bootstrap JS 및 jQuery 스크립트 링크 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>