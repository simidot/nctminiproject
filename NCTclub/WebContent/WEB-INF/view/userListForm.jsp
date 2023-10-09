<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="userRole" value="${sessionScope.loginDto.userrole.name()}"/>
<!-- header html -->
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
			        <div class="container">
			           
			            <h2 class="mb-3 text-center">ALL USERS</h2>
			        </div>
							<table class="table">
							     <thead>
							        <tr>
			                        <th>ID.</th>
			                        <th>NAME.</th>
			                        <th>NICKNAME.</th>
			                        <th>BIRTHDATE.</th>
			                        <th>PHONE.</th>
			                        <th>EMAIL.</th>
			                        <th>ADDRESS.</th>
			                        <th>REGDATE.</th>
			                        <th>DELETE.</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <c:forEach var="member" items="${memberList}">
			                        <tr>
			                            <td>${member.userId}</td>
			                            <td>${member.username}</td>
			                            <td>${member.nickname}</td>
			                            <td>${member.birthdate}</td>
			                            <td>${member.phone}</td>
			                            <td>${member.email}</td>
			                            <td>${member.address}</td>
			                            <td>${member.regdate}</td>
			                           
			                            <c:if test="${sessionScope.loginDto.userrole.name() == 'ADMIN'}">
			                            	<!-- 삭제하기 버튼 -->
			                            	<td><button data-user-id="${member.userId}" class="delete-button btn btn-dark d-block btn-sm">삭제하기
			                            	</button></td>
		                        		</c:if>			                        
		                        	</tr>
				                </c:forEach>
					      </tbody>
					   </table>
				</div>

		      <%@ include file="paging/paging.jsp" %>
		     

<div class="modal fade" id="deletenotificationModal" tabindex="-1" role="dialog" aria-labelledby="notificationModalLabel" aria-hidden="true">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="notificationModalLabel">알림</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body">
				                <p id="notificationMessage">정말 삭제하시겠습니까?</p>
				            </div>
				            <div class="modal-footer">
				                <button id = "confirmDeleteButton" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				            </div>
				        </div>
				    </div>
				</div>
				</div>

<script>
//이벤트 핸들러 등록은 한 번만 수행되도록 수정
$(document).ready(function () {
    // 삭제하기 버튼 클릭 이벤트 핸들러를 등록합니다.
    $(".delete-button").on("click", function () {
        // 삭제하기 버튼에 연결된 멤버 아이디를 가져옵니다.
        const userId = $(this).data("user-id");
        console.log(userId);
        
        // 삭제하기 확인 모달을 띄웁니다.
        deleteUserConfirmation(userId);
    });
});
//삭제하기 버튼을 클릭했을 때 모달 창을 띄우는 함수
function deleteUserConfirmation(userId) {
    // memberIdToDelete 변수에 삭제할 멤버의 아이디를 저장
    const userIdToDelete = userId;
    console.log(userIdToDelete);
    
 // 모달 창을 띄웁니다.
    $("#deletenotificationModal").modal("show");
 
 // 확인 버튼 클릭 시 삭제 동작을 수행합니다.
    $("#confirmDeleteButton").on("click", function () {
        // "삭제" 버튼 클릭 시, 삭제 AJAX 요청을 보냅니다.
        if (userIdToDelete) {
            const deleteUrl = '<c:url value="/admin/deleteuser"/>' + "?userId=" + userIdToDelete;
            console.log(deleteUrl);
            // 삭제 동작 수행 또는 다른 작업 수행
            window.location.href = '<c:url value="/admin/deleteuser"/>' + "?userId=" + userIdToDelete;
       
            
            // 모달 닫기
            $("#deletenotificationModal").modal("hide");
   }
    });
}
</script>

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>