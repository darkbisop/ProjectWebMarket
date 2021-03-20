<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $("#gnb_logout_button").click(function() {
        $.ajax({
            type: "post",
            async:false,
            url: "/member/logout.do",
            success:function () {
                alert("로그아웃에 성공하였습니다");
                document.location.reload();
            }
        });
    });

    $("#gnb_kakaoLogout_button").click(function () {
        location.href="https://kauth.kakao.com/oauth/logout?client_id=27455cf079b38009ee0184c422408895&logout_redirect_uri=http://localhost:8080/kakao/kakaoLogout";
        $.ajax({
            type: "post",
            async:false,
            url: "/kakao/kakaoLogout",
            success:function () {
                document.location.reload();
            }
        });
    });

    $("#gnb_googleLogout_button").click(function () {
        location.href="https://accounts.google.com/logout";
        $.ajax({
            type: "post",
            async:false,
            url: "/google/googleLogout",
            success:function () {
                document.location.reload();
            }
        });
    });
</script>
</body>
</html>
