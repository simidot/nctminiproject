<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!-- header html -->
<%@ include file="inc/header.jsp" %>


<!-- main html -->
<div class="container shadow py-5 w-25 rounded p-5 my-auto">
<h2 class="text-center mb-3">회원가입</h2>
    <form action='${ctxPath}/user/register' method='post'>
            <div class="form-group row">
            <label for="userId" class="col-sm-3 col-form-label text-nowrap">아이디:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control mb-2" id="userId" name="userId" required>
                 <a class="btn btn-dark text-light w-100 mb-2 p-2" onclick="idCheck()">ID Check</a>
            </div>
        	</div>

        <div class="form-group row">
            <label for="password" class="col-sm-3 col-form-label text-nowrap">비밀번호:</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
        </div>
        
<!--         <div class="form-group row">
            <label for="passwordconfirm" class="col-sm-3 col-form-label text-nowrap">비밀번호 재확인:</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" id="passwordconfirm" name="passwordconfirm" required>
            </div>
        </div>
 -->
        <div class="form-group row">
            <label for="username" class="col-sm-3 col-form-label text-nowrap">Full Name:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
        </div>

        <div class="form-group row">
            <label for="nickname" class="col-sm-3 col-form-label text-nowrap">Nickname:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="nickname" name="nickname">
            </div>
        </div>

        <div class="form-group row">
            <label for="birthdate" class="col-sm-3 col-form-label text-nowrap">Birth Date:</label>
            <div class="col-sm-9">
                <input type="date" class="form-control" id="birthdate" name="birthdate">
            </div>
        </div>

        <div class="form-group row">
            <label for="phone" class="col-sm-3 col-form-label text-nowrap">Phone:</label>
            <div class="col-sm-9">
                <input type="tel" class="form-control" id="phone" name="phone">
            </div>
        </div>

        <div class="form-group row">
            <label for="email" class="col-sm-3 col-form-label">Email:</label>
            <div class="col-sm-9">
                <input type="email" class="form-control" id="email" name="email">
            </div>
        </div>

        <div class="form-group row">
            <label for="address" class="col-sm-3 col-form-label">Address:</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="address" name="address">
            </div>
        </div>

        <button type="submit" class="btn btn-dark d-block mx-auto">가입하기</button>
    </form>
</div>

<!-- 아이디 중복체크 Modal -->
<div class="modal fade" id="chkModal" >
  <div class="modal-dialog modal-sm modal-dialog-centered mb-auto">
	<div class="modal-content" style="background : #ffffff">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title ms-auto ps-4 text-center">중복 확인</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
    		<span aria-hidden="true">&times;</span>
			</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body text-center" id="chkMsg"></div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn bg-dark text-light" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>

<script>
   function idCheck(){
      var userId = $("#userId").val();
 
      $.ajax({
         url:"<c:url value='/user/idCheck.do'/>",	
         type:"get",
         data:{"userId":userId}, //서버에 전송할 데이터
         success : function(responseData){
        	 
            // responseData = "yes" : 사용가능, "no":사용불가
            // alert(responseData);
            if(responseData=="yes"){
               $("#chkMsg").html("사용가능한 아이디 입니다.");
            }else{
               $("#chkMsg").html("사용할 수 없는 아이디 입니다.");
            }
            $("#chkModal").modal("show");
         },
         error: function(){alert("error!!")}
      });
   }
   
</script>

<!-- footer html -->
<%@ include file="inc/footer.jsp" %>