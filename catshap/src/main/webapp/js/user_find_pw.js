$(function () {
    $('#findPwBtn').on('click', (e) => {
        e.preventDefault();

        if (validate()) {
           	console.log("모든 입력이 유효합니다!");
        }
    });
});

// 유효성 검사 함수
const validate = () => {
    const unameValid = validateField('#uname', '#uname-error', '이름을 입력해주세요.');
    const usidValid = validateField('#usid', '#usid-error', '아이디를 입력해주세요.');
    const emailValid = validateField('#email', '#email-error', '이메일을 입력해주세요.') &&
        validateEmailFormat('#email', '#email-error', '이메일 형식이 올바르지 않습니다.');
    return unameValid && usidValid && emailValid;
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
