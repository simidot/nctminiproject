<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header html -->
<%@ include file="inc/header.jsp" %>

<!-- main html -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 리스트</title>
    <style>
    	/* 추가된 CSS 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.7);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .container {
    		margin-top: 100px; /* header의 높이에 맞게 조절하세요. */
		}
        
    </style>
</head>
<body>
    <form action ='${ctxPath}/admin/userlist' method = 'get'>
        <div class="container">
            <h2 class="mb-3">회원 리스트</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>사용자 아이디</th>
                        <th>이름</th>
                        <th>닉네임</th>
                        <th>생년월일</th>
                        <th>휴대폰번호</th>
                        <th>이메일</th>
                        <th>주소</th>
                        <th>등록일</th>
                        <th>삭제</th>
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
                            <td><button type="button" class="btn btn-dark d-block mx-auto delete-button" data-user-id="${member.userId}">회원 삭제</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 모달 창 -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>정말 삭제하시겠습니까?</p>
                <button id="confirmDelete">삭제</button>
            </div>
        </div>
    </form>


<script>
    // JavaScript 코드
    document.addEventListener("DOMContentLoaded", function () {
        const deleteButtons = document.querySelectorAll(".delete-button");
        const modal = document.getElementById("myModal");
        const confirmDeleteButton = document.getElementById("confirmDelete");
        const closeButton = document.querySelector(".close");

        let userIdToDelete = null;

        // 각 버튼 클릭 시 해당 유저 ID를 저장하고 모달 창을 엽니다.
        deleteButtons.forEach(function (button) {
            button.addEventListener("click", function () {
                userIdToDelete = button.getAttribute("data-user-id");
                console.log(userIdToDelete);
                modal.style.display = "block";
            });
        });

        // 모달 닫기 버튼 클릭 시 모달을 닫습니다.
        closeButton.addEventListener("click", function () {
            modal.style.display = "none";
        });

        // 확인 버튼 클릭 시 삭제 동작을 수행합니다.
        confirmDeleteButton.addEventListener("click", function () {
        	// "삭제" 버튼 클릭 시, 삭제 AJAX 요청을 보냅니다.
        	    if (userIdToDelete) {
        	        // AJAX 요청을 보낼 URL을 설정합니다.
        	        const deleteUrl = '<c:url value="/admin/deleteUser?userId="/>'+userIdToDelete;

        	        $.ajax({
        	            type: "GET", // HTTP 요청 메서드 선택 (GET 또는 POST)
        	            url: deleteUrl, // 요청을 보낼 URL
        	            dataType: "text", // 서버 응답 데이터 유형 (JSON을 기대하면 json으로 설정)
        	            success: function (response) {
        	                // 성공적으로 응답을 받았을 때 처리할 코드
        	                if (response =="yes") {
        	                    // 삭제가 성공했을 경우 추가 로직을 작성하세요.
        	                    // 예를 들어, 화면에서 해당 행을 삭제하거나 다시 로드할 수 있습니다.
        	                    window.location.href = "${ctxPath}/admin/userlist";

        	                    console.log("회원 삭제 성공");
        	                } else if (response == "no"){
        	                    console.error("회원 삭제 실패");
        	                }
        	               // modal.style.display = "none"; // 모달 닫기
        	            },
        	            error: function () {
        	                // 요청이 실패했을 때 처리할 코드
        	                console.error("요청 실패");
        	                //modal.style.display = "none"; // 모달 닫기
        	            }
	                

        	        });
        	    }
        	});


    /*     // 모달 외부를 클릭하면 모달을 닫습니다.
        window.addEventListener("click", function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }); */
    });
</script>
</body>

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>
