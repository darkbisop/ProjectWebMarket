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
                <c:if test="${member == null or kakaoMember == null}">
                    <li>
                        <a href="/member/login">Login</a>
                    </li>

                    <li>
                        <a href="/member/signUp">Sign Up</a>
                    </li>
                </c:if>

                <c:if test="${member != null or kakaoMember != null}">
                    <c:if test="${member.adminCk == 1}">
                        <li><a href="/admin/main">관리자 페이지</a> </li>
                    </c:if>
                    <li>
                        <a id="gnb_logout_button">Logout</a>
                        <%--<a href="https://kauth.kakao.com/oauth/logout?client_id=27455cf079b38009ee0184c422408895&logout_redirect_uri=http://localhost:8080/kakao/kakaoLogout">Logout</a>--%>
                    </li>

                    <li>
                        장바구니
                    </li>
                </c:if>


                <li>고객센터</li>
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
                <!-- 로그인 하지 않았을때 -->
                <c:if test="${member == null or kakaoMember == null}">
                    <div class="login_button"><a href="/member/login">Login</a></div>
                    <span><a href="/member/signUp">SignUp</a></span>
                </c:if>

                <!-- 로그인 했을때 -->
                <c:if test="${member != null}">
                    <div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <span>충전금액 : <fmt:formatNumber value = "${member.money}" pattern="\#,###,##" /></span>
                        <span>포인트 : <fmt:formatNumber value = "${member.point}" pattern="\#,###" /></span>
                        <%--<a href="/member/logout.do">Logout</a>--%>
                    </div>
                </c:if>
                <c:if test="${kakaoMember != null}">
                    <div class="login_success_area">
                        <span>회원 : ${kakaoMember}</span>
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
        location.href="https://kauth.kakao.com/oauth/logout?client_id=27455cf079b38009ee0184c422408895&logout_redirect_uri=http://localhost:8080/kakao/kakaoLogout";

        $.ajax({
            type: "post",
            url: "/kakao/kakaoLogout",
            success:function (data) {
                document.location.reload();
            }
        });

    });
</script>
</body>
</html>