<%--
  Created by IntelliJ IDEA.
  User: QzzZ
  Date: 2016/7/13
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎登录后台管理系统--Wowplay视频播放</title>
    <link href="../../resources/back/css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../resources/back/js/jquery.js"></script>
    <script src="../../resources/back/js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
        });
    </script>

</head>

<body style="background-color:#1c77ac; background-image:url(../../resources/back/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>欢迎登录后台管理界面平台</span>
    <ul>
        <li><a href="#">回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>

<div class="loginbody">

    <span class="systemlogo"></span>

    <div class="loginbox">

        <ul>
            <li><input name="" type="text" class="loginuser" value="admin" onclick="JavaScript:this.value=''"/></li>
            <li><input name="" type="text" class="loginpwd" value="密码" onclick="JavaScript:this.value=''"/></li>
            <li><input name="" type="button" class="loginbtn" value="登录"  onclick="javascript:window.location='main.html'"  /><label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>
        </ul>


    </div>

</div>



<div class="loginbm">版权所有  我呸科技开发有限公司</div>
</body>
</html>

