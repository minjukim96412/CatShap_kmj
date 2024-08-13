 // 페이지가 로드된 후 실행되도록 설정
document.addEventListener("DOMContentLoaded", function() {
    // input 요소를 선택
    var prodNoInput = document.getElementById("prodNo");
    
    // value 값을 가져와서 페이지에 표시
    var prodNoValue = prodNoInput.value;
    var displayElement = document.getElementById("displayProdNo"); // 값을 표시할 HTML 요소의 ID
    if (displayElement) {
        displayElement.textContent = "Product Number: " + prodNoValue;
    }
});

 $(document).ready(function() {
            var $modal = $('#reviewModal');
            var $openModalButton = $('#reviewBtn');

            // 모달 열기
            $openModalButton.on('click', function() {
                $modal.show();
            });

            // 모달 닫기 버튼 클릭 시 모달 닫기
            $modal.on('click', '.close', function () {
                $modal.hide();
            });

            // 모달 외부 클릭 시 모달 닫기
            $(window).on('click', function (event) {
                if ($(event.target).is($modal)) {
                    $modal.hide();
                }
            });

       // 리뷰 제출
    $('#submitReview').on('click', function(event) {
        event.preventDefault(); // 폼 제출 기본 동작 방지
 	checkLoginStatus(function() {
        // 폼 데이터 가져오기
        const userNo = JSON.parse(sessionStorage.getItem('userNo'));
        const prodNo = $('#prodNo').val();
        const revTitle = $('#revTitle').val();
        const revText = $('#revText').val();
        const revScore = $('#revScore').val();

		// 값 콘솔에 출력하기
	    console.log('userNo:', userNo);
	    console.log('prodNo:', prodNo);
	    console.log('revTitle:', revTitle);
	    console.log('revText:', revText);
	    console.log('revScore:', revScore);

        // 필수 필드가 비어있는지 확인
        if (!userNo || !prodNo || !revTitle || !revText || isNaN(revScore) || revScore <= 0) {
            $('#message').text('모든 필드를 올바르게 입력하세요.');
            return;
        }

        // AJAX 요청
        $.ajax({
            url: '/catshap/RegistReview',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                userNo: userNo,
                prodNo: prodNo,
                revTitle: revTitle,
                revText: revText,
                revScore: revScore // 숫자로 변환
            }),
            success: function(data) {
                if (data.success) {
                    $('#message').text('리뷰가 성공적으로 제출되었습니다!');
                    $('#reviewModal').hide(); // 모달 닫기
                } else {
                    $('#message').text('리뷰 제출에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                $('#message').text('오류: ' + error);
            }
        });
        }); 
    });
 });
 
 const checkLoginStatus = (callback) => {
    $.ajax({
        url: '/catshap/check-login-status',
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            if (!response.loggedIn) {
                alert('로그인 정보가 없습니다. 로그인 페이지로 이동합니다.');
                window.location.href = '/catshap/user_login.jsp'; // 로그인 페이지로 리디렉션
            } else {
                callback(); // 로그인 상태가 유효하면 콜백 함수 호출
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error checking login status:', textStatus, errorThrown);
        }
    });
}