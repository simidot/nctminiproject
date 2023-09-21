<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- header html -->
<%@ include file="inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctxPath}/resources/css/userList.css">


<!-- main html -->
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
	const deleteUrl = '<c:url value="/admin/deleteuser"/>' + "?userId=" + confirmDelete.getAttribute("data-user-id");
</script> 
<script src="${ctxPath}/resources/js/deleteUser.js"></script>




<!-- footer html -->
<%@ include file="inc/footer.jsp" %>
