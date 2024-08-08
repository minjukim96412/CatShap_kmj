$(function() {

	// 인증코드 확인 버튼 클릭 시
	$('#verifyAuthcodeBtn').on('click', (e) => {
		e.preventDefault();

		const uauthcode = $('#uauthcode').val().trim();
		const user = JSON.parse(sessionStorage.getItem('user'));
		if(validate(uauthcode)) {
			$.ajax({
			type: 'POST',
			url: 'http://localhost:8888/catshap/user-authcode-verify',
			data: {
				uauthcode: uauthcode,
				usid: user.usid
			},
			success: function(response) {
				if (response.success) {
					$('#uauthcode-error').hide();
					window.location.href = 'user_change_pw.jsp';
				} else {
					$('#uauthcode-error').text("인증코드 불일치합니다! 다시 입력해주세요.").show();
				}
			},
			error: function() {
				alert('서버 오류가 발생했습니다.');
			}
		})
		}
	});

	// 인증코드 다시받기 버튼 클릭 시
	$('#tryAuthcodeBtn').on('click', () => {
		const user = JSON.parse(sessionStorage.getItem('user'));
		$.ajax({
			type: 'POST',
			url: 'http://localhost:8888/catshap/user-pw-recovery',
			data: {
				uname: user.uname,
				usid: user.usid,
				email: user.email
			},
			success: function(response) {
				if (response.success) {
					alert("인증코드가 재전송 되었습니다.");
				} else {
					alert("인증코드 재전송 실패... 다시 클릭해주세요.");
				}
			},
			error: function() {
				alert('서버 오류가 발생했습니다.');
			}
		})
	});

	// 취소 버튼 클릭 시
	$('#cancelFindPwBtn').on('click', () => {
		window.location.href = 'user_login.jsp';
	});

});

const validate = () => {
	const uauthcodeValid = validateField('#uauthcode', '#uauthcode-error', '인증코드를 입력해주세요.') &&
		validateFormat('#uauthcode', '#uauthcode-error', '인증코드는 6개의 숫자입니다.', regex.uauthcode);
	return uauthcodeValid;
}