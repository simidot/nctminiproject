<%@page import="com.nctclub.model.UserDTO"%>
<%@page import="com.nctclub.model.CustomUserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="userRole" value="${sessionScope.loginDto.userrole.name()}"/>

<div class="container mt-3">
    <div class="col-md-12 text-center">
        <h2>COMMENTS</h2>
        
    </div>
    <div class="border p-3 rounded">

        <div id="commentSection"></div> 

        <!-- 답글의 답글 -->
        <div id="replyTemplate" class="d-none"> <!-- d-none으로 숨김 -->
	        <div class="row mb-3">
	            <div class="col-md-8 offset-md-3 position-relative">
	                <div class="card bg-light mb-2">
	                    <div class="card-header d-flex justify-content-between">
	                        <span>댓글달기</span>
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

$(document).ready(function() {
	
	//사용자 이름 
	var userName = '<%= ((UserDTO)session.getAttribute("loginDto")).getUsername() %>';
	var urlParams = new URLSearchParams(window.location.search);
	//nctmemberId
    var nctmemberId = urlParams.get('memberId');
	//사용자 아이
    var userId = '<%= ((UserDTO)session.getAttribute("loginDto")).getId()%>' ;
    
    //댓글 불러오기
	loadComments();
	
    $('.btn-primary').click(function() {
        var replyContent = $(this).closest('.card').find('textarea').val();
        if (!replyContent) {
            alert('댓글 내용을 입력해주세요.');
            return;
        }
        var reply = {
        		"contents":replyContent,
        	    "userid" : userId,
        	    "nctmember_id" : nctmemberId,
        	    "depth" : 1
        };
       	replyFunc.register(reply, function(result) {
       	    if (result === "success") {
       	        alert('댓글이 성공적으로 등록되었습니다.');
       	        location.reload();
       	    } else {
       	        console.error("댓글 등록 실패:", result.error);
       	        alert("댓글 등록에 실패했습니다. 다시 시도해 주세요.");
       	    }
       	});

    });
    
    $(document).on('click', '.btn-success', function() {
        var replyContent = $(this).closest('.card').find('textarea').val();
        if (!replyContent) {
            alert('댓글 내용을 입력해주세요.');
            return;
        }
     	
        var parentId = $(this).closest('.card').data('parent-comment-id');        
        var reply = {
        		"contents":replyContent,
        	    "userid" : userId,
        	    "nctmember_id" : nctmemberId,
        	    "depth" : 2,
                "parents_id": parentId 
        };
       	replyFunc.register(reply, function(result) {
       	    if (result === "success") {
       	        alert('댓글이 성공적으로 등록되었습니다.');
       	        location.reload();
       	    } else {
       	        console.error("댓글 등록 실패:", result.error);
       	        alert("댓글 등록에 실패했습니다. 다시 시도해 주세요.");
       	    }
       	});

    });
    

    // 댓글 리스트 불러오는 함수
    function loadComments() {
        var urlParams = new URLSearchParams(window.location.search);
        var nctmemberId = urlParams.get('memberId');

        replyFunc.get(nctmemberId, function(comments) {
        
            // 댓글을 동적으로 추가하는 코드
            var commentHtml = '';

            $.each(comments, function(index, comment) {
                if (comment.parents_id == null) { // 원본 댓글
                    commentHtml += generateCommentHtml(comment, userName);
                }
            });

            $('#commentSection').html(commentHtml); // 원본 댓글들만 먼저 출력

            // 답글 추가
            $.each(comments, function(index, comment) {
                if (comment.parents_id != null) { // 답글
                    var parentDiv = $('[data-comment-id="'+ comment.parents_id +'"]').closest('.row');
                    var replyHtml = generateCommentHtml(comment, userName);
                    parentDiv.after(replyHtml); // 원본 댓글 바로 아래에 답글 추가
                }
            });
        });
    }

    function generateCommentHtml(comment, userName) {
        var html = '';
        html += '<div class="row mb-3">';
        html += '<div class="col-md-8 offset-md-2">';
        html += '<div class="card mb-2 py-1" id="REPLY_FORM_ID" data-comment-id="' + comment.commentid + '">';
        html += '<div class="card-header d-flex justify-content-between">';
        html += '<span>' + userName + '</span>';  
        html += '<div>';
        html += '<button class="btn btn-primary btn-sm mr-1">수정</button>';
        html += '<button class="btn btn-danger btn-sm">삭제</button>';
        html += '</div>';
        html += '</div>';
        html += '<div class="card-body">';
        html += '<textarea class="form-control mb-2" rows="3" readonly>' + comment.contents + '</textarea>';
        html += '<div class="comment-time">' + replyFunc.showDateTime(comment.regdate) + '</div>'; 
        html += '</div>';
        html += '<button class="btn btn-secondary btn-sm mr-1 reply-button">댓글달기</button>';
        html += '</div>';
        html += '</div>';
        html += '</div>';
        return html;
    }


});
	

$(document).on('click', '.reply-button', function() {
    // 원본 댓글의 data-comment-id 값을 가져옵니다.
    var parentId = $(this).closest('.card').data('comment-id');
    // #replyTemplate의 내용을 복사
    var replyForm = $('#replyTemplate').clone().removeAttr('id').removeClass('d-none');
    // 새롭게 생성되는 답글 양식에 원본 댓글의 data-comment-id 값을 저장합니다.
    replyForm.find('.card').data('parent-comment-id', parentId);
    // 현재 댓글 카드의 바로 다음에 댓글 입력 양식 추가
    $(this).closest('.row').after(replyForm);
});

</script>
