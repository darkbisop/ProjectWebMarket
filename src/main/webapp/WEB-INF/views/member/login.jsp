<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/signin.css" rel="stylesheet">
    <title>Insert title here</title>
    <%--<link rel="stylesheet" href="/resources/css/member/login.css?after">--%>
    <%--<link rel="shortcut icon" href="#">--%>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/RSA/jsbn.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/RSA/rsa.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/RSA/prng4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/RSA/rng.js"></script>
</head>
<body class="text-center">
<main class="form-signin">
    <form action="${pageContext.request.contextPath}/member/login" method="post" id="loginForm">
        <img class="mb-4" src="${pageContext.request.contextPath}/resources/css/bootstrap-logo.svg" alt="" width="72" height="57">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

        <label for="memberId" class="visually-hidden">ID</label>
        <input type="text" id="memberId" name="memberId" class="form-control" placeholder="ID" required autofocus>

        <label for="memberPw" class="visually-hidden">Password</label>
        <input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="Password" required>
       <%-- <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>--%>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2021-2021</p>
    </form>

    <!-- 실제 서버로 전송되는 form -->
    <form action="${pageContext.request.contextPath}/member/login" method="post" id="hiddenForm">
        <input type="hidden" name="memberId" />
        <input type="hidden" name="memberPw" />
    </form>

    <!-- 유저 입력 form의 submit event 재정의 -->
    <script>
        const $email = $("#hiddenForm input[name='memberId']");
        const $password = $("#hiddenForm input[name='memberPw']");

        // Server로부터 받은 공개키 입력
        const rsa = new RSAKey();
        rsa.setPublic("${modulus}", "${exponent}");

        $("#loginForm").submit(function(e) {
            // 실제 유저 입력 form은 event 취소
            // javascript가 작동되지 않는 환경에서는 유저 입력 form이 submit 됨
            // -> Server 측에서 검증되므로 로그인 불가
            e.preventDefault();

            // 아이디/비밀번호 암호화 후 hidden form으로 submit
            const memberId = $(this).find("#memberId").val();
            const memberPw = $(this).find("#memberPw").val();
            $email.val(rsa.encrypt(memberId)); // 아이디 암호화
            $password.val(rsa.encrypt(memberPw)); // 비밀번호 암호화
            $("#hiddenForm").submit();
        });
    </script>
</main>
</body>
</html>