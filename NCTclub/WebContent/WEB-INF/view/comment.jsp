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
		        <div class="col-md-12">
		            <div class="card bg-light mb-2">
		                <div class="card-header d-flex justify-content-between">
							<span>${sessionScope.loginDto.username}</span>
		                </div>
		                <div class="card-body">
		                    <textarea class="form-control mb-2" rows="3" placeholder="답글 내용을 입력하세요"></textarea>
		                    <div class="d-flex justify-content-end">
		                        <button class="btn btn-success btn-sm">등록</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

		<hr>
        <!-- 새로운 댓글 작성 폼 -->
		<c:if test="${userRole == 'ADMIN' or userRole == 'USER'}">
		<div class="row mb-3">
            <div class="col-md-12">
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
    
    $(document).on('click', '.btn-danger', function() {
        // 해당 댓글의 comment-id 값을 가져옵니다.
        var commentId = $(this).closest('.comment-box').data('comment-id');

        // 사용자에게 삭제 확인을 물어봅니다.
        if (confirm('댓글을 삭제하시겠습니까?')) {
            replyFunc.remove(commentId, function(result) {
                if (result === "success") {
                    alert('댓글이 성공적으로 삭제되었습니다.');
                    location.reload();
                } else {
                    console.error("댓글 삭제 실패:", result.error);
                    alert("댓글 삭제에 실패했습니다. 다시 시도해 주세요.");
                }
            });
        }
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
                
                // 해당 원본 댓글에 달린 답글들을 찾아 추가
                $.each(comments, function(replyIndex, replyComment) {
                    if (replyComment.parents_id == comment.commentid) {
                        commentHtml += generateCommentHtml(replyComment, userName);
                    }
                });
            }
        });

        $('#commentSection').html(commentHtml); // 원본 댓글과 그에 딸린 답글들을 출력
    });
}


function generateCommentHtml(comment, userName) {
    var html = '';

    // 답글에 대한 depth 확인
    var paddingLeftValue = 15 + (comment.depth - 1) * 20; // 기본값은 15, depth가 증가할 때마다 20px씩 추가

    html += '<div class="comment-box mb-3" data-comment-id="' + comment.commentid + '" style="border-bottom: 1px solid #e5e5e5; padding-left: ' + paddingLeftValue + 'px;">';

    if (comment.depth == 2) {
        html += '<div class="reply-indicator" style="position: absolute; margin-left: -20px;">ㄴ</div>'; 
    }
    html += '<div class="comment-header d-flex justify-content-between">';
    html += '<strong class="comment-username">' + userName + '</strong>';
    html += '<div class="comment-actions">';
    html += '<button class="btn btn-primary btn-sm mr-1">수정</button>';
    html += '<button class="btn btn-danger btn-sm">삭제</button>';
    if (comment.depth == 1) {
        html += '<button class="btn btn-secondary btn-sm mr-1 reply-button">댓글달기</button>';
    }
    html += '</div>';
    html += '</div>';
    html += '<div class="comment-content">';

    // is_deleted가 1이면 '삭제된 댓글입니다' 출력
    if (comment.is_deleted == 1) {
        html += '<p>삭제된 댓글입니다</p>';
    } else {
        html += '<p>' + comment.contents + '</p>';
    }

    html += '</div>';
    html += '<div class="comment-time">' + replyFunc.showDateTime(comment.regdate) + '</div>';
    html += '</div>';
    return html;
}

});
	

$(document).on('click', '.reply-button', function() {
    // 원본 댓글의 data-comment-id 값을 가져옵니다.
    var parentId = $(this).closest('.comment-box').data('comment-id');
    // 이미 존재하는 답글 폼이 있는지 확인
    var existingReplyForm = $(this).closest('.comment-box').next('.reply-form');
    if (existingReplyForm.length) {
        // 이미 답글 폼이 존재한다면 그 폼을 제거하고 함수를 종료
        existingReplyForm.remove();
        return;
    }
    // #replyTemplate의 내용을 복사
	var replyForm = $('#replyTemplate').clone().removeAttr('id').removeClass('d-none').addClass('reply-form');
    // 새롭게 생성되는 답글 양식에 원본 댓글의 data-comment-id 값을 저장합니다.
    replyForm.find('.card').data('parent-comment-id', parentId);
    // 현재 댓글 카드의 바로 다음에 댓글 입력 양식 추가
    $(this).closest('.comment-box').after(replyForm);
});


</script>
