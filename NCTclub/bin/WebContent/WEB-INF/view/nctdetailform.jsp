<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h2>MEMEBER DETAIL</h2>
        </div>
    </div>
    
<div class="row mt-3">
    <div class="col-md-6 text-center">
        <img src="${ctxPath}/resources/file_repo/${nctmemberDTO.image}" class="img-fluid mx-auto d-block">
    </div>
    
    <div class="col-md-6">
        <div class="card"> 
            <div class="card-header text-center">
                DETAIL.
            </div>
        <div class="card-body" style="padding-top: 50px; padding-bottom: 50px;"> 
                        <p>이름: ${nctmemberDTO.name}</p>
                        <p>생년월일: ${nctmemberDTO.birthdate}</p>
                        <p>국적: ${nctmemberDTO.nationality}</p>
                        <p>소속 그룹: ${nctmemberDTO.groupList}</p>
                        <p>포지션: ${nctmemberDTO.position}</p>
                        <p>MBTI: ${nctmemberDTO.mbti}</p>

                        <c:if test="${sessionScope.loginDto.userrole.name() == 'ADMIN'}">
                            <!-- 수정하기 버튼 -->
                            <a href="${ctxPath}/admin/updatememberform?memberId=${nctmemberDTO.memberId}" class="btn btn-dark btn-sm">수정하기</a>
                            <!-- 삭제하기 버튼 -->
                            <button data-member-id="${nctmemberDTO.memberId}" class="delete-button btn btn-dark btn-sm">삭제하기</button>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
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
	
     
    <%@ include file="comment.jsp" %>
    </div>
  
  </div>




<script>
//페이지 로드 후 실행되는 함수 (디테일 수정 후 나타나는 화면)
$(document).ready(function() {
    // URL 파라미터에서 successMessage를 가져와서 메시지를 표시
    var successMessage = getParameterByName("successMessage");
    if (successMessage) {
        // 모달에 알림 메시지 채우기
        $("#notificationMessage").text(successMessage);
        // 모달 표시
        $("#updatenotificationModal").modal("show");
    }
});

// URL에서 파라미터를 추출하는 함수
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

//삭제하기 버튼 클릭 이벤트 핸들러를 등록합니다.
$(".delete-button").on("click", function () {
    // 삭제하기 버튼에 연결된 멤버 아이디를 가져옵니다.
    const memberId = $(this).data("member-id");
    console.log(memberId);
    
    // 삭제하기 확인 모달을 띄웁니다.
    deleteMemberConfirmation(memberId);
});

//삭제하기 버튼을 클릭했을 때 모달 창을 띄우는 함수
function deleteMemberConfirmation(memberId) {
    // memberIdToDelete 변수에 삭제할 멤버의 아이디를 저장
    const memberIdToDelete = memberId;
    console.log(memberId);

    
    // 모달 창을 띄웁니다.
    $("#deletenotificationModal").modal("show");
    
    // 확인 버튼 클릭 시 삭제 동작을 수행합니다.
    $("#confirmDeleteButton").on("click", function () {
        // "삭제" 버튼 클릭 시, 삭제 AJAX 요청을 보냅니다.
        if (memberIdToDelete) {
            const deleteUrl = '<c:url value="/admin/deletemember"/>' + "?memberId=" + memberIdToDelete;
            console.log(deleteUrl);
            
            window.location.href = '<c:url value="/admin/deletemember"/>' + "?memberId=" + memberIdToDelete;

            
        }
    });
}



</script>



<!-- footer html -->
<%@ include file="inc/footer.jsp" %>
