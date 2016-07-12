window.onload=function(){
	var friendId=$("#friendId").val();
	if(friendId!=""){
		loadAllMsgBoard(1,friendId);
	}
}

/**显示他人主页的div*/
function showFriendMain(){
	$("#friendMsgBoard").show();
	$("#friendCourse").show();
	$("#friendQuestion").hide();
	$("#friend_main_tag li").prop("class"," ");
	$("#friend_main_tag li").eq(0).prop("class","active");
	
}

/**显示他人问答的div*/
function showFriendQuestion(){
	$("#friendMsgBoard").hide();
	$("#friendCourse").hide();
	$("#friendQuestion").show();
	$("#friend_main_tag li").prop("class"," ");
	$("#friend_main_tag li").eq(1).prop("class","active");
}

/**显示选中问答的详情*/
function showOneQuestion(id){
	$("#MyOneQuestion").css("display","block");
	$("#MyAllQuestion").css("display","none");
	loadOneQuestion(id);
}

/**显示全部的问题*/
function showAllQuestion(){
	$("#MyOneQuestion").css("display","none");
	$("#MyAllQuestion").css("display","block");
}

/**添加关注*/
function addFriend(){
	var personId=$("#personId").val();
	var friendId=$("#friendId").val();
	if(personId!=""){
		$.ajax({
			type:"post",
			data:{
				"friendUser.addUser.id":personId,
				"friendUser.to_user.id":friendId,
			},
			url:"/slowplay/main/main/user_addFriend.action",
			dataType:"json",
			success:function(data){
				if(data=="fail"){
					alert("操作错误，请勿重复关注~！");
				}
				var friendId=$("#friendId").val();
				var strBuff="<a href=\"javascript:cannelFriend();\">" +
						"<span class=\"has-attent\">" +
						"<i class=\"fa\">-</i>取消关注</span></a>";
				$("#keep-friend-butt").html(strBuff);
				window.location.reload();
			},
		})
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
	
}

/**取消关注*/
function cannelFriend(){
	var personId=$("#personId").val();
	var friendId=$("#friendId").val();
	if(personId!=""){
		$.ajax({
			type:"post",
			data:{
				"friendUser.addUser.id":personId,
				"friendUser.to_user.id":friendId,
			},
			url:"/slowplay/main/main/user_delFriend.action",
			dataType:"json",
			success:function(data){
				var strBuff="<a href=\"javascript:addFriend();\">" +
						"<span class=\"has-attent\">+<i class=\"fa\">" +
						"</i> 关注</span></a>";
				$("#keep-friend-butt").html(strBuff);
				window.location.reload();
			},
		})
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
	
}

/**显示关注的人*/
function show_attent(){
	$("#fans_butt").prop("class","pull-right");
	$("#attent_butt").prop("class","first active");
	$("#home-attent").show();
	$("#home-fans").hide();
}

/**显示粉丝*/
function show_fans(){
	$("#attent_butt").prop("class","first");
	$("#fans_butt").prop("class","pull-right active");
	$("#home-attent").hide();
	$("#home-fans").show();
}

/**加载单个问答的详情到div*/
function loadOneQuestion(id){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/question_queryQuestionById.action",
		data:{
			"question.id":id,
		},
		dataType:"json",
		success:function(data){
			$("#MyOneQuestion h1").html("<i class=\"q-icon\"></i>"+data.title+"");
			$("#MyOneQuestion .editor-text").html("<p>"+data.content+"</p>");
			$("#MyOneQuestion .related-course").html("<h2>该问题来自： <a class=\"con\" href=\"/slowplay/main/main/course_queryVideo.action?course.id="+data.video.course.id+"\">"+data.video.videoname+"</a>"+
				"</h2><p>相应课程： <a class=\"con\" href=\"/slowplay/main/main/course_queryVideo.action?course.id="+data.video.course.id+"\">《"+data.video.course.coursename+"》</a></p>");
			if(data.answers!=null){
				$("#MyOneQuestion .question-answer h4").html(""+data.answers.length+"个回答");
			}else{
				$("#MyOneQuestion .question-answer h4").html("0个回答");
			}
			$("#questionId").val(data.id);
			var strBuff="";
			if(data.answers!=null){
				$.each(data.answers,function(){
					strBuff=strBuff+"<li class=\"media\"><div class=\"media-left\">"+
						"<a class=\"js-user-card\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\"> <img class=\"avatar-sm\" src=\""+this.user.path+"\"></a>"+
						"</div><div class=\"question-contents media-body\"><div class=\"name\">"+
						"<a class=\"link-light\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a><span class=\"day text-right\">"+this.answerDate+"</span>"+
						"</div><div class=\"content\" style=\"min-height:24px;\">"+this.content+"</div><div class=\"answer-actions pull-right\"></div></div></li>";
				});
			}
			$("#questionAnswer_ul").html(strBuff);
		}
	})
}

/**根据分页将留言加载到div*/
function loadAllMsgBoard(modelNum,friendId){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/msgBoard_queryFriendMsgBoard.action",
		data:{
			"newMsgBoard.to_user.id":friendId,
			"page.page":modelNum,
		},
		dataType:"json",
		success:function(ajaxMap){
			data=ajaxMap.msgBoardList;
			pageData=ajaxMap.page;
			pageNum=pageData.page;
			allPage=pageData.allPage;
			$("#comment_input_div").html("");
			var str="";
			if(data!=null){
				$.each(data,function(){
					str=str+"<li id=\"item73929\"><div class=\"userimg\">"+
					"<a class=\" js-user-card\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+
						"<img class=\"img-responsive\" src=\""+this.user.path+"\">"+
					"</a></div><div class=\"userInfo\"><p class=\"head\">"+
						"<a href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\"  style=\"font-size:20px;\">"+this.user.realname+"</a><span style=\"margin-left:570px;\">"+this.time+"</span>"+
					"</p><div class=\"body\">"+this.content+"</div><div class=\"pull-right  \">";
					if(this.chdMsgBoard!=null){
						str=str+"<a class=\"con\" href=\"javascript:showLZL('#lzl_"+this.id+"');\">收缩/展开("+this.chdMsgBoard.length+")</a>";
					}
					str=str+"<a class=\"con\" href=\"javascript:replySomeOne("+this.id+",'"+this.user.realname+"');\">回复</a></div></div>";
					if(this.chdMsgBoard!=null){
						str=str+"<div id=\"lzl_"+this.id+"\" style=\"background: rgb(230, 239, 204);margin-left: 70px;\">";
						$.each(this.chdMsgBoard,function(){	
							str=str+"<div style=\"margin-left: 10px;\"><div style=\"height: 5px;\"></div>"+
								"<img style=\"width: 30px;display: inline;border-radius:50%\" class=\"img-responsive\" src=\""+this.user.path+"\">"+
								"<a style=\"display: inline;\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a><span style=\"margin-left: 530px;\">"+this.time+"</span>"+
								"<div style=\"margin-left: 40px;\">"+this.content+"</div><div style=\"height: 5px;\"></div></div>";			
						});
					}
					if(this.chdMsgBoard!=null){
						str=str+"</div>";
					}
					str=str+"</li>";
				});
			}
			$("#MsgBoardList").html(str);
			var pageStr="";
			if(pageNum!=1){
				pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showAllMsgBoardByPage(1)\">首页</a></span>";
			}
			if(pageNum>1){
				pageStr=pageStr+"<span style=\"margin-left:30px;\"><a href=\"javascript:showAllMsgBoardByPage("+(pageNum-1)+")\">上一页</a></span>";
			}
			if(pageNum<allPage){
				pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showAllMsgBoardByPage("+(pageNum+1)+")\">下一页</a></span>";
			}
			if(pageNum!=allPage){
				pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showAllMsgBoardByPage("+allPage+")\">尾页</a></span>";
			}
			pageStr=pageStr+"<span style=\"margin-left:50px;\">第"+pageNum+"页，共"+allPage+"页</span>";
			$("#pageContent").html(pageStr);
			$("#nowPage").val(pageNum);
			$("#allPage").val(allPage);
		},
		error:function(){
			alert("网络异常，请刷新后重试~！");
		}
	});
}

/**回答问题点击事件*/
$("#answer-submit-btn").click(function(){
	var personId=$("#personId").val();
	var questionId=$("#questionId").val();
	var answerText=$("#answer_input_div").html();
	if(personId!=""){
		$.ajax({
			type:"post",
			data:{
				"question.id":questionId,
				"question.user.id":personId,
				"question.content":answerText,
			},
			dataType:"json",
			url:"/slowplay/main/main/question_addQAnswer.action",
			success:function(data){
				$("#answer_input_div").html("");
				alert("回复成功~！");
				showOneQuestion(questionId);
				var num= parseInt($("#answersNum"+questionId+"").html()) + 1;
				$("#answersNum"+questionId+"").html(num);
			},
		});
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
})

/**发表留言*/
$("#MsgBoard-btn").click(function(){
	var pid=$("#hiddenCommentId").val();
	var personId=$("#personId").val();
	if(personId!=""){
		var replyStr=$("#comment_input_div").html();
		//replyStr = replyStr.replace(/<\/?[^>]*>/g,''); //去除HTML tag  
		replyStr = replyStr.replace(/[ | ]* /g,''); //去除行尾空白  
        replyStr=replyStr.replace(/&nbsp;/ig,'');//去掉  
		if(replyStr!=""){
			if(pid!=null){
				document.getElementById("commentHiddenPerson").parentNode.removeChild(document.getElementById("commentHiddenPerson"));
			}
			else{
				pid=0;
			}
			$.ajax({
				type:"post",
				data:{
					"msgBoard.to_user.id":$("#friendId").val(),
					"msgBoard.content":$("#comment_input_div").html(),
					"msgBoard.pid":pid,
					"page.page":$("#nowPage").val(),
				},
				url:"/slowplay/main/main/msgBoard_addMsgBoard.action",
				success:function(data){
					loadAllMsgBoard($("#nowPage").val(),$("#friendId").val());
				}
			});
		}else{
			alert("评论类容不能为空");
		}
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
})