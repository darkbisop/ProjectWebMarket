<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/header.jsp"%>
    <%@ include file="../include/replyStyle.jsp"%>
    <link href="/resources/lighting/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="/resources/lighting/css/flexslider.css" type="text/css" media="screen" />
    <script>
        function replyList() {
            const productNum = ${view.productNum};
            $.getJSON("/shop/view/replyList?n=" + productNum, function (data) {
                let str = "";
                $(data).each(function () {
                    console.log(data);
                    let replyDate = new Date(this.replyDate);
                    replyDate = replyDate.toLocaleDateString("ko-US");
                    str += "<li data-replyNum='" + this.replyNum + "'>"
                        + "<div class='userInfo'>"
                        + "<span class='userName'>" + this.memberId + "</span>"
                        + "<span class='date'>" + replyDate + "</span>"
                        + "</div>"
                        + "<div class='replyContent'>" + this.replyContent + "</div>"

                        + "<c:if test="${member != null or googleMember != null or kakaoMember != null}">"
                        + "<div class='replyFooter'>"
                        + "<button type='button' class='update' data-replyNum='" + this.replyNum + "'>수정</button>"
                        + "<button type='button' class='delete' data-replyNum='" + this.replyNum + "'>삭제</button>"
                        + "</div>"
                        + "</c:if>"
                        + "</li>"
                });
                $("section.replyList ol").html(str);
            });
        }
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
   <%--         <%@include file="../include/loginArea.jsp"%>
            <%@include file="../include/logOut.jsp"%>--%>
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
          <%--  <fmt:formatNumber pattern="###,###,###" value="${total}"/> (${stock})--%>
           <%-- <a href="checkout.html">
                <div class="total">
                    <span class="simpleCart_total"></span> (<span value=${".inputStock"}></span>)</div>
                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
            </a>--%>
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
        <form role="form" method="post">
            <input type="hidden" name="productNum" value="${view.productNum}">
            <input type="hidden" class="productName" value="${view.productName}">
            <input type="hidden" class="productPrice" value="${view.productPrice}">
            <input type="hidden" class="productThumbnail" value="${view.productThumbnail}">
        </form>
        <div class="product-price1">
            <div class="top-sing">
                <div class="col-md-7 single-top">
                    <div class="productImage">
                        <ul class="slides">
                            <li data-thumb="${view.productImage}">
                                <div class="thumb-image"> <img src="${view.productImage}" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                            </li>
                        </ul>
                    </div>
                   <%-- <script src="/resources/lighting/js/imagezoom.js"></script>
                    <script defer src="/resources/lighting/js/jquery.flexslider.js"></script>--%>
                   <%-- <script>
                        // Can also be used with $(document).ready()
                        $(window).load(function() {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>--%>

                </div>
                <div class="col-md-5 single-top-in simpleCart_shelfItem">
                    <div class="single-para ">
                        <h4 class="productName">${view.productName}</h4>
                        <h5 class="item_price productPrice"><fmt:formatNumber value="${view.productPrice}" pattern="###,###,###" />원</h5>
                        <p class="productDescription">${view.productDescription}</p>
                        <div class="prdt-info-grid">
                            <ul>
                                <li class="productName">- <span>상품명 : </span>${view.productName}</li>
                                <li class="categoryName">- <span>종류 : </span>${view.categoryName}</li>
                                <li class="productStock">- <span>재고 : </span>${view.productStock}EA</li>
                                <li class="cartStock">- <span>구매 수량 : </span>
                                    <input type="number" class="inputStock" min="1" maxlength="${view.productStock}" value="1" />
                                </li>
                            </ul>
                        </div>
                       <%-- <div class="check">
                            <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Enter pin code for delivery &amp; availability</p>
                            <form class="navbar-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Enter Pin code">
                                </div>
                                <button type="submit" class="btn btn-default">Verify</button>
                            </form>
                        </div>--%>
                        <p class="addToCart">
                            <button type="button" class="addCart_btn add-cart item_add">ADD TO CART</button>
                            <script>
                                $(".addCart_btn").click(function () {
                                    const productNum = $("#productNum").val();
                                    const productName = $(".productName").val();
                                    const productPrice = $(".productPrice").val();
                                    const productThumbnail = $(".productThumbnail").val();
                                    const cartStock = $(".inputStock").val();

                                    const data = {
                                        productNum : productNum,
                                        productName : productName,
                                        productPrice : productPrice,
                                        productThumbnail : productThumbnail,
                                        cartStock : cartStock
                                    };

                                    $.ajax({
                                        url : "/shop/view/addCart?pN=" + productName,
                                        type : "post",
                                        data : data,
                                        success : function (result) {
                                            if (result === 1) {
                                                alert("장바구니에 담았습니다.");
                                                $(".inputStock").val();
                                            } else {
                                                alert("회원만 사용할 수 있습니다.")
                                            }
                                        },
                                        error : function () {
                                            alert("장바구니에 담는데 실패하였습니다.")
                                        }
                                    });
                                    $.ajax({
                                        url : "/shop/view/calcCart?pN=" + productName,
                                        type : "post",
                                        data : data,
                                        async : true,
                                        success : function (total) {
                                            calcTotal(total);
                                        }
                                    });
                                });
                            </script>
                        </p>
                        <br>
                        <hr>
                        <div id="reply">
                            <c:if test="${member == null and kakaoMember == null and googleMember == null}">
                                <p>소감을 남기시려면 <a href="/member/login">로그인</a>해주세요</p>
                            </c:if>

                            <c:if test="${member != null or kakaoMember != null or googleMember != null}">
                                <section class="replyForm">
                                    <form role="form" method="post" autocomplete="off">
                                        <input type="hidden" id="productNum" name="productNum" value="${view.productNum}">
                                        <div class="input_area">
                                            <textarea name="replyContent" id="replyContent"></textarea>
                                        </div>

                                        <div class="input_area">
                                            <button type="button" id="reply_btn">소감 남기기기</button>

                                            <script>
                                                $("#reply_btn").click (function () {

                                                    const productNum = $("#productNum").val();
                                                    const replyContent = $("#replyContent").val();
                                                    const replyConfirm = confirm("등록하시겠습니까?");

                                                    const data = {
                                                        productNum : productNum,
                                                        replyContent : replyContent
                                                    };

                                                    if (replyConfirm) {
                                                        if (replyContent !== "") {
                                                            $.ajax({
                                                                url : "/shop/view/registReply",
                                                                type : "post",
                                                                data : data,
                                                                success : function () {
                                                                    replyList();
                                                                    $("#replyContent").val("");
                                                                }
                                                            });
                                                        } else {
                                                            alert("공백은 입력할 수 없습니다.");
                                                        }
                                                    }
                                                });
                                            </script>
                                        </div>
                                    </form>
                                </section>
                            </c:if>
                        </div>
                        <section class="replyList">
                            <input type="hidden" id="currMember" name="currLoginId" value="${member.memberId}">
                            <input type="hidden" id="currGoogle" name="currLoginId" value="${googleMember}">
                            <input type="hidden" id="currKakao" name="currLoginId" value="${kakaoMember}">
                            <ol>
                                <%--<c:forEach items="${replyList}" var="reply">
                                    <li>
                                        <div class="userInfo">
                                            <span class="userName">${reply.memberId}</span>
                                            <span class="date"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd" /></span>
                                        </div>
                                        <div class="replyContent">${reply.replyContent}</div>
                                    </li>
                                </c:forEach>--%>

                            </ol>
                            <script>
                                replyList();
                            </script>

                            <script>
                                $(document).on("click", ".update", function(){
                                    let currId;
                                    $("input[name='currLoginId']").each(function () {
                                        if ($(this).val() !== "") {
                                            currId = $(this).val();
                                        }
                                    });

                                    const spanID = $(this).parent().parent().find(".userName").text();

                                    if (currId === spanID) {
                                        $(".replyModal").fadeIn(200);
                                        var replyNum = $(this).attr("data-replyNum");
                                        var replyContent = $(this).parent().parent().children(".replyContent").text();
                                        $(".modal_replyContent").val(replyContent);
                                        $(".modal_update_btn").attr("data-replyNum", replyNum);
                                    } else {
                                        alert("작성자 본인만 수정 가능합니다");
                                    }

                                });

                                $(document).on("click", ".delete", function () {

                                    let deleteConfirm = confirm("정말로 삭제하시겠습니까?");

                                    if (deleteConfirm) {
                                        let data = { replyNum : $(this).attr("data-replyNum")};

                                        $.ajax({
                                            url : "/shop/view/deleteReply",
                                            type : "post",
                                            data : data,
                                            success : function (result) {
                                                if (result === 1) {
                                                    replyList();
                                                } else {
                                                    alert("작성자 본인만 삭제할 수 있습니다.")
                                                }
                                            },
                                            error : function () {
                                                alert("로그인 후 삭제 가능합니다다");
                                            }
                                        });
                                    }
                                });
                            </script>
                        </section>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="replyModal">
            <div class="modalContent">
                <div>
                    <textarea class="modal_replyContent" name="modal_replyContent"></textarea>
                </div>

                <div>
                    <button type="button" class="modal_update_btn">수정</button>
                    <button type="button" class="modal_cancel_btn">취소</button>
                </div>
            </div>
            <div class="modalBackground"></div>
        </div>
        <script>
            $(".modal_update_btn").click(function(){
                var modifyConfirm = confirm("정말로 수정하시겠습니까?");

                if(modifyConfirm) {
                    var data = {
                        replyNum : $(this).attr("data-replyNum"),
                        replyContent : $(".modal_replyContent").val()
                    };
                    $.ajax({
                        url : "/shop/view/updateReply",
                        type : "post",
                        data : data,
                        success : function(result){

                            if(result === 1) {
                                replyList();
                                $(".replyModal").fadeOut(200);
                            } else {
                                alert("작성자 본인만 수정 할 수 있습니다.");
                            }
                        },
                        error : function(){
                            alert("로그인 후 수정 가능합니다.")
                        }
                    });
                }
            });

            $(".modal_cancel_btn").click(function () {
                $(".replyModal").fadeOut(200);
            })
        </script>

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