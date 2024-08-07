$(function () {
	// 로그인하러 가기 버튼 클릭 시
    $('#toLoginBtn').on('click', () => {
        window.location.href = 'user_login.jsp';
    });

 	// 메인화면으로 이동 버튼 클릭 시
    $('#toMainBtn').on('click', () => {
        window.location.href = 'main.jsp';
    });

});