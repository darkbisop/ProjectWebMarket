<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lighting/js/memenu.js"></script>
    <link href="${pageContext.request.contextPath}/resources/lighting/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<ul class="memenu skyblue"><li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
    <li class="grid"><a href="${pageContext.request.contextPath}/shop/list?c=100&l=1">Products</a>
        <div class="mepanel">
            <div class="row">
                <div class="col1 me-one">
                    <h4><a href="${pageContext.request.contextPath}/shop/list?c=100&l=1">Cake</a></h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=101&l=2">초콜릿 케이크</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=102&l=2">딸기 케이크</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=103&l=2">허니 케이크</a></li>
                    </ul>
                </div>
                <div class="col1 me-one">
                    <h4><a href="${pageContext.request.contextPath}/shop/list?c=200&l=1">Muffin</a></h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=201&l=2">초콜릿 머핀</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=202&l=2">딸기 머핀</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=203&l=2">허니 머핀</a></li>
                    </ul>
                </div>
                <div class="col1 me-one">
                    <h4><a href="${pageContext.request.contextPath}/shop/list?c=300&l=1">Bread</a></h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=301&l=2">초콜릿 브레드</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=302&l=2">딸기 브레드</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=303&l=2">허니 브레드</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </li>
    <li class="grid"><a href="#">Typo</a></li>
    <li class="grid"><a href="#">Contact</a></li>
    <c:if test="${member != null and member.adminCk == 1}">
        <li class="grid active"><a href="${pageContext.request.contextPath}/admin/main">관리자 페이지</a></li>
    </c:if>
</ul>
</body>
</html>