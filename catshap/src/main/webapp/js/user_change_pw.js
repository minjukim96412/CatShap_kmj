$(function() {
	$('#changePwBtn').on('click', (e) => {
		e.preventDefault();

		if (validate() && equalPassword()) {
			console.log('비밀번호 변경 시작!');
		}
	});

	$('#cancelChangePwBtn').on('click', (e) => {
		e.preventDefault();
		window.location.href = 'user_login.jsp';
	});
});

// 유효성 검사 함수
const validate = () => {
	const upassValid = validateField('#upass', '#upass-error', '비밀번호를 입력해주세요.') &&
		validateFormat('#upass', '#upass-error', '비밀번호 형식이 올바르지 않습니다.', regex.upass);
	const upassConfirmValid = validateField('#upassConfirm', '#upassConfirm-error', '비밀번호를 입력해주세요.');
	return upassValid && upassConfirmValid;
}

// 비밀번호 일치 여부 확인 함수
const equalPassword = () => {
	const upass = $('#upass').val().trim();
	const upassConfirm = $('#upassConfirm').val().trim();
	
	if (upass !== upassConfirm) {
		$('#upassConfirm-error').text("비밀번호가 일치하지 않습니다.").show();
		return false;
	} else {
		$('#upassConfirm-error').hide();
		return true;
	}
}
