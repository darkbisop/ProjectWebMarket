<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/member/login.css?after">
    <link rel="shortcut icon" href="#">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function() {

            /* 로그인 버튼 클릭 */
            $(".login_button").click(function() {

                /* 로그인 매서드 서버 요청 */
                $("#login_form").attr("action", "/member/login");
                $("#login_form").submit();
            });
        });
    </script>
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <form id="login_form" method="post">
            <div class="logo_wrap">
                <span>Book Market</span>
            </div>

            <div class="login_wrap">
                <div class="id_wrap">
                    <div class="id_input_box">
                        <input class="id_input" name="memberId">
                    </div>
                </div>

                <div class="pw_wrap">
                    <div class="pw_input_box">
                        <input class="pw_input" name="memberPw">
                    </div>
                </div>


                <c:if test="${result == 0}">
                    <div class="login_warn">Please Confirm your ID or Password</div>
                </c:if>

                <div class="login_button_wrap">
                    <input type="button" class="login_button" value="Login">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>