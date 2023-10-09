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
            <h2 class="mb-4 text-center">ALL NCT MEMBER</h2>
            <form action="${ctxPath}/user/searchmember" method="get">
            <div class="row align-items-center mb-3">
				<div style="flex: 0 0 29.16667%; max-width: 29.16667%;"></div>
              	<div class="col-md-5 d-flex justify-content-between align-items-center">
			    <select name="option" class="form-control d-inline-block mx-1" style="width: 120px;">
			        <option value="n" <c:if test="${param.option == 'n'}">selected</c:if>>이름</option>
			        <option value="g" <c:if test="${param.option == 'g'}">selected</c:if>>그룹명</option>
			    </select>
			    <input type="text" name="search" class="form-control d-inline-block mx-1" placeholder="검색어를 입력하세요" value="${param.search}">
			    <button type="submit" class="btn btn-dark mx-1" style="width: 100px; white-space: nowrap;">검색</button>
			</div>

                <c:if test="${userRole == 'ADMIN'}">
					<div class="col-md-2 text-center form-check">
					    <input type="checkbox" id="hiddenMemberCheckbox" class="form-check-input"
					    <c:if test="${check == 'yes'}">checked</c:if>>
					    <label class="hidden-member-check-label form-check-label" for="hiddenMemberCheckbox">숨긴 멤버 보기</label>
					</div>
                </c:if>
            </div>
            </form>

			<c:choose>
			    <c:when test="${not empty nctmemberList}">
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
			    </c:when>
			    <c:otherwise>
					<div class="d-flex justify-content-center align-items-center">
    					<p>해당되는 인원이 없습니다.</p>
					</div>
			    </c:otherwise>
			</c:choose>

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
