<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <%--微博/腾讯登陆接口--%>
    <%--<meta property="wb:webmaster" content="e6647c2b95f7cef7" />--%>
    <%--<meta property="qc:admins" content="32743656436341127561577236654" />--%>
    <%--<meta property="qc:admins" content="3274365027620767011717676375" />--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <meta name="viewport"
          content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="XN2OVFQdUg">
    <title>首页 wowplay</title>
    <meta name="description" content="">
    <%--跨站请求伪造--%>
    <%--<meta name="csrf-token" content="d40e197917ad23c46fd09f38de8f7cdd851243ac">--%>
    <meta name="is-login" content="0">
    <meta name="is-open" content="1">
    <style type="text/css">
        #tt::-ms-clear {
            display: none;
        }
    </style>
    <link href="<%=basePath%>resources/front/assets/v2/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>resources/front/assets/css/common.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>resources/front/assets/css/font-awesome.min.css" rel="stylesheet"
          media="screen">
    <link href="<%=basePath%>resources/front/assets/v2/css/es-icon.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>resources/front/assets/v2/css/main.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>resources/front/assets/css/howzhi.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>resources/front/assets/css/hz-font/iconfont.css" rel="stylesheet"
          type="text/css">
    <link href="<%=basePath%>resources/front/assets/css/hover.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>resources/front/assets/js/static/css/ui2.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>resource/front/assets/css/jquery.bigautocomplete.css"
          type="text/css"/>

    <script src="<%=basePath%>resources/front/assets/js/myfocus-2.0.1.min.js"></script>
    <script src="<%=basePath%>resources/front/assets/js/setHomeSetFav.js"></script>
    <script src="<%=basePath%>resources/front/assets/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>resources/front/assets/js/jquery.bigautocomplete.js"></script>
    <script type="text/javascript">
        myFocus.set({
            id: 'boxID',//焦点图盒子ID
            pattern: 'mF_fancy',//风格应用的名称
            time: 3,//切换时间间隔(秒)
            trigger: 'click',//触发切换模式:'click'(点击)/'mouseover'(悬停)
            width: 1350,//设置图片区域宽度(像素)
            height: 415,//设置图片区域高度(像素)
            txtHeight: 'default'//文字层高度设置(像素),'default'为默认高度，0为隐藏
        });
    </script>
</head>
<body class="index">
<input type="hidden" id="personId" value="">
<header class="header">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"> <img class="img-responsive" alt="。。"
                                                   src="<%=basePath%>resources/front/assets/img/logo.png">
            </a>
            <button class="navbar-toggle" type="button" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
        </div>
        <nav class="collapse navbar-collapse pull-left">
            <ul class="nav navbar-nav topmenu">

                <li><a href="#">我的课程 </a></li>
                <li id="class_menu" class="nav-hover"><a
                        href="#">分类<b
                        class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">java</a>
                        </li>
                        <li>
                            <a href="#">c++</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#">最新 </a></li>

            </ul>
            <form class="navbar-form navbar-left" action="#"
                  method="post">
                <div class="form-group">
                    <!-- <input id="search_likeCourseName" name="course.coursename" class="form-control js-search" placeholder="搜课程"
                        autocomplete="off"> -->
                    <input id="tt" type="text" name="course.coursename" class="form-control js-search text"
                           placeholder="搜课程">
                    <script type="text/javascript">
                        $("#tt").bigAutocomplete({
                            width: 320,
                            url: "#",
                            callback: function (data) {
                                //alert();
                            }
                        });
                    </script>
                    <button class="button" style="font-size: 10px;" type="submit">查询</button>
                </div>
            </form>
        </nav>
        <ul class="nav user-nav pull-right">
            <li class="guide-log-box"><a class="hz-guide-logo " href="#">
                <img class="mian-log" style="width: 100px;" src="<%=basePath%>front/assets/img/welcome_header.jpg">
                <img class="animated left-and-right" alt=".."
                     src="<%=basePath%>resources/front/assets/img/guide-updown.png">
            </a></li>
            <ul id="login_header" class="nav nav-login" style="margin-right: -90px;">

                <li id="login_li"><a
                        style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;"
                        href="javascript:showLogin('#login-modal_2')">登录</a></li>
                <li id="register_li"><a
                        style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;"
                        href="javascript:showLogin('#signup-modal_2')">注册</a></li>

                <%--<li id="login_li" style="margin-top: 38px;">--%>
                <%--<a style="display: inline;margin: 0px;padding: 0px;"--%>
                <%--href="#">某某</a>，您好--%>
                <%--<a style="display: inline;" href="javascript:loginExit()">注销</a>--%>
                <%--</li>--%>
            </ul>
        </ul>
    </div>
</header>
<div id="boxID">
    <!--焦点图盒子-->
    <div class="loading"><img src="<%=basePath%>resources/front/assets/img/loading.gif" alt="请稍候..."/></div>
    <!--载入画面(可删除)-->
    <div class="pic"><!--内容列表(li数目可随意增减)-->
        <ul>
            <li><a href="#"><img src="<%=basePath%>resources/front/assets/img/block_picture_1446810333.jpg"/></a>
            </li>
            <li><a href="#"><img src="<%=basePath%>resources/front/assets/img/block_picture_1447733144.jpg"/></a>
            </li>
            <li><a href="#"><img src="<%=basePath%>resources/front/assets/img/block_picture_1446810351.jpg"/></a>
            </li>
            <li><a href="#"><img src="<%=basePath%>resources/front/assets/img/block_picture_1447731887.jpg"/></a>
            </li>
            <li><a href="#"><img src="<%=basePath%>resources/front/assets/img/block_picture_1447239528.jpg"/></a>
            </li>
            <li><a href="#"><img src="<%=basePath%>resources/front/assets/img/block_picture_1446810333.jpg"/></a>
            </li>
            <li><a href="#"><img src="<%=basePath%>resources/front/assets/img/block_picture_1447733144.jpg"/></a>
            </li>
        </ul>
    </div>
</div>
<section class="hz-section">
    <div class="course container" id="recommend-course-block">
        <div class="section-header">
            <h2>
                <span> 推荐课程 </span>
                <div class="line"></div>
            </h2>
            <p>从数千门课程中发现你的兴趣</p>
        </div>
        <div class="section-body index-course">
            <nav class="hz-index-nav">
                <ul class="clearfix">
                    <li id="class_1" value="0"><a href="#">热门推荐</a></li>
                    <c:set var="course_num" value="1"></c:set>
                    <c:forEach items="${sortList}" var="sort_1">
                        <c:forEach items="${sort_1.chirdList}" var="sort_2">
                            <c:forEach items="${sort_2.chirdList}" var="sort_3" end="1">
                                <c:if test="${course_num<10}">
                                    <li id="class_${course_num+1}" value="${course_num}">
                                        <a href="../front/sort_initSortTitle.action?sort.id=${sort_3.id}">${sort_3.name}</a>
                                    </li>
                                    <c:set var="course_num" value="${course_num+1}"></c:set>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </c:forEach>
                </ul>
                <div id="youbiao_classes" class="bottom-act hidden-xs hidden-sm"
                     style="margin-left: 336px;"></div>
            </nav>
            <div class="tabs">
                <div class="item clearfix" id="hot"></div>
                <c:set var="course_num" value="1"></c:set>
                <%--<c:forEach items="${sortList}" var="sort_1">--%>
                <%--<c:forEach items="${sort_1.chirdList}" var="sort_2">--%>
                <%--<c:forEach items="${sort_2.chirdList}" var="sort_3" end="1">--%>
                <%--<c:if test="${course_num<10}">--%>
                <div class="item clearfix">
                    <%--<c:forEach items="${sort_3.courseList}" var="course" end="8">--%>
                    <div class="col-md-3 col-sm-6  nobd">
                        <div class="course-item">
                            <div class="course-img">
                                <img alt="图片" style="width:300px;height:150px;"
                                     src="">
                                <a href="#">
                                    <div class="mask">
                                        <span class="btn btn-primary">开始学习</span>
                                    </div>
                                </a>
                            </div>
                            <div class="course-info">
                                <div class="title">
                                    <span class="label label-p">运动</span> <a class="transition"
                                                                             href="#">#</a>
                                </div>
                                <div class="metas">
                                    <span>3次浏览</span>
                                </div>
                                <div class="teacher text-o-show">
                                    <a class=" js-user-card" href="#"> <img
                                            class="avatar-ss "
                                            src="<%=basePath%>resources/front/assets/img/02515170a7b9957485.jpg">
                                    </a> <a class="link-light "
                                            href="javascript:;">课程作者</a>
                                    <span class="daren-icon-t"></span>

                                    <div class="price free pull-right">
                                        <a href="javascript:addCollect(1)"><span>加入收藏</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--</c:forEach>--%>
                </div>
                <%--<c:set var="course_num" value="${course_num+1}"></c:set>--%>
                <%--</c:if>--%>
                <%--</c:forEach>--%>
                <%--</c:forEach>--%>
                <%--</c:forEach>--%>
            </div>
        </div>
        <div class="more">
            <a href="#">更多课程<i class="fa fa-angle-right"></i></a>
        </div>
    </div>
</section>

<section class="hot-tag hz-section">
    <div class="container">
        <div class="section-header">
            <h2>
                <span>热门标签</span>
                <div class="line"></div>
            </h2>
        </div>
        <div class="section-body">
            <div class="hot-tag-main tag-hide row" style="display: block;">

                <div class="col-md-4">
                    <ul>
                        <li class="col-xs-5 item-s"><a
                                href="#">
                            <img
                                    alt="运动"
                                    src="<%=basePath%>resources/front/assets/img/hot_tag_mode1_1.jpg">
                            <span class="label label-b label-md">运动</span>
                        </a></li>

                        <li class="col-xs-7 item-s"><a
                                href="#">
                            <img alt="美食"
                                 src="<%=basePath%>resources/front/assets/img/hot_tag_mode1_2.jpg">
                            <span class="label label-b label-md">美食</span>
                        </a></li>

                        <li class="col-xs-7 item-l"><a
                                href="#">
                            <img
                                    alt="美食"
                                    src="<%=basePath%>resources/front/assets/img/hot_tag_mode1_7.jpg">
                            <span class="label label-b label-md">美食</span>
                        </a></li>

                        <li class="col-xs-5 item-l"><a
                                href="#">
                            <img
                                    alt="美食"
                                    src="<%=basePath%>resources/front/assets/img/hot_tag_mode1_8.jpg">
                            <span class="label label-b label-md">美食</span>
                        </a></li>
                </div>
            </div>
            <div class="more">
                <a href="#">更多标签<i class="fa fa-angle-right"></i></a>
            </div>
        </div>
    </div>
</section>
<section class="hz-section daren">
    <div class="container">
        <div class="section-header">
            <h2>
                <span>达人/机构</span>
                <div class="line"></div>
            </h2>
        </div>
        <div class="section-body">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1505966/"
                           data-user-id="1505966" data-card-url="/user/1505966/card/show">
                            <img class="avatar-ll" alt="天天理财"
                                 src="http://f1.howzhi.com/avatar/2014/07-08/104427b75d35119496.jpg">
                            <span title="达品牌" class="dapinpai-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">天天理财</span><span>天天理财网</span>
                        </div>
                        <p class="info">
                            <a href="/u/1505966/">天天理财网，天天投资咨询有限公司旗下理财...</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1539093/"
                           data-user-id="1539093" data-card-url="/user/1539093/card/show">
                            <img class="avatar-ll" alt="广州邢帅教育"
                                 src="http://f1.howzhi.com/avatar/2014/09-15/170930a5c295409701.jpg">
                            <span title="达品牌" class="dapinpai-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">广州邢帅教育</span><span>刑帅教育</span>
                        </div>
                        <p class="info">
                            <a href="/u/1539093/">广州邢帅教育，专注设计制图软件、影音制作...</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1356134/"
                           data-user-id="1356134" data-card-url="/user/1356134/card/show">
                            <img class="avatar-ll" alt="华清远见"
                                 src="<%=basePath%>resources/front/assets/img/avatar.png"> <span
                                title="达品牌" class="dapinpai-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">华清远见</span><span>IT教育培训</span>
                        </div>
                        <p class="info">
                            <a href="/u/1356134/">华清远见教育集团是一家嵌入式技术服务机构...</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1656086/"
                           data-user-id="1656086" data-card-url="/user/1656086/card/show">
                            <img class="avatar-ll" alt="东京萌"
                                 src="http://f1.howzhi.com/avatar/2015/01-07/11372448cd12285259.jpg">
                            <span title="达品牌" class="dapinpai-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">东京萌</span><span>日语学习社区</span>
                        </div>
                        <p class="info">
                            <a href="/u/1656086/">东京萌是给日本动漫、日本文化爱好者学日语...</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1292713/"
                           data-user-id="1292713" data-card-url="/user/1292713/card/show">
                            <img class="avatar-ll" alt="踏浪100"
                                 src="http://f1.howzhi.com/default/2015/09-15/151606647f0f208859.jpg">
                            <span title="达人" class="daren-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">踏浪100</span><span>互联网营销达人</span>
                        </div>
                        <p class="info">
                            <a href="/u/1292713/">踏浪100创始人</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1601706/"
                           data-user-id="1601706" data-card-url="/user/1601706/card/show">
                            <img class="avatar-ll" alt="51RGB"
                                 src="http://f1.howzhi.com/avatar/2015/04-27/15175979b03f063403.jpg">
                            <span title="达品牌" class="dapinpai-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">51RGB</span><span>IT培训网站</span>
                        </div>
                        <p class="info">
                            <a href="/u/1601706/">51RGB IT在线教育网站...</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1677342/"
                           data-user-id="1677342" data-card-url="/user/1677342/card/show">
                            <img class="avatar-ll" alt="建築詩周公子"
                                 src="http://f1.howzhi.com/avatar/2015/01-30/114934e01320795955.jpg">
                            <span title="达人" class="daren-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">土木大神元康</span><span>分享达人</span>
                        </div>
                        <p class="info">
                            <a href="/u/1677342/">分享众多建筑学与城市规划公开课...</a>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="item">
                        <a class=" js-user-card" href="/u/1741090/"
                           data-user-id="1741090" data-card-url="/user/1741090/card/show">
                            <img class="avatar-ll" alt="Mr_Liu"
                                 src="http://f1.howzhi.com/avatar/2015/06-06/08213829d18f254931.jpg">
                            <span title="达人" class="daren-icon"></span>
                        </a>

                        <div class="name clearfix">
                            <span class="left">Mr_Liu</span><span>分享达人</span>
                        </div>
                        <p class="info">
                            <a href="#">分享众多课程</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="more">
                <a href="#">申请入驻 <i
                        class="fa fa-angle-right"></i></a>
            </div>
        </div>
    </div>
</section>

<section class="mlearning hz-section">
    <div class="container">
        <h3>更有效、更有趣的学习</h3>
        <ul class="row">
            <li class="col-sm-4 col-xs-12"><a href="courses">
                <div class="pic">
                    <img alt="发现数千门课程"
                         src="<%=basePath%>resources/front/assets/img/learning-n1-new.png">
                </div>
                <p>发现数千门课程</p>
            </a></li>
            <li class="col-sm-4 col-xs-12"><a href="marketing">
                <div class="pic">
                    <img alt="专业学习计划指引"
                         src="<%=basePath%>resources/front/assets/img/learning-n2-new.png">
                </div>
                <p>专业学习计划指引</p>
            </a></li>
            <li class="col-sm-4 col-xs-12"><a href="groups/explore">
                <div class="pic">
                    <img alt="与同学一起讨论"
                         src="<%=basePath%>resources/front/assets/img/learning-n3-new.png">
                </div>
                <p>与同学一起讨论</p>
            </a></li>
        </ul>
    </div>
</section>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 ">
                <a href="#">
                    <img src="<%=basePath%>resources/front/assets/img/logo.png"/>
                </a>
            </div>
            <div class="col-md-4 about">
                <span><a href="#">关于我们</a></span>| <span><a
                    href="#" target="_blank">加入我们</a></span>| <span><a
                    href="#" target="_blank">合作申请</a></span>| <span><a
                    href="#">意见反馈</a></span><br>
                <a style="margin-left: 45%" class="con" href="#">
                    学苑路85号 </a>
            </div>
            <div class="col-md-4">
                关注我们： <a href="http://weibo.com"><i
                    class="hz-icon icon-weibo"
                    style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px -30px; background-repeat:repeat-y'></i></a>
                <a class="icon-sns"><i
                        class="hz-icon icon-weixin"
                        style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px -59px; background-repeat:repeat-y'></i>
                    <div class="sns-popover"
                         style='background:url("<%=basePath%>resources/front/assets/img/slowPlay-weixin.jpg")'>
                    </div>
                </a> <a href="http://www.qq.com"><i
                    class="hz-icon icon-qq"
                    style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px 49px; background-repeat:repeat-y'></i></a>
                <a
                        href="http://qzone.qq.com"><i
                        class="hz-icon icon-gongnengyedouban"
                        style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px 0px; background-repeat:repeat-y'></i></a>
            </div>
        </div>
    </div>
</footer>
<div class="friendlinks">
    <div class="container">
        <font>友情链接</font> <a class="white" href="http://www.edusoho.com/"
                             target="_blank">EduSoho开源网络课堂</a> <span>|</span> <a class="white"
                                                                                 href="http://www.qiqiuyu.com/"
                                                                                 target="_blank">气球鱼学院</a>
        <span>|</span>
        <a class="white" href="http://hao.360.cn/" target="_blank">360安全网址导航</a>
        <span>|</span> <a class="white" href="http://www.hao123.com/"
                          target="_blank">hao123</a> <span>|</span> <a class="white"
                                                                       href="http://www.lvse.com/"
                                                                       target="_blank">绿色网</a> <span>|</span> <a
            class="white" href="http://www.chinaz.com/" target="_blank">站长之家</a>
        <span>|</span> <a class="white" href="http://www.xker.com/"
                          target="_blank">新客网</a> <span>|</span> <a class="white"
                                                                    href="http://www.talang100.com/" target="_blank">踏浪100</a>
        <br>
			<span style="margin-left: 35%">Powered by <a href="#" target="_blank">XuTeng
                v6.6.11</a> ©2014-2015 <a class="mlm" href="#"
                                          target="_blank">slowplay</a>
			</span>

    </div>
</div>

<ul class="fixed-bar">
    <li class="hz-app"><a class="active btn btn-primary"
                          href="h#"
                          target="_blank"> APP </a></li>
    <li class="hz-weixin"><a class="fixed-bar-icon"
                             href="javascript:;"> <i class="hz-icon icon-erweima "
                                                     style='background:url("<%=basePath%>resources/front/assets/img/right_weixin.jpg")'></i>
    </a>
        <div class="weixin" style="">
            <p class="text-center mvs t-primary hidden-xs hidden-sm">扫一扫
                关注SlowPlay</p>
            <img class="img-responsive" alt="..."
                 src="<%=basePath%>front/assets/img/slowPlay-weixin.jpg">
        </div>
    </li>
    <li class="hz-feedback"><a class="fixed-bar-icon"
                               href="#"> <i class="hz-icon icon-question "
                                            style='background:url("<%=basePath%>resources/front/assets/img/right_wenhao.jpg")'></i>
    </a> <a class="js-feedback fixed-bar-text"
            href="#"
            target="_blank"> 问题反馈 </a></li>
    <li class="go-top" style="display: block;">
        <a class="fixed-bar-icon" href="javascript:;">
            <i class="hz-icon icon-keyboardarrowup"
               style='background:url("<%=basePath%>resources/front/assets/img/right_top.jpg")'></i>
        </a>
        <a class="fixed-bar-text" href="javascript:pageScroll();"> 回到顶部 </a>
    </li>
</ul>
<div class="coverbox" id="cover"></div>
<!-- 登录注册隐藏域 -->
<div class="modal" id="login-modal_2" style="width:380px;height:350px">
    <a class="close" href="javascript:closeLogin('#login-modal_2')">×</a>
    <h1>登录</h1>
    <form class="login-form">
        <!-- <div class="form-arrow"></div> -->
        <input id="username" name="user.username" type="text" placeholder="用户名：">
        <input id="password" name="user.password" type="password" placeholder="密码：">
        <div>
            验证码：<input id="verifyCode" name="verifyCode" type="text" onchange="codeVerify()"
                       style="width: 100px;display: inline;"/>
            <img id="imgObj" alt="" src="xuan/verifyCode"/>
            <a href="javascript:changeVerify('#imgObj')">换一张</a><br/>
            <span id="codeError"> </span>
        </div>
        <br/>
        <span id="qqLoginBtn"></span>
        <br/>
        <input type="button" id="login_butt" class="button-blue login" value="登录">
        <!-- <div class="clearfix"></div> -->
        <a class="forgot">忘记密码？</a>
    </form>
</div>
<div class="modal in" id="signup-modal_2" style="width:400px;height:550px">
    <a class="close" href="javascript:closeLogin('#signup-modal_2')">×</a>
    <h1>注册</h1>
    <form class="signup-form " method="post"
          id="signup_form" onsubmit="return checkForm()">
        <p class="error"></p>
        <input name="user.username" type="text" placeholder="用户名：" id="username1" onfocus="hightLight('username1');"
               onblur="restore('username1');checkName()"><span id="nameError"></span>
        <input name="user.password" type="password" placeholder="密码：" id="password1" onfocus="hightLight('password1');"
               onblur="restore('password1');checkPsd()"><span id="psdError"></span>
        <input name="repassword" type="password" placeholder="确认密码：" id="repsd" onfocus="hightLight('repsd');"
               onblur="restore('repsd');checkRepsd()"><span id="repsdError"></span>
        <input type="text" id="realname" name="user.realname" placeholder="真实姓名："/>
        性别：<input type="radio" name="user.sex" value="男" checked="checked" style="display: inline;width: 30px"> 男
        <input type="radio" name="user.sex" value="女" style="display: inline;width:30px"/>女<br>
        输入你的生日：<input name="user.birthday" id="birthday" type="date" placeholder="你的生日"
                      style="display: inline;width: 200px"/><br/>
        手机号码：<input id="user_phone" type="text" placeholder="你的手机号码" style="display: inline;width: 120px"/>
        <input id="phone_verify_butt" style="display: inline;width: 100px;background-color: rgba(16, 182, 124, 1)"
               type="button" value="发送短信验证码"/><br/>
        短信验证码：<input id="phone_verify" type="text" style="display: inline;width: 80px" onchange="checkPhoneVerify()">
        <span id="phoneverify_msg" style="display: inline;width: 80px"></span>
        <input type="hidden" name="title" value="">
        <input type="hidden" name="url" value="">
        <div class="clearfix"></div>
        <input type="button" id="signup_butt" class="button-blue reg"
               value="注册" data-category="UserAccount" data-action="regist">
    </form>
</div>

<script src="<%=basePath%>resources/front/assets/js/bootstrap.min.js"></script>
<script src="<%=basePath%>resources/front/assets/js/main.js"></script>

<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js"
        data-appid="101275090" data-redirecturi="http://qq363491275.imwork.net/slowplay/main/person_main.jsp"
        charset="utf-8"></script>
<script type="text/javascript">
    //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
    QC.Login({
        //btnId：插入按钮的节点id，必选
        btnId: "qqLoginBtn",
        //用户需要确认的scope授权项，可选，默认all
        scope: "all",
        //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
        size: "B_M"
    });
</script>

</body>
</html>