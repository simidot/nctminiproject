<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header html -->
<%@ include file="inc/header.jsp" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버 상세정보</title>
 </head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h2>멤버 상세정보</h2>
        </div>
    </div>
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
                    <p>이름: ${nctmemberDTO.name}</p>
                    <p>생년월일: ${nctmemberDTO.birthdate}</p>
                    <p>국적: ${nctmemberDTO.nationality}</p>
                    <p>소속 그룹: ${nctmemberDTO.groupList}</p>
                    <p>포지션: ${nctmemberDTO.position}</p>
                    <p>MBTI: ${nctmemberDTO.mbti}</p>
                   
					<!-- 수정하기 버튼 -->
					<a href="${ctxPath}/admin/updatememberform?memberId=${nctmemberDTO.memberId}" class="btn btn-secondary btn-sm">수정하기</a>
		            <!-- 삭제하기 버튼 -->
		            <button onclick="deleteMember(${nctmemberDTO.memberId})" class = "btn btn-secondary btn-sm">삭제하기</button>
                    
                </div>
            </div>
        </div>
    </div>
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
</html>



<!-- footer html -->
<%@ include file="inc/footer.jsp" %>
