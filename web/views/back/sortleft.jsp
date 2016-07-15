<%--
  Created by IntelliJ IDEA.
  User: QzzZ
  Date: 2016/7/13
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="../../resources/back/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../resources/back/js/jquery.js"></script>
    <script type="text/javascript" src="../../resources/back/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="../../resources/back/js/select-ui.min.js"></script>
    <script type="text/javascript" src="../../resources/back/editor/kindeditor.js"></script>
    <script type="text/javascript">
        $(function(){
            //导航切换
            $(".menuson1 li").click(function(){
                $(".menuson1 li.active1").removeClass("active1")
                $(this).addClass("active1");
            });
        })
    </script>
</head>
<body>
<dl class="leftmenu1">
    <dd>
        <ul class="menuson1">
            <li><cite></cite><a href="#" target="rightFrame">分类管理</a><i></i></li>
            <li class="active1"><cite></cite><a href="#" target="rightFrame">一级分类</a><i></i></li>
            <li><cite></cite><a href="secondlevel.jsp" target="rightFrame">二级分类</a><i></i></li>
            <li><cite></cite><a href="tag.jsp" target="rightFrame">标签分类</a><i></i></li>
        </ul>
    </dd>
</dl>
</body>
</html>