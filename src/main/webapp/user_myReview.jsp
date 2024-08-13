<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/user_myReview.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@700&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Short Stack:wght@400&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Jost:wght@400;700&display=swap"
    />
  </head>
  <body>
    <div class="xans-element- xans-myshop xans-myshop-boardpackage">
      <!--
        내부 박스
    -->
      <div class="sp--width" scope="box">
        <!--
            타이틀
        -->
        <div class="sp--title" theme="underline-heavy" scale="2xl-nude">
          <div class="sp--title-inner">
            <dt><span>글 목록</span></dt>
            <i
              class="sp--icon"
              ico="string"
              rotate="135"
              scale="xs"
              hspace="xs"
            ></i>
            <span class="sp--title-subtext">내가 작성한 글의 목록입니다.</span>
          </div>
        </div>

        <!--
            검색부
        -->
        <form
          id="boardSearchForm"
          name=""
          action="/myshop/board_list.html"
          method="get"
          target=""
          enctype="multipart/form-data"
        >
          <input id="board_no" name="board_no" value="" type="hidden" />
          <input id="page" name="page" value="1" type="hidden" />
          <input id="board_sort" name="board_sort" value="" type="hidden" />
          <div class="xans-element- xans-myshop xans-myshop-boardlistsearch">
            <div class="sp--box" fill="justify" vertical="middle">
              <ul class="sp--form" theme="xl-light-fill-round">
                <li>
                  <!-- 분류선택 -->
                  <div
                    class="xans-element- xans-myshop xans-myshop-boardlisthead sp--title-right"
                  >
                    <div class="sp--desc" gap="xl-y-box">
                      <select
                        id="board_sort"
                        name="board_sort"
                        fw-filter=""
                        fw-label=""
                        fw-msg=""
                        onchange="BOARD.change_sort('boardSearchForm', this);"
                      >
                        <option value="D">작성 일자별</option>
                        <option value="C">분류별</option>
                      </select>
                    </div>
                  </div>
                </li>
                <li>
                  <!-- 검색 -->
                  <div class="sp--box" gap="sm" vertical="middle">
                    <ul>
                      <li>
                        <select
                          id="search_key"
                          name="search_key"
                          fw-filter=""
                          fw-label=""
                          fw-msg=""
                        >
                          <option value="subject">제목</option>
                          <option value="content">내용</option>
                          <option value="writer_name">글쓴이</option>
                          <option value="member_id">아이디</option>
                          <option value="nick_name">별명</option>
                        </select>
                      </li>
                      <li sp--js-placeholder="검색어를 입력하세요.">
                        <input
                          id="search"
                          name="search"
                          fw-filter=""
                          fw-label=""
                          fw-msg=""
                          class="inputTypeText"
                          placeholder="검색어를 입력하세요."
                          value=""
                          type="text"
                        />
                      </li>
                      <li>
                        <a
                          href="/myshop/board_list.html"
                          class="sp--btn"
                          theme="box-white-round"
                          scale="xl"
                        >
                          <i class="sp--icon" ico="reload" scale="md-minup"></i>
                          &nbsp; 초기화
                        </a>
                      </li>
                      <li>
                        <a
                          href="#none"
                          class="sp--btn"
                          theme="box-dark-round"
                          scale="xl"
                          onclick="BOARD.form_submit('boardSearchForm');"
                        >
                          <i class="sp--icon" ico="search" scale="md-minup"></i>
                          &nbsp; 검색
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </form>
        <!--
            목록
        -->
        <div class="xans-element- xans-myshop xans-myshop-boardlist">
          <!--
                $count = 10
                $relation_post = yes
            -->
          <table
            class="sp--table"
            theme="lg-center"
            gap="2xl"
            solid="light-nude"
            vertical="middle"
          >
            <caption>
              게시물 관리 목록
            </caption>
            <colgroup
              class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002"
            >
              <col style="width: 70px" />
              <col style="width: 70px" />
              <col />
              <col style="width: 84px" />
              <col style="width: 100px" />
              <col style="width: 65px" />
            </colgroup>
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">분류</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회</th>
              </tr>
            </thead>
            <tbody class="displaynone">
              <tr class="">
                <td>
                  <span class="sp--font" scale="sm"></span>
                </td>
                <td>
                  <a
                    href=""
                    class="sp--btn"
                    theme="box-light-nowrap-round"
                    scale="md"
                  ></a>
                </td>
                <td direction="left">
                  <span class="sp--mix"></span>
                  <a
                    href=""
                    class="sp--empty-field"
                    empty="이 글에는 제목이 없습니다."
                    cut=""
                  ></a>
                  <span class="sp--mix"></span>
                  <span
                    class="sp--font"
                    theme="primary"
                    scale="sm"
                    hspace="3xl"
                  ></span>
                </td>
                <td>
                  <span class="sp--empty-field" empty="빈 작성자"></span>
                </td>
                <td>
                  <span class="sp--font" scale="sm"></span>
                </td>
                <td>
                  <span class="sp--font" scale="sm"></span>
                </td>
              </tr>
              <tr class="">
                <td>
                  <span class="sp--font" scale="sm"></span>
                </td>
                <td>
                  <a
                    href=""
                    class="sp--btn"
                    theme="box-light-nowrap-round"
                    scale="md"
                  ></a>
                </td>
                <td direction="left">
                  <span class="sp--mix"></span>
                  <a
                    href=""
                    class="sp--empty-field"
                    empty="이 글에는 제목이 없습니다."
                    cut=""
                  ></a>
                  <span class="sp--mix"></span>
                  <span
                    class="sp--font"
                    theme="primary"
                    scale="sm"
                    hspace="3xl"
                  ></span>
                </td>
                <td>
                  <span class="sp--empty-field" empty="빈 작성자"></span>
                </td>
                <td>
                  <span class="sp--font" scale="sm"></span>
                </td>
                <td>
                  <span class="sp--font" scale="sm"></span>
                </td>
              </tr>
            </tbody>
          </table>
          <!--
                결과없음
            -->
          <div class="sp--desc" theme="xl-center" gap="3xl-box-y">
            <div class="sp--desc" gap="3xl-box">
              <i class="sp--icon" ico="article" scale="x4" vspace="3xl"></i>
              <p class="sp--font" theme="gray" gap="3xl">
                작성한 게시물이 없습니다.
              </p>
            </div>
          </div>
        </div>

        <!--
            페이지네이션
        -->
        <!-- // -->
      </div>
    </div>
  </body>
</html>