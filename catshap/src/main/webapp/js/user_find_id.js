$(function () {
    $('#findIdBtn').on('click', (e) => {
        e.preventDefault();

        if (validate()) {
           	const uname = $('#uname').val().trim();
            const email = $('#email').val().trim();

            $.ajax({
                type: 'POST',
                url: 'http://localhost:8888/catshap/user-id-recovery',
                data: {
                    uname: uname,
                    email: email
                },
                success: function (response) {
                    if (response.success) {
                        window.location.href = 'user_find_id_ok.jsp';
                    } else {
                        alert("올바르지 않은 계정입니다.");
                    }
                },
                error: function () {
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    });
    
    $('#cancelFindIdBtn').on('click', (e) => {
		e.preventDefault();
		window.location.href = 'user_login.jsp';
	});
});

// 유효성 검사 함수
const validate = () => {
    const unameValid = validateField('#uname', '#uname-error', '이름을 입력해주세요.') &&
    	validateFormat('#uname', '#uname-error', '이름 형식이 올바르지 않습니다.', regex.uname);
    const emailValid = validateField('#email', '#email-error', '이메일을 입력해주세요.') &&
        validateFormat('#email', '#email-error', '이메일 형식이 올바르지 않습니다.', regex.email);
    return unameValid && emailValid;
}
