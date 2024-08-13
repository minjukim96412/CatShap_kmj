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


           $('#reviewForm').on('submit', function(event) {
		        event.preventDefault(); // 폼 제출 기본 동작 방지
		
		        // 폼 데이터 가져오기
		        const prodNo = $('#prodNo').val();
		        const revTitle = $('#revTitle').val();
		        const revText = $('#revText').val();
		        const revScore = $('#revScore').val();
		
				console.log(prodNo);
		        // AJAX 요청
		        $.ajax({
		            url: '/catshap/RegistReview',
		            type: 'POST',
		            contentType: 'application/json',
		            data: JSON.stringify({
		                prodNo: prodNo,
		                revTitle: revTitle,
		                revText: revText,
		                revScore: revScore
		            }),
		            success: function(data) {
		                if (data.success) {
		                    $('#message').text('Review submitted successfully!');
		                    $('#reviewForm')[0].reset(); // 폼 리셋
		                } else {
		                    $('#message').text('Failed to submit review.');
		                }
		            },
		            error: function(xhr, status, error) {
		                $('#message').text('Error: ' + error);
		            }
		        });
		    });
 });