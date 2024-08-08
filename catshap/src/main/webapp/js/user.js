$(function() {
	// 로그인의 아이디 찾기 버튼 클릭한 경우
	$('#userLoginFindIdBtn').on('click', () => {
		window.location.href = 'user_find_id.jsp';
	});

	// 로그인의 비밀번호 찾기 버튼 클릭한 경우
	$('#userLoginFindPassBtn').on('click', () => {
		window.location.href = 'user_find_pw.jsp';
	});

	// 아이다 찾기의 아이디 찾기 버튼 클릭한 경우
	$('#userFindIdBtn').on('click', (e) => {
		e.preventDefault();
		
		const isUnameValid = validateUname();
		const isEmailValid = validateEmail();
		if (isUnameValid && isEmailValid) {
			const uname = $('#uname').val().trim();
			const email = $('#email').val().trim();

			$.ajax({
				type: 'POST',
				url: 'http://localhost:8888/catshap/user-id-recovery',
				data: {
					uname: uname,
					email: email
				},
				success: function(response) {
					if (response.success) {
						window.location.href = 'user_find_id_ok.jsp';
					} else {
						alert("올바르지 않은 계정입니다.");
					}
				},
				error: function() {
					alert('서버 오류가 발생했습니다.');
				}
			});
		}
	});

	// 비밀번호 찾기의 비밀번호 찾기 버튼을 클릭한 경우
	$('#userFindPwBtn').on('click', (e) => {
		e.preventDefault();

		const isUnameValid = validateUname();
		const isUsidValid = validateUsid();
		const isEmailValid = validateEmail();
		
		if (isUnameValid && isUsidValid && isEmailValid) {
			const uname = $('#uname').val().trim();
			const usid = $('#usid').val().trim();
			const email = $('#email').val().trim();

			$.ajax({
				type: 'POST',
				url: 'http://localhost:8888/catshap/user-pw-recovery',
				data: {
					uname: uname,
					usid: usid,
					email: email
				},
				success: function(response) {
					if (response.success) {
						sessionStorage.setItem('user', JSON.stringify(response.user));
						window.location.href = 'user_find_pw_code.jsp';
					} else {
						alert("올바르지 않은 계정입니다.");
					}
				},
				error: function() {
					alert('서버 오류가 발생했습니다.');
				}
			});
		}
	});

	// 비밀번호 찾기의 인증코드 확인 버튼 클릭한 경우
	$('#user_find_pw_code').on('click', (e) => {
		e.preventDefault();

		const uauthcode = $('#uauthcode').val().trim();
		const user = JSON.parse(sessionStorage.getItem('user'));
		if (validateUauthcode()) {
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

	// 비밀번호 찾기의 인증코드 다시받기 버튼 클릭한 경우
	$('#userTryPwcodeBtn').on('click', () => {
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

	// 비밀번호 변경의 비밀번호 변경 버튼 클릭한 경우
	$('#userChangePwBtn').on('click', (e) => {
		e.preventDefault();

		const upass = $('#upass').val().trim();
		const upassConfirm = $('#upassConfirm').val().trim();
		const user = JSON.parse(sessionStorage.getItem('user'));
		const isPasswordValid = validatePassword();
		const isEequalPassword = equalPassword(upass, upassConfirm);
		if (isPasswordValid && isEequalPassword) {
			$.ajax({
				type: 'POST',
				url: 'http://localhost:8888/catshap/user-pass-change',
				data: {
					usid: user.usid,
					upass: upass
				},
				success: function(response) {
					console.log(response);
					if (response.success) {
						window.location.href = 'user_change_pw_ok.jsp';
					} else {
						alert('비밀번호 변경 실패...');
					}
				},
				error: function() {
					alert('서버 오류가 발생했습니다.');
				}
			});
		}
	});

	// 취소 버튼을 클릭한 경우
	$('#userCancelBtn').on('click', (e) => {
		e.preventDefault();
		window.location.href = 'user_login.jsp';
	});

	// 로그인하러 가기 버튼 클릭 시
	$('#toLoginBtn').on('click', () => {
		window.location.href = 'user_login.jsp';
	});

	// 메인화면으로 이동 버튼 클릭 시
	$('#toMainBtn').on('click', () => {
		window.location.href = 'main.jsp';
	});

});

// 이름 유효성 검사 메소드
const validateUname = () => {
	return validateField('#uname', '#uname-error', '이름을 입력해주세요.') &&
		validateFormat('#uname', '#uname-error', '이름 형식이 올바르지 않습니다.', regex.uname);
}

// 아이디 유효성 검사 메소드
const validateUsid = () => {
	return validateField('#usid', '#usid-error', '아이디를 입력해주세요.') &&
		validateFormat('#usid', '#usid-error', '아이디 형식이 올바르지 않습니다.', regex.usid);
}

// 이메일 유효성 검사 메소드
const validateEmail = () => {
	return validateField('#email', '#email-error', '이메일을 입력해주세요.') &&
		validateFormat('#email', '#email-error', '이메일 형식이 올바르지 않습니다.', regex.email);
}

// 인증코드 유효성 검사 메소드
const validateUauthcode = () => {
	const uauthcodeValid = validateField('#uauthcode', '#uauthcode-error', '인증코드를 입력해주세요.') &&
		validateFormat('#uauthcode', '#uauthcode-error', '인증코드는 6개의 숫자입니다.', regex.uauthcode);
	return uauthcodeValid;
}

// 새로운 비밀번호 유효성 검사 메소드
const validatePassword = () => {
	const upass = $('#upass').val().trim();
	const typesCount = [regex.lowerCase.test(upass),
	regex.upperCase.test(upass),
	regex.number.test(upass),
	regex.specialChar.test(upass)]
		.filter(Boolean).length;

	const upassBlankValid = validateField('#upass', '#upass-error', '비밀번호를 입력해주세요.');
	let upassPatternValid = false;
	if (!regex.upasslength.test(upass) || typesCount < 3) {
		$('#upass-error').text('비밀번호는 8~16자 사이이며, 대문자, 소문자, 숫자, 특수문자 중 3가지 이상을 포함해야 합니다.').show();
		upassPatternValid = false;
	} else {
		$('#upass-error').hide();
		upassPatternValid = true;
	}
	return upassBlankValid && upassPatternValid;
}

// 비밀번호 일치 여부 확인 메소드
const equalPassword = (upass, upassConfirm) => {
	if (upass !== upassConfirm) {
		$('#upassConfirm-error').text("비밀번호가 일치하지 않습니다.").show();
		return false;
	} else {
		$('#upassConfirm-error').hide();
		return true;
	}
}

