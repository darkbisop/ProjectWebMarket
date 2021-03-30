<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>

</head>
<body>
    <!-- 로그인 하지 않았을때 -->
    <c:if test="${member == null and kakaoMember == null and googleMember == null}">
        <div class="login_button"><a href="/member/login">Login</a></div>
        <span><a href="/member/signUp">SignUp</a></span>
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
        <span id="message"><img src="../resources/lighting/images/cartImg.png" alt="" width="30px" height="30px"> : </span>
        <fmt:formatNumber pattern="###,###,###" value="${total}"/> (${stock})
    </c:if>
</body>
</html>
