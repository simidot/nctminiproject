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
    <form action ='${ctxPath}/user/detail' method = 'get'>
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
                <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
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
                   
					<!-- 수정하기 버튼 -->
					<a href="${ctxPath}/admin/updatememberform?memberId=${nctmemberDTO.memberId}" class="btn btn-secondary btn-sm">수정하기</a>
		            <!-- 삭제하기 버튼 -->
                    <button type="button" class="btn btn-secondary btn-sm delete-button" data-toggle="modal" data-target="#deletenotificationModal" data-member-id="${nctmemberDTO.memberId}">삭제하기</button>
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
 
    <div class="row mt-3">
        <div class="col-md-6 offset-md-3">
            <!-- 코멘트 -->
            <div class="card">
                <div class="card-header">
                    코멘트
                </div>
                <div class="card-body">
                    <!-- 코멘트 내용 -->
                    <p>멤버에 대한 추가 정보 및 코멘트 내용이 나타납니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>
</form>


<!-- Bootstrap JS 및 jQuery 스크립트 링크 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
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


//모달이 열릴 때만 confirmDeleteButton을 찾도록 수정
$("#deletenotificationModal").on("shown.bs.modal", function () {
    const deleteButtons = document.querySelectorAll(".delete-button");

    let memberIdToDelete = null;

    // 각 버튼 클릭 시 해당 유저 ID를 저장하고 모달 창을 엽니다.
    deleteButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            memberIdToDelete = button.getAttribute("data-member-id");
        });
    });
    
    // 첫 번째 삭제 버튼을 확인 버튼으로 사용
    const confirmDeleteButton = deleteButtons[0];

    // 확인 버튼 클릭 시 삭제 동작을 수행합니다.
    confirmDeleteButton.addEventListener("click", function () {
        // "삭제" 버튼 클릭 시, 삭제 AJAX 요청을 보냅니다.
        if (memberIdToDelete) {
            // AJAX 요청을 보낼 URL을 설정합니다.
            const deleteUrl = '<c:url value="/admin/deletemember"/>' + "?memberId=" + memberIdToDelete;
            console.log(deleteUrl);
    	        $.ajax({
    	            type: "GET", // HTTP 요청 메서드 선택 (GET 또는 POST)
    	            url: deleteUrl, // 요청을 보낼 URL
    	            dataType: "text", // 서버 응답 데이터 유형 (JSON을 기대하면 json으로 설정)
    	            success: function (response) {
    	                // 성공적으로 응답을 받았을 때 처리할 코드
    	                if (response =="yes") {
    	                    // 삭제가 성공했을 경우 추가 로직을 작성하세요.
    	                    // 예를 들어, 화면에서 해당 행을 삭제하거나 다시 로드할 수 있습니다.
    	                    window.location.href('<c:url value = "/user/main"/>');

    	                    console.log("멤버 삭제 성공");
    	                } else if (response == "no"){
    	                    console.error("멤버 삭제 실패");
    	                }
    	                //modal.style.display = "none"; // 모달 닫기
    	            },
    	            error: function () {
    	                // 요청이 실패했을 때 처리할 코드
    	                console.error("요청 실패");
    	                //modal.style.display = "none"; // 모달 닫기
    	            }
                

    	        });
    	    }
    	});


     // 모달 외부를 클릭하면 모달을 닫습니다.
    window.addEventListener("click", function (event) {

        if (event.target === modal) {
            modal.style.display = "none";
        }
    }); 
});



</script>



<!-- footer html -->
<%@ include file="inc/footer.jsp" %>
