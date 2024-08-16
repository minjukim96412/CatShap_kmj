<%@page import="catshap.butler.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%
	Users user = (Users)session.getAttribute("user");
	System.out.println(user);
	if(user != null){
		int userNo = user.getUserNo(); 
	}
%>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/user_myReview.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@700&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Short+Stack:wght@400&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400;700&display=swap" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <script src="./js/check_login.js" ></script>
    <script src="./js/user_myReview.js" ></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="xans-element- xans-myshop xans-myshop-boardpackage">
        <div class="sp--width" scope="box">
            <div class="sp--title" theme="underline-heavy" scale="2xl-nude">
                <div class="sp--title-inner">
                    <dt><span>후기 목록</span></dt>
                    <i class="sp--icon" ico="string" rotate="135" scale="xs" hspace="xs"></i>
                    <span class="sp--title-subtext">내가 작성한 상품후기의 목록입니다.</span>
                </div>
            </div>
            <!-- 모달 창 HTML -->
			<div id="reviewModal" class="modal">
			  <div class="modal-content">
			    <span class="close">&times;</span>
			    <h2 id="modalReviewTitle">리뷰 제목</h2>
			    <p><strong>작성자:</strong> <span id="modalReviewAuthor"></span></p>
			    <p><strong>작성일:</strong> <span id="modalReviewDate"></span></p>
			    <p id="modalReviewContent"></p>
			  </div>
			</div>
            <div class="xans-element- xans-myshop xans-myshop-boardlist">
                <table  id="reviewTable" class="sp--table" theme="lg-center" gap="2xl" solid="light-nude" vertical="middle">
                    <caption>게시물 관리 목록</caption>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>상품</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody id="reviewTableBody">
                        <!-- 내가 쓴 리뷰 내용 출력 -->
                    </tbody>
                </table>
            </div>
             <!-- 페이지네이션 -->
            <div class="pagination"></div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>