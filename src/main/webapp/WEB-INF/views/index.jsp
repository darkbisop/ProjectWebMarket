<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="include/header.jsp"%>
    <title>Welcome to BookMall</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<!--header-->
<script src="/resources/lighting/js/responsiveslides.min.js"></script>
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
            <h1><a href="index.html">Lighting</a></h1>
        </div>
        <!---->
        <div class="top-nav">
            <%@include file="include/aside.jsp"%>
        </div>
        <!---->
        <div class="cart box_1">
            <%@include file="include/loginArea.jsp"%>
            <%@include file="include/logOut.jsp"%>
            <a href="/shop/cart">
                <%--<div class="total">
                    <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div>
                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>--%>
            </a>
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
    <div class="callbacks_container">
        <ul class="rslides" id="slider">
            <li>
                <div class="banner1">
                    <div class="banner-info">
                        <h3>Morbi lacus hendrerit efficitur.</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit.</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner2">
                    <div class="banner-info">
                        <h3>Phasellus elementum tincidunt.</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit.</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner3">
                    <div class="banner-info">
                        <h3>Maecenas interposuere volutpat.</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. consectetur adipiscing elit. consectetur adipiscing elit.</p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<!---->
<script src="/resources/lighting/js/bootstrap.js"> </script>

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
    <div class="container">
        <div class="footer-grids">
            <div class="col-md-3 about-us">
                <h3>About Us</h3>
                <p>Maecenas nec auctor sem. Vivamus porttitor tincidunt elementum nisi a, euismod rhoncus urna. Curabitur scelerisque vulputate arcu eu pulvinar. Fusce vel neque diam</p>
            </div>
            <div class="col-md-3 ftr-grid">
                <h3>Information</h3>
                <ul class="nav-bottom">
                    <li><a href="#">Track Order</a></li>
                    <li><a href="#">New Products</a></li>
                    <li><a href="#">Location</a></li>
                    <li><a href="#">Our Stores</a></li>
                    <li><a href="#">Best Sellers</a></li>
                </ul>
            </div>
            <div class="col-md-3 ftr-grid">
                <h3>More Info</h3>
                <ul class="nav-bottom">
                    <li><a href="login.html">Login</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="#">Shipping</a></li>
                    <li><a href="#">Membership</a></li>
                </ul>
            </div>
            <div class="col-md-3 ftr-grid">
                <h3>Categories</h3>
                <ul class="nav-bottom">
                    <li><a href="#">Car Lights</a></li>
                    <li><a href="#">LED Lights</a></li>
                    <li><a href="#">Decorates</a></li>
                    <li><a href="#">Wall Lights</a></li>
                    <li><a href="#">Protectors</a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="copywrite">
    <div class="container">
        <div class="copy">
            <p>© 2015 Lighting. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
        </div>
        <div class="social">
            <a href="#"><i class="facebook"></i></a>
            <a href="#"><i class="twitter"></i></a>
            <a href="#"><i class="dribble"></i></a>
            <a href="#"><i class="google"></i></a>
            <a href="#"><i class="youtube"></i></a>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!---->
</body>
</html>
