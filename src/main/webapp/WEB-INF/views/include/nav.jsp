<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <ul class="list">
        <c:if test="${member == null and kakaoMember == null}">
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
            <li>상품목록</li>
            <li>장바구니</li>
            <li>고객센터</li>
            <c:choose>
                <c:when test="${kakaoMember != null}">
                    <li><a id="gnb_kakaoLogout_button">Logout</a></li>
                </c:when>
                <c:when test="${member != null}">
                    <li><a id="gnb_logout_button">Logout</a></li>
                </c:when>
            </c:choose>
        </c:if>
    </ul>
</body>
</html>