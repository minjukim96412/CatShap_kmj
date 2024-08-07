$(function () {
    $('#findIdBtn').on('click', (e) => {
        e.preventDefault();

        validateField('#uname', '#uname-error', '이름을 입력해주세요.');
        validateField('#email', '#email-error', '이메일을 입력해주세요.');
    });
});

// 이름, 이메일 입력했는지 확인 함수
const validateField = (selector, errorSelector, errorMessage) => {
    const value = $(selector).val().trim();
    if (value === '') {
        $(errorSelector).text(errorMessage).show();
    } else {
        $(errorSelector).hide();
    }
} 