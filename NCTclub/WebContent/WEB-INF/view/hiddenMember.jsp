<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="userRole" value="${sessionScope.loginDto.userrole.name()}"/>
 
<%@ include file="inc/header.jsp" %>
<div class="container-fluid">
    <div class="row">
    
	    <c:choose>
		    <c:when test="${userRole == 'ADMIN'}">
		        <%@ include file="inc/sidebar.jsp" %>
		        <div class="col-md-9">
		    </c:when>
		    <c:otherwise>
		        <div class="col-md-12">
		    </c:otherwise>
		</c:choose>
		
			<div class = "container">
					<h2 class="mb-3 text-center">HIDDEN NCT MEMBER</h2>
						<form action="${ctxPath}/user/searchmember" method="get">
					
					<div class="search-container" style="display: flex; align-items: center; max-width: 600px; margin: 0 auto;">
					    <select name = "option" class="search-option" style="flex: 1; padding:3px; width: 60px; margin-right: 10px; border: 1px solid #ccc; border-radius: 4px; font-size: 15px; outline: none;">
					   <c:choose>
				            <c:when test="${not empty param.option}">
				                <!-- 컨트롤러에서 받은 검색 옵션 값이 있는 경우 -->
				                <option value="n" <c:if test="${param.option == 'n'}">selected</c:if>>이름</option>
				                <option value="g" <c:if test="${param.option == 'g'}">selected</c:if>>그룹명</option>
				            </c:when>
				            <c:otherwise>
				                <!-- 컨트롤러에서 검색 옵션 값을 받지 않은 경우 -->
				                <option value="n" selected>이름</option>
				                <option value="g">그룹명</option>
				            </c:otherwise>
				        </c:choose>
					    </select>
					    <div class="search-input-container" style="flex: 1;">
					    	<c:choose>
				            <c:when test="${not empty param.search}">
				            	<input type="text" name = "search" class="search-input" value="${param.search}" style="width: 100%; margin-right: 20px; padding:3px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; outline: none;">
				            </c:when>
				            <c:otherwise>
				            	<input type="text" name = "search" class="search-input" placeholder="검색어를 입력하세요" style="width: 100%; margin-right: 20px; padding:3px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; outline: none;">
				            </c:otherwise>
				        	</c:choose>
					    </div>
					    <div class="search-button-container" style="flex: 1;">
					        <button type ="submit" class="search-button" style="padding:3px 7px; background-color: #000; border: none; border-radius: 4px; color: #fff; cursor: pointer; font-size: 16px;">검색</button>
					    </div>
					</div>
   				 </form>

					
					<table class="table">
					    <c:forEach var="nctmember" items="${nctmemberList}" varStatus="status">
					        <c:if test="${status.index % 4 == 0}">
					            <!-- 새로운 줄 시작 -->
					            <tr>
					        </c:if>
					        <td style="text-align: center; vertical-align: middle; font-size: 25;">
					            <span><strong>${nctmember.name}</strong></span><br>
					            <img src="${ctxPath}/resources/file_repo/${nctmember.image}" width="150" height="150"><br>
					            <a href="${ctxPath}/user/detail?memberId=${nctmember.memberId}" class="btn btn-dark btn-sm p-1 mt-2">상세보기</a>
					        </td>
					        <c:if test="${status.index % 4 == 3 or status.last}">
					            <!-- 줄 끝 -->
					            </tr>
					        </c:if>
					        <c:if test="${status.index % 4 != 3 and status.last}">
					            <!-- 마지막 항목이면서 현재 줄에 4개의 열이 채워지지 않았을 때 -->
					            </tr>
					        </c:if>
					    </c:forEach>
					</table>


				</div>
		    </div>
		    </div>
		</div>
<%@ include file="inc/footer.jsp" %>