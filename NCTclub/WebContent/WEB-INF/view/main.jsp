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
					<h2 class="mb-3 text-center">ALL NCT MEMBER</h2>
					<table class="table">
					    <c:forEach var="nctmember" items="${nctmemberList}" varStatus="status">
					        <c:if test="${status.index % 4 == 0}">
					            <!-- 새로운 줄 시작 -->
					            <tr>
						        </c:if>
								<td style="text-align: center; vertical-align: middle;">
								    <img src="${ctxPath}/resources/file_repo/${nctmember.IMAGE}" width="150" height="150">
								    <br>
									<span><strong>${nctmember.NAME}</strong></span>
								    <br>
    							<a href="${ctxPath}/user/detail?memberId=${nctmember.MEMBERID}" class="btn btn-dark btn-sm p-1 m-0">상세보기</a>
								</td>
						        <c:if test="${status.index % 4 == 3 or status.last}">
					            <!-- 줄 끝 -->
					            </tr>
					        </c:if>
					    </c:forEach>
					</table>
				</div>
		    </div>
		    </div>
		</div>
<%@ include file="inc/footer.jsp" %>