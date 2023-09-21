<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header html -->
<%@ include file="inc/header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h2>멤버 상세정보 수정하기</h2>
        </div>
    </div>
    
    <form action="${ctxPath}/admin/updatemember" method="POST" enctype="multipart/form-data">
        <div class="row mt-3">
            <div class="col-md-6">
                <!-- 이미지 -->
                <img src="${ctxPath}/resources/file_repo/${nctmemberDTO.image}" class="img-fluid mx-auto d-block">
                
            </div>
        
            <div class="col-md-6">
                <!-- 세부사항 -->
                <div class="card">
                    <div class="card-header">
                        세부사항
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
                        <div class="form-group row">
                            <label for="groupList" class="col-md-3 col-form-label">소속 그룹:</label>
                            <div class="col-md-9">
                        		<input type="text" id="groupList" name="groupName" value="${nctmemberDTO.groupList}" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="position" class="col-md-3 col-form-label">포지션:</label>
                            <div class="col-md-9">
                        		<input type="text" id="position" name="position" value="${nctmemberDTO.position}" class="form-control">
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
		                    <input type="file" class="form-control text-right" id="file" name="file">   
		                </div>
		                <div class="row mt-3">
			            <div class="col-md-4 text-center">
			                <!-- 확인 버튼 -->
			                <button type="submit" class="btn btn-primary">제출하기</button>
			            </div>
			        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="row mt-3">
        <div class="col-md-6 offset-md-3">
            <!-- 코멘트 -->
            <div class="card">
                <div class="card-header">
                    코멘트
                </div>
                <div class="card-body">
                    <!-- 코멘트 내용 -->
                    <p>멤버에 대한 추가 정보 및 코멘트 내용이 나타납니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS 및 jQuery 스크립트 링크 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>
