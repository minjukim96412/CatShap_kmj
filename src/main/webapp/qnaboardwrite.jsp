<%@page import="catshap.butler.bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/qnaboardwrite.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/check_login.js"></script>  
    <script>
        function openProductSearch() {
            window.open('${pageContext.request.contextPath}/api/qnaproductsearch.jsp', '상품 검색', 'width=600,height=400');
        }
        function selectProduct(prodNo, prodName) {
            document.getElementById('prodNoInput').value = prodNo;
            document.getElementById('prodNameInput').value = prodName;
        }
    </script>
</head>
<body>
    <form action="/catshap/QnaInsertServlet" method="post">
        <section class="author-input">
            <div class="author-input-inner">
                <div class="form-header-parent">
                    <div class="form-header">
                        <div class="horizontalborder5">
                            <div class="div113">글 작성</div>
                        </div>
                        <div class="instruction">
                            <div class="div114">아래 양식을 확인하고 입력해주세요.</div>
                        </div>
                    </div>
                    <div class="row23">
                        <div class="title-cell">
                            <div class="cell6">제목</div>
                        </div>
                        <div class="options1">
                            <select class="div115" name="qnacatno">
                                <option value="1">상품문의</option>
                                <option value="2">배송문의</option>
                                <option value="3">기타문의</option>
                            </select>
                        </div>
                        <div class="options2">
                            <input class="container24" placeholder="퍼피독에 문의합니다." type="text" name="qnatitle" required />
                            <button type="button" onclick="openProductSearch()">상품 검색</button>
                            <input type="text" id="prodNameInput" readonly placeholder="선택된 상품명">
                            <input type="hidden" id="prodNoInput" name="prodno" value="0">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row-wrapper">
                <div class="data-application">
                    <textarea class="backgroundborder9" name="qnatext" required></textarea>
                </div>
            </div>
            <div class="actions-area">
                <div class="actions-row">
                    <div class="item4" id="itemContainer">
                        <div class="link14">
                            <div class="list-icon-area">
                                <img class="icon31" alt="" src="<%= request.getContextPath() %>/public/icon-82.svg" />
                            </div>
                            <div class="div124"> 목록으로</div>
                        </div>
                    </div>
                </div>
                <div class="frame-parent33">
                    <div class="frame-wrapper13">
                        <div class="item-group">
                            <div class="vertical-divider8"></div>
                        </div>
                    </div>
                    <div class="frame">
                        <div class="div123">건전한 게시글 문화를 응원합니다.</div>
                    </div>
                    <div class="vertical-divider9"></div>
                    <div class="submission-buttons">
                        <!-- 제출 버튼 -->
                        <button type="submit" class="link15" id="linkContainer2">                
                            <div class="div126"> + 글 등록하기</div>
                        </button>
                        <!-- 취소 버튼 -->
                        <button type="button" class="link16" id="linkContainer3" onclick="window.location.href='qnaboardmain.jsp'">
                            <div class="submission-elements">
                                <img class="icon30" alt="" src="<%= request.getContextPath() %>/public/icon-102.svg" />
                            </div>
                            <div class="div127"> X 취소하기</div>
                        </button>
                    </div>
                </div>
            </div>
        </section>
        <div class="frame-parent34">
            <div class="frame-parent35">
                <div class="strong-q-a-container">
                    <h2 class="strong-q5">Q & A</h2>
                </div>
                <div class="qa3">상품 Q&A입니다.</div>
            </div>
            <div class="horizontal-divider-container">
                <div class="horizontal-divider2"></div>
            </div>
        </div>
    </form>
</body>
</html>
