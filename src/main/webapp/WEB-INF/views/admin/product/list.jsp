<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>

    <style>
        #container_box table td { width:170px; text-align: center }
    </style>
</head>
<body>
    <div id="container_box">
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>상품명</th>
                    <th>카테고리</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>등록날짜</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${list}" var="list">
                    <tr>
                        <td>${list.productNum}</td>
                        <td>
                            <a href="/admin/product/view?n=${list.productNum}">${list.productName}</a>
                        </td>
                        <td>${list.categoryName}</td>
                        <td>
                            <fmt:formatNumber value="${list.productPrice}" pattern="###,###,###" />
                        </td>
                        <td>${list.productStock}</td>
                        <td>
                            <fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
