<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/header.jsp"%>
<%--
    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" id="sourcecode">
        $(function()
        {
            $('.scroll-pane').jScrollPane();
        });
    </script>--%>
</head>
<body>
<!--header-->
<div class="header-top">
    <div class="header-bottom">
        <div class="logo">
            <h1><a href="${pageContext.request.contextPath}/index">Lighting</a></h1>
        </div>
        <!---->
        <div class="top-nav">
            <%@include file="../include/aside.jsp"%>
        </div>
        <!---->
        <div class="lang-box">
            <a id="getURL" href="">한국어</a> /
            <a id="getURL_2" href="">日本語</a>
            <script>
                const url = window.location.href;
                const testUrl = url;
                const subUrl = url.substr(0, 64);

                document.getElementById("getURL").innerHTML = "<a href='" + subUrl + "&?lang=ko" + "' style='color: red'>한국어</a>";
                document.getElementById("getURL_2").innerHTML = "<a href='" + subUrl + "&?lang=ja" + "' style='color: red'>日本語</a>";
            </script>
        </div>
        <div class="cart box_1">
            <a href="${pageContext.request.contextPath}/shop/cartList">
                <c:if test="${member == null and kakaoMember == null and googleMember == null}">
                    <div class="login_button"><a href="${pageContext.request.contextPath}/member/login">Login</a></div>
                    <span><a href="${pageContext.request.contextPath}/member/signUp">SignUp</a></span>
                </c:if>

                <c:choose>
                    <c:when test="${member != null}">
                        <div class="login_success_area">
                            <span>회원 : ${member.memberName}</span><br/>
                        </div>
                    </c:when>
                    <c:when test="${kakaoMember != null}">
                        <div class="login_success_area">
                            <span>회원 : ${kakaoMember}</span>
                        </div>
                    </c:when>
                    <c:when test="${googleMember != null}">
                        <div class="login_success_area">
                            <span>회원 : ${googleMember}</span>
                        </div>
                    </c:when>
                </c:choose>

                <c:if test="${member != null or kakaoMember != null or googleMember != null}">
                    <span id="message"><img src="${pageContext.request.contextPath}/resources/lighting/images/cartImg.png" alt="" width="30px" height="30px"> : </span>
                    <fmt:formatNumber pattern="###,###,###" value="${total}"/> (${stock})
                    <script>
                        function calcTotal(total, stock) {
                            let calcTotal = "";
                            calcTotal += "<span>" + " : " + total + " " + "(" + stock + ")" + "</span>";
                            $("#message").html(calcTotal);
                        }
                    </script>
                    <c:if test="${member != null or kakaoMember != null or googleMember != null}">
                        <span id="message">${total}</span>
                    </c:if>
                </c:if>
            </a>
            <%@include file="../include/logOut.jsp"%>
            <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
            <div class="clearfix"> </div>
        <!---->
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
            <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
            <li class="active">Products</li>
        </ol>
        <h2>Our Products</h2>
        <div class="col-md-9 product-model-sec">
            <c:forEach items="${list}" var="list">
                <div class="product-grid">
                    <div class="more-product"><span> </span></div>
                    <div class="product-img b-link-stripe b-animate-go  thickbox">
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <a href="${pageContext.request.contextPath}/shop/view?n=${list.productNum}"><img src="/ProjectWebMarket/resources${list.productThumbnail}" alt="" width="200px" height="200px"></a>
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <a href="${pageContext.request.contextPath}/shop/view?n=${list.productNum}">
                                        <button><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
                                    </a>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <div class="product-info simpleCart_shelfItem">
                        <div class="product-info-cust prt_name">
                            <h5 align="center">
                                <%--<script>
                                    if (window.location.href.indexOf("?lang=ko") > -1) {
                                        alert("ko");
                                        document.getElementById("langProduct").innerHTML = "<b>${list.productName}</b>";
                                    } else  if (window.location.href.indexOf("?lang=ja") > -1) {
                                        alert("ja");
                                        document.getElementById("langProduct").innerHTML = "<b>チョコチョコケーキ</b>";
                                    }
                                </script>--%>
                                <b id="langProduct">${list.productName}</b>

                            </h5>
                            <p></p>
                            <h5 class="item_price productPrice" align="center"><fmt:formatNumber value="${list.productPrice - list.productPrice * (list.sale * 0.01)}" pattern="###,###,###" />원</h5>
                            <br>
                            <h5 align="center"><del>${list.productPrice}원</del>[${list.sale}% Off]
<%--                            <input type="number" class="inputStock item_quantity productStock" min="1" maxlength="${list.productStock}" value="1" />
                            <button type="button" class="addCart_btn add-cart item_add items">ADD</button>--%>
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
                            <li class="by"><%--<img src="images/do.png" alt="">--%></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="${pageContext.request.contextPath}/shop/list?c=101&l=2"><p>Chocolate Cake</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=102&l=2"><p>Strawberry Cake</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=103&l=2"><p>Honey Cake</p></a>
                        </div>
                    </div>
                    <div class="tab2">
                        <ul class="place">
                            <li class="sort">Muffin</li>
                            <li class="by"><%--<img src="images/do.png" alt="">--%></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="${pageContext.request.contextPath}/shop/list?c=201&l=2"><p>Chocolate Muffin</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=202&l=2"><p>Strawberry Muffin</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=203&l=2"><p>Honey Muffin</p></a>
                        </div>
                    </div>
                    <div class="tab3">
                        <ul class="place">
                            <li class="sort">Bread</li>
                            <li class="by"><%--<img src="images/do.png" alt="">--%></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="${pageContext.request.contextPath}/shop/list?c=301&l=2"><p>Chocolate Bread</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=302&l=2"><p>Strawberry Bread</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=303&l=2"><p>Honey Bread</p></a>
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
    <%@ include file="../include/footer.jsp"%>
</div>
<!---->
<div class="copywrite">
    <%@ include file="../include/copywrite.jsp"%>
</div>
<!---->
</body>
</html>