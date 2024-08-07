$(function () {
    $('#findIdBtn').on('click', (e) => {
        e.preventDefault();

        if (validate()) {
           	const uname = $('#uname').val().trim();
            const email = $('#email').val().trim();

            $.ajax({
                type: 'POST',
                url: 'http://localhost:8888/catshap/userFindId',
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
});

// 유효성 검사 함수
const validate = () => {
    const unameValid = validateField('#uname', '#uname-error', '이름을 입력해주세요.');
    const emailValid = validateField('#email', '#email-error', '이메일을 입력해주세요.') &&
        validateEmailFormat('#email', '#email-error', '이메일 형식이 올바르지 않습니다.');
    return unameValid && emailValid;
}

// 이름, 이메일 입력했는지 확인 함수
const validateField = (selector, errorSelector, errorMessage) => {
    const value = $(selector).val().trim();
    if (value === '') {
        $(errorSelector).text(errorMessage).show();
        return false;
    } else {
        $(errorSelector).hide();
        return true;
    }
} 

// 이메일 형식 확인 함수
const validateEmailFormat = (selector, errorSelector, errorMessage) => {
    const value = $(selector).val().trim();
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 기본 이메일 정규 표현식
    if (!emailPattern.test(value)) {
        $(errorSelector).text(errorMessage).show();
        return false;
    } else {
        $(errorSelector).hide();
        return true;
    }
}
