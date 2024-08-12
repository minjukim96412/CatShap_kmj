<%@page import="catshap.butler.bean.Users"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

	HttpSession session2 = request.getSession();
	Users user = (Users) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/user.css" />
    <link rel="stylesheet" href="./css/global.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="./js/check_login.js"></script>
	<script src="./js/user_regex.js"></script>
	<script src="./js/user.js"></script>
	<script>
        $(document).ready(function() {
            // 사용자 정보를 JSON 형태로 JavaScript에 전달
            const user = {
                usid: '<%= user.getUsid() %>',
                userNo: '<%= user.getUserNo() %>'
            };
            sessionStorage.setItem('user', JSON.stringify(user));
        });
    </script>
</head>
<body>
    <div class="login-desktop">
        <section class="login">
            <div class="login-form">
                <div class="login-header">
                    <div class="login-title">
                        <div class="title">
                            <div class="strong-login-wrapper">
                                <h3 class="strong-login">Change Password</h3>
                            </div>
                            <div class="changePwTitle">회원 비밀번호 변경</div>
                        </div>
                        <div class="horizontal-divider-frame">
                            <div class="horizontal-divider"></div>
                        </div>
                    </div>
                </div>
                <form action="/user-pass-change" method="post">
                    <div class="input-fields-parent">
                        <div class="input-fields">
                            <div class="find-input">
                                <div class="input-title-container">
                                    <div class="loginDetailTitle">비밀번호 변경하기</div>
                                </div>
                                <div class="user-input">
                                    <label for="upass">새 비밀번호</label>
                                    <input id="upass" class="label-input-upass" placeholder="새로운 비밀번호를 입력해주세요." type="text" />
                                    <p id="upass-error" class="error-message" style="display: none;"></p>
                                    <label for="upassConfirm">비밀번호 확인</label>
                                    <input id="upassConfirm" class="label-input-upassConfirm" placeholder="다시 비밀번호를 입력해주세요." type="password" />
                                    <p id="upassConfirm-error" class="error-message" style="display: none;"></p>
                                </div>
                            </div>
                        </div>
                        <div class="changePwBtnDiv">
                            <button id="userChangePwBtn" class="changePwBtn" type="submit">비밀번호 변경</button>
                            <button id="userCancelBtn" class="cancelFindIdBtn" type="button">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</body>
</html>