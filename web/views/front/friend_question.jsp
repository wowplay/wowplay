<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta property="qc:admins" content="3274365027620767011717676375" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
	<meta name="viewport"
		  content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta name="renderer" content="webkit">
	<meta name="baidu-site-verification" content="XN2OVFQdUg">
	<title>个人中心—首页</title>
	<meta name="keywords" content="免费教程, 在线教育, 在线学习, 知识分享, 教程, 视频教程, 视频教学, 网络教学, 自学教程, 摄影教程, 折纸教程, 编程教程, 电脑教程, 健身教程,  ps教程, 公开课">
	<meta name="description" content="">
	<meta name="csrf-token" content="d40e197917ad23c46fd09f38de8f7cdd851243ac">
	<meta name="is-login" content="0">
	<meta name="is-open" content="1">

	<link href="<%=basePath%>main/assets/v2/bootstrap/bootstrap.css"
		  rel="stylesheet">
	<link href="<%=basePath%>main/assets/css/common.css"
		  rel="stylesheet" media="screen">
	<link href="<%=basePath%>main/assets/css/font-awesome.min.css"
		  rel="stylesheet" media="screen">
	<link href="<%=basePath%>main/assets/v2/css/es-icon.css"
		  rel="stylesheet" media="screen">
	<link href="<%=basePath%>/main/assets/v2/css/main.css"
		  rel="stylesheet" media="screen">
	<link href="<%=basePath%>main/assets/css/howzhi.css"
		  rel="stylesheet" type="text/css">
	<link href="<%=basePath%>main/assets/css/hz-font/iconfont.css"
		  rel="stylesheet" type="text/css">
	<link href="<%=basePath%>main/assets/css/style.css"
		  rel="stylesheet" type="text/css">
	<link href="<%=basePath%>main/assets/css/hover.css"
		  rel="stylesheet" type="text/css">
	<link href="<%=basePath%>main/assets/js/static/css/ui2.css"
		  rel="stylesheet" type="text/css">
	<script src="<%=basePath%>main/assets/js/jquery-2.0.3.min.js"></script>

</head>
<body class="index">
<input type="hidden" id="personId" value="${person.id}">
<header class="header">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"
			   href="${pageContext.request.contextPath}/main/main.jsp"> <img
					class="img-responsive" alt="。。"
					src="${pageContext.request.contextPath}/main/assets/img/logo.png">
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
						href="${pageContext.request.contextPath}/main/main/sort_initSortTitle.action?sort.id=0">分类<b
						class="caret"></b></a>
					<ul id="firstSort_ul" class="dropdown-menu">
					</ul></li>
				<li><a href="#">最新 </a></li>

			</ul>
			<form class="navbar-form navbar-left" role="search" action="#">
				<div class="form-group">
					<input name="q" class="form-control js-search" placeholder="搜课程"
						   autocomplete="off">

					<button class="button" style="font-size: 10px;" type="submit">查询</button>
				</div>
			</form>
		</nav>
		<ul class="nav user-nav pull-right">
			<li class="guide-log-box"><a class="hz-guide-logo " href="#">
				<img class="mian-log" style="width: 100px;"
					 src="${pageContext.request.contextPath}/main/assets/img/welcome_header.jpg">
				<img class="animated left-and-right" alt=".."
					 src="${pageContext.request.contextPath}/main/assets/img/guide-updown.png">
			</a></li>
			<ul id="login_header" class="nav nav-login"
				style="margin-right: -90px;">
				<%--<c:if test="${person==null}">--%>
				<li id="login_li"><a
						style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;"
						href="javascript:showLogin('#login-modal_2')">登录</a></li>
				<li id="register_li"><a
						style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;"
						href="javascript:showLogin('#signup-modal_2')">注册</a></li>
				<%--</c:if>--%>
				<%--<c:if test="${person!=null}">--%>
				<%--<li id="login_li" style="margin-top: 38px;"><a--%>
				<%--style="display: inline;margin: 0px;padding: 0px;"--%>
				<%--href="${pageContext.request.contextPath}/main/person_main.jsp">【--%>
				<%--${person.realname}】</a>，您好 <a style="display: inline;"--%>
				<%--href="javascript:loginExit()">注销</a></li>--%>

				<%--</c:if>--%>
			</ul>
		</ul>
	</div>
</header>

<%--<section class="m-home">--%>
<%--<div class="container">--%>
<%--<div class="userImg">--%>
<%--<a class=" js-user-card" href="#"> <img class="img-responsive"--%>
<%--src="${person.path}" alt="" >--%>
<%--</a>--%>

<%--<div class="user-info">--%>
<%--<a class="user-name">${person.realname}</a>--%>
<%--<p>--%>
<%--“<span id="_person_autograph">${person.autograph}</span>” <a--%>
<%--href="#" class="tooltop"> <i class="fa fa-pencil-square-o"></i>--%>
<%--</a>--%>
<%--</p>--%>

<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</section>--%>

<nav class="home-nav">
	<div class="container">
		<ul id="person_main_tag" class="nav nav-mian">
			<li><a href="javascript:;">主页</a></li>
			<li><a class="active" href="javascript:;">问答</a></li>
		</ul>
	</div>
</nav>

<!-- 问答 -->
<section id="question_center_box""
class="container home">
<div class="col-md-9">
	<div class="flat myhz-course">
		<h3>我的问题 <a class=" follow-question btn pull-right btn-primary" href="javascript:showAllQuestion()">查看全部</a></h3>
		<div id="MyAllQuestion" class="course phPublic-course">
			<ul id="allQuestion_ul" class="course-in-ul" style="margin-left: 30px;">

			</ul>
		</div>
		<div id="MyOneQuestion" class="course phPublic-course" style="display: none;">
			<div class="detail flat">
				<h1>

				</h1>
				<div class="editor-text">

				</div>
				<div class="related-course">

				</div>
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
				   href="javascript:;">0</a><span>课程</span></li>
			<li class="line"></li>
			<li><a class="count" href="javascript:;">0</a><span>笔记</span></li>
			<li class="line"></li>
			<li><a class="count" href="javascript:;">0</a><span>回答</span></li>
		</ul>
	</div>
	<div class="person-info flat">
		<ul>
			<li><span class="first">昵称：</span><span>昵称：</span></li>
			<li><span class="first">昵称：</span>昵称：</li>
			<li><span class="first">QQ：</span><span>qq</span></li>
			<li><span class="first">最近动态：</span><span class="content">最近动态：</span></li>
		</ul>
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
						src="${pageContext.request.contextPath}/main/assets/img/logo.png" />
				</a>
			</div>
			<div class="col-md-4 about">
				<span><a href="#">关于我们</a></span>| <span><a href="#"
															target="_blank">加入我们</a></span>| <span><a href="#" target="_blank">合作申请</a></span>|
				<span><a href="#">意见反馈</a></span><br> <a
					style="margin-left: 45%" class="con" href="#"> 学苑路85号 </a>
			</div>
			<div class="col-md-4">
				关注我们： <a href="http://weibo.com"><i class="hz-icon icon-weibo"
													style='background-image:url("${pageContext.request.contextPath}/main/assets/img/social-share-icons.png");background-position:5px -30px; background-repeat:repeat-y'></i></a>
				<a class="icon-sns"><i class="hz-icon icon-weixin"
									   style='background-image:url("${pageContext.request.contextPath}/main/assets/img/social-share-icons.png");background-position:5px -59px; background-repeat:repeat-y'></i>
					<div class="sns-popover"
						 style='background:url("${pageContext.request.contextPath}/main/assets/img/slowPlay-weixin.jpg")'>
					</div> </a> <a href="http://www.qq.com"><i class="hz-icon icon-qq"
															   style='background-image:url("${pageContext.request.contextPath}/main/assets/img/social-share-icons.png");background-position:5px 49px; background-repeat:repeat-y'></i></a>
				<a href="http://qzone.qq.com"><i
						class="hz-icon icon-gongnengyedouban"
						style='background-image:url("${pageContext.request.contextPath}/main/assets/img/social-share-icons.png");background-position:5px 0px; background-repeat:repeat-y'></i></a>
			</div>
		</div>
	</div>
</footer>
<div class="friendlinks">
	<div class="container">
		<font>友情链接</font> <a class="white" href="http://www.edusoho.com/"
							 target="_blank">EduSoho开源网络课堂</a> <span>|</span> <a class="white"
																				 href="http://www.qiqiuyu.com/" target="_blank">气球鱼学院</a> <span>|</span>
		<a class="white" href="http://hao.360.cn/" target="_blank">360安全网址导航</a>
		<span>|</span> <a class="white" href="http://www.hao123.com/"
						  target="_blank">hao123</a> <span>|</span> <a class="white"
																	   href="http://www.lvse.com/" target="_blank">绿色网</a> <span>|</span> <a
			class="white" href="http://www.chinaz.com/" target="_blank">站长之家</a>
		<span>|</span> <a class="white" href="http://www.xker.com/"
						  target="_blank">新客网</a> <span>|</span> <a class="white"
																	href="http://www.talang100.com/" target="_blank">踏浪100</a> <br>
			<span style="margin-left: 35%">Powered by <a href="#"
														 target="_blank">XuTeng v6.6.11</a> ©2014-2015 <a class="mlm"
																										  href="#" target="_blank">slowplay</a>
			</span>

	</div>
</div>

<ul class="fixed-bar">
	<li class="hz-app"><a class="active btn btn-primary" href="h#"
						  target="_blank"> APP </a></li>
	<li class="hz-weixin"><a class="fixed-bar-icon"
							 href="javascript:;"> <i class="hz-icon icon-erweima "
													 style='background:url("${pageContext.request.contextPath}/main/assets/img/right_weixin.jpg")'></i>
	</a>
		<div class="weixin" style="">
			<p class="text-center mvs t-primary hidden-xs hidden-sm">扫一扫
				关注SlowPlay</p>
			<img class="img-responsive" alt="..."
				 src="${pageContext.request.contextPath}/main/assets/img/slowPlay-weixin.jpg">
		</div></li>
	<li class="hz-feedback"><a class="fixed-bar-icon" href="#"> <i
			class="hz-icon icon-question "
			style='background:url("${pageContext.request.contextPath}/main/assets/img/right_wenhao.jpg")'></i>
	</a> <a class="js-feedback fixed-bar-text" href="#" target="_blank">
		问题反馈 </a></li>
	<li class="go-top" style="display: block;"><a
			class="fixed-bar-icon" href="javascript:;"> <i
			class="hz-icon icon-keyboardarrowup"
			style='background:url("${pageContext.request.contextPath}/main/assets/img/right_top.jpg")'></i>
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
					   onchange="codeVerify()" style="width: 100px;display: inline;" /> <img
				id="imgObj" alt="" src="xuan/verifyCode" /> <a
				href="javascript:changeVerify('#imgObj')">换一张</a><br /> <span
				id="codeError"> </span>
		</div>
		<br /> <span id="qqLoginBtn"></span><br /> <input type="button"
														  id="login_butt2" class="button-blue login" value="登录">
		<!-- <div class="clearfix"></div> -->
		<a class="forgot">忘记密码？</a>
	</form>
</div>
<div class="modal in" id="signup-modal_2"
	 style="width:400px;height:550px">
	<a class="close" href="javascript:closeLogin('#signup-modal_2')">×</a>
	<h1>注册</h1>
	<form class="signup-form " method="post" id="signup_form"
		  onsubmit="return checkForm()">
		<p class="error"></p>
		<input name="user.username" type="text" placeholder="用户名："
			   id="username1" onfocus="hightLight('username1');"
			   onblur="restore('username1');checkName()"><span
			id="nameError"></span> <input name="user.password" type="password"
										  placeholder="密码：" id="password1" onfocus="hightLight('password1');"
										  onblur="restore('password1');checkPsd()"><span id="psdError"></span>
		<input name="repassword" type="password" placeholder="确认密码："
			   id="repsd" onfocus="hightLight('repsd');"
			   onblur="restore('repsd');checkRepsd()"><span id="repsdError"></span>
		<input type="text" id="realname" name="user.realname"
			   placeholder="真实姓名：" /> 性别：<input type="radio" name="user.sex"
												value="男" checked="checked" style="display: inline;width: 30px">
		男 <input type="radio" name="user.sex" value="女"
				 style="display: inline;width:30px" />女<br> 输入你的生日：<input
			name="user.birthday" id="birthday" type="date" placeholder="你的生日" />
		<input type="hidden" name="title" value=""> <input
			type="hidden" name="url" value="">
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

<script src="${pageContext.request.contextPath}/main/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/main/assets/js/main.js"></script>

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
	$("#login_butt2").click(function() {
		var username = $("#username").val();
		var password = $("#password").val();
		var code = $("#verifyCode").val().toUpperCase();
		if (username == "" || password == "") {
			alert("用户名、密码不能为空~！");
		} else if (code != verifyCode.toUpperCase()) {
			alert("验证码错误~！");
		} else {
			$.ajax({
				type : "post",
				data : {
					"user.username" : username,
					"user.password" : password,
				},
				url : "main/user_main_login.action",
				dataType : "json",
				success : function(data) {
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
	//调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
	QC.Login({
		//btnId：插入按钮的节点id，必选
		btnId : "qqLoginBtn",
		//用户需要确认的scope授权项，可选，默认all
		scope : "all",
		//按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
		size : "B_M"
	});

	//调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
	QC.Login({
		//btnId：插入按钮的节点id，必选
		btnId : "qqLoginBtn",
		//用户需要确认的scope授权项，可选，默认all
		scope : "all",
		//按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
		size : "B_M"
	}, function(reqData, opts) {//登录成功
		QC.Login.getMe(function(openId, accessToken) {
			$.ajax({
				type : "post",
				data : {
					"user.openId" : openId,
					"user.realname" : reqData.nickname,
					"user.path" : reqData.figureurl,
					"user.sex" : reqData.gender,
					"user.username" : "",
				},
				url : "/slowplay/main/main/user_loadByQQ.action",
				success : function(data) {
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