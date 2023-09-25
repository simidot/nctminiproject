<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container mt-3">
    <div class="col-md-12 text-center">
        <h2>COMMENTS</h2>
    </div>

    <div class="border p-3 rounded">
        <!-- 원본 댓글 -->
        <div class="row mb-3">
            <div class="col-md-8 offset-md-2">
                <div class="card mb-2 py-1"> 
				    <div class="card-header d-flex justify-content-between">
				        <span>이름</span>
				        <div>
				            <button class="btn btn-primary btn-sm mr-1">수정</button>
				            <button class="btn btn-danger btn-sm">삭제</button>
				        </div>
				    </div>
				    <div class="card-body"> 
				        <textarea class="form-control mb-2" rows="3" placeholder="코멘트 내용을 입력하세요"></textarea>
				    </div>
				</div>
            </div>
        </div>

        <!-- 답글의 답글 -->
        <div class="row mb-3">
            <div class="col-md-8 offset-md-3 position-relative">
                <div class="card bg-light mb-2">
                    <div class="card-header d-flex justify-content-between">
                        <span>댓글</span>
                        <div>
                            <button class="btn btn-primary btn-sm mr-1">수정</button>
                            <button class="btn btn-danger btn-sm">삭제</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <textarea class="form-control mb-2" rows="3" placeholder="답글 내용을 입력하세요"></textarea>
                        <button class="btn btn-success btn-sm">댓글달기</button>
                    </div>
                </div>
                <!-- 왼쪽 수직 바 추가 -->
                <div class="position-absolute" style="top: 50%; transform: translateY(-50%); left: -15px; height: 3px; width: 15px; background-color: #000000;"></div>
            </div>
        </div>
		
		<hr>
        <!-- 새로운 댓글 작성 폼 -->
		<div class="row mb-3">
            <div class="col-md-8 offset-md-2">
                <div class="card mb-2">
                    <div class="card-header d-flex justify-content-between">
                        <span>글쓰기</span>
                        <div>
                            <button class="btn btn-primary btn-sm mr-1">등록하기</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <textarea class="form-control mb-2" rows="3" placeholder="코멘트 내용을 입력하세요"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
