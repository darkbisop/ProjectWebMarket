<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/header.jsp"%>
    <title></title>
</head>
<body>
<!--header-->
<script src="${pageContext.request.contextPath}/resources/lighting/js/responsiveslides.min.js"></script>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            pager: false,
        });
    });
</script>

<div class="header-top">
    <div class="header-bottom">
        <div class="logo">
            <h1><a href="${pageContext.request.contextPath}/index">Lighting</a></h1>
        </div>
        <!---->
        <div class="top-nav">
            <%@include file="include/aside.jsp"%>
        </div>
        <!---->
        <div class="cart box_1">
            <%@include file="include/loginArea.jsp"%>
            <%@include file="include/logOut.jsp"%>
           <%-- <a href="/shop/cart">
                <div class="total">
                    <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div>
                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
            </a>--%>
            <p><a href="javascript:" class="simpleCart_empty">Empty Cart</a></p>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
        <!---->
    </div>
    <div class="clearfix"> </div>
</div>
<!---->
<div class="slider">
    <%@ include file="include/banner.jsp"%>
</div>
<!---->
<script src="${pageContext.request.contextPath}/resources/lighting/js/bootstrap.js"> </script>

<div class="items">
   <%@ include file="include/indexProductList.jsp"%>
</div>
<!---->
<div class="offers">
    <%@include file="include/indexEndSale.jsp"%>
</div>
<!---->
<div class="subscribe">
    <div class="container">
        <h3>Newsletter</h3>
        <form>
            <input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
            <input type="submit" value="Subscribe">
        </form>
    </div>
</div>
<!---->
<div class="footer">
    <%@ include file="include/footer.jsp"%>
</div>
<!---->
<div class="copywrite">
    <%@ include file="include/copywrite.jsp"%>
</div>
<!---->
</body>
</html>
