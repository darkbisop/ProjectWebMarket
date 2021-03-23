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

        section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
        section.replyList { padding:30px 0; }
        section.replyList ol { padding:0; margin:0; }
        section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
        section.replyList div.userInfo { }
        section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
        section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
        section.replyList div.replyContent { padding:10px; margin:20px 0; }

        div.replyModal { position:relative; z-index:1; display: none; }
        div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
        div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
        div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
        div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
        div.modalContent button.modal_cancel_btnl { margin-left:20px; }
    </style>

    <script>
        function replyList() {
            const productNum = ${view.productNum};
            $.getJSON("/shop/view/replyList" + "?n=" + productNum, function (data) {
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
                    <form role="form" method="post">
                        <input type="hidden" name="productNum" value="${view.productNum}">
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

                                                           const data = {
                                                               productNum : productNum,
                                                               replyContent : replyContent
                                                           };

                                                           $.ajax({
                                                               url : "/shop/view/registReply",
                                                               type : "post",
                                                               data : data,
                                                               success : function () {
                                                                   replyList();
                                                                   $("#replyContent").val("");
                                                               }
                                                           });
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

                                        var spanID = $(this).parent().parent().find(".userName").text();

                                        if (currId === spanID) {
                                            $(".replyModal").fadeIn(200);
                                            var replyNum = $(this).attr("data-replyNum");
                                            var replyContent = $(this).parent().parent().children(".replyContent").text();
                                            $(".modal_replyContent").val(replyContent);
                                            $(".modal_update_btn").attr("data-replyNum", replyNum);
                                        } else {
                                            alert("본인만 가능");
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
                </section>
            </div>
        </section>
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
<%@include file="../include/logOut.jsp"%>
</body>
</html>