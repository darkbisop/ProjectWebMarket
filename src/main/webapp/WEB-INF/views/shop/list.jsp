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
    </style>
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
                        <c:forEach items="${list}" var="list">
                            <li>
                                <div class="productThumb">
                                    <a href="/shop/view?n=${list.productNum}"><img src="${list.productThumbnail}" alt=""></a>
                                </div>
                                <div class="productName">
                                    <a href="/shop/view?n=${list.productNum}">${list.productName}</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </section>
            </div>
        </section>
    </div>
</div>

<%@include file="../include/logOut.jsp"%>
</body>
</html>