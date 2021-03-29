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
        section#content ul li { margin:10px 0; }
        section#content ul li img { width:250px; height:250px; }
        section#content ul li::after { content:""; display:block; clear:both; }
        section#content div.productThumb { float:left; width:250px; }
        section#content div.productInfo { float:right; width:calc(100% - 270px); }
        section#content div.productInfo { font-size:20px; line-height:2; }
        section#content div.productInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
        section#content div.productInfo .delete { text-align:right; }
        section#content div.productInfo .delete button { font-size:22px;
            padding:5px 10px; border:1px solid #eee; background:#eee;}
    </style>

    <script>
        $(document).on("click", ".delete_btn", function(){
            const productName = $(this).parent().parent().find(".goodsName").val();
                console.log(productName);
            const data = {
                productName : productName
            };

            $.ajax({
                url : "/shop/view/deleteCart?pN=" + productName,
                type : "post",
                data : data,
                success : function (result) {
                    if (result === 1) {
                        alert("해당 상품을 삭제하였습니다");
                        window.location.reload();
                    }
                },
                error : function () {
                    alert("삭제 하는데 실패하였습니다.")
                }
            });
        });
    </script>
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <%@include file="../include/nav.jsp"%>
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
                    <ul>
                        <c:forEach items="${cartList}" var="cartList">
                            <li>
                                <div class="productThumb">
                                   <img src="${cartList.productThumbnail}" alt="">
                                </div>
                                <div class="productInfo">
                                    <p>
                                        <span>상품명 : </span>${cartList.productName}<br />
                                        <input type="hidden" class="goodsName" name="goodsName" value="${cartList.productName}">
                                        <span>개당 가격 : </span>
                                        <fmt:formatNumber pattern="###,###,###" value="${cartList.productPrice}"/> 원<br/>
                                        <span>구입 수량 : </span>${cartList.cartStock} 개<br/>
                                        <span>최종 가격 : </span>
                                        <fmt:formatNumber pattern="###,###,###" value="${cartList.productPrice * cartList.cartStock}"/> 원
                                    </p>
                                    <div class="delete">
                                        <button type="button" class="delete_btn">삭제</button>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <br />
                    <span>총 금액 :</span>
                        <fmt:formatNumber pattern="###,###,###" value="${total}"/>
                </section>
            </div>
        </section>
    </div>
</div>

<%@include file="../include/logOut.jsp"%>
</body>
</html>