//user_info.js
$(document).ready(() => {
    // 페이지 로드 시 사용자 정보를 서버에서 가져와서 폼에 채우기
    $.ajax({
        url: '/catshap/user-info',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.error) {
                alert(data.error);
                // 사용자 로그인 상태가 아닐 경우 처리
            } else {
                // 폼 필드를 사용자 데이터로 채우기
                $('#usid').val(data.usid);
                $('#uname').val(data.uname);
                $('#unick').val(data.unick);
                $('#uphone').val(data.uphone);
                $('#email').val(data.email);
                $('#umailAddress').val(data.umailAddress);
                $('#uaddress').val(data.uaddress);
                $('#udetailAddress').val(data.udetailAddress);
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error: ' + status + error);
        }
    });

    // 사용자 정보 수정 버튼 클릭 이벤트
    $('#modifyBtn').on('click', function() {
        var userInfo = {
            uname: $('#uname').val(),
            unick: $('#unick').val(),
            utelecom: $('#utelecom').val(),
            uphone: $('#uphone').val(),
            email: $('#email').val(),
            umailAddress: $('#umailAddress').val(),
            uaddress: $('#uaddress').val(),
            udetailAddress: $('#udetailAddress').val()
        };

        $.ajax({
            url: '/catshap/update-user-info',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(userInfo),
            success: function(response) {
                alert('정보가 성공적으로 수정되었습니다.');
                // 성공적으로 수정 후 페이지 이동
                window.location.href = '/catshap/user_mypage.jsp';
                
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('정보 수정 실패:', textStatus, errorThrown);
                alert('정보 수정 실패. 다시 시도해 주세요.');
            }
        });
    });
});

