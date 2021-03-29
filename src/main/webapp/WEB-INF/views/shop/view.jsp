<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../include/header.jsp"%>
    <link href="/resources/lighting/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="/resources/lighting/css/flexslider.css" type="text/css" media="screen" />
</head>
<body>
<!--header-->
<div class="header-top">
    <div class="header-bottom">
        <div class="logo">
            <h1><a href="index.html">Lighting</a></h1>
        </div>
        <!---->
        <div class="top-nav">
            <%@include file="../include/aside.jsp"%>
        </div>
        <!---->
        <div class="cart box_1">
            <a href="checkout.html">
                <div class="total">
                    <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div>
                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
            </a>
            <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
        <!---->
    </div>
    <div class="clearfix"> </div>
</div>
<!--header//-->
<div class="product">
    <div class="container">
        <div class="product-price1">
            <div class="top-sing">
                <div class="col-md-7 single-top">
                    <div class="flexslider">
                        <ul class="slides">
                            <li data-thumb="images/si.jpg">
                                <div class="thumb-image"> <img src="images/si.jpg" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                            </li>
                            <li data-thumb="images/si2.jpg">
                                <div class="thumb-image"> <img src="images/si2.jpg" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                            </li>
                            <li data-thumb="images/si3.jpg">
                                <div class="thumb-image"> <img src="images/si3.jpg" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                            </li>
                        </ul>
                    </div>
                    <script src="js/imagezoom.js"></script>
                    <script defer src="js/jquery.flexslider.js"></script>
                    <script>
                        // Can also be used with $(document).ready()
                        $(window).load(function() {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>

                </div>
                <div class="col-md-5 single-top-in simpleCart_shelfItem">
                    <div class="single-para ">
                        <h4>Lighting Wood Carved Mop Glass Double Wall Lamp </h4>
                        <h5 class="item_price">$ 500.00</h5>
                        <p class="para">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, Vivamus porttitor tincidunt elementum nisi a, euismod rhoncus urna. Curabitur scelerisque vulputate diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat </p>
                        <div class="prdt-info-grid">
                            <ul>
                                <li>- Brand : Fos Lighting</li>
                                <li>- Dimensions : (LXBXH) in cms of...</li>
                                <li>- Color : Brown</li>
                                <li>- Material : Wood</li>
                            </ul>
                        </div>
                        <div class="check">
                            <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Enter pin code for delivery &amp; availability</p>
                            <form class="navbar-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Enter Pin code">
                                </div>
                                <button type="submit" class="btn btn-default">Verify</button>
                            </form>
                        </div>
                        <a href="#" class="add-cart item_add">ADD TO CART</a>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="bottom-prdt">
            <div class="btm-grid-sec">
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p3.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$1200</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p10.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$700</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p5.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$1300</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p4.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$9000</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p2.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$450</span></a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
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