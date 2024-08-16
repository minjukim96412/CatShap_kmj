<%@page import="catshap.butler.bean.Users"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="initial-scale=1, width=device-width" />
  <link href="./css/global.css" rel="stylesheet" />
  <link href="./css/user_mypage.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="./js/check_login.js"></script>
  <script src="./js/user.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <div class="login-desktop">
    <section class="login">
      <div class="login-form">
        <div class="login-header">
          <div class="login-title">
            <div class="title">
              <div class="strong-login-wrapper">
                <h3 class="strong-login">MY PAGE</h3>
              </div>
              <div class="loginTitle">마이 페이지</div>
            </div>
            <div class="horizontal-divider-frame">
              <div class="horizontal-divider"></div>
            </div>
          </div>
        </div>
          <div class="profile-card">
		            <div class="profile-image">
				                <img src="./image/mypage_icon.png" alt="Profile Image">
				            </div>
				                 <%
					                HttpSession session2 = request.getSession();
					                Users user = (Users) session2.getAttribute("user"); // 세션에서 사용자 정보 가져오기
					                if (user != null) {
					                    String userNick = user.getUnick();
					                    out.print("<h2><span style='color:#FF5733'>" + userNick + "</span>님</h2><p>환영합니다</p>");
					                } else {
					                    out.print("<h2>사용자 정보를 불러올 수 없습니다.</h2>");
					                }
					              %>    
					         <button type="button" class="userExitBtn" id="userExitBtn">
								<div class="container47">
									<div>회원 탈퇴하기</div>
								</div>
							</button>     
							<div class="profile-info">
				              <nav class='profile-nav'>
				                <a href='#'>주문내역</a>
				                <a href='/catshap/user_modify.jsp'>회원정보 수정</a>
				                <a href='/catshap/user_myReview.jsp'>내 리뷰 보기</a>
				                <a href='/catshap/user_myQnA.jsp'>내 게시글 보기</a>
				              </nav>
		            </div>
		        </div>
		</div>
    </section>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>