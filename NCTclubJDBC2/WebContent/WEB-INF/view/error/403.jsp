<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header html -->


<%@ include file="../inc/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-danger text-white">
                    경고
                </div>
                <div class="card-body">
                    <p class="card-text">해당 페이지에 접근할 권한이 없습니다.</p>
                    <a href="${ctxPath}/user/main" class="btn btn-dark d-block mx-auto">메인으로 돌아가기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../inc/footer.jsp" %>