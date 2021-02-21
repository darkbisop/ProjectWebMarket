<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to BookMall</title>
    <link rel="stylesheet" href="/resources/css/main.css?after">
    <link rel="shortcut icon" href="#">
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <h1>gnb area</h1>
        </div>

        <div class="top_area">
            <div class="logo_area">
                <h1>logo area</h1>
            </div>

            <div class="search_area">
                <h1>search area</h1>
            </div>

            <div class="login_area">
                <!-- 로그인 하지 않았을때 -->
                <c:if test="${member == null}">
                    <div class="login_button"><a href="/member/login">Login</a></div>
                    <span><a href="/member/signUp">SignUp</a></span>
                </c:if>

                <!-- 로그인 했을때 -->
                <c:if test="${member != null}">
                    <div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <span>충전금액 : <fmt:formatNumber value = "${member.money}" pattern="\#,###,##" /></span>
                        <span>포인트 : <fmt:formatNumber value = "${member.point}" pattern="\#,###" /></span>
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
</body>
</html>