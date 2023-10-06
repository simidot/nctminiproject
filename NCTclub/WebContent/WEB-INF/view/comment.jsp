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
		                        <button id="replyCommentBtn" class="btn btn-dark btn-sm mr-1">등록</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<%@ include file="paging/paging.jsp" %>
		<hr>
        <!-- 새로운 댓글 작성 폼 -->
		<c:if test="${userRole == 'ADMIN' or userRole == 'USER'}">
		<div class="row mb-3">
            <div class="col-md-12">
                <div class="card mb-2">
                    <div class="card-header d-flex justify-content-between">
                        <span><strong>글쓰기</strong></span>                        
                        <div>
                            <button id="registerCommentBtn" class="btn btn-dark btn-sm mr-1">등록하기</button>
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
   
    $('#registerCommentBtn').click(function() {
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
    
    $(document).on('click', '#replyCommentBtn', function() {
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
        var depth = $(this).closest('.comment-box').data('depth');
        
        var reply = {
                "commentid":commentId,
                "depth" : depth
          };


        // 사용자에게 삭제 확인을 물어봅니다.
        if (confirm('댓글을 삭제하시겠습니까?')) {
            replyFunc.remove(reply, function(result) {
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
	    var paddingLeftValue = 15 + (comment.depth - 1) * 20;
	    html += '<div class="comment-box mb-3" data-comment-id="' + comment.commentid + '" data-depth="' + comment.depth + '" style="border-bottom: 1px solid #e5e5e5; padding-left: ' + paddingLeftValue + 'px;">';

	    if (comment.depth == 2) {
	        html += '<div class="reply-indicator" style="position: absolute; margin-left: -20px;">ㄴ</div>'; 
	    }
	    html += '<div class="comment-header d-flex justify-content-between">';
	    html += '<strong class="comment-username">' + comment.username + '</strong>';

	    var showDropdown = false;
	    var dropdownHtml = '<div class="dropdown">';
	    dropdownHtml += '<button class="btn btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>';
	    dropdownHtml += '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="min-width: auto !important; padding-left: 5px !important; padding-right: 5px !important;">';

	    if (comment.userid == userId) {
	        dropdownHtml += '<a class="dropdown-item edit-button" style="padding-top: 3px; padding-bottom: 3px;">수정</a>';
	        dropdownHtml += '<a class="dropdown-item delete-button btn-danger" style="padding-top: 3px; padding-bottom: 3px;">삭제</a>';
	        showDropdown = true;
	    }
	    if (comment.depth == 1) {
	        dropdownHtml += '<a class="dropdown-item reply-button">댓글달기</a>';
	        showDropdown = true;
	    }
	    dropdownHtml += '</div>'; // end of dropdown-menu
	    dropdownHtml += '</div>'; // end of dropdown

	    if (showDropdown) {
	        html += dropdownHtml;
	    }
	    
	    html += '</div>'; // end of comment-header
    html += '<div class="comment-content">';
    if (comment.is_deleted == 1) {
        html += '<p>삭제된 댓글입니다</p>';
    } else {
        html += '<p>' + comment.contents + '</p>';
    }
    html += '</div>';
    html += '<div class="comment-time">' + replyFunc.showDateTime(comment.regdate) + '</div>';
    html += '</div>'; // end of comment-box

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


$(document).on('click', '.edit-button', function() {
    var commentBox = $(this).closest('.comment-box');
    var commentContent = commentBox.find('.comment-content p').text();
    
    // 이미 textarea가 존재한다면 아무런 동작을 하지 않음
    if (commentBox.find('.edit-textarea').length) {
        return;
    }

    // 원본 댓글 내용을 숨김
    commentBox.find('.comment-content').hide();

    // textarea 생성 및 원본 내용을 넣음
    var textarea = $('<textarea class="form-control edit-textarea mb-2"></textarea>').val(commentContent);  // 여기에 mb-2를 추가
    commentBox.find('.comment-content').after(textarea);

    // '저장' 및 '취소' 버튼 추가
    var buttonContainer = $('<div class="d-flex justify-content-end"></div>');
    var saveBtn = $('<button class="btn btn-sm btn-dark save-edit mr-2">저장</button>');
    var cancelBtn = $('<button class="btn btn-sm btn-secondary cancel-edit">취소</button>');


    buttonContainer.append(saveBtn).append(cancelBtn);
    textarea.after(buttonContainer);
});



$(document).on('click', '.save-edit', function() {
    var commentBox = $(this).closest('.comment-box');
    var updatedContent = commentBox.find('.edit-textarea').val();
    // 댓글의 고유 ID를 가져옵니다. 예를 들어, data-id 속성을 사용한다고 가정합니다.
	var commentId = commentBox.data('comment-id');
    // 수정된 내용과 댓글의 ID를 포함하는 객체를 생성합니다.
	var reply = {
	    commentid: commentId,
	    contents: updatedContent  
	};
    // update 함수를 호출하여 수정된 댓글 내용을 서버에 전송합니다.
    replyFunc.update(reply, function(result) {
        if (result === "success") {
            commentBox.find('.comment-content p').text(updatedContent);
            commentBox.find('.comment-content').show();
            commentBox.find('.edit-textarea, .save-edit, .cancel-edit').remove();
        } else {
            alert('댓글 수정 실패!');
        }
    });
});


$(document).on('click', '.cancel-edit', function() {
    var commentBox = $(this).closest('.comment-box');
    commentBox.find('.comment-content').show();
    commentBox.find('.edit-textarea, .save-edit, .cancel-edit').remove();
});


</script>
