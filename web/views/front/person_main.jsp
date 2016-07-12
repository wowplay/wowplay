<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta property="qc:admins" content="3274365027620767011717676375"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <meta name="viewport"
          content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="XN2OVFQdUg">
    <title>个人中心—首页</title>
    <meta name="keywords"
          content="免费教程, 在线教育, 在线学习, 知识分享, 教程, 视频教程, 视频教学, 网络教学, 自学教程, 摄影教程, 折纸教程, 编程教程, 电脑教程, 健身教程,  ps教程, 公开课">
    <meta name="description" content="">
    <meta name="csrf-token"
          content="d40e197917ad23c46fd09f38de8f7cdd851243ac">
    <meta name="is-login" content="0">
    <meta name="is-open" content="1">
    <style type="text/css">
        #tt::-ms-clear {
            display: none;
        }
    </style>
    <link
            href="<%=basePath%>resources/front/assets/v2/bootstrap/bootstrap.css"
            rel="stylesheet">
    <link
            href="<%=basePath%>resources/front/assets/css/common.css"
            rel="stylesheet" media="screen">
    <link
            href="<%=basePath%>resources/front/assets/css/font-awesome.min.css"
            rel="stylesheet" media="screen">
    <link
            href="<%=basePath%>resources/front/assets/v2/css/es-icon.css"
            rel="stylesheet" media="screen">
    <link
            href="<%=basePath%>resources/front/assets/v2/css/main.css"
            rel="stylesheet" media="screen">
    <link
            href="<%=basePath%>resources/front/assets/css/howzhi.css"
            rel="stylesheet" type="text/css">
    <link
            href="<%=basePath%>resources/front/assets/css/hz-font/iconfont.css"
            rel="stylesheet" type="text/css">
    <link
            href="<%=basePath%>resources/front/assets/css/style.css"
            rel="stylesheet" type="text/css">
    <link
            href="<%=basePath%>resources/front/assets/css/hover.css"
            rel="stylesheet" type="text/css">
    <link
            href="<%=basePath%>resources/front/assets/js/static/css/ui2.css"
            rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>resources/front/assets/css/jquery.bigautocomplete.css" type="text/css"/>

    <script
            src="<%=basePath%>resources/front/assets/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/front/assets/js/jquery.bigautocomplete.js"></script>
    <script
            src="<%=basePath%>resources/front/assets/js/cropbox.js"></script>

</head>
<body class="index">
<header class="header">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand"
               href="<%=basePath%>resources/front/main.jsp"> <img
                    class="img-responsive" alt="。。"
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
                    <ul id="firstSort_ul" class="dropdown-menu">
                    </ul>
                </li>
                <li><a href="#">最新 </a></li>

            </ul>
            <form class="navbar-form navbar-left" action="/slowplay/main/main/course_queryCourseLikeName.action"
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
                <img class="mian-log" style="width: 100px;"
                     src="<%=basePath%>resources/front/assets/img/welcome_header.jpg">
                <img class="animated left-and-right" alt=".."
                     src="<%=basePath%>resources/front/assets/img/guide-updown.png">
            </a></li>
            <ul id="login_header" class="nav nav-login"
                style="margin-right: -90px;">
                <%--<c:if test="${person==null}">--%>
                    <%--<li id="login_li"><a--%>
                            <%--style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;"--%>
                            <%--href="javascript:showLogin('#login-modal_2')">登录</a></li>--%>
                    <%--<li id="register_li"><a--%>
                            <%--style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;"--%>
                            <%--href="javascript:showLogin('#signup-modal_2')">注册</a></li>--%>
                <%--</c:if>--%>
                <%--<c:if test="${person!=null}">--%>
                    <li id="login_li" style="margin-top: 38px;"><a
                            style="display: inline;margin: 0px;padding: 0px;"
                            href="<%=basePath%>resources/front/person_main.jsp">【
                            张三】</a>，您好 <a style="display: inline;"
                                                          href="javascript:loginExit()">注销</a></li>

                <%--</c:if>--%>
            </ul>
        </ul>
    </div>
</header>

<section class="m-home">
    <div class="container">
        <div class="userImg">
            <a class=" js-user-card" href="#"> <img class="img-responsive"
                                                    src="${person.path}">
            </a>

            <div class="user-info">
                <a class="user-name">${person.realname}</a>
                <p>
                    “<span id="_person_autograph">${person.autograph}</span>” <a
                        href="#" class="tooltop"> <i class="fa fa-pencil-square-o"></i>
                </a>
                </p>

            </div>
        </div>
    </div>
</section>

<nav class="home-nav">
    <div class="container">
        <ul id="person_main_tag" class="nav nav-mian">
            <li><a class="active" href="javascript:showPerson()">个人中心</a></li>
            <li><a href="javascript:showMyStudy()">在学</a></li>
            <li><a href="javascript:showMyNote()">笔记</a></li>
            <li><a href="javascript:showMyQuestion()">问答</a></li>
            <li><a href="javascript:showMyMsgBoard()">留言板</a></li>
        </ul>
    </div>
</nav>

<section id="person_center_box" class="container home">
    <div class="container" id="content-container">
        <div class="row">
            <div class="col-md-3">
                <div class="sidenav">
                    <ul id="MyMsgAndImgTab" class="list-group">
                        <li class="list-group-heading">个人设置</li>
                        <li class="list-group-item active"><a
                                href="javascript:showMyMsg()"><i
                                class="glyphicon glyphicon-user"></i> 基础信息</a></li>
                        <li class="list-group-item"><a
                                href="javascript:showChangePwd()"><i
                                class="glyphicon glyphicon-user"></i> 修改密码</a></li>
                        <li class="list-group-item"><a href="javascript:showMyImg()"><i
                                class="glyphicon glyphicon-picture"></i> 头像设置</a></li>
                    </ul>
                </div>
            </div>

            <div id="msg_box" class="col-md-9">
                <div class="panel panel-default panel-col">
                    <div class="panel-heading">基础信息</div>
                    <div class="panel-body">

                        <form id="person-msg-form" class="form-horizontal" method="post">
                            <div class="form-group">
                                <label class="col-md-2 control-label">用户名</label>
                                <div class="col-md-7 controls">
                                    <div class="control-text">张三</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="profile_truename">真实姓名</label>
                                <div class="col-md-7 controls">
                                    <input type="text" id="profile_truename" class="form-control"
                                           name="user.realname" value="张三">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">性别</label>
                                <div class="col-md-7 controls radios">
                                    <div id="profile_gender">
                                        <input type="radio" id="profile_gender_0" name="user.sex"
                                               checked="checked" value="男">
                                        <label class="required">男</label>
                                        <input type="radio" id="profile_gender_1" name="user.sex"
                                               value="女">
                                        <label class="required">女</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">个性签名</label>
                                <div class="col-md-7 controls radios">
                                    <input type="text" id="person_autograph" name="user.autograph"
                                           class="form-control" value="我很帅">
                                    <div class="help-block" style="display:none;"></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="profile_mobile" class="col-md-2 control-label">手机号码</label>
                                <div class="col-md-7 controls">
                                    <input type="text" id="person_tel" name="user.tel"
                                           class="form-control" value="${person.tel}">
                                    <div class="help-block" style="display:none"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="profile_qq" class="col-md-2 control-label">QQ</label>
                                <div class="col-md-7 controls">
                                    <input type="text" id="person_qq" name="user.qq"
                                           class="form-control" value="${person.qq}">
                                    <div class="help-block" style="display:none;"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7 col-md-offset-2">
                                    <button id="updatePerson-save-btn" type="button"
                                            class="btn btn-primary">保存
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div id="myImg_box" class="col-md-9" style="display: none;">
                <div class="containers2">
                    <div id="newImg" class="imageBox" style="display:none;">
                        <div class="form-group">
                            <div class="thumbBox"></div>
                            <div class="spinner" style="display: none">Loading...</div>
                        </div>

                    </div>
                    <div id="changeImgButt" class="action" style="display: none">
                        <input type="file" id="file" style="float:left; width: 250px">
                        <input type="button" id="btnCrop" value="Crop"
                               style="float: right"> <input type="button"
                                                            id="btnZoomIn" value="+" style="float: right"> <input
                            type="button" id="btnZoomOut" value="-" style="float: right">
                    </div>

                    <div id="oldImg">
                        <div class="form-group">
                            <div class="col-md-2 control-label">
                                <b>当前头像</b>
                            </div>
                            <div id="oldImg_img" class="controls col-md-8 controls">
                                <img src="" alt="头像">
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 50px;">
                            <div class="col-md-2 control-label"></div>
                            <div class="controls col-md-8 controls">
                                <p class="help-block">
                                    你可以上传JPG、GIF或PNG格式的文件，文件大小不能超过<strong>2M</strong>。
                                </p>
                            </div>
                        </div>
                        <div class="action">
                            <a id="upload-picture-btn" style="margin-left: 30px;"
                               class="btn btn-primary webuploader-container"
                               onclick="javascript:showImgCut()">
                                <div class="webuploader-pick">上传新头像</div>
                                <div id="rt_rt_1a5ed30jaeqfvhs1v4613lri11"
                                     style="position: absolute; top: 6px; left: 12px; width: 70px; height: 20px; overflow: hidden; bottom: auto; right: auto;">
                                    <label
                                            style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);">
                                    </label>
                                </div>
                            </a> <a id="save-picture-btn"
                                    style="margin-left: 135px;display: none;width: 100px;float: left;"
                                    class="btn btn-primary webuploader-container">
                            <div class="webuploader-pick" onclick="saveUserImg()">保存</div>
                        </a>
                        </div>
                    </div>
                </div>
            </div>

            <div id="changePwd_box" class="col-md-9" style="display: none;">
                <div class="panel panel-default panel-col">
                    <div class="panel-heading">修改密码</div>
                    <div class="panel-body">

                        <form id="person-pwd-form" class="form-horizontal" method="post">
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="profile_truename">原密码</label>
                                <div class="col-md-7 controls">
                                    <input type="password" name="user.pwd" id="oldPwd"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">新密码</label>
                                <div class="col-md-7 controls radios">
                                    <input type="password" id="newPwd" name="user.newPwd"
                                           class="form-control">
                                    <div class="help-block" style="display:none;"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">重复密码</label>
                                <div class="col-md-7 controls radios">
                                    <input type="password" id="newPwd2" class="form-control">
                                    <div class="help-block" style="display:none;"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7 col-md-offset-2">
                                    <button id="updatePwd-save-btn" type="button"
                                            class="btn btn-primary">保存
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </div>
</section>
<form id="frmm_11"
      action="/slowplay/main/main/user_updateUserImg.action" method="post"
      enctype="multipart/form-data">
    <input type="hidden" id="user_upload_img" name="user.path">
</form>

<!-- 在学 -->
<section id="study_center_box" style="display: none;"
         class="container home">
    <div class="col-md-9">
        <div class="flat myhz-course">
            <h3>
                我的课程 <a id="userCourse_a"
                        href="javascript:showCollectCourse()" class="active">已收藏课程 </a> <a
                    id="recentlyPlay_a" href="javascript:showRecentlyPlay()">最近浏览</a>
            </h3>
            <div class="course phPublic-course">
                <div class="section-body">
                    <div id="personCourse_div" class="row"></div>

                    <div id="recentlyPlayCourse_div" style="display: none;"
                         class="row"></div>
                </div>
            </div>
        </div>
    </div>
    <aside class="col-md-3">
        <div class="person-count">
            <ul id="center_right_tab1" class="clearfix">
                <li><a class="count"
                       href="javascript:showCollectCourseByNum()">1</a><span>课程</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyNoteByNum()">一</a><span>笔记</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyQuestionByNum()">一</a><span>回答</span></li>
            </ul>
        </div>


        <div class="person-info flat">
            <ul>
                <li><span class="first">昵称：</span><span>张三</span></li>
                <li><span class="first">性别：</span>男</li>
                <li><span class="first">QQ：</span><span>111111</span></li>
                <li><span class="first">最近动态：</span><span class="content">我好耍</span></li>
            </ul>
        </div>

        <div class="flat person-learner">
            <h3>
                好友<span class="count"></span>
            </h3>
            <a id="attent_butt1" class="first active"
               href="javascript:show_attent1()">关注（${fn:length(PersonAttent)}）</a>
            <a id="fans_butt1" class="pull-right" href="javascript:show_fans1()">粉丝（${fn:length(PersonFans)}）</a>
            <div class="person-student">
                <ul class="clearfix" id="home-attent1" style="display: block;">

                    <li>
                        <a class="js-user-card"
                           href="#">
                            <img class="avatar-sm" src="">
                        </a>
                        <a class="name"
                           href="#">java</a>
                    </li>
                </ul>
                <ul class="clearfix" id="home-fans1" style="display: none;">

                    <li>
                        <a class=" js-user-card"
                           href="#">
                            <img class="avatar-sm" src="粉丝">
                        </a>
                        <a class="name"
                           href="#">李四</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="flat person-visitor">
            <h3>
                最新来访<span class="count"></span>
            </h3>
            <div class="empty">暂无访客！</div>
        </div>
    </aside>
</section>

<!-- 笔记 -->
<section id="note_center_box" style="display: none;"
         class="container home">
    <div class="col-md-9" style="background-color: #fff">
        <div class="flat myhz-course">
            <h3>我的笔记</h3>
            <div id="showMyNote_div"></div>
        </div>
    </div>
    <aside class="col-md-3">
        <div class="person-count">
            <ul id="center_right_tab2" class="clearfix">
                <li><a class="count"
                       href="javascript:showCollectCourseByNum()">一</a><span>课程</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyNoteByNum()">1</a><span>笔记</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyQuestionByNum()">一</a><span>回答</span></li>
            </ul>
        </div>
        <div class="person-info flat">
            <ul>
                <li><span class="first">昵称：</span><span>张三</span></li>
                <li><span class="first">性别：</span>男</li>
                <li><span class="first">QQ：</span><span>22222222</span></li>
                <li><span class="first">最近动态：</span><span class="content">我很丑</span></li>
            </ul>
        </div>

        <div class="flat person-learner">
            <h3>
                好友<span class="count"></span>
            </h3>
            <a id="attent_butt2" class="first active"
               href="javascript:show_attent2()">关注（${fn:length(PersonAttent)}）</a>
            <a id="fans_butt2" class="pull-right" href="javascript:show_fans2()">粉丝（${fn:length(PersonFans)}）</a>
            <div class="person-student">
                <ul class="clearfix" id="home-attent2" style="display: block;">
                    <%--<c:forEach items="${PersonAttent}" var="attend">--%>
                        <li>
                            <a class=" js-user-card"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${attend.id}">
                                <img class="avatar-sm" src="${attend.path}">
                            </a>
                            <a class="name"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${attend.id}">${attend.realname}</a>
                        </li>
                    <%--</c:forEach>--%>
                </ul>
                <ul class="clearfix" id="home-fans2" style="display: none;">
                    <%--<c:forEach items="${PersonFans}" var="fans">--%>
                        <li>
                            <a class=" js-user-card"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${fans.id}">
                                <img class="avatar-sm" src="${fans.path}">
                            </a>
                            <a class="name"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${fans.id}">${fans.realname}</a>
                        </li>
                    <%--</c:forEach>--%>
                </ul>
            </div>
        </div>

        <div class="flat person-visitor">
            <h3>
                最新来访<span class="count"></span>
            </h3>
            <div class="empty">暂无访客！</div>
        </div>
    </aside>
</section>

<!-- 问答 -->
<section id="question_center_box" style="display: none;"
         class="container home">
    <div class="col-md-9">
        <div class="flat myhz-course">
            <h3>我的问答
                <a class=" follow-question btn pull-right btn-primary"
                   href="javascript:showAllQuestion()">查看全部</a>
            </h3>
            <div id="MyAllQuestion" class="course phPublic-course">
                <ul id="allQuestion_ul" class="course-in-ul"
                    style="margin-left: 30px;">

                </ul>
            </div>
            <div id="MyOneQuestion" class="course phPublic-course"
                 style="display: none;">
                <div class="detail flat">
                    <h1></h1>
                    <div class="editor-text"></div>
                    <div class="related-course"></div>
                    <div class="question-answer">
                        <div class="head clearfix">
                            <h4></h4>
                        </div>
                        <div class="sidebar-judge">
                            <ul id="questionAnswer_ul" class="thread-post-list">

                            </ul>
                        </div>

                        <div class="form ">
                            <div class="form-group">
                                <label class="control-label hidden">内容</label>
                                <div class="controls">
                                    <input type="hidden" id="questionId">
                                    <div id="answer_input_div"
                                         class="form-control question_title " contenteditable="true"
                                         style="height: 120px;width: 770px;overflow-x:hidden;"></div>
                                </div>
                            </div>
                            <div class="btns clearfix">
                                <button class="btn submit pull-right" id="answer-submit-btn">发表</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <aside class="col-md-3">
        <div class="person-count">
            <ul id="center_right_tab3" class="clearfix">
                <li><a class="count"
                       href="javascript:showCollectCourseByNum()">一</a><span>课程</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyNoteByNum()">一</a><span>笔记</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyQuestionByNum()">0</a><span>回答</span></li>
            </ul>
        </div>
        <div class="person-info flat">
            <ul>
                <li><span class="first">昵称：</span><span>${person.realname}</span></li>
                <li><span class="first">性别：</span>${person.sex}</li>
                <li><span class="first">QQ：</span><span>${person.qq}</span></li>
                <li><span class="first">最近动态：</span><span class="content">${person.autograph}</span></li>
            </ul>
        </div>

        <div class="flat person-learner">
            <h3>
                好友<span class="count"></span>
            </h3>
            <a id="attent_butt3" class="first active"
               href="javascript:show_attent3()">关注（${fn:length(PersonAttent)}）</a>
            <a id="fans_butt3" class="pull-right" href="javascript:show_fans3()">粉丝（${fn:length(PersonFans)}）</a>
            <div class="person-student">
                <ul class="clearfix" id="home-attent3" style="display: block;">
                    <c:forEach items="${PersonAttent}" var="attend">
                        <li>
                            <a class=" js-user-card"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${attend.id}">
                                <img class="avatar-sm" src="${attend.path}">
                            </a>
                            <a class="name"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${attend.id}">${attend.realname}</a>
                        </li>
                    </c:forEach>
                </ul>
                <ul class="clearfix" id="home-fans3" style="display: none;">
                    <c:forEach items="${PersonFans}" var="fans">
                        <li>
                            <a class=" js-user-card"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${fans.id}">
                                <img class="avatar-sm" src="${fans.path}">
                            </a>
                            <a class="name"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${fans.id}">${fans.realname}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <div class="flat person-visitor">
            <h3>
                最新来访<span class="count"></span>
            </h3>
            <div class="empty">暂无访客！</div>
        </div>
    </aside>
</section>

<!-- 留言板 -->
<section id="MsgBoard_center_box" style="display: none;"
         class="container home">
    <div class="col-md-9">
        <div class="flat myhz-course">
            <div class="person-comment course-in flat">
                <h2 class="nopadding">留言板</h2>
                <div class="form-group">
                    <label class="control-label hidden" for="comment">内容</label>
                    <div class="controls">
                        <input type="hidden" id="personId" value="${person.id}">
                        <div id="comment_input_div" class="form-control question_title "
                             contenteditable="true"
                             style="height: 120px;width: 770px;overflow-x:hidden;"></div>
                    </div>
                </div>

                <div class="clearfix">
                    <a href="javascript:showFuhao('#fuhao');"
                       class="mlm emotion-expand-btn"
                       style="font-weight:normal;font-size:12px;">^_^插入表情</a>
                    <div id="fuhao" class="emotions mvm" style="display: none;">
                        <a><img
                                src="<%=basePath%>resources/front/img_gif/1.gif"
                                alt="微笑" title="微笑" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/2.gif"
                            alt="哈哈大笑" title="哈哈大笑" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/3.gif"
                            alt="调皮" title="调皮" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/5.gif"
                            alt="惊讶" title="惊讶" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/6.gif"
                            alt="惊恐" title="惊恐" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/7.gif"
                            alt="撇嘴" title="撇嘴" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/8.gif"
                            alt="困" title="困" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/9.gif"
                            alt="难过" title="难过" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/10.gif"
                            alt="委屈" title="委屈" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/11.gif"
                            alt="生气" title="生气" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/12.gif"
                            alt="流泪" title="流泪" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/16.gif"
                            alt="酷" title="酷" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/18.gif"
                            alt="抓狂" title="抓狂" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/19.gif"
                            alt="吐" title="吐" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/20.gif"
                            alt="偷笑" title="偷笑" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/21.gif"
                            alt="可爱" title="可爱" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/22.gif"
                            alt="白眼" title="白眼" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/24.gif"
                            alt="饥饿" title="饥饿" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/27.gif"
                            alt="流汗" title="流汗" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/28.gif"
                            alt="憨笑" title="憨笑" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/30.gif"
                            alt="奋斗" title="奋斗" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/31.gif"
                            alt="咒骂" title="咒骂" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/32.gif"
                            alt="疑问" title="疑问" style="cursor: pointer;"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/33.gif"
                            alt="嘘" title="嘘" style="cursor: pointer;" data-code="[[嘘]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/34.gif"
                            alt="晕" title="晕" style="cursor: pointer;" data-code="[[晕]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/35.gif"
                            alt="抓狂" title="抓狂" style="cursor: pointer;" data-code="[[抓狂]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/38.gif"
                            alt="敲头" title="敲头" style="cursor: pointer;" data-code="[[敲头]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/49.gif"
                            alt="拥抱" title="拥抱" style="cursor: pointer;" data-code="[[拥抱]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/76.gif"
                            alt="强" title="强" style="cursor: pointer;" data-code="[[强]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/77.gif"
                            alt="弱" title="弱" style="cursor: pointer;" data-code="[[弱]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/78.gif"
                            alt="握手" title="握手" style="cursor: pointer;" data-code="[[握手]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/96.gif"
                            alt="冷汗" title="冷汗" style="cursor: pointer;" data-code="[[冷汗]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/97.gif"
                            alt="擦汗" title="擦汗" style="cursor: pointer;" data-code="[[擦汗]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/98.gif"
                            alt="抠鼻" title="抠鼻" style="cursor: pointer;" data-code="[[抠鼻]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/99.gif"
                            alt="鼓掌" title="鼓掌" style="cursor: pointer;" data-code="[[鼓掌]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/100.gif"
                            alt="糗大了" title="糗大了" style="cursor: pointer;"
                            data-code="[[糗大了]]"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/101.gif"
                            alt="坏笑" title="坏笑" style="cursor: pointer;" data-code="[[坏笑]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/104.gif"
                            alt="哈欠" title="哈欠" style="cursor: pointer;" data-code="[[哈欠]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/105.gif"
                            alt="鄙视" title="鄙视" style="cursor: pointer;" data-code="[[鄙视]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/107.gif"
                            alt="快哭了" title="快哭了" style="cursor: pointer;"
                            data-code="[[快哭了]]"></a> <a><img
                            src="<%=basePath%>resources/front/img_gif/108.gif"
                            alt="阴险" title="阴险" style="cursor: pointer;" data-code="[[阴险]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/109.gif"
                            alt="亲亲" title="亲亲" style="cursor: pointer;" data-code="[[亲亲]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/110.gif"
                            alt="吓" title="吓" style="cursor: pointer;" data-code="[[吓]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/111.gif"
                            alt="可怜" title="可怜" style="cursor: pointer;" data-code="[[可怜]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/118.gif"
                            alt="抱拳" title="抱拳" style="cursor: pointer;" data-code="[[抱拳]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/124.gif"
                            alt="OK" title="OK" style="cursor: pointer;" data-code="[[OK]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/202.gif"
                            alt="色" title="色" style="cursor: pointer;" data-code="[[色]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/203.gif"
                            alt="发呆" title="发呆" style="cursor: pointer;" data-code="[[发呆]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/204.gif"
                            alt="得意" title="得意" style="cursor: pointer;" data-code="[[得意]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/206.gif"
                            alt="害羞" title="害羞" style="cursor: pointer;" data-code="[[害羞]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/207.gif"
                            alt="闭嘴" title="闭嘴" style="cursor: pointer;" data-code="[[闭嘴]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/208.gif"
                            alt="睡觉" title="睡觉" style="cursor: pointer;" data-code="[[睡觉]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/209.gif"
                            alt="大哭" title="大哭" style="cursor: pointer;" data-code="[[大哭]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/210.gif"
                            alt="尴尬" title="尴尬" style="cursor: pointer;" data-code="[[尴尬]]">
                    </a> <a><img
                            src="<%=basePath%>resources/front/img_gif/4.gif"
                            alt="抛媚眼" title="抛媚眼" style="cursor: pointer;"
                            data-code="[[抛媚眼]]"></a>
                    </div>
                    <button class="btn btn-primary pull-right" id="MsgBoard-btn" type="button">发布</button>
                </div>
                <div class="hz-login-editor"></div>
                <ul class="comment-item-list" id="MsgBoardList">

                </ul>
                <div id="pageContent" style="text-align: right;">
                    <c:if test="${page.page!=1}">
							<span style="margin-left: 50px;"> <a
                                    href="javascript:showMsgBoardByPage(1)">首页</a>
							</span>
                    </c:if>
                    <c:if test="${page.page>1}">
							<span style="margin-left: 30px;"> <a
                                    href="javascript:showMsgBoardByPage(${page.page-1})">上一页</a>
							</span>
                    </c:if>
                    <c:if test="${page.page<page.allPage}">
							<span style="margin-left: 30px;"> <a
                                    href="javascript:showMsgBoardByPage(${page.page+1})">下一页</a>
							</span>
                    </c:if>
                    <c:if test="${page.page!=page.allPage}">
							<span style="margin-left: 30px;"> <a
                                    href="javascript:showMsgBoardByPage(${page.allPage})">尾页</a>
							</span>
                    </c:if>
                    <span style="margin-left: 50px;">第${page.page}页，共${page.allPage}页</span>
                </div>
                <input type="hidden" id="nowPage" value="${page.page}"> <input
                    type="hidden" id="allPage" value="${page.allPage}">
            </div>
        </div>
    </div>
    <aside class="col-md-3">
        <div class="person-count">
            <ul id="center_right_tab4" class="clearfix">
                <li><a class="count"
                       href="javascript:showCollectCourseByNum()">一</a><span>课程</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyNoteByNum()">一</a><span>笔记</span></li>
                <li class="line"></li>
                <li><a class="count" href="javascript:showMyQuestionByNum()">一</a><span>回答</span></li>
            </ul>
        </div>
        <div class="person-info flat">
            <ul>
                <li><span class="first">昵称：</span><span>${person.realname}</span></li>
                <li><span class="first">性别：</span>${person.sex}</li>
                <li><span class="first">QQ：</span><span>${person.qq}</span></li>
                <li><span class="first">最近动态：</span><span class="content">${person.autograph}</span></li>
            </ul>
        </div>

        <div class="flat person-learner">
            <h3>
                好友<span class="count"></span>
            </h3>
            <a id="attent_butt4" class="first active"
               href="javascript:show_attent4()">关注（${fn:length(PersonAttent)}）</a>
            <a id="fans_butt4" class="pull-right" href="javascript:show_fans4()">粉丝（${fn:length(PersonFans)}）</a>
            <div class="person-student">
                <ul class="clearfix" id="home-attent4" style="display: block;">
                    <c:forEach items="${PersonAttent}" var="attend">
                        <li>
                            <a class=" js-user-card"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${attend.id}">
                                <img class="avatar-sm" src="${attend.path}">
                            </a>
                            <a class="name"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${attend.id}">${attend.realname}</a>
                        </li>
                    </c:forEach>
                </ul>
                <ul class="clearfix" id="home-fans4" style="display: none;">
                    <c:forEach items="${PersonFans}" var="fans">
                        <li>
                            <a class=" js-user-card"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${fans.id}">
                                <img class="avatar-sm" src="${fans.path}">
                            </a>
                            <a class="name"
                               href="/slowplay/main/main/user_visitFriend.action?user.id=${fans.id}">${fans.realname}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <div class="flat person-visitor">
            <h3>
                最新来访<span class="count"></span>
            </h3>
            <div class="empty">暂无访客！</div>
        </div>
    </aside>
</section>


<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4 ">
                <a href="#"> <img
                        src="<%=basePath%>resources/front/assets/img/logo.png"/>
                </a>
            </div>
            <div class="col-md-4 about">
                <span><a href="#">关于我们</a></span>| <span><a href="#"
                                                            target="_blank">加入我们</a></span>| <span><a href="#"
                                                                                                      target="_blank">合作申请</a></span>|
                <span><a href="#">意见反馈</a></span><br> <a
                    style="margin-left: 45%" class="con" href="#"> 学苑路85号 </a>
            </div>
            <div class="col-md-4">
                关注我们： <a href="http://weibo.com"><i class="hz-icon icon-weibo"
                                                    style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px -30px; background-repeat:repeat-y'></i></a>
                <a class="icon-sns"><i class="hz-icon icon-weixin"
                                       style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px -59px; background-repeat:repeat-y'></i>
                    <div class="sns-popover"
                         style='background:url("<%=basePath%>resources/front/assets/img/slowPlay-weixin.jpg")'>
                    </div>
                </a> <a href="http://www.qq.com"><i class="hz-icon icon-qq"
                                                    style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px 49px; background-repeat:repeat-y'></i></a>
                <a href="http://qzone.qq.com"><i
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
			<span style="margin-left: 35%">Powered by <a href="#"
                                                         target="_blank">XuTeng v6.6.11</a> ©2014-2015 <a class="mlm"
                                                                                                          href="#"
                                                                                                          target="_blank">slowplay</a>
			</span>

    </div>
</div>

<ul class="fixed-bar">
    <li class="hz-app"><a class="active btn btn-primary" href="h#"
                          target="_blank"> APP </a></li>
    <li class="hz-weixin"><a class="fixed-bar-icon"
                             href="javascript:;"> <i class="hz-icon icon-erweima "
                                                     style='background:url("<%=basePath%>resources/front/assets/img/right_weixin.jpg")'></i>
    </a>
        <div class="weixin" style="">
            <p class="text-center mvs t-primary hidden-xs hidden-sm">扫一扫
                关注SlowPlay</p>
            <img class="img-responsive" alt="..."
                 src="<%=basePath%>resources/front/assets/img/slowPlay-weixin.jpg">
        </div>
    </li>
    <li class="hz-feedback"><a class="fixed-bar-icon" href="#"> <i
            class="hz-icon icon-question "
            style='background:url("<%=basePath%>resources/front/assets/img/right_wenhao.jpg")'></i>
    </a> <a class="js-feedback fixed-bar-text" href="#" target="_blank">
        问题反馈 </a></li>
    <li class="go-top" style="display: block;"><a
            class="fixed-bar-icon" href="javascript:;"> <i
            class="hz-icon icon-keyboardarrowup"
            style='background:url("<%=basePath%>resources/front/assets/img/right_top.jpg")'></i>
    </a> <a class="fixed-bar-text" href="javascript:pageScroll();"> 回到顶部 </a>
    </li>
</ul>
<div class="coverbox" id="cover"></div>
<!-- 登录注册隐藏域 -->
<div class="modal" id="login-modal_2" style="width:380px;height:350px">
    <a class="close" href="javascript:closeLogin('#login-modal_2')">×</a>
    <h1>登录</h1>
    <form class="login-form">
        <!-- <div class="form-arrow"></div> -->
        <input id="username" name="user.username" type="text"
               placeholder="用户名："> <input id="password"
                                          name="user.password" type="password" placeholder="密码：">
        <div>
            验证码：<input id="verifyCode" name="verifyCode" type="text"
                       onchange="codeVerify()" style="width: 100px;display: inline;"/> <img
                id="imgObj" alt="" src="xuan/verifyCode"/> <a
                href="javascript:changeVerify('#imgObj')">换一张</a><br/> <span
                id="codeError"> </span>
        </div>
        <br/> <span id="qqLoginBtn"></span><br/> <input type="button"
                                                        id="login_butt2" class="button-blue login" value="登录">
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

<div class="modal in" id="qq-modal_2" style="width:400px;height:300px">
    <a class="close" href="javascript:closeLogin('#qq-modal_2')">×</a>
    <h1>该qq初次登录，请填写初始化信息：</h1>
    <form class="signup-form" method="post" id="qqInit-form">
        <p class="error"></p>
        <input type="hidden" id="qq_realname" name="user.realname"> <input
            type="hidden" id="qq_openId" name="user.realname"> <input
            type="hidden" id="qq_path" name="user.path"> <input
            type="hidden" id="qq_sex" name="user.sex"> <input
            name="user.username" type="text" placeholder="用户名：" id="qq_username"
            onfocus="hightLight('username');"
            onblur="restore('username');checkName()"><span
            id="nameError"></span> <input name="user.password" type="password"
                                          placeholder="密码：" id="qq_password" onfocus="hightLight('password');"
                                          onblur="restore('password');checkPsd()"><span id="psdError"></span>
        <input type="password" placeholder="确认密码：" id="qq_repsd"
               onfocus="hightLight('repsd');"
               onblur="restore('repsd');checkRepsd()"><span id="repsdError"></span>
        <div class="clearfix"></div>
        <input type="button" id="qqInit_butt" class="button-blue reg"
               value="保存">
    </form>
</div>

<script
        src="<%=basePath%>resources/front/assets/js/bootstrap.min.js"></script>
<script src="<%=basePath%>resources/front/assets/js/main.js"></script>
<script
        src="<%=basePath%>resources/front/assets/js/myMsg.js"></script>

<script type="text/javascript"
        src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js"
        data-appid="101275090"
        data-redirecturi="http://qq363491275.imwork.net/slowplay/main/person_main.jsp"
        charset="utf-8"></script>

<script type="text/javascript"
        src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js"
        charset="utf-8" data-callback="true"></script>

<script type="text/javascript">
    //登录
    $("#login_butt2").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        var code = $("#verifyCode").val().toUpperCase();
        if (username == "" || password == "") {
            alert("用户名、密码不能为空~！");
        } else if (code != verifyCode.toUpperCase()) {
            alert("验证码错误~！");
        } else {
            $.ajax({
                type: "post",
                data: {
                    "user.username": username,
                    "user.password": password,
                },
                url: "main/user_main_login.action",
                dataType: "json",
                success: function (data) {
                    if (data == 3) {
                        alert("该用户已被禁止登陆~！");
                    } else if (data == 1) {
                        alert("用户名密码错误~！");
                    } else {
                        window.location = "/slowplay/main/person_main.jsp";
                    }
                }
            });
        }
    });
</script>
<script type="text/javascript">
    $(window)
            .load(
                    function () {
                        var options = {
                            thumbBox: '.thumbBox',
                            spinner: '.spinner',
                            imgSrc: '${person.path}'
                        };
                        var cropper = $('.imageBox').cropbox(options);
                        $('#file').on('change', function () {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                options.imgSrc = e.target.result;
                                cropper = $('.imageBox').cropbox(options);
                            }
                            reader.readAsDataURL(this.files[0]);
                            this.files = [];
                        });
                        $('#btnCrop')
                                .on(
                                        'click',
                                        function () {
                                            var img = cropper.getDataURL();
                                            $('#oldImg_img')
                                                    .html(
                                                            '<img id="user_upload_img_box" src="' + img + '">');
                                            $("#newImg").css("display",
                                                    "none");
                                            $("#oldImg").css("display",
                                                    "block");
                                            $("#save-picture-btn").css(
                                                    "display", "block");
                                            $("#changeImgButt").css(
                                                    "display", "none");
                                        });
                        $('#btnZoomIn').on('click', function () {
                            cropper.zoomIn();
                        });
                        $('#btnZoomOut').on('click', function () {
                            cropper.zoomOut();
                        });
                        $
                                .ajax({
                                    type: "post",
                                    url: "/slowplay/main/main/sort_queryFirstSortForMy.action",
                                    dataType: "json",
                                    success: function (data) {
                                        var strBuff = "";
                                        if (data != null) {
                                            $
                                                    .each(
                                                            data,
                                                            function () {
                                                                strBuff = strBuff
                                                                        + "<li><a href=\"/slowplay/main/main/sort_initSortTitle.action?sort.id="
                                                                        + this.id
                                                                        + "\">"
                                                                        + this.name
                                                                        + "</a></li>";
                                                            });
                                        }
                                        $("#firstSort_ul").html(strBuff);
                                    },
                                });
                    });
</script>
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

    //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
    QC.Login({
        //btnId：插入按钮的节点id，必选
        btnId: "qqLoginBtn",
        //用户需要确认的scope授权项，可选，默认all
        scope: "all",
        //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
        size: "B_M"
    }, function (reqData, opts) {//登录成功
        QC.Login.getMe(function (openId, accessToken) {
            $.ajax({
                type: "post",
                data: {
                    "user.openId": openId,
                    "user.realname": reqData.nickname,
                    "user.path": reqData.figureurl,
                    "user.sex": reqData.gender,
                    "user.username": "",
                },
                url: "/slowplay/main/main/user_loadByQQ.action",
                success: function (data) {
                    if (data == 1) {
                        showLogin('#qq-modal_2');
                        $("#qq_openId").val(openId);
                        $("#qq_realname").val(reqData.nickname);
                        $("#qq_path").val(reqData.figureurl);
                        $("#qq_sex").val(reqData.gender);
                    } else if (data != 0) {
                        window.location = "/slowplay/main/person_main.jsp";

                        window.opener.location.reload(); //刷新父窗口
                    }
                }
            });
        });
    });
</script>
</body>
</html>