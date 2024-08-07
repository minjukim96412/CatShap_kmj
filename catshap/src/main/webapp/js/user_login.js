$(function () {
	// 아이디 찾기 버튼 클릭 시
    $('#userFindId').on('click', () => {
        window.location.href = 'user_find_id.jsp';
    });

 	// 비밀번호 찾기 버튼 클릭 시
    $('#userFindPw').on('click', () => {
        window.location.href = 'user_find_pw.jsp';
    });

});