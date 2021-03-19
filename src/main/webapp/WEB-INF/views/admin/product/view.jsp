<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .input_Area { margin:10px 0; }
        select { width:80px; }
        label { display:inline-block; width:70px; padding:5px; }
        label[for='productDescription'] { display:block; }
        input { width:150px; }
        textarea#productDescription { width:400px; height:180px; }
        .origImg {width: 200px; height: auto;}
        .thumbImg{width: 100px; height: auto;}
    </style>
</head>
<body>
<div id="container">
    <h2>상품 상세정보</h2>

    <form role="form" action="${pageContext.request.contextPath}/admin/product/view" method="post" autocomplete="off">

        <input type="hidden" name="n" value="${product.productNum}" />
        <label>1차 분류</label><span class="result1"></span>
        <label>2차 분류</label><span class="result2"></span>
        <label>
            <select id="category1">
                <option value="">전체</option>
            </select>
        </label>

        <label>
            <select id="category2">
                <option value="">전체</option>
            </select>
        </label>

        <div class="input_Area">
            <label>상품명</label>
            <span>${product.productName}</span>
        </div>

        <div class="input_Area">
            <label>상품 가격</label>
            <span><fmt:formatNumber value="${product.productPrice}" pattern="###,###,###" /></span>
        </div>

        <div class="input_Area">
            <label>상품수량</label>
            <span>${product.productStock}</span>
        </div>

        <div class="input_Area">
            <label>상품소개</label>
            <span>${product.productDescription}</span>
        </div>

        <div class="input_Area">
            <label>이미지</label>
            <p>원본 이미지</p>
            <img src="${product.productImage}" class="origImg" />

            <p>섬네일</p>
            <img src="${product.productThumbnail}" class="thumbImg"/>
        </div>

        <div class="input_Area">
            <label>등록 날짜</label>
            <span><fmt:formatDate value="${product.regDate}" pattern="yyyy-MM-dd" /></span>
        </div>

        <div class="input_Area">
            <button type="submit" class="update_Btn btn-warning">수정</button>
            <button type="submit" class="delete_Btn btn-danger">삭제</button>
        </div>
    </form>
</div>

<script>
    const jsonData = JSON.parse('${category}');
    console.log(jsonData);

    let cate1Arr = [];
    let cate1Obj = {};

    for (let i = 0; i < jsonData.length; i ++) {
        if (jsonData[i].depth === 1) {
            cate1Obj = {};
            cate1Obj.categoryCode = jsonData[i].categoryCode;
            cate1Obj.categoryName = jsonData[i].categoryName;
            cate1Arr.push(cate1Obj);
        }
    }

    for (let i = 0; i < cate1Arr.length; i++) {
        $("#category1").append("<option value='" + cate1Arr[i].categoryCode + "'>" + cate1Arr[i].categoryName + "</option>");
    }

    const select_cateCode  = '${product.categoryCode}';
    const select_cateCodeRef = '${product.categoryCodeRef}';
    const select_cateName = '${product.categoryName}';

    if(select_cateCodeRef != null && select_cateCodeRef != '') {
        $("#category1").val(select_cateCodeRef);
        $("#category2").val(select_cateCode);
        $("#category2").children().remove();
        $("#category2").append("<option value='" + select_cateCode + "'>" + select_cateName + "</option>");
    }

    $('.result1').text($("#category1 option:selected").text());
    $('.result2').text($("#category2 option:selected").text());
    document.getElementById("category1").style.display = "none";
    document.getElementById("category2").style.display = "none";

    const formObj = $("form[role='form']");
    $(".update_Btn").click(function() {
        formObj.attr("action", "/admin/product/update");
        formObj.attr("method", "get");
        formObj.submit();
    });

    $(".delete_Btn").click(function() {
        const con = confirm("정말로 삭제하시겠습니까?");

        if (con) {
            formObj.attr("action", "/admin/product/delete");
            formObj.submit();
        }
        alert("게시글을 삭제하였습니다.");
    });

</script>
</body>
</html>
