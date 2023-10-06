/**
 * 
 */

var replyFunc = (function(){
	// 댓글 등록
	function register(reply, cb){
		$.ajax({
			url:'/NCTclub/comment/new',
			type:'post',
			// 서버에 전송하는 데이터 형식
			data: JSON.stringify(reply), // JSON객체를 문자열(텍스트)로 변환
            contentType: "application/json; charset=utf-8", // JSON 데이터로 설정
			success:function(result){
				if(cb){
					cb(result);
				}
			},
  			error:function(){alert("요청실패!!")}
		});
	}
	// 댓글 삭제
	function remove(reply, cb){
    $.ajax({
        type:'post',  // 변경: POST로 설정
        url:'/NCTclub/comment/delete', // 변경: URL 수정
        data: JSON.stringify(reply),
        contentType: "application/json; charset=utf-8", // JSON 데이터로 설정
        success:function(result){
            if(cb){
                cb(result);
            }
        },
        error:function(){alert("요청실패!!")}
    });
}
	// 댓글 전체 조회
	function get(nctmember_id, cb){
		$.get('/NCTclub/comment/list/'+nctmember_id, function(result){
			if(cb) cb(result);
		}).fail(function(){
			alert('요청실패!!');
		});
	}
	
	// 댓글 수정
	function update(reply, cb){
		$.ajax({
			url:'/NCTclub/comment/update/'+reply.commentid,
			type:'put',
			data:JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success:function(result){
				if(cb){
					cb(result);
				}
			},
			error:function(){alert("요청실패!!");}
		});
	}
	
	function getList(param, cb){
		var bid= param.bid;
		var viewPage = param.viewPage;
		
		// data: 전송타입 설정 속성, dataType: 응답타입 설정 속성 
		// dataType을 JSON형태로 설정 
		$.getJSON("/NCTclub/comment/list/"+bid+"/"+viewPage+".json",
			function(result){
				if(cb) cb(result);
			}).fail(function(){alert("요청실패!!!"); }); 
	}
		
	function showDateTime(timeValue) {
	    var rDate = new Date(timeValue); // 댓글등록시간으로 Date객체 생성
	
	    var yy = rDate.getFullYear();
	    var mm = rDate.getMonth() + 1;   // getMonth()는 0부터 시작 -> 1월은 0+1로 표현해야함
	    var dd = rDate.getDate();
	    var hh = rDate.getHours();      // 댓글 등록 시간 구하기
	    var mi = rDate.getMinutes();    // 분
	
	    // 날짜와 함께 시간과 분도 표시 
	    return [yy, '.', (mm > 9 ? '' : '0') + mm, '.', (dd > 9 ? '' : '0') + dd, ' ', (hh > 9 ? '' : '0') + hh, '.', (mi > 9 ? '' : '0') + mi].join('');
	}
	return{
		register : register,
		remove : remove,
		get : get,
		update : update,
		getList : getList,
		showDateTime : showDateTime
	}
})();