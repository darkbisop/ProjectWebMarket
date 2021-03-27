<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
        a { color:#05f; text-decoration:none; }
        a:hover { text-decoration:underline; }

        h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
        ul, lo, li { margin:0; padding:0; list-style:none; }

        aside { float:left; width:180px; }
        aside h3 { font-size:22px; margin-bottom:20px; text-align:left; }
        aside li { font-size:16px; text-align:left; }
        aside li a { color:#000; display:block; padding:5px 0 5px 5px; }
        aside li a:hover { text-decoration:none; background:#eee; }

        aside li { position:relative; }
        aside li:hover { background:#eee; }
        aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
        aside li:hover > ul.low { display:block; }
        aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
        aside li:hover > ul.low li a:hover { background:#fff;}
        aside li > ul.low li { width:180px; }

    </style>
</head>
<body>
 <aside>
     <h3>카테고리</h3>
     <ul>
         <li><a href="/shop/list?c=100&l=1">케이크</a>
            <ul class="low">
                <li><a href="/shop/list?c=101&l=2">초콜릿 케이크</a></li>
                <li><a href="/shop/list?c=102&l=2">딸기 케이크</a></li>
                <li><a href="/shop/list?c=103&l=2">허니 케이크</a></li>
            </ul>
         </li>

         <li><a href="/shop/list?c=200&l=1">머핀</a>
             <ul class="low">
                 <li><a href="/shop/list?c=201&l=2">초콜릿 머핀</a></li>
                 <li><a href="/shop/list?c=202&l=2">딸기 머핀</a></li>
                 <li><a href="/shop/list?c=203&l=2">허니 머핀</a></li>
             </ul>
         </li>

         <li><a href="/shop/list?c=300&l=1">브레드</a>
             <ul class="low">
                 <li><a href="/shop/list?c=301&l=2">초콜릿 브레드</a></li>
                 <li><a href="/shop/list?c=302&l=2">딸기 브레드</a></li>
                 <li><a href="/shop/list?c=303&l=2">허니 브레드</a></li>
             </ul>
         </li>
     </ul>
 </aside>

</body>
</html>