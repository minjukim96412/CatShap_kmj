<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.Users"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/user_find_pw_ok.css" />
    <link rel="stylesheet" href="./css/user_find.css" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/main.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
    <div class="login-desktop">
        <section class="login">
            <div class="login-form">
                <div class="login-header">
                    <div class="login-title">
                        <div class="title">
                            <div class="strong-login-wrapper">
                                <h3 class="strong-login">Find PW</h3>
                            </div>
                            <div class="findPwTitle">회원 비밀번호 찾기</div>
                        </div>
                        <div class="logo-container">
                            <img src="image/catShapLogo.png" alt="CatShapLogoImage" />
                        </div>
                    </div>
                </div>
                <div class="login-success">
				     <% 
					    HttpSession sessions = request.getSession(false);
				        Users user = (Users)(sessions != null ? sessions.getAttribute("user") : null);
	
				        if (user != null) {
				            out.print("<p>" + user.getEmail() + " 이메일로</p>");
				            out.print("<p>메일이 성공적으로 전송되었습니다.</p>");
				            session.invalidate();
				        } else {
				            out.println("<p>비밀번호 찾기 실패. 다시 시도해주세요.</p>");
				        }
				    %>
                </div>
                <div class="findPwBtnDiv">
                    <button id="toLoginBtn" class="toLoginBtn">비밀번호 찾으러 가기</button>
                    <button id="toMainBtn" class="toMainBtn">메인화면으로 이동</button>
                </div>
            </div>
        </section>
    </div>
</body>

</html>