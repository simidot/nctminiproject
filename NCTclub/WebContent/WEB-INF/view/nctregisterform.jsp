<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="userRole" value="${sessionScope.loginDto.userrole.name()}"/>

<%@ include file="inc/header.jsp" %>

<div class="container-fluid">


<div class="row">
	    <c:choose>
		    <c:when test="${userRole == 'ADMIN'}">
		        <%@ include file="inc/sidebar.jsp" %>
		        <div class="col-md-9">
		    </c:when>
		    <c:otherwise>
		        <div class="col-md-12">
		    </c:otherwise>
		</c:choose>

<div class="container shadow py-5 w-50 rounded p-5 mt-5">
<h2 class="text-center mb-3">NCT MEMBER REGISTER</h2>

	<form action="${ctxPath}/admin/nctregister" method="post" enctype="multipart/form-data">
    	<!-- 멤버 이름 등록 -->
        <div class="form-group row">
          <label for="name" class="col-sm-3 col-form-label text-nowrap">멤버 이름: <span class="text-danger">*</span></label>
            <div class="col-sm-9">
                <input type="text" class="form-control mb-2" id="name" name="name" required>
                <small id="nameWarning" class="text-danger"></small>
            </div>
        </div>

      <!-- 생년월일 정보 등록 -->
        <div class="form-group row">
            <label for="birthdate" class="col-sm-3 col-form-label text-nowrap">생년월일: <span class="text-danger">*</span></label>
            <div class="col-sm-9">
                <input type="date" class="form-control" id="birthdate" name="birthdate">
            </div>
        </div>
      <!-- 국적 정보 등록 -->
      <div class="form-group row">
            <label for="nationality" class="col-sm-3 col-form-label text-nowrap">국적 :<span class="text-danger">*</span></label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="nationality" name="nationality">
            </div>
        </div>
        
        <!-- 포지션 정보 등록 (리더, 센터, 메인보컬, 리드보컬, 서브보컬, 메인댄서, 리드댄서, 서브댄서, 메인래퍼, 리드래퍼, 서브래퍼 중 선택하도록)
        체크하면 리스트에 추가되도록 하면 좋을 것 같당... -->
		<div class="form-group row">
	    <label for="positionlist" class="col-sm-3 col-form-label text-nowrap">포지션 :<span class="text-danger">*</span></label>
		    <div class="col-sm-9">
		        <label>
		            <input type="radio" name="position" value="보컬"> 보컬
		        </label>
		        <label>
		            <input type="radio" name="position" value="댄서"> 댄서
		        </label>
		        <label>
		            <input type="radio" name="position" value="래퍼"> 래퍼
		        </label>
		    </div>
		</div>
        
        <!-- 엠비티아이 정보 등록 -->
        <div class="form-group row">
            <label for="mbti" class="col-sm-3 col-form-label text-nowrap">MBTI : </label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="mbti" name="mbti">
            </div>
        </div>

        <!-- 이미지 파일 등록 -->
        <div class="form-group row">
            <label for="image" class="col-sm-3 col-form-label text-nowrap">이미지파일 <span class="text-danger">*</span></label>
            <div class="col-sm-9">
                <input type="file" class="form-control text-right" id="file" name="file">
            </div>
        </div>
        
        <!-- 그룹 정보 등록 (NCT U, NCT DREAM, Way V, NCT 127, SuperM, NCT 도재정 중 선택하도록)
        체크하면 리스트에 추가되도록 하면 좋을 것 같당... -->
		<div class="form-group row">
    <label for="groupList" class="col-sm-3 col-form-label text-nowrap">소속 그룹 :<span class="text-danger">*</span></label>
    <div class="col-sm-9">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="nctU" name="groupList" value="NCT U">
            <label class="form-check-label" for="nctU">NCT U</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="nctDREAM" name="groupList" value="NCT DREAM">
            <label class="form-check-label" for="nctDREAM">NCT DREAM</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="wayV" name="groupList" value="WAY V">
            <label class="form-check-label" for="wayV">WAY V</label>
        </div>
        <br>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="nct127" name="groupList" value="NCT 127">
            <label class="form-check-label" for="nct127">NCT 127</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="superM" name="groupList" value="SUPERM">
            <label class="form-check-label" for="superM">SUPERM</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="dojaejung" name="groupList" value="NCT 도재정">
            <label class="form-check-label" for="dojaejung">NCT 도재정</label>
        </div>
    </div>
</div>
      <button type="submit" class="btn btn-dark d-block mx-auto" >등록하기</button>
    </form>
</div>
</div>
</div>

<script>
    var nameCheckURL = "<c:url value='/admin/nameCheck.do'/>";
</script>
<script src="${ctxPath}/resources/js/nctRegisterCheck.js"></script> 

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>