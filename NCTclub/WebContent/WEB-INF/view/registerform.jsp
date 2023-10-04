<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- header html -->
<%@ include file="inc/header.jsp" %>
<div class="container-fluid">
	<div class="container shadow py-5 w-50 rounded p-5 my-auto">
	<h2 class="text-center mb-3">Register</h2>
	    <form action='${ctxPath}/user/register' method='post'>
	        <div class="form-group row">
	    		<label for="userId" class="col-sm-3 col-form-label text-nowrap">아이디: <span class="text-danger">*</span></label>
	            <div class="col-sm-9">
	                <input type="text" class="form-control mb-2" id="userId" name="userId" required>
	                <small id="idWarning" class="text-danger"></small>
	            </div>
	        </div>
	
			<!-- 기존의 비밀번호 입력 부분 -->
	        <div class="form-group row">
	            <label for="password" class="col-sm-3 col-form-label text-nowrap">비밀번호:<span class="text-danger">*</span></label>
	            <div class="col-sm-9">
					<input type="password" class="form-control" id="password" name="password" onBlur="validatePassword()">
	        		<small id="passwordMsg" class="form-text"></small>
	            </div>
	        </div>
	
	        <!-- 비밀번호 재확인 입력 부분 -->
	        <div class="form-group row">
	            <label for="passwordconfirm" class="col-sm-3 col-form-label text-nowrap">비밀번호 재확인:<span class="text-danger">*</span></label>
	            <div class="col-sm-9">
	                <input type="password" class="form-control" id="passwordconfirm" name="passwordconfirm" required onInput="checkPasswordMatch()">
	                 <small id="passwordConfirmMsg" class="form-text"></small> <!-- 이 부분을 추가 -->


	            </div>
	        </div>

	        <div class="form-group row">
	            <label for="username" class="col-sm-3 col-form-label text-nowrap">(한글) 이름:<span class="text-danger">*</span></label>
	            <div class="col-sm-9">
	                <input type="text" class="form-control" id="username" name="username"  placeholder="한글로 10자 이내로 입력해주세요.">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label for="nickname" class="col-sm-3 col-form-label text-nowrap">닉네임:<span class="text-danger">*</span></label>
	            <div class="col-sm-9">
	                <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임은 10자 이내로 입력해주세요.">
	            </div>
	        </div>

	        <div class="form-group row">
	            <label for="birthdate" class="col-sm-3 col-form-label text-nowrap">생년월일:<span class="text-danger">*</span></label>
	            <div class="col-sm-9">
	                <input type="date" class="form-control" id="birthdate" name="birthdate">
	            </div>
	        </div>

	        <div class="form-group row">
	            <label for="phone" class="col-sm-3 col-form-label text-nowrap">핸드폰번호: <span class="text-danger">*</span></label>
	            <div class="col-sm-9">
	                <input type="tel" class="form-control" id="phone" name="phone" placeholder="전화번호는 '-'를 제외하고 11자">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label for="email" class="col-sm-3 col-form-label">이메일:</label>
	            <div class="col-sm-9">
	                <input type="email" class="form-control" id="email" name="email">
	            </div>
	        </div>
	
	        <div class="form-group row">
	            <label for="address" class="col-sm-3 col-form-label">주소:</label>
	            <div class="col-sm-9">
	                <input type="text" class="form-control" id="address" name="address">
	            </div>
	        </div>
	
			<button type="submit" class="btn btn-dark d-block mx-auto" onclick="return validateForm();">가입하기</button>
	    </form>
	</div>
</div>
<script>
    var idCheckURL = "<c:url value='/user/idCheck.do'/>";
</script>
<script src="${ctxPath}/resources/js/registerCheck.js"></script> 
<!-- footer html -->
<%@ include file="inc/footer.jsp" %>