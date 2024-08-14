$(document).ready(function() {
    loadReviews();
    
    // 모달창 닫기 버튼 이벤트 리스너
    $('.close').click(function() {
        $('#reviewModal').hide();
    });
});

function loadReviews() {
    $.ajax({
        url: '/catshap/getReviews', // 서블릿 URL
        method: 'GET',
        dataType: 'json',
        success: function(reviews) {
            console.log(reviews); // 리뷰 데이터를 콘솔에 출력
            // 리뷰 데이터를 테이블에 추가
            var tableBody = $('#reviewTableBody');
            tableBody.empty(); // 기존 내용을 지웁니다

            if (reviews.length === 0) {
                tableBody.append('<tr><td colspan="6">작성한 게시물이 없습니다.</td></tr>');
            } else {
                reviews.forEach(function(review) {
                    // 이미지 태그와 제품 이름을 함께 출력
                    var productInfo = '<img src="./image/' + review.prodImgPath + '" alt="Product Image" style="width: 50px; height: 50px;"> ' + review.prdoTitleName;
                    
                    // 리뷰 내용 요약
                    var shortText = review.revText.length > 10 ? review.revText.substring(0, 10) + '...' : review.revText;
                    
                    // 리뷰 내용 클릭 시 모달창에 내용 표시
                    var reviewContentLink = '<a href="#" class="review-link" ' +
                                            'data-title="' + review.revTitle + '" ' +
                                            'data-author="' + review.unick + '" ' +
                                            'data-date="' + review.revRegDate + '" ' +
                                            'data-content="' + review.revText + '">자세히 보기</a>';
                    
                    tableBody.append('<tr>' +
                        '<td>' + review.reviewNo + '</td>' +
                        '<td>' + productInfo + '</td>' +
                        '<td><a href="#">' + review.revTitle + '</a></td>' +
                        '<td>' + shortText + ' ' + reviewContentLink + '</td>' +
                        '<td>' + review.unick + '</td>' +
                        '<td>' + review.revRegDate + '</td>' +
                        '</tr>');
                });
                
                // 리뷰 링크 클릭 시 모달창에 내용 표시
                $('.review-link').click(function(event) {
                    event.preventDefault();
                    var title = $(this).data('title');
                    var author = $(this).data('author');
                    var date = $(this).data('date');
                    var content = $(this).data('content');

                    $('#modalReviewTitle').text(title);
                    $('#modalReviewAuthor').text(author);
                    $('#modalReviewDate').text(date);
                    $('#modalReviewContent').text(content);
                    $('#reviewModal').show();
                });
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error fetching reviews:', textStatus, errorThrown);
        }
    });
}
