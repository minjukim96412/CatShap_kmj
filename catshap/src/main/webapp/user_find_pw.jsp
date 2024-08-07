<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/user_find_pw.css" />
    <link rel="stylesheet" href="./css/user_find.css" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/main.css" />
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
                        <div class="horizontal-divider-frame">
                            <div class="horizontal-divider"></div>
                        </div>
                    </div>
                </div>
                <form action="/findUserPw" method="post">
                    <div class="input-fields-parent">
                        <div class="input-fields">
                            <div class="find-input">
                                <div class="input-title-container">
                                    <div class="findPwDetailTitle">비밀번호 찾기(이름 / ID / Email)</div>
                                </div>
                                <div class="user-input">
                                    <label for="uname">이름</label>
                                    <input id="uname" class="label-input-uname" placeholder="NAME" type="text" />
                                    <label for="usid">아이디</label>
                                    <input id="usid" class="label-input-usid" placeholder="ID" type="text" />
                                    <label for="uemail">이메일</label>
                                    <input id="email" class="label-input-email" placeholder="EMAIL" type="email" />
                                </div>
                            </div>
                        </div>
                        <div class="findPwBtnDiv">
                            <button id="findPwBtn" class="findPwBtn">비밀번호 찾기</button>
                            <button id="cancelFindPwBtn" class="cancelFindPwBtn">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</body>
</html>