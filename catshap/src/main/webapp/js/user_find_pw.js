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
    const unameValid = validateField('#uname', '#uname-error', '이름을 입력해주세요.') &&
    	validateFormat('#uname', '#uname-error', '이름 형식이 올바르지 않습니다.', regex.uname);
    const usidValid = validateField('#usid', '#usid-error', '아이디를 입력해주세요.') &&
        validateFormat('#usid', '#usid-error', '아이디 형식이 올바르지 않습니다.', regex.usid);
    const emailValid = validateField('#email', '#email-error', '이메일을 입력해주세요.') &&
        validateFormat('#email', '#email-error', '이메일 형식이 올바르지 않습니다.', regex.email);
    return unameValid && usidValid && emailValid;
}
