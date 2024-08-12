<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUY</title>
    <link rel="stylesheet" href="./css/buy.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="./js/buy.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>
    <!--<jsp:include page="header.jsp"></jsp:include>-->
    <main id="main">
        <div>
        </div>
        <p class="pay">주문/결제</p>
        <section id="main1">
            <div id="main1Wrapper">
                <div class="main1_1 title" id="title1" data-target="content1">
                    <b>배송지</b>
                    <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
                </div>
                <div id="content1" class="content">
                    <div class="main1_2">
                        <p>받는사람</p>
                        <input type="text" />
                    </div>
                    <div class="main1_2 main1_3">
                        <p>주소</p>
                        <input type="text" placeholder="우편번호" />
                        <input type="text" placeholder="기본주소" />
                        <input type="text" placeholder="나머지 주소(선택 입력 가능)" />
                    </div>
                    <div class="main1_4">
                        <p class="call">휴대전화</p>
                        <div class="main1_4input">
                            <input type="text" placeholder=" 010" />
                            <input type="text" />
                            <input type="text" />
                        </div>
                        <span class="main1_4Span1">-</span>
                        <span class="main1_4Span2">-</span>
                    </div>
                    <div class="main1_5">
                        <p>이메일</p>
                        <div class="main1_5_1">
                            <input type="text" />
                            <span>@</span>
                            <select aria-placeholder="직접입력">
                                <option>naver.com</option>
                                <option>gmail.com</option>
                                <option>daum.com</option>
                            </select>
                        </div>
                    </div>
                    <input class="message" type="text" placeholder="- 메세지 입력 (문 앞에 놓아주세요)" />
                </div>
            </div>
        </section>
        <section id="main2">
            <div class="main2_1 title" id="title2" data-target="content2">
                <b>주문상품</b>
                <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
            </div>
            <div id="content2" class="content">
                <div class="main2_2">
                    <img class="stockimg" src="../img/cat.png" />

                    <div class="main2_2text">
                        <a href="#" class="delete"><img src="../img/close.png" /></a>
                        <p>정수기 화이트</p>
                        <p>수량:1개</p>
                        <p>29,000원</p>
                    </div>
                </div>
            </div>
        </section>
        <div class="main2_3 endtitle">
            <p>배송비</p>
            <b>3,000원</b>
        </div>
        <section id="main3">
            <div class="main3_1 title" id="title3" data-target="content3">
                <b>결제정보</b>
                <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
            </div>

            <div id="content3" class="content">
                <div class="middletext">
                    <p>주문상품</p>
                    <b>29,200원</b>
                </div>
                <div class="middletext">
                    <p>배송비</p>
                    <b>+3.000원</b>
                </div>
                <div class="middletext">
                    <p>할인/부가결제</p>
                    <b><span>0</span>원</b>
                </div>
            </div>
        </section>
        <div class="main3_2 endtitle">
            <b>최종 결제 금액</b>
            <b>32,300원</b>
        </div>
        <section id="main4">
            <div class="main4_1 title" id="title4" data-target="content4">
                <b>결제정보</b>
                <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
            </div>
            <div id="content4" class="content">
                <div class="main4div">
                    <div class="middletext">
                        <p>카드선택</p>
                        <select>
                            <option>신용카드</option>
                            <option>체크카드</option>
                        </select>
                    </div>
                    <div class="middletext">
                        <p>할부기간</p>
                        <select>
                            <option>무이자 3개월</option>
                        </select>
                    </div>
                    <p class="main4text">법인카드는 무이자 할부 적용이 되지 않습니다.</p>
                    <div class="middletext main4div2">
                        <p>결제 안내</p>
                        <input class="btn" type="button" value="공인 인증서 발급안내" />
                        <input class="btn" type="button" value="안심클릭 안내" />
                        <input class="btn" type="button" value="안전결제(ISP) 안내" />
                    </div>
                    <p class="main4text">- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
                </div>
            </div>
        </section>
        <section id="main5">
            <div class="main5_1 title" id="title5" data-target="content5">
                <input class="main5check" id="allcheckbox" type="checkbox" />
                <b>모든 약관 동의</b>
                <a href="#"><img class="slidebtn" src="../img/slidebtn.png" /></a>
            </div>
            <div id="content5" class="content">
                <div class="middletext2">
                    <input id="main5check1" type="checkbox" />
                    <span>[필수]</span>
                    <p>결제대행서비스 약관 동의</p>
                    <input type="button" value=">" />
                </div>
                <div class="middletext2">
                    <input id="main5check2" type="checkbox" />
                    <span>[필수]</span>
                    <p>쇼핑몰 이용약관 동의</p>
                    <input type="button" value=">" />
                </div>
                <div class="middletext2">
                    <input id="main5check3" type="checkbox" />
                    <span>[필수]</span>
                    <p>개인정보 수집 및 이용 동의</p>
                    <input type="button" value=">" />
                </div>
            </div>
        </section>
        <a class="main5a" href="#">32,200원 결제하기</a>
        <section id="main6">
            <p>- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우
                장바구니에서 무이자 할부 상품만 선택하여 주문하여 주시기 바랍니다.</p>
            <p>- 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
        </section>
    </main>
    <jsp:include page="footer.jsp"></jsp:include>
    <div id="event">
        <span>X</span>
        <p>
            [ 개인정보 수집 및 이용 동의 ]
            <br /><br />
            1. 개인정보의 수집 및 이용 목적
            - 고객 서비스 제공
            - 상품 및 서비스 안내
            <br />
            2. 수집하는 개인정보 항목
            - 이름, 연락처, 이메일 등
            <br />
            3. 개인정보의 보유 및 이용 기간
            - 서비스 이용 기간 동안 보유
            <br />
            4. 개인정보의 제3자 제공
            - 제3자에게 제공하지 않음
            <br />
            5. 개인정보의 안전성 확보 조치
            - 암호화 및 접근 제어
            <br />
            6. 고객의 권리와 그 행사 방법
            - 개인정보 조회 및 수정 가능
            <br />
            7. 개인정보 보호 책임자
            - 연락처 및 이메일 주소
            <br /><br />
            [냥#]
            주소: [코리아 IT 아카데미 역삼점 3층 인베디드A]<br />
            연락처: [010-1234-5678]<br />
            이메일: [이메일]
            <br /><br />
            제정일: 2024년 [8월] [8일]
        </p>
    </div>
</body>
</html>