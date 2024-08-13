<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/qnaboardmain.css" />    
    <link rel="stylesheet" href="./css/review.css" />    
</head>
<body>
 	<header>
      <jsp:include page="header.jsp"></jsp:include>
   </header>
   <div class="div318">
      <div class="auth-container-wrapper">
         <div class="auth-container">
 			<div class="auth-options">
               <div class="join-container">
                  <h2 class="strong-join">REVIEW</h2>
                  <div class="join-divider-container">
                     <div class="horizontal-divider15"></div>
                  </div>
               </div>
            </div>
          </div>
          <div class="parent">
            <div class="div8"> 고객지원센터</div>
            <div class="q-a"> Q & A</div>
          </div>
        </div>
        <section class="inquiry-row-wrapper">
          <div class="inquiry-row">
            <div class="footer-links">
              <div class="options">
                <div class="container1">
                  <select class="div9" name="qsort" form="searchForm">
                    <option value="product">상품문의</option>
                    <option value="delivery">배송문의</option>
                    <option value="other">기타문의</option>
                  </select>
                </div>
              </div>
              <form class="search-filter" id="searchForm" action="${pageContext.request.contextPath}/QnaBoardMainServlet" method="get">
                <div class="options">
                  <div class="container1">
                    <select class="div10" name="searchKeyword">
                      <option value="qnatitle">제목</option>
                      <option value="qnatext">내용</option>
                    </select>
                  </div>
                </div>
                <div class="item-input">
                  <input
                    class="container4"
                    name="searchValue"
                    placeholder="검색어를 입력하세요."
                    type="text"
                  />
                </div>
                <div class="search-button-container">
                  <button class="item-link8" type="submit">
                    <div class="search-pair">
                      <img class="icon8" alt="" src="./public/icon-8.svg" />
                    </div>
                    <div class="div12"> 검색</div>
                  </button>
                </div>
              </form>
            </div>
            <div class="question-list">
              <div class="tablecontainer">                
                <table>
                  <thead>
                    <tr>
                      <th>카테고리</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="qna" items="${qnaList}">
                      <tr>
                        <td>${qna.qnacatno}</td>
                        <td>${qna.qnatitle}</td>
                        <td>${qna.userno}</td>
                        <td><fmt:formatDate value="${qna.qnaregdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>   
              </div>
            </div>
            <div class="footer-action">
              <div class="navigation-links">
                <div class="shopping-link-wrapper">
                  <div class="link5" id="linkContainer">
                    <div class="shopping-link-content">
                      <img class="icon9" alt="" src="./public/icon-9.svg" />
                    </div>
                    <div class="div84"> 쇼핑하기</div>
                  </div>
                </div>
                <div class="q-a-container">
                  <div class="wrapper">
                    <div class="div85">건전한 게시글 문화를 응원합니다.</div>
                  </div>
                  <div class="vertical-divider-wrapper">
                    <div class="vertical-divider4"></div>
                  </div>
                  <div class="shopping-link">
                    <div class="link6" id="linkContainer">
                      <div class="write-post-link-content">
                        <img class="icon10" alt="" src="./public/icon-10.svg" />
                      </div>
                      <a href="qnaboardwrite.jsp" class="div86">+ 글쓰기</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="separator3"></div>
            </div>
            <div class="pagination-wrapper-wrapper">
              <div class="pagination-wrapper">
                <img class="item-icon4" alt="" src="./public/item-4.svg" />

                <div class="link7">
                  <div class="div87">1</div>
                </div>
                <div class="link-2-wrapper">
                  <div class="link-2">2</div>
                </div>
                <div the="link-3-wrapper">
                  <div class="link-3">3</div>
                </div>
                <div class="link-4-wrapper">
                  <div class="link-4">4</div>
                </div>
                <div class="pagination-content">
                  <div class="link-5">5</div>
                </div>
                <img class="item-icon4" alt="" src="./public/item-5.svg" />
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>
    <script>
      var linkContainer = document.getElementById("linkContainer");
      if (linkContainer) {
        linkContainer.addEventListener("click", function (e) {
          // Please sync "메인" to the project
        });
      }
      var linkContainer = document.getElementById("linkContainer");
      if (linkContainer) {
        linkContainer.addEventListener("click", function (e) {
          // Please sync "게시글 글쓰기" to the project
        });
      }
    </script>
  </body>
</html>
