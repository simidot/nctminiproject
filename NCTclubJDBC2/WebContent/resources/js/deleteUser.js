/**
 * 
 */

// JavaScript 코드
	document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll(".delete-button");
    const modal = document.getElementById("myModal");
    const confirmDeleteButton = document.getElementById("confirmDelete");
    const closeButton = document.querySelector(".close");

    let userIdToDelete = null;

    // 각 버튼 클릭 시 해당 유저 ID를 저장하고 모달 창을 엽니다.
    deleteButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            userIdToDelete = button.getAttribute("data-user-id");
            console.log(userIdToDelete);
            modal.style.display = "block";
        });
    });

    // 모달 닫기 버튼 클릭 시 모달을 닫습니다.
    closeButton.addEventListener("click", function () {
        modal.style.display = "none";
    });

    // 확인 버튼 클릭 시 삭제 동작을 수행합니다.
    confirmDeleteButton.addEventListener("click", function () {
    	// "삭제" 버튼 클릭 시, 삭제 AJAX 요청을 보냅니다.
    	    if (userIdToDelete) {
    	        // AJAX 요청을 보낼 URL을 설정합니다.
			const deleteUrl = '<c:url value="/admin/deleteuser"/>' + "?userId=" + userIdToDelete;
		     console.log(deleteUrl);
    	        $.ajax({
    	            type: "GET", // HTTP 요청 메서드 선택 (GET 또는 POST)
    	            url: deleteUrl, // 요청을 보낼 URL
    	            dataType: "text", // 서버 응답 데이터 유형 (JSON을 기대하면 json으로 설정)
    	            success: function (response) {
    	                // 성공적으로 응답을 받았을 때 처리할 코드
    	                if (response =="yes") {
    	                    // 삭제가 성공했을 경우 추가 로직을 작성하세요.
    	                    // 예를 들어, 화면에서 해당 행을 삭제하거나 다시 로드할 수 있습니다.
    	                    window.location.href = "${ctxPath}/admin/userlist";

    	                    console.log("회원 삭제 성공");
    	                } else if (response == "no"){
    	                    console.error("회원 삭제 실패");
    	                }
    	               // modal.style.display = "none"; // 모달 닫기
    	            },
    	            error: function () {
    	                // 요청이 실패했을 때 처리할 코드
    	                console.error("요청 실패");
    	                //modal.style.display = "none"; // 모달 닫기
    	            }
                

    	        });
    	    }
    	});


     // 모달 외부를 클릭하면 모달을 닫습니다.
    window.addEventListener("click", function (event) {

        if (event.target === modal) {
            modal.style.display = "none";
        }
    }); 
});
