/**
 * 
 */
var nameChecked = false;  // 아이디 중복 검사 상태 저장 변수
$("#name").on("change", function() {
    nameChecked = false;  // 아이디가 변경되었으므로 상태 초기화
    nameCheck();  // 아이디 중복 검사 실행
});

// 멤버 이름 체크 실행 ajax 함수 
function nameCheck() {
    if (nameChecked) {
        return;  // 이미 중복 검사를 통과한 경우, 검사 건너뛰기
    }

    var name = $("#name").val();

    $.ajax({
        url: nameCheckURL,
        type: "get",
        data: {"name": name},
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8", // Explicitly set the content type
        success: function(responseData) {
            if (responseData == "yes") {
                $("#name").css("border", "1px solid green");  // 테두리 초록색으로
                $("#nameWarning").removeClass('text-danger').addClass('text-success');
                $("#nameWarning").text("멤버 등록이 가능합니다.");  // 사용 가능 메시지 출력
                nameChecked = true;  // 중복 검사 통과 상태 저장
            } else {
                $("#name").css("border", "1px solid red");  // 테두리 빨간색으로
                $("#nameWarning").removeClass('text-danger').addClass('text-danger');
                $("#nameWarning").text("이미 등록된 멤버입니다. ");  // 사용 불가 메시지 출력
                nameChecked = false;  // 중복 검사 실패 상태 저장
            }
        },
        error: function() {
            alert("error!!");
        }
    });
}

// 포지션 체크박스 선택 여부 확인 함수
function isPositionSelected() {
    var selectedPosition = $("input[name='position']:checked").val();
    return typeof selectedPosition !== "undefined" && selectedPosition !== "";
}

// 소속 그룹 체크박스 선택 여부 확인 함수
function isGroupSelected() {
    var groupCheckboxes = $("input[name='groupList']:checked");
    return groupCheckboxes.length > 0;
}

// 이미지 파일 첨부 확인 함수
function isImageAttached() {
    var imageInput = document.getElementById("file");
    return imageInput.files.length > 0;
}




//폼 제출 시 등록폼 개별 확인 함수
function validateForm() {
    // 이름 검사
    if (!$("#name").val()) {
        alert("멤버 이름을 입력해주세요.");
        $("#name").focus();
        return false;
    } else if (!nameChecked) {
        alert("멤버 중복 확인이 필요합니다.");
        $("#name").focus();
        return false;
    }

    //생년월일 검사
	var birthDateValue = $("#birthdate").val();
	if (birthDateValue) {
	    var birthDate = new Date(birthDateValue);
	    var yesterday = new Date();
	    yesterday.setDate(yesterday.getDate() - 1);
	    if (birthDate >= yesterday) {
	        alert("생년월일은 어제 날짜 이전으로 선택해주세요.");
	        $("#birthdate").focus();
	        return false;
	    }
	}

	// 국적 검사
    var nationality = $("#nationality").val();
    if (!nationality) {
        alert("국적을 입력해주세요.");
        $("#nationality").focus();
        return false;
    }


	// 포지션 검사
    if (!isPositionSelected()) {
        alert("포지션을 선택해주세요.");
        return false;
    }

	// 이미지 파일 검사
    if (!isImageAttached()) {
        alert("이미지 파일을 첨부해주세요.");
        return false;
    }
	
	
	// 소속 그룹 검사
    if (!isGroupSelected()) {
        alert("소속 그룹을 선택해주세요.");
        return false;
    }

    // 모든 유효성 검사를 통과하면 폼 제출
    return true;
}

// 폼 제출 이벤트 리스너 추가
$(document).ready(function() {
    $("form").on("submit", function(e) {
        if (!validateForm()) {
            e.preventDefault();  // 폼 제출 막기
        }
    });
});
