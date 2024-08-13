// checkLogin.js
$(document).ready(function() {
    // 페이지가 로드된 후 로그인 상태를 확인하기 위한 AJAX 요청을 실행
	   $.ajax({
        url: '/catshap/check-login-status',
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            if (!response.loggedIn) {
                alert('로그인 정보가 없습니다. 로그인 페이지로 이동합니다.');
                window.location.href = '/catshap/user_login.jsp'; // 로그인 페이지로 리디렉션
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error checking login status:', textStatus, errorThrown);
        }
    });

});


