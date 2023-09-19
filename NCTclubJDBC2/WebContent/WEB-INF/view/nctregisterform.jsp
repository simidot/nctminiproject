<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!-- header html -->
<%@ include file="inc/header.jsp" %>


<!-- main html -->
<div class="container shadow py-5 w-50 rounded p-5 my-auto">
<h2 class="text-center mb-3">엔시티 멤버 등록</h2>
    <form action='${ctxPath}/admin/nctregister' method='post'>
    	<!-- 멤버 이름 등록 -->
        <div class="form-group row">
    		<label for="memberName" class="col-sm-3 col-form-label text-nowrap">멤버 이름: <span class="text-danger">*</span></label>
            <div class="col-sm-9">
                <input type="text" class="form-control mb-2" id="memberName" name="memberName" required>
                <small id="idWarning" class="text-danger"></small>
            </div>
        </div>

		<!-- 생년월일 정보 등록 -->
        <div class="form-group row">
            <label for="birthdate" class="col-sm-3 col-form-label text-nowrap">생년월일:</label>
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
		            <input type="checkbox" name="positionlist[]" value="리더"> 리더
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="positionlist[]" value="센터"> 센터
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="positionlist[]" value="보컬"> 보컬
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="positionlist[]" value="댄서"> 댄서
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="positionlist[]" value="래퍼"> 래퍼
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
            <label for="image" class="col-sm-3 col-form-label text-nowrap">이미지파일 등록</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="image" name="image">
            </div>
        </div>
        
        <!-- 그룹 정보 등록 (NCT U, NCT DREAM, Way V, NCT 127, SuperM, NCT 도재정 중 선택하도록)
        체크하면 리스트에 추가되도록 하면 좋을 것 같당... -->
		<div class="form-group row">
	    <label for="groupList" class="col-sm-3 col-form-label text-nowrap">소속 그룹 :<span class="text-danger">*</span></label>
		    <div class="col-sm-9">
		        <label>
		            <input type="checkbox" name="groupList[]" value="NCT U"> NCT U
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="groupList[]" value="NCT DREAM"> NCT DREAM
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="groupList[]" value="Way V"> Way V
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="groupList[]" value="NCT 127"> NCT 127
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="groupList[]" value="SuperM"> SuperM
		        </label>
		        <br>
		        <label>
		            <input type="checkbox" name="groupList[]" value="NCT 도재정"> NCT 도재정
		        </label>
		    </div>
		</div>

		<button type="submit" class="btn btn-dark d-block mx-auto" >등록하기</button>
    </form>
</div>

<%-- <script>
    var idCheckURL = "<c:url value='/user/idCheck.do'/>";
</script>
<script src="${ctxPath}/resources/js/registerCheck.js"></script> --%>

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>