<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/header.jsp"%>

    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" id="sourcecode">
        $(function()
        {
            $('.scroll-pane').jScrollPane();
        });
    </script>
</head>
<body>
<!--header-->
<div class="header-top">
    <div class="header-bottom">
        <div class="logo">
            <h1><a href="/index">Lighting</a></h1>
        </div>
        <!---->
        <div class="top-nav">
            <%@include file="../include/aside.jsp"%>
        </div>
        <!---->
        <div class="cart box_1">
            <script>
                function calcTotal(total) {
                    console.log(total);
                    let calcTotal = "";

                    calcTotal += "<span>" + " : " + total + "</span>";
                    $("#message").html(calcTotal);
                }
            </script>
            <img src="/resources/lighting/images/cartImg.png" alt="" width="30px" height="30px">
            <span id="message"></span>
            <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
        <!---->
    </div>
    <div class="clearfix"> </div>
</div>
<!--header//-->
<div class="product-model">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/index">Home</a></li>
            <li class="active">Products</li>
        </ol>
        <h2>Our Products</h2>
        <div class="col-md-9 product-model-sec">
            <c:forEach items="${list}" var="list">
                <a href="#"></a><div class="product-grid">
                    <div class="more-product"><span> </span></div>
                    <div class="product-img b-link-stripe b-animate-go  thickbox">
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <a href="/shop/view?n=${list.productNum}"><img src="${list.productThumbnail}" alt="" width="200px" height="200px"></a>
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <a href="/shop/view?n=${list.productNum}">
                                        <button><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
                                    </a>

                                </h4>
                            </div>
                        </div>
                    </div>

                    <div class="product-info simpleCart_shelfItem">
                        <div class="product-info-cust prt_name">
                            <a href="/shop/view?n=${list.productNum}"><h4>${list.productName}</h4></a>
                            <span class="item_price productPrice"></span><fmt:formatNumber pattern="###,###,###" value="${list.productPrice}" />원
                            <div class="ofr">
                                <p class="pric1"><del>Rs 280</del></p>
                                <p class="disc">[12% Off]</p>
                            </div>
                            <input type="text" class="item_quantity" value="1" />
                            <input type="button" class="item_add items" value="ADD">
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="rsidebar span_1_of_left">
            <section  class="sky-form">
                <div class="product_right">
                    <h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories</h4>
                    <div class="tab1">
                        <ul class="place">
                            <li class="sort">Cake</li>
                            <li class="by"><img src="images/do.png" alt=""></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="#"><p>Chocolate Cake</p></a>
                            <a href="#"><p>Strawberry Cake</p></a>
                            <a href="#"><p>Honey Cake</p></a>
                        </div>
                    </div>
                    <div class="tab2">
                        <ul class="place">
                            <li class="sort">Muffin</li>
                            <li class="by"><img src="images/do.png" alt=""></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="#"><p>Chocolate Muffin</p></a>
                            <a href="#"><p>Strawberry Muffin</p></a>
                            <a href="#"><p>Honey Muffin</p></a>
                        </div>
                    </div>
                    <div class="tab3">
                        <ul class="place">
                            <li class="sort">Bread</li>
                            <li class="by"><img src="images/do.png" alt=""></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="#"><p>Chocolate Muffin</p></a>
                            <a href="#"><p>Strawberry Muffin</p></a>
                            <a href="#"><p>Honey Muffin</p></a>
                        </div>
                    </div>
                    <!--script-->
                    <script>
                        $(document).ready(function(){
                            $(".tab1 .single-bottom").hide();
                            $(".tab2 .single-bottom").hide();
                            $(".tab3 .single-bottom").hide();

                            $(".tab1 ul").click(function(){
                                $(".tab1 .single-bottom").slideToggle(300);
                                $(".tab2 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                            })
                            $(".tab2 ul").click(function(){
                                $(".tab2 .single-bottom").slideToggle(300);
                                $(".tab1 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                            })
                            $(".tab3 ul").click(function(){
                                $(".tab3 .single-bottom").slideToggle(300);
                                $(".tab1 .single-bottom").hide();
                                $(".tab2 .single-bottom").hide();
                            })
                        });
                    </script>
                </div>
            </section>
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