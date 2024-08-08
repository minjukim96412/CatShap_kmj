$(function() {
	$('#changePwBtn').on('click', (e) => {
		e.preventDefault();
		
		const upass = $('#upass').val().trim();
		const upassConfirm = $('#upassConfirm').val().trim();
		const user = JSON.parse(sessionStorage.getItem('user'));
		if (validate() && equalPassword(upass, upassConfirm)) {
			 $.ajax({
                type: 'POST',
                url: 'http://localhost:8888/catshap/user-pass-change',
                data: {
					usid: user.usid,
                   	upass: upass
                },
                success: function (response) {
					console.log(response);
                    if (response.success) {
                        window.location.href = 'user_change_pw_ok.jsp';
                    } else {
						alert('비밀번호 변경 실패...');
					}
                },
                error: function () {
                    alert('서버 오류가 발생했습니다.');
                }
            });
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
const equalPassword = (upass, upassConfirm) => {
	if (upass !== upassConfirm) {
		$('#upassConfirm-error').text("비밀번호가 일치하지 않습니다.").show();
		return false;
	} else {
		$('#upassConfirm-error').hide();
		return true;
	}
}
