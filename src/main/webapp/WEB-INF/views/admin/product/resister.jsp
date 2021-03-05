<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div id="container">
    <h2>상품등록</h2>

    <form role="form" method="post" autocomplete="off">
        <label>1차 분류</label>
        <label>
            <select id="category1" name="category1">
                <option value="">전체</option>
            </select>
        </label>

        <label>2차 분류</label>
        <select id="category2" name="category2">
            <option value="">전체</option>
        </select>
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

    $("#category1").on("change", function () {
        let cate2Arr = [];
        let cate2Obj = {};
        let cate2Select = $("#category2");

        for (let i = 0; i < jsonData.length; i ++) {
            if (jsonData[i].depth === 2) {
                cate2Obj = {};
                cate2Obj.categoryCode = jsonData[i].categoryCode;
                cate2Obj.categoryName = jsonData[i].categoryName;
                cate2Obj.categoryCodeRef = jsonData[i].categoryCodeRef;
                cate2Arr.push(cate2Obj);
            }
        }

        cate2Select.children().remove();

        $("#category1 option:selected").each(function () {
            const val = $(this).val();
            console.log(val);
            cate2Select.append("<option value=''>ALL</option>")

            for (let i = 0; i < cate2Arr.length; i++) {
                if (val === cate2Arr[i].categoryCodeRef) {
                    cate2Select.append("<option value='" + cate2Arr[i].categoryCode + "'>" + cate2Arr[i].categoryName + "</option>");
                }
            }
        });
    });

</script>
</body>
</html>
