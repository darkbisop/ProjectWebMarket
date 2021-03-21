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

        section.replyForm { padding:30px 0; }
        section.replyForm div.input_area { margin:10px 0; }
        section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:300px;; height:100px; }
        section.replyForm button { font-size:15px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }

        section.replyList { padding:30px 0; }
        section.replyList ol { padding:0; margin:0; }
        section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
        section.replyList div.userInfo { }
        section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
        section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
        section.replyList div.replyContent { padding:10px; margin:20px 0; }
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
                <%@include file="../include/loginArea.jsp"%>
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
                            <br>

                            <div id="reply">
                                <c:if test="${member == null and kakaoMember == null and googleMember == null}">
                                    <p>소감을 남기시려면 <a href="/member/login">로그인</a>해주세요</p>
                                </c:if>

                                <c:if test="${member != null or kakaoMember != null or googleMember != null}">
                                    <section class="replyForm">
                                        <form role="form" method="post" autocomplete="off">
                                            <input type="hidden" name="productNum" value="${view.productNum}">
                                            <div class="input_area">
                                                <textarea name="replyContent" id="replyContent"></textarea>
                                            </div>

                                            <div class="input_area">
                                                <button type="submit" id="reply_btn">소감 남기기기</button>
                                           </div>
                                        </form>
                                    </section>
                                </c:if>
                            </div>

                            <section class="replyList">
                                <ol>
                                    <c:forEach items="${replyList}" var="reply">
                                        <li>
                                            <div class="userInfo">
                                                <span class="userName">${reply.memberId}</span>
                                                <span class="date"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd" /></span>
                                            </div>
                                            <div class="replyContent">${reply.replyContent}</div>
                                        </li>
                                    </c:forEach>

                                </ol>
                            </section>
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