<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to BookMall</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css?after">
    <style>
        section#content ul li { display:inline-block; margin:10px; }
        section#content div.productThumb img { width:200px; height:200px; }
        section#content div.productName { padding:10px 0; text-align:center; }
        section#content div.productName a { color:#000; }
        div.product div.productImage { float:left; width:350px; }
        div.product div.productImage img { width:350px; height:auto; }

        div.product div.productInfo { float:left; width:330px; font-size:18px; padding-top: 20px; padding-left: 70px; }
        div.product div.productInfo p { margin:0 0 20px 0; }
        div.product div.productInfo p span { display:inline-block; width:100px; margin-right:15px; }

        div.product div.productInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
        div.product div.productInfo p.cartStock button { font-size:26px; border:none; background:none; }
        div.product div.productInfo p.addToCart { text-align: left; }
        div.product div.productDescription { font-size:18px; clear:both; padding-top:30px; }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <%@include file="../include/nav.jsp"%>>
        </div>

        <div class="top_area">
            <div class="logo_area">
                <%@include file="../include/aside.jsp"%>
            </div>

            <div class="search_area">
                <h1>search area</h1>
            </div>

            <div class="login_area">
                <!-- 로그인 하지 않았을때 -->
                <c:if test="${member == null and kakaoMember == null}">
                    <div class="login_button"><a href="/member/login">Login</a></div>
                    <span><a href="/member/signUp">SignUp</a></span>
                </c:if>

                <!-- 로그인 했을때 -->
                <c:choose>
                    <c:when test="${member != null}">
                        <div class="login_success_area">
                            <span>회원 : ${member.memberName}</span>
                            <span>충전금액 : <fmt:formatNumber value = "${member.money}" pattern="\#,###,##" /></span>
                            <span>포인트 : <fmt:formatNumber value = "${member.point}" pattern="\#,###" /></span>
                                <%--<a href="/member/logout.do">Logout</a>--%>
                        </div>
                    </c:when>
                    <c:when test="${kakaoMember != null}">
                        <div class="login_success_area">
                            <span>회원 : ${kakaoMember}</span>
                        </div>
                    </c:when>
                </c:choose>
            </div>
            <div class="clearfix">
            </div>
        </div>

        <div class="navi_bar_area">
            <h1>navi bar</h1>
        </div>
        <section id="container">
            <div id="container_box">
                <section id="content">
                    <form role="form" method="post">
                        <input type="hidden" name="productNum" value="${view.productNum}"
                    </form>

                    <div class="product">
                        <div class="productImage">
                            <img src="${view.productImage}" alt="">
                        </div>

                        <div class="productInfo">
                            <p class="productName"><span>상품명</span>${view.productName}</p>
                            <p class="categoryName"><span>종류</span>${view.categoryName}</p>
                            <p class="productPrice"><span>가격</span><fmt:formatNumber value="${view.productPrice}" pattern="###,###,###" />원</p>
                            <p class="productStock"><span>재고</span>${view.productStock}EA</p>
                            <p class="productDescription"><span>상품설명</span>${view.productDescription}</p>
                            <p class="cartStock"><span>구매 수량</span>
                                <input type="number" min="1" maxlength="${view.productStock}" value="1" />
                            </p>
                            <p class="addToCart"><button type="button">카트에 담기</button></p>

                       </div>
                    </div>
                </section>
            </div>
        </section>
    </div>
</div>
<%@include file="../include/logOut.jsp"%>
</body>
</html>