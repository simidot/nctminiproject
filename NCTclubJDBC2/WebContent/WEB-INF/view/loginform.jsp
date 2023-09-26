<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<!-- header html -->
<%@ include file="inc/header.jsp" %>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/styles.css">


<!-- main html -->
<div class="container shadow py-5 w-25 rounded p-5 my-auto">
<h2 class="text-center mb-3">로그인</h2>
    <form action="${ctxPath}/user/login" method="post">
        <div class="form-group row">
            <label for="userId" class="col-sm-3 col-form-label text-nowrap">아이디:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="userId" name="userId" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="password" class="col-sm-3 col-form-label text-nowrap">비밀번호:</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
        </div>
		<p class="text-danger">${errorMessage}</p>	
        <button type="submit" class="btn btn-dark d-block mx-auto">로그인하기</button>
    </form>
</div>


<!-- footer html -->
<%@ include file="inc/footer.jsp" %>