<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header html -->
<%@ include file="inc/header.jsp" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버 상세정보</title>
 </head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h2>멤버 상세정보</h2>
        </div>
    </div>
    <!-- 모달 다이얼로그 -->
<div class="modal fade" id="updatenotificationModal" tabindex="-1" role="dialog" aria-labelledby="notificationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notificationModalLabel">알림</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="notificationMessage">이 곳에 알림 메시지를 표시합니다.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
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

    
    <div class="row mt-3">
        <div class="col-md-6">
            <!-- 이미지 -->
            <img src="${ctxPath}/resources/file_repo/${nctmemberDTO.image}" class="img-fluid mx-auto d-block">
        </div>
        <div class="col-md-6">
            <!-- 세부사항 -->
            <div class="card">
                <div class="card-header">
                    세부사항
                </div>
                <div class="card-body">
                    <!-- 세부사항 내용 -->
                    <p>이름: ${nctmemberDTO.name}</p>
                    <p>생년월일: ${nctmemberDTO.birthdate}</p>
                    <p>국적: ${nctmemberDTO.nationality}</p>
                    <p>소속 그룹: ${nctmemberDTO.groupList}</p>
                    <p>포지션: ${nctmemberDTO.position}</p>
                    <p>MBTI: ${nctmemberDTO.mbti}</p>
                   

				  <c:if test="${sessionScope.loginDto.userrole.name() == 'ADMIN'}">
				    <!-- 수정하기 버튼 -->
				    <a href="${ctxPath}/admin/updatememberform?memberId=${nctmemberDTO.memberId}" class="btn btn-secondary btn-sm">수정하기</a>
				    <!-- 삭제하기 버튼 -->
					<button data-member-id="${nctmemberDTO.memberId}" class="delete-button btn btn-secondary btn-sm">삭제하기</button>
				</c:if>

                </div>
            </div>
        </div>
    </div>
    
<!--     모달 창
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>정말 삭제하시겠습니까?</p>
                <button id="confirmDelete">삭제</button>
            </div>
        </div> -->
     
     <%@ include file="comment.jsp" %>

</div>


<!-- Bootstrap JS 및 jQuery 스크립트 링크 추가 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
            // AJAX 요청을 보낼 URL을 설정합니다.
            const deleteUrl = '<c:url value="/admin/deletemember"/>' + "?memberId=" + memberIdToDelete;
            console.log(deleteUrl);
            
            window.location.href = '<c:url value="/admin/deletemember"/>' + "?memberId=" + memberIdToDelete;

            
        }
    });



}



</script>



<!-- footer html -->
<%@ include file="inc/footer.jsp" %>
