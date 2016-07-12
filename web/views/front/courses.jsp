<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html class="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">

<title>全部课程 </title>
<style type="text/css">
	#tt::-ms-clear{
    	display:none;
	}
</style>
<link href="<%=basePath%>resources/front/assets/v2/bootstrap/bootstrap.css" rel="stylesheet" />
<link rel="<%=basePath%>resources/front/stylesheet" media="screen" href="assets/css/common.css" />
<link rel="stylesheet" media="screen"
	href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" media="screen" href="<%=basePath%>resources/front/assets/v2/css/es-icon.css" />
<link rel="stylesheet" media="screen" href="<%=basePath%>resources/front/assets/v2/css/main.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/front/assets/css/howzhi.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/front/assets/css/hz-font/iconfont.css">
<link href="<%=basePath%>resources/front/assets/css/hover.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>resources/front/assets/js/static/css/ui2.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="<%=basePath%>resources/front/assets/css/index_2.css">
<link rel="stylesheet" href="<%=basePath%>resources/front/assets/css/keTang.css">
<link rel="stylesheet" href="<%=basePath%>resources/front/assets/css/jquery.bigautocomplete.css" type="text/css" />
<script src="<%=basePath%>resources/front/assets/js/jquery-2.0.3.min.js"></script>	
<script type="text/javascript" src="<%=basePath%>resources/front/assets/js/jquery.bigautocomplete.js"></script>
</head>
<body class="index">
	<input type="hidden" id="personId" value="${person.id}">
	<header class="header">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>resources/front/main.jsp"> <img class="img-responsive"
					alt="。。" src="<%=basePath%>resources/front/assets/img/logo.png">
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
					<li id="class_menu" class="nav-hover"><a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=0">分类<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<c:forEach items="${firstSortList}" var="firstSort">
							<li><a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=${firstSort.id}">${firstSort.name}</a></li>
							</c:forEach>
						</ul>
					</li>
					<li><a href="#">最新 </a></li>

				</ul>
				<form class="navbar-form navbar-left" action="/slowplay/main/main/course_queryCourseLikeName.action" method="post">
					<div class="form-group">
						<input id="tt" type="text" name="course.coursename" class="form-control js-search text" placeholder="搜课程">
						<script type="text/javascript">
							$("#tt").bigAutocomplete({
								width:320,
								url:"/slowplay/main/main/course_loadLikeTitle.action",
								callback:function(data){
									//alert();
								}
							});
						</script>	
						<button class="button" style="font-size: 10px;" type="submit">查询</button>
					</div>
				</form>
			</nav>
			<ul class="nav user-nav pull-right">
				<li class="guide-log-box"><a class="hz-guide-logo "
					href="#"> <img class="mian-log" style="width: 100px;" src="<%=basePath%>resources/front/assets/img/welcome_header.jpg"> <img
						class="animated left-and-right" alt=".."
						src="<%=basePath%>resources/front/assets/img/guide-updown.png">
				</a></li>
				<ul id="login_header" class="nav nav-login" style="margin-right: -90px;">
					<c:if test="${person==null}">
						<li id="login_li"><a style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;" href="javascript:showLogin('#login-modal_2')">登录</a></li>
						<li id="register_li"><a style="color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;" href="javascript:showLogin('#signup-modal_2')">注册</a></li>
					</c:if>
					<c:if test="${person!=null}">
						<li id="login_li" style="margin-top: 38px;">
							<a style="display: inline;margin: 0px;padding: 0px;" href="<%=basePath%>resources/front/person_main.jsp">【 ${person.realname}】</a>，您好
							<a style="display: inline;" href="javascript:loginExit()">注销</a>
						</li>
						
					</c:if>
				</ul>
			</ul>
		</div>
	</header>
	<div class="container" id="content-container">
		<h1 class="hidden-clip">slowplay-重拾学习乐趣</h1>
			<div class="mod-breadcrumbs mod-list-breadcrumbs js-breadcrumbs"
				style="padding-top:4px;">
				<a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=0" class="mod-breadcrumbs__nav">
					全部课程 
				</a>
				<span class="mod-breadcrumbs__arrow">&nbsp;&gt;&nbsp;</span>
				<div class="breadcrumbs-nab disable-dropdown">
					<a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=${sort.id}" class="mod-breadcrumbs__nav">
						${sort.name}
					</a> 
				</div>
				<c:if test="${sort.name!=null}">
					<span class="mod-breadcrumbs__arrow">&nbsp;&gt;&nbsp;</span>
				</c:if>
				<c:if test="${sort.chirdList!=null}">
				<c:forEach items="${sort.chirdList}" var="chd1" end="0">
					<div class="breadcrumbs-nab disable-dropdown">
						<a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=${chd1.id}" class="mod-breadcrumbs__nav">
							${chd1.name}
						</a> 
					</div>
					<span class="mod-breadcrumbs__arrow">&nbsp;&gt;&nbsp;</span> <span
					class="mod-breadcrumbs__current"></span>
					<c:forEach items="${chd1.chirdList}" var="chd2" end="0">
					<div class="breadcrumbs-nab disable-dropdown">
						<a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=${chd2.id}"  class="mod-breadcrumbs__nav">
							${chd2.name}
						</a>
						<c:set var="course_all" value="${chd2.id}"/>
					</div>
					<span class="mod-breadcrumbs__arrow">&nbsp;&gt;&nbsp;</span> <span
					class="mod-breadcrumbs__current"></span>
					</c:forEach>
				</c:forEach>
				</c:if>
			</div>
			
			<div class="sort-menu-con" id="auto-test-1">
				<div class="sort-menu-border1">
					<dl class="sort-menu sort-menu1 clearfix">
						<div style="height: 15px;"></div>
						<dt style="font-size: 16px;color: #666">分类 :</dt>
						<dd class="dd-all ">
							<c:forEach items="${chdSort}" var="chdCourseType" end="0">
								<a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=${chdCourseType.pid}">全部</a>
								<c:set value="${chdCourseType.pid}" var="querySort"/>
							</c:forEach>
							<c:if test="${chdSort==null}">
								<a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=${course_all}">全部</a>
								<c:set value="${course_all}" var="querySort"/>
							</c:if>
						</dd>
						<c:forEach items="${chdSort}" var="chdCourseType">
							<dd class="">
								<a href="<%=basePath%>resources/front/main/sort_initSortTitle.action?sort.id=${chdCourseType.id}">
									${chdCourseType.name}
								</a>
							</dd>
						</c:forEach> 	 	
					</dl>
				</div>
				<div class="sort-menu-border2">
					<div class="label-row js-label-row js-sort-menu-category">
						<dl class="sort-menu sort-menu2 js-sort-menu clearfix">
							<dt style="font-size: 16px;color: #666">标签 :</dt>
							<c:forEach items="${tagList}" var="tags">
							<dd>
								<a href="<%=basePath%>resources/front/main/sort_queryByTag.action?sort.id=${querySort}&tag.id=${tags.id}">
									<span class="js-label">${tags.name}</span>
									<i class="flags-close js-close"></i>
								</a>
							</dd>
							</c:forEach>
						</dl>
					</div>
				</div>
				
				<c:if test="${queryTagList!=null}">
				<div style="margin-top: -20px;" class="label-row js-label-row js-sort-menu-category">
		          <dl class="sort-menu sort-menu2 js-sort-menu clearfix">
		           <div style="height: 15px;"></div>
		            <dt>筛选条件:</dt>
		            <c:forEach items="${queryTagList}" var="qTagsList">
		            <dd>
		            	<a class="flags-item-unselected-js-tag" href="<%=basePath%>resources/front/main/sort_afterRemoveTags.action?sort.id=${querySort}&tag.id=${qTagsList.id}">
			            	<span class="js-label">${qTagsList.name}</span>
							<i class="flags-close-js-close">X</i>
						</a>
					</dd>
					</c:forEach>
		          </dl>
		        </div>
		        </c:if>
			</div>
			<div class="sort-nav sort-nav-sml clearfix">
				<dl class="sort-nav-order sort-nav-order-my">
					<dd id="auto-test-2">
						<a href="javascript:;" class="cur">课程显示</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${likeName!=null}">
							${likeType} 检索 &nbsp;&nbsp; [ " ${likeName} " ] 
						</c:if>
					</dd>
				</dl>
			</div>

		<section class="flat">
			<h2>
				推荐课程
				<div class="filter pull-right">
					<a id="tuijianbutt_" href="javascript:showTuiJian();">推荐</a>
					<span>|</span> <a id="hotbutt_" href="javascript:showHot();">最热</a> 
					<span>|</span> <a id="newbutt_" href="javascript:showNew();">最新</a>
				</div>
			</h2>
			<div class="section-body course nopad">
				<div id="tuijian_" class="row" style="display: none;">
					<c:forEach items="${courseList}" var="course">
					<div class="col-md-3 col-sm-6 ">
						<div class="course-item">
							<div class="course-img">
								<img src="${course.picpath}" style="width:300px;height:150px;" />
								<a href="<%=basePath%>resources/front/main/course_queryVideo.action?course.id=${course.id}">
									<div class="mask">
										<span class="btn btn-primary">开始学习</span>
									</div>
								</a>
							</div>
							<div class="course-info">
								<div class="title">
									<span class="label label-p">${course.sort.name}</span> <a class="transition"
										href="#">${course.coursename}</a>
								</div>
								<div class="metas">
									<span>${course.loadCount}次浏览</span>/ <span>${course.haveStudent}学员</span>
								</div>
								<div class="teacher text-o-show">
									<a class=" js-user-card"> <img class="avatar-ss " 
										src="http://f1.howzhi.com/default/2015/07-14/145733d2af26635228.jpg">
									</a> <a class="link-light " href="#">${course.author}</a> 
									<span class="daren-icon-t"></span>
									<div class="price free pull-right">
										<span><a href="javascript:addCollect(${course.id})">加入收藏</a></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				
				<div id="hot_" class="row" style="display: none;">
					<c:forEach items="${hotList}" var="hotcourse">
					<div class="col-md-3 col-sm-6 ">
						<div class="course-item">
							<div class="course-img">
								<img src="${hotcourse.picpath}" style="width:300px;height:150px;" />
								<a href="<%=basePath%>resources/front/main/course_queryVideo.action?course.id=${hotcourse.id}">
									<div class="mask">
										<span class="btn btn-primary">开始学习</span>
									</div>
								</a>
							</div>
							<div class="course-info">
								<div class="title">
									<span class="label label-p">${hotcourse.sort.name}</span> <a class="transition"
										href="#">${hotcourse.coursename}</a>
								</div>
								<div class="metas">
									<span>${hotcourse.loadCount}次浏览</span>/ <span>2学员</span>
								</div>
								<div class="teacher text-o-show">
									<a class=" js-user-card"> <img class="avatar-ss " 
										src="http://f1.howzhi.com/default/2015/07-14/145733d2af26635228.jpg">
									</a> <a class="link-light " href="#">${hotcourse.author}</a> 
									<span class="daren-icon-t"></span>
									<div class="price free pull-right">
										<span><a href="javascript:addCollect(${course.id})">加入收藏</a></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				
				<div id="newCourse_" class="row" style="display: none;">
					<c:forEach items="${newList}" var="newcourse">
					<div class="col-md-3 col-sm-6 ">
						<div class="course-item">
							<div class="course-img">
								<img src="${newcourse.picpath}" style="width:300px;height:150px;" />
								<a href="<%=basePath%>resources/front/main/course_queryVideo.action?course.id=${newcourse.id}">
									<div class="mask">
										<span class="btn btn-primary">开始学习</span>
									</div>
								</a>
							</div>
							<div class="course-info">
								<div class="title">
									<span class="label label-p">${newcourse.sort.name}</span> <a class="transition"
										href="#">${newcourse.coursename}</a>
								</div>
								<div class="metas">
									<span>${newcourse.loadCount}次浏览</span>/ <span>2学员</span>
								</div>
								<div class="teacher text-o-show">
									<a class=" js-user-card"> <img class="avatar-ss " 
										src="http://f1.howzhi.com/default/2015/07-14/145733d2af26635228.jpg">
									</a> <a class="link-light " href="#">${newcourse.author}</a> 
									<span class="daren-icon-t"></span>
									<div class="price free pull-right">
										<span><a href="javascript:addCollect(${course.id})">加入收藏</a></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<ul class="pagination ">
				<li class="active"><a href="javascript:;">1</a></li>
				<li><a href="javascript:;">尾页</a></li>
			</ul>

		</section>


	</div>

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
					关注我们： <a href="#"><i
						class="hz-icon icon-weibo" style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px -30px; background-repeat:repeat-y'></i></a> <a class="icon-sns"><i
						class="hz-icon icon-weixin" style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px -59px; background-repeat:repeat-y'></i>
						<div class="sns-popover" style='background:url("<%=basePath%>resources/front/assets/img/slowPlay-weixin.jpg")'>
						</div> </a> <a href="#"><i
						class="hz-icon icon-qq" style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px 49px; background-repeat:repeat-y'></i></a> <a
						href="#"><i
						class="hz-icon icon-gongnengyedouban" style='background-image:url("<%=basePath%>resources/front/assets/img/social-share-icons.png");background-position:5px 0px; background-repeat:repeat-y'></i></a>
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
			<span style="margin-left: 35%">Powered by <a href="#" target="_blank">XuTeng
				v6.6.11</a> ©2014-2015 <a class="mlm" href="#"
				target="_blank">slowplay</a>
			</span>

		</div>
	</div>
	<section class="serch-enginne-course visible-lg" 　role="alert">
	</section>
	<div class="modal " id="login-modal" data-url="/login/ajax"></div>
	<div class="modal" id="modal"></div>
	<div tabindex="-1" class="modal fade ckeditor-images"
		id="hz-imges-upload" data-url="/ckeditor/images/upload"></div>
	<ul class="fixed-bar">
		<li class="hz-app"><a class="active btn btn-primary"
			href="h#"
			target="_blank"> APP </a></li>
		<li class="hz-weixin"><a class="fixed-bar-icon"
			href="javascript:;"> <i class="hz-icon icon-erweima " style='background:url("<%=basePath%>resources/front/assets/img/right_weixin.jpg")'></i>
		</a>
			<div class="weixin" style="">
				<p class="text-center mvs t-primary hidden-xs hidden-sm">扫一扫
					关注SlowPlay</p>
				<img class="img-responsive" alt="..."
					src="<%=basePath%>resources/front/assets/img/slowPlay-weixin.jpg">
			</div></li>
		<li class="hz-feedback"><a class="fixed-bar-icon"
			href="#"> <i class="hz-icon icon-question " style='background:url("<%=basePath%>resources/front/assets/img/right_wenhao.jpg")'></i>
		</a> <a class="js-feedback fixed-bar-text"
			href="#"
			target="_blank"> 问题反馈 </a></li>
		<li class="go-top" style="display: block;">
			<a class="fixed-bar-icon" href="javascript:;"> 
				<i class="hz-icon icon-keyboardarrowup" style='background:url("<%=basePath%>resources/front/assets/img/right_top.jpg")'></i>
			</a> 
			<a class="fixed-bar-text" href="javascript:pageScroll();"> 回到顶部 </a>
		</li>
	</ul>
	<div class="coverbox" id="cover"></div>
	<!-- 登录注册隐藏域 -->
	<div class="modal" id="login-modal_2" style="width:380px;height:340px">
		<a class="close" href="javascript:closeLogin('#login-modal_2')">×</a>
		<h1>登录</h1>
		<form class="login-form" >
			<!-- <div class="form-arrow"></div> -->
			<input id="username" name="user.username" type="text" placeholder="用户名：" > 
			<input id="password" name="user.password" type="password" placeholder="密码：" > 
			<div>
				验证码：<input id="verifyCode" name="verifyCode" type="text" onchange="codeVerify()" style="width: 100px;display: inline;"/>       
		        <img id="imgObj"  alt="" src="xuan/verifyCode"/>       
		        <a href="javascript:changeVerify('#imgObj')">换一张</a><br/>
		        <span id="codeError"> </span> 
        	</div>
        	<br/><span id="qqLoginBtn"></span><br />
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
			<input name="user.username" type="text" placeholder="用户名：" id="username1" onfocus="hightLight('username1');" onblur="restore('username1');checkName()"><span id="nameError"></span>
			<input name="user.password" type="password" placeholder="密码：" id="password1" onfocus="hightLight('password1');" onblur="restore('password1');checkPsd()"><span id="psdError"></span>
			<input name="repassword" type="password" placeholder="确认密码：" id="repsd" onfocus="hightLight('repsd');" onblur="restore('repsd');checkRepsd()"><span id="repsdError"></span>
			<input type="text" id="realname" name="user.realname" placeholder="真实姓名：" />
			性别：<input type="radio" name="user.sex" value="男" checked="checked" style="display: inline;width: 30px"> 男 
			<input type="radio" name="user.sex" value="女" style="display: inline;width:30px"/>女<br>
			输入你的生日：<input name="user.birthday" id="birthday" type="date" placeholder="你的生日" style="display: inline;width: 200px"/><br/>
			手机号码：<input id="user_phone" type="text" placeholder="你的手机号码" style="display: inline;width: 120px"/>
			<input id="phone_verify_butt" style="display: inline;width: 100px;background-color: rgba(16, 182, 124, 1)" type="button" value="发送短信验证码"/><br/>
			短信验证码：<input id="phone_verify" type="text" style="display: inline;width: 80px" onchange="checkPhoneVerify()">
			<span id="phoneverify_msg" style="display: inline;width: 80px" ></span>
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
	 data-appid="101275090" data-redirecturi="http://qq363491275.imwork.net/slowplay/main/person_main.jsp" charset="utf-8"></script>
	<script type="text/javascript">
	   //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
	  QC.Login({
	       //btnId：插入按钮的节点id，必选
	       btnId:"qqLoginBtn",    
	       //用户需要确认的scope授权项，可选，默认all
	       scope:"all",
	       //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
	       size: "B_M"
	   });
	</script>
</body>
</html>