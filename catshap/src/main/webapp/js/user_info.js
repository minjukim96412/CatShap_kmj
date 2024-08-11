$(document).ready(function() {
    // 페이지 로드 시 사용자 정보를 가져오는 코드
    $.ajax({
        url: '/catshap/user-info',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.error) {
                console.error(data.error);
            } else {
                $('#userno').val(data.userNo || ''); // 아이디는 읽기 전용
                $('#usid').val(data.usid || ''); // 아이디는 읽기 전용
                $('#uname').val(data.uname || '');
                $('#unick').val(data.unick || '');
                $('#uphone').val(data.uphone || '');
                $('#email').val(data.email || '');
                $('#umailAddress').val(data.umailAddress || '');
                $('#uaddress').val(data.uaddress || '');
                $('#udetailAddress').val(data.udetailAddress || '');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error fetching user info:', textStatus, errorThrown);
        }
    });

});

