<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h2>MEMBER DETAIL UPDATE</h2>
        </div>
    </div>
    
    <form action="${ctxPath}/admin/updatemember" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="memberId" value="${nctmemberDTO.memberId}">
        
        <div class="row mt-3">
            <div class="col-md-6">
                <!-- 이미지 -->
                <img src="${ctxPath}/resources/file_repo/${nctmemberDTO.image}" class="img-fluid mx-auto d-block">
                
            </div>
        
            <div class="col-md-6">
                <!-- 세부사항 -->
                <div class="card">
                    <div class="card-header">
                        DETAIL.
                    </div>
                    <div class="card-body">
                        <!-- 세부사항 내용 -->
                        <div class="form-group row">
                            <label for="name" class="col-md-3 col-form-label">이름:</label>
                            <div class="col-md-9">
                                <input type="text" id="name" name="name" value="${nctmemberDTO.name}" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="birthdate" class="col-md-3 col-form-label">생년월일:</label>
                            <div class="col-md-9">
                        		<input type="date" id="birthdate" name="birthdate" value="${nctmemberDTO.birthdate}" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="nationality" class="col-md-3 col-form-label">국적:</label>
                            <div class="col-md-9">
                      		  <input type="text" id="nationality" name="nationality" value="${nctmemberDTO.nationality}" class="form-control">
                            </div>
                        </div>
                        
                        
					<!-- 소속 그룹 표시 -->
					<div class="form-group row">
					    <label for="groupList" class="col-md-3 col-form-label">소속 그룹: </label>
					    <div class="col-md-5">
					        <c:forEach items="${allGroups}" var="group">
					            <div class="form-check form-check-inline">
					                <input class="form-check-input" type="checkbox" id="${group}" name="groupList" value="${group}" 
					                <c:if test="${nctmemberDTO.groupList.contains(group)}">checked</c:if>>
					                <label class="form-check-label" for="${group}">${group}</label>
					            </div>
					        </c:forEach>
					    </div>
					</div>
					                      
                        <div class="form-group row">
                            <label for="positionlist" class="col-sm-3 col-form-label text-nowrap">포지션 :</label>
							    <div class="col-md-9">
							        <label>
							            <input type="radio" name="position" value="보컬" ${nctmemberDTO.position == '보컬' ? 'checked' : ''}> 보컬
							        </label>
							        <label>
							            <input type="radio" name="position" value="댄서" ${nctmemberDTO.position == '댄서' ? 'checked' : ''}> 댄서
							        </label>
							        <label>
							            <input type="radio" name="position" value="래퍼" ${nctmemberDTO.position == '래퍼' ? 'checked' : ''}> 래퍼
							        </label>
							    </div>
							</div>
                        <div class="form-group row">
                            <label for="mbti" class="col-md-3 col-form-label">MBTI:</label>
                            <div class="col-md-9">
                        		<input type="text" id="mbti" name="mbti" value="${nctmemberDTO.mbti}" class="form-control">
                            </div>
                        </div>
                        
				<label for="editimage" class="col-form-label text-nowrap">이미지 파일 수정하기</label>
				<div>
				    <!-- 이미지 미리 보기 -->
				    <img id="image-preview" src="기본 이미지 URL" alt="이미지 미리 보기" width="100">
				    
				    <!-- 이미지 업로드 필드 -->
				    <input type="file" class="form-control text-right" id="file" name="file">
				</div>
				<div class="row mt-3">
				    <div class="col-md-4 text-center">
				        <!-- 이미지를 업로드하면 미리 보기 업데이트 -->
				        <script>
				            document.getElementById("file").addEventListener("change", function() {
				                var fileInput = this;
				                var imagePreview = document.getElementById("image-preview");
				
				                if (fileInput.files && fileInput.files[0]) {
				                    var reader = new FileReader();
				
				                    reader.onload = function(e) {
				                        imagePreview.src = e.target.result;
				                    };
				
				                    reader.readAsDataURL(fileInput.files[0]);
				                }
				            });
				        </script>
				    </div>
				</div>
			                <!-- 확인 버튼 -->
			                <button type="submit" class="btn btn-dark d-block mx-auto">제출하기</button>
			            </div>
			        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
</body>

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>