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
        
        <div class="container">
            <h2 class="mb-3 text-center">ALL NCT MEMBER</h2>
            
            <form action="${ctxPath}/user/searchmember" method="get">
                <div class="row justify-content-center mb-3">
                    <div class="col-md-2">
                        <select name="option" class="form-control">
                            <option value="n" <c:if test="${param.option == 'n'}">selected</c:if>>이름</option>
                            <option value="g" <c:if test="${param.option == 'g'}">selected</c:if>>그룹명</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="search" class="form-control" placeholder="검색어를 입력하세요" value="${param.search}">
                    </div>
                    <div class="col-md-1">
                        <button type="submit" class="btn btn-dark btn-block">검색</button>
                    </div>
	                <c:if test="${userRole == 'ADMIN'}">
					    <div class="col-md-5 text-right">
					        <input type="checkbox" id="hiddenMemberCheckbox" class="form-check-input"
					        <c:if test="${check == 'yes'}">checked</c:if>>
					        <label class="hidden-member-check-label" for="hiddenMemberCheckbox">숨긴 멤버 보기</label>
					    </div>
					</c:if>
                </div>
            </form>

			<div class="container">
			    <div class="row">
			        <c:forEach var="nctmember" items="${nctmemberList}">
			            <div class="col-md-3">
			                <div class="card mb-4">
			                	<h5 class="card-title mt-2 text-center"><strong>${nctmember.name}</strong></h5>
			                    <img src="${ctxPath}/resources/file_repo/${nctmember.image}" class="card-img-top" alt="${nctmember.name}">
			                    <div class="card-body text-center">
			                        <a href="${ctxPath}/user/detail?memberId=${nctmember.memberId}" class="btn btn-dark btn-sm mt-2">상세보기</a>
			                    </div>
			                </div>
			            </div>
			        </c:forEach>
			    </div>
			</div>
        </div>
    </div>
</div>



<script>
    const checkbox = document.getElementById("hiddenMemberCheckbox");

    checkbox.addEventListener("change", function () {
    	const ischecked = checkbox.checked;
    	
        if (checkbox.checked) {
        	location.href = "${ctxPath}/admin/hiddenmember";
        } else {
        	location.href = "${ctxPath}/user/main";
        }
    });
</script>
<%@ include file="inc/footer.jsp" %>
