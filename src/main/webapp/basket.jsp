<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="catshap.butler.bean.Users"%>
    
<%
	Users user = new Users();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/index.css" />
</head>
<body>
    <div class="c-01">
        <div class="item"></div>
        <div class="item1"></div>
        <section class="cart-product"></section>
        <section class="c-01-inner">
            <div class="frame-parent">
                <div class="frame-wrapper">
                    <div class="frame-group">
                        <div class="frame-container">
                            <div class="frame-div">
                                <div class="frame-parent1">
                                    <div class="strong-my-cart-parent">
                                        <h2 class="strong-my">MY CART</h2>
                                        <div class="wrapper">
                                            <div class="div">나의 · 장바구니</div>
                                        </div>
                                    </div>
                                    <div class="horizontal-divider-wrapper">
                                        <div class="horizontal-divider"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="my-shopping-link">
                                <div class="link-wrapper">
                                    <img class="link-icon" loading="lazy" alt="" src="./image/link.svg" />
                                </div>
                                <div class="icon-wrapper">
                                    <img class="icon" loading="lazy" alt="" src="./image/icon.svg" />
                                </div>
                                <div class="container">
                                    <div class="div1"> 마이쇼핑</div>
                                </div>
                                <div class="icon-container">
                                    <img class="icon1" loading="lazy" alt="" src="./image/icon-1.svg" />
                                </div>
                                <div class="div2"> 장바구니</div>
                            </div>
                        </div>
                        <div class="order-status-link-wrapper">
                            <div class="order-status-link">
                                <div class="parent">
                                    <b class="b">01. 장바구니 </b>
                                    <div class="background">
                                        <b class="now">now</b>
                                    </div>
                                </div>
                                <div class="link-02-wrapper">
                                    <div class="link-02">02. 주문서 작성</div>
                                </div>
                                <div class="link-03-wrapper">
                                    <div class="link-03">03. 결제완료</div>
                                </div>
                                <div class="link-04">04. 주문완료</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="frame-wrapper1">
                    <div class="horizontal-divider-parent">
                        <div class="horizontal-divider1"></div>
                        <div class="horizontal-divider2"></div>
                    </div>
                </div>
                <div class="frame-wrapper2">
                    <div class="shop-info-content-parent">
                        <div class="shop-info-content">
                            <div class="border">
                                <div class="support-info">
                                    <div class="container-wrapper">
                                        <img class="container-icon" loading="lazy" alt=""
                                            src="./image/container@2x.png" />
                                    </div>
                                    <div class="vertical-divider-parent">
                                        <div class="vertical-divider"></div>
                                        <div class="login-info-parent">
                                            <div class="login-info">
                                                <div class="div3">
                                                    저희 쇼핑몰을 이용해 주셔서 감사합니다.
                                                </div>
                                                <div class="div4">
                                                    <span>
                                                        <span>로그인</span>
                                                        <span class="span"> 을 하시면 </span>
                                                        <span>다양한 혜택</span>
                                                        <span class="span1"> 을 확인할 수 있습니다.</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="separator-parent">
                                                <img class="separator-icon" loading="lazy" alt=""
                                                    src="./image/separator.svg" />

                                                <div class="frame-parent2">
                                                    <div class="background-wrapper">
                                                        <div class="background1">
                                                            <img class="circlesvg-fill-icon" alt=""
                                                                src="./public/circlesvg-fill.svg" />

                                                            <div class="div5">|</div>
                                                        </div>
                                                    </div>
                                                    <div class="div6">
                                                        <span class="txt">
                                                            <span>궁금한점은 </span>
                                                            <span class="span2">게시판</span>
                                                            <span>으로 문의주세요.</span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <img class="separator-icon1" loading="lazy" alt=""
                                                    src="./image/separator-1.svg" />
                                            </div>
                                            <div class="user-info">
                                                <div class="item-link">
                                                    <div class="div7">가용 적립금 </div>
                                                </div>
                                                <div class="item-link1">
                                                    <div class="div8">마일리지 </div>
                                                </div>
                                                <div class="item-link2">
                                                    <div class="div9">쿠폰 </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vertical-divider-wrapper">
                                            <div class="vertical-divider1"></div>
                                        </div>
                                    </div>
                                    <div class="support-info-inner">
                                        <div class="ddb5f2541png-parent">
                                            <img class="ddb5f2541png-icon" loading="lazy" alt=""
                                                src="./image/20210510155806-5ddb5f2541png@2x.png" />

                                            <div class="frame">
                                                <div class="div10">고객센터</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="delivery-info-wrapper">
                                        <div class="delivery-info">
                                            <div class="delivery-info-content">
                                                <div class="vertical-divider2"></div>
                                            </div>
                                            <div class="delivery-info-content1">
                                                <div class="e229a30png-parent">
                                                    <img class="e229a30png-icon" loading="lazy" alt=""
                                                        src="./image/20210510155801-656e229a30png@2x.png" />

                                                    <div class="wrapper1">
                                                        <div class="div11">배송조회</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="delivery-info-content2">
                                                <div class="vertical-divider3"></div>
                                            </div>
                                            <div class="delivery-info-content3">
                                                <div class="e8d6f0575png-parent">
                                                    <img class="e8d6f0575png-icon" loading="lazy" alt=""
                                                        src="./image/20210510155136-2e8d6f0575png@2x.png" />

                                                    <div class="wrapper2">
                                                        <div class="div12">상품문의</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="vertical-divider4"></div>
                                        </div>
                                    </div>
                                    <div class="support-info-child">
                                        <div class="f7a406fccpng-parent">
                                            <img class="f7a406fccpng-icon" loading="lazy" alt=""
                                                src="./image/20210510155413-3f7a406fccpng@2x.png" />

                                            <div class="wrapper3">
                                                <div class="div13">상품후기</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="container1">
                                    <img class="backgroundshadow-icon" loading="lazy" alt=""
                                        src="./image/backgroundshadow@2x.png" />
                                </div>
                            </div>
                            <div class="item2">
                                <div class="background-container">
                                    <div class="background2">
                                        <div class="div14">0</div>
                                    </div>
                                </div>
                                <div class="delivery-info-item">
                                    <div class="icon-frame">
                                        <img class="icon2" loading="lazy" alt="" src="./image/icon-2.svg" />
                                    </div>
                                    <div class="div15"> 국내배송상품</div>
                                </div>
                                <div class="icon-parent">
                                    <img class="icon3" loading="lazy" alt="" src="./image/icon-3.svg" />

                                    <div class="item3"></div>
                                    <div class="list-content">
                                        <div class="list"></div>
                                        <img class="image-3-icon" alt="" src="./image/image-3@2x.png" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wrapper4">
                            <div class="div16">장바구니가 비어 있습니다.</div>
                        </div>
                        <div class="separator-group">
                            <div class="separator"></div>
                            <div class="order-button-link">
                                <div class="link" id="linkContainer">
                                    <div class="icon-wrapper1">
                                        <img class="icon4" loading="lazy" alt="" src="./image/icon-4.svg" />
                                    </div>
                                    <div class="div17"> 전체상품 주문</div>
                                </div>
                                <div class="link1" id="linkContainer1">
                                    <div class="icon-wrapper2">
                                        <img class="icon5" loading="lazy" alt="" src="./image/icon-5.svg" />
                                    </div>
                                    <div class="div18">선택상품 주문</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="cart-info-background-parent">
            <footer class="cart-info-background"></footer>
            <div class="border-wrapper">
                <div class="border1">
                    <img class="item-icon" loading="lazy" alt="" src="./public/item.svg" />

                    <div class="vertical-divider5"></div>
                    <div class="cart-info">
                        <div class="info-title">
                            <div class="icon-title">
                                <div class="info-icon">
                                    <img class="icon6" loading="lazy" alt="" src="./public/icon-6.svg" />
                                </div>
                                <b class="b1"> 장바구니 이용안내</b>
                            </div>
                            <img class="separator-icon2" loading="lazy" alt="" src="./public/separator-2.svg" />

                            <div class="delivery-info1">
                                <div class="group">
                                    <div class="div19">
                                        해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니
                                        장바구니 별로 따로 결제해 주시기 바랍니다.
                                    </div>
                                    <div class="delivery-content">
                                        <div class="div20">
                                            해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가
                                            해외배송 장바구니로 이동하여 결제하실 수 있습니다.
                                        </div>
                                    </div>
                                    <div class="div21">
                                        선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경]
                                        버튼을 누르시면 됩니다.
                                    </div>
                                    <div class="delivery-content1">
                                        <div class="div22">
                                            [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수
                                            있습니다.
                                        </div>
                                    </div>
                                    <div class="delivery-content2">
                                        <div class="div23">
                                            장바구니와 관심상품을 이용하여 원하시는 상품만
                                            주문하거나 관심상품으로 등록하실 수 있습니다.
                                        </div>
                                    </div>
                                    <div class="delivery-content3">
                                        <div class="div24">
                                            파일첨부 옵션은 동일상품을 장바구니에 추가할 경우
                                            마지막에 업로드 한 파일로 교체됩니다.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="installment-info">
                            <div class="installment-title">
                                <div class="dollar-icon">
                                    <img class="icon7" loading="lazy" alt="" src="./public/icon-7.svg" />
                                </div>
                                <b class="b2"> 무이자할부 이용안내</b>
                            </div>
                            <img class="separator-icon3" loading="lazy" alt="" src="./public/separator-3.svg" />

                            <div class="installment-details">
                                <div class="parent1">
                                    <div class="div25">
                                        상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만
                                        선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.
                                    </div>
                                    <div class="installment-content">
                                        <div class="div26">
                                            [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이
                                            선택된 모든 상품에 대한 주문/결제가 이루어집니다.
                                        </div>
                                    </div>
                                    <div class="div27">
                                        단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부
                                        혜택을 받으실 수 없습니다.
                                    </div>
                                    <div class="installment-content1">
                                        <div class="div28">
                                            무이자할부 상품은 장바구니에서 별도 무이자할부 상품
                                            영역에 표시되어, 무이자할부 상품 기준으로 배송비가
                                            표시됩니다.
                                        </div>
                                    </div>
                                    <div class="installment-content2">
                                        <div class="div29">
                                            실제 배송비는 함께 주문하는 상품에 따라 적용되오니
                                            주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>
        var linkContainer = document.getElementById("linkContainer");
        if (linkContainer) {
            linkContainer.addEventListener("click", function (e) {
                window.location.href = "./frame.html";
            });
        }

        var linkContainer1 = document.getElementById("linkContainer1");
        if (linkContainer1) {
            linkContainer1.addEventListener("click", function (e) {
                window.location.href = "./frame.html";
            });
        }
    </script>
</body>
</html>