<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        a:link { color: red; text-decoration: none;}
        a:visited { color: black; text-decoration: none;}
        a:hover { color: blue; text-decoration: none;}
    </style>
</head>
<body>
<a href="${pageContext.request.contextPath}/shop/cartList">
    <!-- 로그인 하지 않았을때 -->
    <c:if test="${member == null and kakaoMember == null and googleMember == null}">
        <div class="login_button"><a href="${pageContext.request.contextPath}/member/login">Login</a></div>
        <span><a href="${pageContext.request.contextPath}/member/signUp">SignUp</a></span>
    </c:if>

    <!-- 로그인 했을때 -->
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
    </c:if>
</a>
</body>
</html>
