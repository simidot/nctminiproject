<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="userRole" value="${sessionScope.loginDto.userrole.name()}"/>

<div class="container mt-3">
    <div class="col-md-12 text-center">
        <h2>COMMENTS</h2>
    </div>

    <div class="border p-3 rounded">
        <!-- 원본 댓글 -->
        <div class="row mb-3">
            <div class="col-md-8 offset-md-2">
                <div class="card mb-2 py-1"> 
				    <div class="card-header d-flex justify-content-between">
				        <span>이름</span>
				        <div>
				            <button class="btn btn-primary btn-sm mr-1">수정</button>
				            <button class="btn btn-danger btn-sm">삭제</button>
				        </div>
				    </div>
				    <div class="card-body"> 
				        <textarea class="form-control mb-2" rows="3" placeholder="코멘트 내용을 입력하세요"></textarea>
				    </div>
				</div>
            </div>
        </div>

        <!-- 답글의 답글 -->
        <div class="row mb-3">
            <div class="col-md-8 offset-md-3 position-relative">
                <div class="card bg-light mb-2">
                    <div class="card-header d-flex justify-content-between">
                        <span>댓글</span>
                        <div>
                            <button class="btn btn-primary btn-sm mr-1">수정</button>
                            <button class="btn btn-danger btn-sm">삭제</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <textarea class="form-control mb-2" rows="3" placeholder="답글 내용을 입력하세요"></textarea>
                        <button class="btn btn-success btn-sm">댓글달기</button>
                    </div>
                </div>
                <!-- 왼쪽 수직 바 추가 -->
                <div class="position-absolute" style="top: 50%; transform: translateY(-50%); left: -15px; height: 3px; width: 15px; background-color: #000000;"></div>
            </div>
        </div>
		
		<hr>
        <!-- 새로운 댓글 작성 폼 -->
		<c:if test="${userRole == 'ADMIN' or userRole == 'USER'}">
		<div class="row mb-3">
            <div class="col-md-8 offset-md-2">
                <div class="card mb-2">
                    <div class="card-header d-flex justify-content-between">
                        <span>글쓰기</span>
                        <div>
                            <button class="btn btn-primary btn-sm mr-1">등록하기</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <textarea class="form-control mb-2" rows="3" placeholder="내용을 입력하세요"></textarea>
                    </div>
                </div>
            </div>
        </div>
        </c:if>
    </div>
</div>

<script src="${ctxPath}/resources/js/reply.js"></script>

<script>

$(document).ready(function(){
    // "등록하기" 버튼 클릭 이벤트 핸들러 설정
    $('.btn-primary').click(function(){
        // 댓글 내용을 가져옵니다.
        var replyContent = $(this).closest('.card').find('textarea').val();
        
        // 댓글 내용이 비어있는 경우 전송하지 않습니다.
        if(!replyContent){
            alert('댓글 내용을 입력해주세요.');
            return;
        }
        
        // 댓글 객체 생성
        var reply = {
            content: replyContent,
            // 필요한 다른 데이터도 이곳에 추가할 수 있습니다. (예: 사용자 ID, 게시물 ID 등)
        };
        
        // AJAX 함수를 사용하여 서버로 댓글 데이터 전송
        replyFunc.register(reply, function(result){
            if(result === "success"){
                // 성공적으로 댓글이 등록된 후의 처리를 이곳에 작성합니다.
                alert('댓글이 성공적으로 등록되었습니다.');
                location.reload();  // 페이지를 새로고침하여 댓글 리스트를 업데이트합니다.
            } else {
                // 댓글 등록에 실패한 경우의 처리를 이곳에 작성합니다.
                alert("댓글 등록에 실패했습니다. 다시 시도해 주세요.");
            }
        });
    });
});

</script>
