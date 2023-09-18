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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<form action ='${ctxPath}/admin/userlist' method = 'get'>
	    <div class="container mt-5">
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
            <c:forEach var = "member" items="${memberList}">
                <tr>
                    <th>${member.userId}</th>
                    <th>${member.username}</th>
                    <th>${member.nickname}</th>
                    <th>${member.birthdate}</th>
                    <th>${member.phone}</th>
                    <th>${member.email}</th>
                    <th>${member.address}</th>
                    <th>${member.regdate}</th>
                    <th><button type="button" class="btn btn-dark d-block mx-auto">회원 삭제</button></th>
                </tr>
            </c:forEach>
            
                
            </tbody>
        </table>
    </div>
    	</form>
    
</body>


<!-- footer html -->
<%@ include file="inc/footer.jsp" %>