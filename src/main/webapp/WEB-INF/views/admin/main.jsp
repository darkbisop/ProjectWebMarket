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
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <ul class="list">
                <c:if test="${member != null}">
                    <c:if test="${member.adminCk == 1}">
                        <li><a href="/admin/product/register">상품 등록</a> </li>
                        <li><a href="/admin/product/list">상품 목록</a> </li>
                        <li>
                            <a id="gnb_logout_button">Logout</a>
                        </li>
                        <li>
                            장바구니
                        </li>
                    </c:if>
                </c:if>
            </ul>
        </div>

        <div class="top_area">
            <div class="logo_area">
                <h1>logo area</h1>
            </div>

            <div class="search_area">
                <h1>search area</h1>
            </div>

            <div class="login_area">
                <!-- 로그인 했을때 -->
                <c:if test="${member != null}">
                    <div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <span>충전금액 : <fmt:formatNumber value = "${member.money}" pattern="\#,###,##" /></span>
                        <span>포인트 : <fmt:formatNumber value = "${member.point}" pattern="\#,###" /></span>
                            <%--<a href="/member/logout.do">Logout</a>--%>
                    </div>
                </c:if>
            </div>
            <div class="clearfix">
            </div>
        </div>

        <div class="navi_bar_area">
            <h1>navi bar</h1>
        </div>
        <div class="content_area">
            <h1>content area</h1>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#gnb_logout_button").click(function() {
        $.ajax({
            type: "post",
            url: "/member/logout.do",
            success:function (data) {
                alert("로그아웃 성공");
                document.location.reload();
            }
        });
    });
</script>