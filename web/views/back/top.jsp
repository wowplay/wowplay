<%--
  Created by IntelliJ IDEA.
  User: QzzZ
  Date: 2016/7/13
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="../../resources/back/css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../resources/back/js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            //顶部导航切换
            $(".nav li a").click(function(){
                $(".nav li a.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
    </script>


</head>

<body style="background:url(../../resources/back/images/topbg.gif) repeat-x;">

<div class="topleft">
    <a href="main.jsp" target="_parent"><img src="../../resources/back/images/logo.png" title="系统首页" /></a>
</div>

<ul class="nav">
    <li><a href="default.jsp" target="rightFrame" class="selected"><img src="../../resources/back/images/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="imgtable.jsp" target="rightFrame"><img src="../../resources/back/images/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a href="imglist.jsp"  target="rightFrame"><img src="../../resources/back/images/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="tools.jsp"  target="rightFrame"><img src="../../resources/back/images/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="computer.jsp" target="rightFrame"><img src="../../resources/back/images/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="tab.jsp"  target="rightFrame"><img src="../../resources/back/images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
</ul>

<div class="topright">
    <ul>
        <li><span><img src="../../resources/back/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
        <li><a href="login.jsp" target="_parent">退出</a></li>
    </ul>

    <div class="user">
        <span>admin</span>
        <i>消息</i>
        <b>5</b>
    </div>

</div>
</body>
</html>

