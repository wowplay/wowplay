<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">

<title>slowplay播放页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
			<link rel="stylesheet" type="text/css" href="styles.css">
			-->
<link
	href="${pageContext.request.contextPath}/main/assets/v2/bootstrap/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/main/assets/css/common.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/main/assets/css/font-awesome.min.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/main/assets/v2/css/es-icon.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/main/assets/v2/css/main.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/main/assets/css/howzhi.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/main/assets/css/hz-font/iconfont.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/main/assets/css/hover.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/main/assets/js/static/css/ui2.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/main/assets/js/myfocus-2.0.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/main/assets/js/setHomeSetFav.js"></script>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
	<div id="login_header_div" class="learn-dashboard-header breadcrumb ">
		<a
			href="${pageContext.request.contextPath}/main/main/sort_initSortTitle.action?sort.id=${firstSort.id}">
			全部 </a>
		<c:if test="${fn:length(videoList)==0}">
			<span class="phm"> > </span>暂无视频
		</c:if>
		<c:forEach items="${videoList}" var="videoone" begin="${playId}"
			end="${playId}">
			<span class="phm"> > </span>L${playId+1}&nbsp;&nbsp;  ${videoone.videoname} 
		</c:forEach>
		<div id="login_header" class="nav nav-login"
			style="margin-right: 60px;">
			<c:if test="${person==null}">
				<li id="login_lii"><a
					style="color:yellow; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:0px;"
					href="javascript:showLogin('#login-modal_2')">登录</a></li>
				<li id="register_li"><a
					style="color:yellow; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:0px;"
					href="javascript:showRegister('#signup-modal_2')">注册</a></li>
			</c:if>
			<c:if test="${person!=null}">
				<a style="display: inline;margin: 0px;padding: 0px;color:yellow;"
					href="${pageContext.request.contextPath}/main/person_main.jsp">【 ${person.realname}】</a>，您好
				<a style="display: inline;color:yellow;margin-left: 20px;"
					href="javascript:loginExit2()">注销</a>
			</c:if>
		</div>
	</div>
	<div class="learn-dashboard" id="lesson-dashboard">
		<div id="video_play_box" class="dashboard-content">
			<div class="dashboard-body">
				<c:if test="${fn:length(videoList)==0}">
					<div id="learn-loading" class="learn-load text-center">对不起，该课程暂时没有视频...</div>
				</c:if>
				<c:forEach items="${videoList}" var="videoone" begin="${playId}"
					end="${playId}">
					<video id="example_video_1" style="margin-left:15px;" width="1010px"
						height="580px" controls="controls"> <source id="videoPath"
						src="${videoone.path}" type='video/mp4' /> 
					</video>
				</c:forEach>
			</div>
		</div>
		<div id="right_content_box"  class="dashboard-toolbar pull-right">
			<ul id="right_content_ul" class="options clearfix">
				<li class="active"><a data-toggle="tab" href="#toolbar-1"><i
						class="fa fa-book"></i><span>课时</span></a></li>
				<li data-position="left" class="mid" onclick="showBiji()"><a data-toggle="tab"
					href="#toolbar-2"><i class="fa fa-pencil-square-o"></i><span>笔记</span></a>
				</li>
				<li onclick="showQuestion()" data-position="left"><a data-toggle="tab" href="#toolbar-3"><i
						class="fa fa-comments-o"></i><span>问答</span></a></li>
			</ul>
			<div id="right_content_div" class="tab-content">
				<div id="toolbar-1" class="tab-pane active">
					<div class="course-column column-before">
						<ul>
							<c:set value="0" var="number" />
							<c:if test="${fn:length(videoList)==0}">
								<li>
									<h2 style="text-align: center;">暂无视频</h2>
								</li>
							</c:if>
							<c:forEach items="${videoList}" var="video">
								<c:if test="${number==playId}">
									<li class="learn-ing"><span class="c-grade">L${number+1}</span>
										<h4>
											<a class="c-title active" title="${video.videoname}"
												href="${pageContext.request.contextPath}/main/main/video_play.action?playId=${number}&video.id=${video.id}&video.course.id=${course.id}">${video.videoname}</a>
										</h4></li>
								</c:if>
								<c:if test="${number!=playId}">
									<li><span class="c-grade">L${number+1}</span>
										<h4>
											<a class="c-title active" title="${video.videoname}"
												href="${pageContext.request.contextPath}/main/main/video_play.action?playId=${number}&video.id=${video.id}&video.course.id=${course.id}">${video.videoname}</a>
										</h4></li>
								</c:if>
								<c:set value="${number+1}" var="number" />
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="toolbar-2" class="tab-pane tab-notes">
					<div class="course-notes course-in">
						<ul class="notes-header clearfix options">
							<li class="active"><a href="#tab-notes-1" data-toggle="tab">我的笔记</a></li>
							<li><a href="#tab-notes-2" data-toggle="tab" onclick="showFriendNote()">同学笔记</a></li>
						</ul>
						<div class="tab-content">
						
							<div class="tab-pane active" id="tab-notes-1">
								<div class="form-group">
									<label class="control-label hidden" for="note_content">笔记</label>
									<div class="controls" >
									<div id="biji_input_div" contenteditable="true" style="height: 240px;width: 270px;
									overflow-x:hidden;border: 1px solid green"></div>
									</div>
								</div>
								<div class="btns clearfix">
								<a href="javascript:showFuhao('#fuhao_1');" class="mlm emotion-expand-btn"
									style="font-weight:normal;font-size:12px;">^_^插入表情</a>
									<label><input id="shareNote" style="margin-left:10px;" type="checkbox" value="yes" name="noteStatus">
										分享笔记</label>
									<button class="btn submit pull-right" onclick="saveNote()">保存</button>
								</div>
								<div id="fuhao_1" class="emotions mvm" style="display: none;">
									<a><img src="${pageContext.request.contextPath}/main/img_gif/1.gif"
										alt="微笑" title="微笑" style="cursor: pointer;"></a>
										<a><img src="${pageContext.request.contextPath}/main/img_gif/2.gif"
										alt="哈哈大笑" title="哈哈大笑" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/3.gif"
										alt="调皮" title="调皮" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/5.gif"
										alt="惊讶" title="惊讶" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/6.gif"
										alt="惊恐" title="惊恐" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/7.gif"
										alt="撇嘴" title="撇嘴" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/8.gif"
										alt="困" title="困" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/9.gif"
										alt="难过" title="难过" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/10.gif"
										alt="委屈" title="委屈" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/11.gif"
										alt="生气" title="生气" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/12.gif"
										alt="流泪" title="流泪" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/16.gif"
										alt="酷" title="酷" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/18.gif"
										alt="抓狂" title="抓狂" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/19.gif"
										alt="吐" title="吐" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/20.gif"
										alt="偷笑" title="偷笑" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/21.gif"
										alt="可爱" title="可爱" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/22.gif"
										alt="白眼" title="白眼" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/24.gif"
										alt="饥饿" title="饥饿" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/27.gif"
										alt="流汗" title="流汗" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/28.gif"
										alt="憨笑" title="憨笑" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/30.gif"
										alt="奋斗" title="奋斗" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/31.gif"
										alt="咒骂" title="咒骂" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/32.gif"
										alt="疑问" title="疑问" style="cursor: pointer;"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/33.gif"
										alt="嘘" title="嘘" style="cursor: pointer;" data-code="[[嘘]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/34.gif"
										alt="晕" title="晕" style="cursor: pointer;" data-code="[[晕]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/35.gif"
										alt="抓狂" title="抓狂" style="cursor: pointer;" data-code="[[抓狂]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/38.gif"
										alt="敲头" title="敲头" style="cursor: pointer;" data-code="[[敲头]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/49.gif"
										alt="拥抱" title="拥抱" style="cursor: pointer;" data-code="[[拥抱]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/76.gif"
										alt="强" title="强" style="cursor: pointer;" data-code="[[强]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/77.gif"
										alt="弱" title="弱" style="cursor: pointer;" data-code="[[弱]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/78.gif"
										alt="握手" title="握手" style="cursor: pointer;" data-code="[[握手]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/96.gif"
										alt="冷汗" title="冷汗" style="cursor: pointer;" data-code="[[冷汗]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/97.gif"
										alt="擦汗" title="擦汗" style="cursor: pointer;" data-code="[[擦汗]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/98.gif"
										alt="抠鼻" title="抠鼻" style="cursor: pointer;" data-code="[[抠鼻]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/99.gif"
										alt="鼓掌" title="鼓掌" style="cursor: pointer;" data-code="[[鼓掌]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/100.gif"
										alt="糗大了" title="糗大了" style="cursor: pointer;"
										data-code="[[糗大了]]"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/101.gif"
										alt="坏笑" title="坏笑" style="cursor: pointer;" data-code="[[坏笑]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/104.gif"
										alt="哈欠" title="哈欠" style="cursor: pointer;" data-code="[[哈欠]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/105.gif"
										alt="鄙视" title="鄙视" style="cursor: pointer;" data-code="[[鄙视]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/107.gif"
										alt="快哭了" title="快哭了" style="cursor: pointer;"
										data-code="[[快哭了]]"></a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/108.gif"
										alt="阴险" title="阴险" style="cursor: pointer;" data-code="[[阴险]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/109.gif"
										alt="亲亲" title="亲亲" style="cursor: pointer;" data-code="[[亲亲]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/110.gif"
										alt="吓" title="吓" style="cursor: pointer;" data-code="[[吓]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/111.gif"
										alt="可怜" title="可怜" style="cursor: pointer;" data-code="[[可怜]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/118.gif"
										alt="抱拳" title="抱拳" style="cursor: pointer;" data-code="[[抱拳]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/124.gif"
										alt="OK" title="OK" style="cursor: pointer;" data-code="[[OK]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/202.gif"
										alt="色" title="色" style="cursor: pointer;" data-code="[[色]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/203.gif"
										alt="发呆" title="发呆" style="cursor: pointer;" data-code="[[发呆]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/204.gif"
										alt="得意" title="得意" style="cursor: pointer;" data-code="[[得意]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/206.gif"
										alt="害羞" title="害羞" style="cursor: pointer;" data-code="[[害羞]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/207.gif"
										alt="闭嘴" title="闭嘴" style="cursor: pointer;" data-code="[[闭嘴]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/208.gif"
										alt="睡觉" title="睡觉" style="cursor: pointer;" data-code="[[睡觉]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/209.gif"
										alt="大哭" title="大哭" style="cursor: pointer;" data-code="[[大哭]]">
									</a> <a><img
										src="${pageContext.request.contextPath}/main/img_gif/210.gif"
										alt="尴尬" title="尴尬" style="cursor: pointer;" data-code="[[尴尬]]">
									</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/4.gif"
										alt="抛媚眼" title="抛媚眼" style="cursor: pointer;"
										data-code="[[抛媚眼]]"></a>
								</div>
								<div class="hz-login-editor"></div>
							</div>


							<div class="tab-pane" id="tab-notes-2">
								<ul id="friendNotes_ul" class="notes-list ">
									
								</ul>

							</div>
						</div>
					</div>

				</div>
				<div id="toolbar-3" class="tab-pane tab-question">
					<div class="form  hz-unlogin-editor ">
						<div class="form-group">
							<input type="hidden" id="videoID">
							<div class="controls">
								<textarea id="question_title"
									class="form-control question_title" placeholder="问题标题" ></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="controls">
								<textarea id="question_content" 
									class="form-control question_content" placeholder="详细描述（非必填）" ></textarea>
							</div>
						</div>
						<div class="btns clearfix">
							<button class="btn submit pull-right" id="lesson_qustion_form_btn">提交</button>
						</div>
					</div>
					<div >
						<ul id="questionList">
							
						</ul>
					</div>
				</div>
			</div>
			<div class="back">
				<i id="back_right" class="fa fa-angle-double-right" style="color: #999" onclick="gotoRight()"> 隐藏</i>
				<i id="back_left" class="fa fa-angle-double-left" style="color: #999" onclick="gotoLeft()">展开</i>
			</div>
		</div>
		
		<div class="learn-dashboard-foot">
			<span  style="float: left;margin-left: 480px;margin-top: 20px;">
				<a version="1.0" class="qzOpenerDiv" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_likeurl" target="_blank">赞</a>
			</span>
			<span  style="float: left;margin-left: 0px;margin-top: 20px;">
				<wb:share-button appkey="2415722819" addition="text" type="button" ralateUid="3298218305" default_text="。。。" pic="http%3A%2F%2Fqq363491275.imwork.net%2Fslowplay%2Fmain%2Fassets%2Fimg%2Favatar.png"></wb:share-button>
			</span>
			
			<c:forEach items="${videoList}" var="videoone" begin="${playId+1}"
				end="${playId+1}">
				<div class="right">
					<a class="btn btn-primary mrs" id="learned"> <i
						class="glyphicon glyphicon-unchecked mrs"></i>学过了
					</a> <a href="${pageContext.request.contextPath}/main/main/video_play.action?playId=${playId+1}&video.id=${videoone.id}&video.course.id=${course.id}"
						  class="course-title t-gray"> 下一课: ${videoone.videoname} </a>
					
				</div>
			</c:forEach>
			<c:if test="${fn:length(videoList)==(playId+1)}">
				<div style="margin-left: 50px;" class="right">
					<a class="btn btn-primary mrs" id="learned"> <i
						class="glyphicon glyphicon-unchecked mrs"></i>学过了
					</a> <a href="javascript:void(0);" class="course-title t-gray">
						没有下一集了~！ </a>
				</div>
			</c:if>
		</div>
	</div>



	<div class="container" id="content-container">

		<div class="row">
			<div class="col-md-9">
				<div class="person-comment course-in flat">
					<h2 class="nopadding">学员评论</h2>
					<div class="form-group">
						<label class="control-label hidden" for="comment">内容</label>
						<div class="controls">
							<input type="hidden" id="personId" value="${person.id}">
							<div id="comment_input_div" class="form-control question_title " contenteditable="true"
								style="height: 120px;width: 770px;overflow-x:hidden;"></div>
						</div>
					</div>

					<input type="hidden" name="targetType" value="lesson" /> <input
						type="hidden" name="targetId" value="32606" /> <input
						type="hidden" name="_csrf_token"
						value="30cad287546393080528866d82c9c3c6a22d7382" />

					<div class="clearfix">
						<input type="hidden" value="comment">
						<c:forEach items="${videoList}" var="videoone" begin="${playId}"
							end="${playId}">
							<input type="hidden" id="hiddenVideoId" value="${videoone.id}">
						</c:forEach> <a
							href="javascript:showFuhao('#fuhao');" class="mlm emotion-expand-btn"
							style="font-weight:normal;font-size:12px;">^_^插入表情</a>
						<div id="fuhao" class="emotions mvm" style="display: none;">
							<a><img src="${pageContext.request.contextPath}/main/img_gif/1.gif"
								alt="微笑" title="微笑" style="cursor: pointer;"></a>
								<a><img src="${pageContext.request.contextPath}/main/img_gif/2.gif"
								alt="哈哈大笑" title="哈哈大笑" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/3.gif"
								alt="调皮" title="调皮" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/5.gif"
								alt="惊讶" title="惊讶" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/6.gif"
								alt="惊恐" title="惊恐" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/7.gif"
								alt="撇嘴" title="撇嘴" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/8.gif"
								alt="困" title="困" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/9.gif"
								alt="难过" title="难过" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/10.gif"
								alt="委屈" title="委屈" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/11.gif"
								alt="生气" title="生气" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/12.gif"
								alt="流泪" title="流泪" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/16.gif"
								alt="酷" title="酷" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/18.gif"
								alt="抓狂" title="抓狂" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/19.gif"
								alt="吐" title="吐" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/20.gif"
								alt="偷笑" title="偷笑" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/21.gif"
								alt="可爱" title="可爱" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/22.gif"
								alt="白眼" title="白眼" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/24.gif"
								alt="饥饿" title="饥饿" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/27.gif"
								alt="流汗" title="流汗" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/28.gif"
								alt="憨笑" title="憨笑" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/30.gif"
								alt="奋斗" title="奋斗" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/31.gif"
								alt="咒骂" title="咒骂" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/32.gif"
								alt="疑问" title="疑问" style="cursor: pointer;"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/33.gif"
								alt="嘘" title="嘘" style="cursor: pointer;" data-code="[[嘘]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/34.gif"
								alt="晕" title="晕" style="cursor: pointer;" data-code="[[晕]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/35.gif"
								alt="抓狂" title="抓狂" style="cursor: pointer;" data-code="[[抓狂]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/38.gif"
								alt="敲头" title="敲头" style="cursor: pointer;" data-code="[[敲头]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/49.gif"
								alt="拥抱" title="拥抱" style="cursor: pointer;" data-code="[[拥抱]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/76.gif"
								alt="强" title="强" style="cursor: pointer;" data-code="[[强]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/77.gif"
								alt="弱" title="弱" style="cursor: pointer;" data-code="[[弱]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/78.gif"
								alt="握手" title="握手" style="cursor: pointer;" data-code="[[握手]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/96.gif"
								alt="冷汗" title="冷汗" style="cursor: pointer;" data-code="[[冷汗]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/97.gif"
								alt="擦汗" title="擦汗" style="cursor: pointer;" data-code="[[擦汗]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/98.gif"
								alt="抠鼻" title="抠鼻" style="cursor: pointer;" data-code="[[抠鼻]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/99.gif"
								alt="鼓掌" title="鼓掌" style="cursor: pointer;" data-code="[[鼓掌]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/100.gif"
								alt="糗大了" title="糗大了" style="cursor: pointer;"
								data-code="[[糗大了]]"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/101.gif"
								alt="坏笑" title="坏笑" style="cursor: pointer;" data-code="[[坏笑]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/104.gif"
								alt="哈欠" title="哈欠" style="cursor: pointer;" data-code="[[哈欠]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/105.gif"
								alt="鄙视" title="鄙视" style="cursor: pointer;" data-code="[[鄙视]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/107.gif"
								alt="快哭了" title="快哭了" style="cursor: pointer;"
								data-code="[[快哭了]]"></a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/108.gif"
								alt="阴险" title="阴险" style="cursor: pointer;" data-code="[[阴险]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/109.gif"
								alt="亲亲" title="亲亲" style="cursor: pointer;" data-code="[[亲亲]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/110.gif"
								alt="吓" title="吓" style="cursor: pointer;" data-code="[[吓]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/111.gif"
								alt="可怜" title="可怜" style="cursor: pointer;" data-code="[[可怜]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/118.gif"
								alt="抱拳" title="抱拳" style="cursor: pointer;" data-code="[[抱拳]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/124.gif"
								alt="OK" title="OK" style="cursor: pointer;" data-code="[[OK]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/202.gif"
								alt="色" title="色" style="cursor: pointer;" data-code="[[色]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/203.gif"
								alt="发呆" title="发呆" style="cursor: pointer;" data-code="[[发呆]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/204.gif"
								alt="得意" title="得意" style="cursor: pointer;" data-code="[[得意]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/206.gif"
								alt="害羞" title="害羞" style="cursor: pointer;" data-code="[[害羞]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/207.gif"
								alt="闭嘴" title="闭嘴" style="cursor: pointer;" data-code="[[闭嘴]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/208.gif"
								alt="睡觉" title="睡觉" style="cursor: pointer;" data-code="[[睡觉]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/209.gif"
								alt="大哭" title="大哭" style="cursor: pointer;" data-code="[[大哭]]">
							</a> <a><img
								src="${pageContext.request.contextPath}/main/img_gif/210.gif"
								alt="尴尬" title="尴尬" style="cursor: pointer;" data-code="[[尴尬]]">
							</a> <a><img src="${pageContext.request.contextPath}/main/img_gif/4.gif"
								alt="抛媚眼" title="抛媚眼" style="cursor: pointer;"
								data-code="[[抛媚眼]]"></a>
						</div>
						<c:forEach items="${videoList}" var="videoone" begin="${playId}"
							end="${playId}">
							<c:if test="${videoone.commstate=='yes'}">
								<button class="btn btn-primary pull-right" id="comment-btn" type="button">发布</button>
							</c:if>
							<c:if test="${videoone.commstate=='no'}">
								<button class="btn pull-right" type="button" onclick="javascript:;">该视频现在不允许评论</button>
							</c:if>
						</c:forEach>
					</div>
					<div class="hz-login-editor"></div>
					<ul class=" comment-item-list" id="commentList">
						<c:forEach items="${commentList}" var="comments">
							<li id="item73929">
								<div class="userimg">
									<a class=" js-user-card" href="/slowplay/main/main/user_visitFriend.action?user.id=${comments.user.id}">
										<img class="img-responsive" src="${comments.user.path}">
									</a>
								</div>
								<div class="userInfo">
									<p class="head">
										<a href="/slowplay/main/main/user_visitFriend.action?user.id=${comments.user.id}">${comments.user.realname}</a><span>${comments.time}</span>
									</p>
									<div class="body">${comments.content}</div>
									<div class="pull-right  ">
										<c:if test="${comments.chdComment!=null}">
											<a class="con" href="javascript:showLZL('#lzl_${comments.id}');">收缩/展开(${fn:length(comments.chdComment)})</a>
										</c:if>
										<a class="con" href="javascript:replySomeOne(${comments.id},'${comments.user.realname}');">回复</a>
									</div>
								</div>
								<c:if test="${comments!=null}">
									<div id="lzl_${comments.id}" style="background: rgb(230, 239, 204);margin-left: 70px;">
										<c:forEach items="${comments.chdComment}" var="chdComment">
											<div style="margin-left: 10px;">
												<div style="height: 5px;"></div>
												<img style="width: 30px;display: inline;border-radius:50%" class="img-responsive" src="${chdComment.user.path}">
												<a style="display: inline;" href="/slowplay/main/main/user_visitFriend.action?user.id=${chdComment.user.id}">${chdComment.user.realname}</a><span style="margin-left: 30px;">${chdComment.time}</span>
												<div style="margin-left: 40px;">${chdComment.content}</div>
												<div style="height: 5px;"></div>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</li>
						</c:forEach>
					</ul>
					<div id="pageContent" style="text-align: right;">
						<c:if test="${page.page!=1}">
						<span style="margin-left: 50px;">
							<a href="javascript:showCommentByPage(1)">首页</a>
						</span>
						</c:if>
						<c:if test="${page.page>1}">
						<span style="margin-left: 30px;">
							<a href="javascript:showCommentByPage(${page.page-1})">上一页</a>
						</span>
						</c:if>
						<c:if test="${page.page<page.allPage}">
						<span style="margin-left: 30px;">
							<a href="javascript:showCommentByPage(${page.page+1})">下一页</a>
						</span>
						</c:if>
						<c:if test="${page.page!=page.allPage}">
						<span style="margin-left: 30px;">
							<a href="javascript:showCommentByPage(${page.allPage})">尾页</a>
						</span>
						</c:if>
						<span style="margin-left: 50px;">第${page.page}页，共${page.allPage}页</span>
					</div>
					<input type="hidden" id="nowPage" value="${page.page}">
					<input type="hidden" id="allPage" value="${page.allPage}">
				</div>


				<div class="course flat nopad">
					<div class="section-header">
						<h2>你感兴趣的课程</h2>
					</div>
					<div class="section-body">
						<div class="row">
							<div class="col-md-4 col-sm-6 ">
								<div class="course-item">
									<div class="course-img">
										<img src="${pageContext.request.contextPath}/main/assets/img/lazyload_course.png" /> <a
											href="#">
											<div class="mask">
												<span class="btn btn-primary">开始学习</span>
											</div>
										</a>
									</div>
									<div class="course-info">
										<div class="title">
											<span class="label label-p">进阶技巧</span> <a class="transition"
												href="#">小九来点评</a>
										</div>
										<div class="metas">
											<span>1338浏览</span>
										</div>
										<div class="teacher text-o-show">
											<a class=" js-user-card" href="#" > 
												<img class="avatar-ss " src="${pageContext.request.contextPath}/main/assets/img/212720870038390860.jpg" >
											</a> <a class="link-light " href="#">一个小九</a> <span
												class="daren-icon-t" title="达人"></span>
											<div class="price free pull-right">
												<span>免费</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-6 ">
								<div class="course-item">
									<div class="course-img">
										<img src="${pageContext.request.contextPath}/main/assets/img/lazyload_course.png"/>
										<a href="#">
											<div class="mask">
												<span class="btn btn-primary">开始学习</span>
											</div>
										</a>
									</div>
									<div class="course-info">
										<div class="title">
											<span class="label label-p">进阶技巧</span> <a class="transition"
												href="#">2015大师之路摄影教程实战篇更新中~~</a>
										</div>
										<div class="metas">
											<span>341浏览</span>/
										</div>
										<div class="teacher text-o-show">
											<a class=" js-user-card" href="#" > 
											<img class="avatar-ss " src="${pageContext.request.contextPath}/main/assets/img/15060086cb7c057243.jpg" >
											</a> <a class="link-light " href="#">亮剑</a> <span
												class="daren-icon-t" title="达人"></span>
											<div class="price free pull-right">
												<span>免费</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-6  nobd">
								<div class="course-item">
									<div class="course-img">
										<span class="status">原创</span> 
										<img src="${pageContext.request.contextPath}/main/assets/img/lazyload_course.png" />
										<a href="#">
											<div class="mask">
												<span class="btn btn-primary">开始学习</span>
											</div>
										</a>
									</div>
									<div class="course-info">
										<div class="title">
											<span class="label label-p">进阶技巧</span> <a class="transition"
												href="#">小九摄影ECP（每周三更新）</a>
										</div>
										<div class="metas">
											<span>336浏览</span>/ <span>550学员</span>
										</div>
										<div class="teacher text-o-show">
											<a class=" js-user-card" href="#" > 
												<img class="avatar-ss " src="${pageContext.request.contextPath}/main/assets/img/212720870038390860.jpg" >
											</a> <a class="link-light " href="#">一个小九</a> <span
												class="daren-icon-t" title="达人"></span>
											<div class="price free pull-right">
												<span>免费</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<aside class="col-md-3 course-sidebar">
			<div class="flat sidebar-teach media">
				<h3>课程教师</h3>
				<div class="media-left">
					<a class=" js-user-card" href="javascript:;"> <img
						class=" avatar-sm "
						src="${pageContext.request.contextPath}/main/assets/img/145733d2af26635228.jpg">
					</a>

				</div>
				<div class="teach-info media-body">
					<br />
					<p class="text-o-show">
						<c:if test="${fn:length(videoList)==0}">
							<a class="link-light " href="javascript:;">无数据</a> 
						</c:if>
						<c:forEach items="${videoList}" var="videoone" begin="${playId}"
							end="${playId}">
							<a class="link-light " href="javascript:;">${authorName}</a>  
						</c:forEach>
						
						<span class="daren-icon-t"></span>
					</p>
				</div>
				<div class="info" style="margin-left: 50px;">Lofter:
					www.xtkj.com</div>
			</div>


			<div class="flat sidebar-learner ">
				<h3>
					已加入学员<span class="count">(${fn:length(userList)})</span>
				</h3>
				<ul class="clearfix">
					<c:forEach items="${userList}" var="user">
						<li><a class=" js-user-card" href="/slowplay/main/main/user_visitFriend.action?user.id=${user.id}"> 
							<img class="avatar-sm" src="${user.path}">
						</a> <a href="/slowplay/main/main/user_visitFriend.action?user.id=${user.id}" class="name">${user.realname}</a></li>
					</c:forEach>
				</ul>
			</div>
				<wb:follow-button uid="3298218305" type="gray_4" width="100%" height="64" ></wb:follow-button>
			</div>
			</aside>
			<div class="modal arale-dialog next-learn-dialog" tabindex="-1"
				style="display:none" id="lesson-learned-modal">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3>恭喜您完成了课时</h3>
					<span>离目标又进了一步</span>
				</div>
				<div class="modal-body row">
					<div class="col-md-6">
						<p class="text-left">学分等级</p>
						<div class="row score-ing">
							<div class="col-md-9">
								<div class="bg"></div>
								<div class="ing" id="pointProcess" style=""></div>
							</div>
							<div class="col-md-3 text-left">
								L<span id="currentLevel"></span>
							</div>
						</div>
						<p class="text-left">课程进度</p>
						<div class="row course-ing">
							<div class="col-md-9">
								<div class="bg"></div>
								<div class="ing" style="" id="learn_process"></div>
							</div>
							<div class="col-md-3 text-left">
								<span id="learnedNum"></span>/<span id="totalLessonNum">8</span>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<form class="comment-form" id="lesson-comment-form" method="post"
							action="/comment/0/post">
							<input type="hidden" name="targetType" value="lesson"> <input
								type="hidden" name="targetId" value="32606"> <input
								type="hidden" name="_csrf_token"
								value="30cad287546393080528866d82c9c3c6a22d7382">
							<textarea id="dialog_comment_content" placeholder="学完有没有什么想说的？"
								required="required" name="content"></textarea>
							<button class="btn btn-primary pull-right mtl"
								id="lesson-comment-submint-btn" type="submit">我要说几句</button>
						</form>
					</div>
				</div>
				<div class="modal-footer row" data-role="footer">
					<div class="col-md-6">
						
					</div>
					<div class="col-md-6">
						<span id="thread-recommend" class="btn"></span> <a
							class="btn btn-primary pull-right active" id="next-lesson"
							href="/course/2131/lesson/32607"> 学习下一课 </a>
					</div>
				</div>
			</div>
		</div>
		<input id="isjoin" type="hidden" value="false">
	</div>
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
				关注我们： <a href="#"><i class="hz-icon icon-weibo"
					style='background-image:url("${pageContext.request.contextPath}/main/assets/img/social-share-icons.png");background-position:5px -30px; background-repeat:repeat-y'></i></a>
				<a class="icon-sns"><i class="hz-icon icon-weixin"
					style='background-image:url("${pageContext.request.contextPath}/main/assets/img/social-share-icons.png");background-position:5px -59px; background-repeat:repeat-y'></i>
					<div class="sns-popover"
						style='background:url("${pageContext.request.contextPath}/main/assets/img/slowPlay-weixin.jpg")'>
					</div> </a> <a href="#"><i class="hz-icon icon-qq"
					style='background-image:url("${pageContext.request.contextPath}/main/assets/img/social-share-icons.png");background-position:5px 49px; background-repeat:repeat-y'></i></a>
				<a href="#"><i class="hz-icon icon-gongnengyedouban"
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
	<section class="serch-enginne-course visible-lg" 　role="alert">
	</section>
	<div class="modal " id="login-modal" data-url="/login/ajax"></div>
	<div class="modal" id="modal"></div>
	<div tabindex="-1" class="modal fade ckeditor-images"
		id="hz-imges-upload" data-url="/ckeditor/images/upload"></div>
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
	<div class="modal" id="login-modal_2" style="width:380px;height:330px">
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
			<br /> <span id="qqLoginBtn"></span><br />
			<input type="button" id="login_butt2" class="button-blue login"
				value="登录">
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

	<script
		src="${pageContext.request.contextPath}/main/assets/js/jquery-2.0.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/main/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/main/assets/js/main.js"></script>
	<script type="text/javascript">
		//登录
		$("#login_butt2").click(function(){
			var username=$("#username").val();
			var password=$("#password").val();
			var code = $("#verifyCode").val().toUpperCase();
			if(username==""||password==""){
				alert("用户名、密码不能为空~！");
			}else if(code != verifyCode.toUpperCase()){
				alert("验证码错误~！");
			}else{
				$.ajax({
					type:"post",
					data:{
						"user.username":username,
						"user.password":password,
					},
					url:"main/user_main_login.action",
					dataType:"json",
					success:function(data){
						if(data==3){
							alert("该用户已被禁止登陆~！");
						}else if(data==1){
							alert("用户名密码错误~！");
						}else {
							$("#login_header").html("<a style=\"display: inline;margin: 0px;padding: 0px;color:yellow;\" "+
							"href=\"/slowplay/main/person_main.jsp\">【"+data.realname+"】</a>，"+
							"您好<a style=\"display: inline;color:yellow;margin-left: 20px;\" href=\"javascript:loginExit2()\">注销</a>");
							$("#personId").val(data.id);
							var personId=$("#personId").val();
							var videoId=$("#hiddenVideoId").val();
							$.ajax({
								type:"post",
								data:{
									"note.user.id":personId,
									"note.video.id":videoId,
								},
								url:"/slowplay/main/note_queryMyNote.action",
								dataType:"json",
								success:function(data){
									if(data!=null){
										$("#biji_input_div").html(data.content);
										if(data.status=='yes'){
											$("#shareNote").attr("checked","checked");
										}
									}
									closeLogin("#login-modal_2");
								},
							});
						}
					}
				});
			}
		});
	</script>
	<script  src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111107&style=3&showcount=1&width=130&height=30" charset="utf-8" defer="defer" ></script>
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
						