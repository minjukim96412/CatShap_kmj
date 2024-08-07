$(function () {
	$('#tryAuthcodeBtn').on('click', () => {	
		const user = JSON.parse(sessionStorage.getItem('user'));
		console.log("인증 코드 재받기");
		// 인증코드 다시받기 버튼 클릭 시
	    $.ajax({
	        type: 'POST',
	        url: 'http://localhost:8888/catshap/user-pw-recovery',
	        data: {
	            uname: user.uname,
	            usid: user.usid,
	            email: user.email
	        },
	        success: function (response) {
	            if (response.success) {
					alert("인증코드가 재전송 되었습니다.");
	            } else {
	                alert("인증코드 재전송 실패... 다시 클릭해주세요.");
	            }
	        },
	        error: function () {
	            alert('서버 오류가 발생했습니다.');
	        }
	    })
    });

 	// 취소 버튼 클릭 시
    $('#cancelFindPwBtn').on('click', () => {
        window.location.href = 'user_login.jsp';
    });

});