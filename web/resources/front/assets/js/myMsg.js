/**
 * 将form表单中的值封装到一个json对象中
 * author :zhongxiaoyong
 */
$.fn.serializeObject = function()
{
  var o = {};
  var a = this.serializeArray();//[{name:"user.id",value:"1"},{name:"user.name",value:"wgq"}]]
  								//{"user.id":"1","user.name":"wgq"}
  $.each(a, function() {
    if (o[this.name] !== undefined) {
      if (!o[this.name].push) {
        o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
  
};

/**显示我的基础信息的div*/
function showMyMsg(){
	$("#myImg_box").css("display","none");
	$("#changePwd_box").css("display","none");
	$("#msg_box").css("display","block");
	var str="<li class=\"list-group-heading\">个人设置</li><li class=\"list-group-item active\">" +
	"<a href=\"javascript:showMyMsg()\"><i class=\"glyphicon glyphicon-user\"></i> 基础信息</a></li>" +
	"<li class=\"list-group-item\"><a href=\"javascript:showChangePwd()\"><i class=\"glyphicon glyphicon-user\"></i> 修改密码</a></li>"+
	"<li class=\"list-group-item\"><a href=\"javascript:showMyImg()\">" +
	"<i class=\"glyphicon glyphicon-picture\"></i> 头像设置</a></li>";
	$("#MyMsgAndImgTab").html(str);
}

/**显示修改密码的div*/
function showChangePwd(){
	$("#myImg_box").css("display","none");
	$("#changePwd_box").css("display","block");
	$("#msg_box").css("display","none");
	var str="<li class=\"list-group-heading\">个人设置</li><li class=\"list-group-item\">" +
	"<a href=\"javascript:showMyMsg()\"><i class=\"glyphicon glyphicon-user\"></i> 基础信息</a></li>" +
	"<li class=\"list-group-item active\"><a href=\"javascript:showChangePwd()\"><i class=\"glyphicon glyphicon-user\"></i> 修改密码</a></li>"+
	"<li class=\"list-group-item\"><a href=\"javascript:showMyImg()\">" +
	"<i class=\"glyphicon glyphicon-picture\"></i> 头像设置</a></li>";
	$("#MyMsgAndImgTab").html(str);
}

/**显示我的头像的div*/
function showMyImg(){
	$("#myImg_box").css("display","block");
	$("#changePwd_box").css("display","none");
	$("#msg_box").css("display","none");
	var str="<li class=\"list-group-heading\">个人设置</li><li class=\"list-group-item\">" +
	"<a href=\"javascript:showMyMsg()\"><i class=\"glyphicon glyphicon-user\"></i> 基础信息</a></li>" +
	"<li class=\"list-group-item\"><a href=\"javascript:showChangePwd()\"><i class=\"glyphicon glyphicon-user\"></i> 修改密码</a></li>"+
	"<li class=\"list-group-item active\"><a href=\"javascript:showMyImg()\">" +
	"<i class=\"glyphicon glyphicon-picture\"></i> 头像设置</a></li>";
	$("#MyMsgAndImgTab").html(str);
}

/**显示出已裁剪的图片*/
function showImgCut(){
	$("#oldImg").css("display","none");
	$("#newImg").css("display","block");
	$("#changeImgButt").css("display","block");
}

/**取消收藏*/
function deleteUserCourse(courseId){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/course_deleteUserCourse.action",
		data:{
			"course.id":courseId,
		},
		success:function(data){
			loadUserCourse();
		}
	});
}

/**加载已收藏的课程到div*/
function loadUserCourse(){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/course_queryPersonCourse.action",
		dataType:"json",
		success:function(data){
			var strBuff="";
			if(data!=null){
				$.each(data,function(){
					strBuff=strBuff+"<div class=\"col-md-4 col-sm-6\"><div class=\"course-item\"><div class=\"course-img\"><a href=\"/slowplay/main/main/course_queryVideo.action?course.id="+this.id+"\">" +
					"<img src=\""+this.picpath+"\" class=\"img-responsive\" style=\"width:300px;height:150px;\"> " +
					"<span class=\"load\" style=\"width:0%\"></span> <div class=\"image-overlay\"></div> </a></div>"+
					"<div class=\"course-info\"><div class=\"title\"><span class=\"label label-p\" onclick=\"javascript:window.location='/slowplay/main/main/sort_initSortTitle.action?sort.id="+this.sort.id+"'\">"+this.sort.name+"</span> "+
					"<a class=\"transition\" href=\"javascript:;\">"+this.coursename+"</a></div><div class=\"teacher\">"+
					"<a class=\" js-user-card\" href=\"javascript:;\"> <img class=\"avatar-ss \" src=\"/slowplay/main/assets/img/avatar.png\" >"+
					"</a> <a class=\"link-light \" href=\"javascript:;\">"+this.author+"</a> <a href=\"javascript:deleteUserCourse("+this.id+")\" style=\"width:120px;text-align: right;display: block;float: right;\">取消收藏</a>"+
					"</div></div></div></div>";
				})
				$("#personCourse_div").html(strBuff);
			}
			var data_Num=0;
			if(data!=null){
				data_Num=data.length;
			}
			$("#center_right_tab1 li a").eq(0).html(data_Num);
			$("#center_right_tab2 li a").eq(0).html(data_Num);
			$("#center_right_tab3 li a").eq(0).html(data_Num);
			$("#center_right_tab4 li a").eq(0).html(data_Num);
		}
	});
}

/**加载最近浏览的课程到div*/
function loadRecentlyPlay(){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/course_queryRecentlyPlayCourse.action",
		dataType:"json",
		success:function(data){
			var strBuff="";
			if(data!=null){
				$.each(data,function(){
					strBuff=strBuff+"<div class=\"col-md-4 col-sm-6\"><div class=\"course-item\"><div class=\"course-img\"><a href=\"/slowplay/main/main/course_queryVideo.action?course.id="+this.id+"\">" +
					"<img src=\""+this.picpath+"\" class=\"img-responsive\" style=\"width:300px;height:150px;\"> " +
					"<span class=\"load\" style=\"width:0%\"></span> <div class=\"image-overlay\"></div> </a></div>"+
					"<div class=\"course-info\"><div class=\"title\"><span class=\"label label-p\" onclick=\"javascript:window.location='/slowplay/main/main/sort_initSortTitle.action?sort.id="+this.sort.id+"'\">"+this.sort.name+"</span> "+
					"<a class=\"transition\" href=\"javascript:;\">"+this.coursename+"</a></div><div class=\"teacher\">"+
					"<a class=\" js-user-card\" href=\"javascript:;\"> <img class=\"avatar-ss \" src=\"/slowplay/main/assets/img/avatar.png\" >"+
					"</a> <a class=\"link-light \" href=\"javascript:;\">"+this.author+"</a> <a href=\"javascript:addCollect("+this.id+")\" style=\"width:120px;text-align: right;display: block;float: right;\">加入收藏</a>"+
					"</div></div></div></div>";
				})
				$("#recentlyPlayCourse_div").html(strBuff);
			}
		}
	});
}

/**加载个人笔记到div*/
function loadMyNote(){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/note_queryAllNote.action",
		dataType:"json",
		success:function(data){
			var strBuff="";
			if(data!=null){
				$.each(data,function(){
					strBuff=strBuff+"<div class=\"col-xs-12 col-sm-6 widget-container-span ui-sortable\">"+
						"<div class=\"widget-box\" style=\"opacity: 1; z-index: 0;border-radius:5px\">"+
						"<div class=\"notecaozuo\" style=\"float: right;\">操 作"+
						"<div style=\"display: none;height: 5px\"></div>"+
						"<div style=\"display: none;\">";
					if(this.status=="yes"){
						strBuff=strBuff+"<a href=\"javascript:cancelMyNoteStatus("+this.id+")\">取 消</a></div>";
					}else{
						strBuff=strBuff+"<a href=\"javascript:shareMyNoteStatus("+this.id+")\">分享</a></div>";
					}
					strBuff=strBuff+"<div style=\"display: none;height: 5px\"></div>"+
						"<div style=\"display: none;\"><a href=\"javascript:deleteNote("+this.id+")\">删  除</a></div>"+
						"<div style=\"display: none;height: 5px\"></div>"+
						"</div><div style=\"background-color: #eee\" class=\"widget-header widget-header-large\">"+
						"<h4>来自<a href=\"/slowplay/main/main/course_queryVideo.action?course.id="+this.video.course.id+"\">《"+this.video.course.coursename+"》</a>--  "+this.video.videoname+"</h4></div>"+
						"<div class=\"widget-body\"><div class=\"widget-main\" >"+
						"<p class=\"alert alert-info\">"+this.content+"</p></div></div></div></div>";
				})
			}
			$("#showMyNote_div").html(strBuff);
			/**笔记操作按钮的鼠标触发事件*/
			$(".notecaozuo").hover(
				function () {
					$(this).children().show();
					$(this).css("border-radius","5px").css("background-color","#fff");
					
				},
				function () {
					$(".notecaozuo div").hide();
					$(".notecaozuo").css("border-radius","0px").css("background-color","#ccc");
				}
			);
			var data_Num=0;
			if(data!=null){
				data_Num=data.length;
			}
			$("#center_right_tab1 li a").eq(1).html(data_Num);
			$("#center_right_tab2 li a").eq(1).html(data_Num);
			$("#center_right_tab3 li a").eq(1).html(data_Num);
			$("#center_right_tab4 li a").eq(1).html(data_Num);
		}
	});
}

/**加载问题列表到div*/
function loadMyQuestion(){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/question_queryQuestionByUser.action",
		dataType:"json",
		success:function(data){
			var strBuff="";
			if(data!=null){
				$.each(data,function(){
					var answerNum;
					if(this.answers!=null){
						answerNum=this.answers.length;
					}else{
						answerNum=0;
					}
					strBuff=strBuff+"<li><h4><span class=\"q-icon\"></span>"+
						"<a class=\"js-nav\" href=\"javascript:showOneQuestion("+this.id+")\">"+this.title+"</a> "+
						"<a class=\"link-muted\" href=\"/slowplay/main/main/course_queryVideo.action?course.id="+this.video.course.id+"\"><span class=\"from\">来自"+this.video.videoname+"</span>"+
						"</a></h4><p>by <a class=\"link-light link-muted\" href=\"#\">"+this.user.username+"</a>• "+answerNum+" 回答</p></li>";
				});
			}
			$("#allQuestion_ul").html(strBuff);
			var data_Num=0;
			if(data!=null){
				data_Num=data.length;
			}
			$("#center_right_tab1 li a").eq(2).html(data_Num);
			$("#center_right_tab2 li a").eq(2).html(data_Num);
			$("#center_right_tab3 li a").eq(2).html(data_Num);
			$("#center_right_tab4 li a").eq(2).html(data_Num);
		}
	});
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
			$("#MyOneQuestion h1").html("<i class=\"q-icon\"></i>"+data.title+""+
				"<a class=\" follow-question btn pull-right btn-primary\" "+
				"href=\"javascript:deleteQuestion("+data.id+")\">删除</a>");
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
						"<a class=\"js-user-card\" href=\"#\"> <img class=\"avatar-sm\" src=\""+this.user.path+"\"></a>"+
						"</div><div class=\"question-contents media-body\"><div class=\"name\">"+
						"<a class=\"link-light\" href=\"#\">"+this.user.realname+"</a><span class=\"day text-right\">"+this.answerDate+"</span>"+
						"</div><div class=\"content\" style=\"min-height:24px;\">"+this.content+"</div><div class=\"answer-actions pull-right\"></div></div></li>";
				});
			}
			$("#questionAnswer_ul").html(strBuff);
		}
	})
}

/**根据分页将留言加载到div*/
function loadAllMsgBoard(modelNum){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/msgBoard_queryMsgBoard.action",
		data:{
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
					"<a class=\" js-user-card\" href=\"javascript:;\">"+
						"<img class=\"img-responsive\" src=\""+this.user.path+"\">"+
					"</a></div><div class=\"userInfo\"><p class=\"head\">"+
						"<a href=\"javascript:;\"  style=\"font-size:20px;\">"+this.user.realname+"</a><span style=\"margin-left:570px;\">"+this.time+"</span>"+
					"</p><div class=\"body\">"+this.content+"</div><div class=\"pull-right  \">";
					if(this.chdMsgBoard!=null){
						str=str+"<a class=\"con\" href=\"javascript:showLZL('#lzl_"+this.id+"');\">收缩/展开("+this.chdMsgBoard.length+")</a>";
					}
					str=str+"<a class=\"con\" href=\"javascript:replySomeOne("+this.id+",'"+this.user.realname+"');\">回复</a>" +
							"<a class=\"con\" href=\"javascript:deleteMsgBoard("+this.id+");\">删除</a></div></div>";
					if(this.chdMsgBoard!=null){
						str=str+"<div id=\"lzl_"+this.id+"\" style=\"background: rgb(230, 239, 204);margin-left: 70px;\">";
						$.each(this.chdMsgBoard,function(){	
							str=str+"<div style=\"margin-left: 10px;\"><div style=\"height: 5px;\"></div>"+
								"<img style=\"width: 30px;display: inline;border-radius:50%\" class=\"img-responsive\" src=\""+this.user.path+"\" alt=\"清水自然\">"+
								"<a style=\"display: inline;\" href=\"javascript:;\">"+this.user.realname+"</a><span style=\"margin-left: 530px;\">"+this.time+"</span>"+
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

/**删除问答*/
function deleteQuestion(id){
	if(confirm('你确定要删除?')){
		$.ajax({
			type:"post",
			data:{
				"question.id":id,
			},
			url:"/slowplay/main/main/question_deleteQuestion.action",
			dataType:"json",
			success:function(data){
				alert("删除成功~！");
				showAllQuestion();
				showPerson();
			}
		})
	}
}

/**根据分页查询留言*/
function showAllMsgBoardByPage(pageNum){
	loadAllMsgBoard(pageNum);
}

/**根据id删除留言*/
function deleteMsgBoard(id){
	if(confirm('你确定要删除?')){
		$.ajax({
			type:"post",
			data:{
				"msgBoard.id":id,
			},
			url:"/slowplay/main/main/msgBoard_deleteMsgBoard.action",
			success:function(data){
				loadAllMsgBoard($("#nowPage").val());
			}
		});
	}
}

/**删除笔记*/
function deleteNote(noteId){
	if(confirm('你确定要删除?')){
		$.ajax({
			type:"post",
			url:"/slowplay/main/main/note_deleteNote.action",
			data:{
				"note.id":noteId,
			},
			success:function(data){
				showMyNote();
			}
		})
	}
}

/**分享笔记*/
function shareMyNoteStatus(id){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/note_updateNoteState.action",
		data:{
			"note.id":id,
			"note.status":"yes",
		},
		success:function(data){
			showMyNote();
		}
	})
}

/**取消分享笔记*/
function cancelMyNoteStatus(id){
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/note_updateNoteState.action",
		data:{
			"note.id":id,
			"note.status":"no",
		},
		success:function(data){
			showMyNote();
		}
	})
}

/**显示个人中心的div*/
function showPerson(){
	$("#study_center_box").css("display","none");
	$("#person_center_box").css("display","block");
	$("#note_center_box").css("display","none");
	$("#question_center_box").css("display","none");
	$("#MsgBoard_center_box").css("display","none");
	$("#person_main_tag li a").attr("class"," ");
	$("#person_main_tag li a").eq(0).attr("class","active");
}

/**显示在学的div*/
function showMyStudy(){
	$("#study_center_box").css("display","block");
	$("#person_center_box").css("display","none");
	$("#note_center_box").css("display","none");
	$("#question_center_box").css("display","none");
	$("#MsgBoard_center_box").css("display","none");
	$("#person_main_tag li a").attr("class"," ");
	$("#person_main_tag li a").eq(1).attr("class","active");
	loadUserCourse();
}

/**显示笔记的div*/
function showMyNote(){
	$("#study_center_box").css("display","none");
	$("#person_center_box").css("display","none");
	$("#note_center_box").css("display","block");
	$("#question_center_box").css("display","none");
	$("#MsgBoard_center_box").css("display","none");
	$("#person_main_tag li a").attr("class"," ");
	$("#person_main_tag li a").eq(2).attr("class","active");
	loadMyNote();
}

/**显示问答的div*/
function showMyQuestion(){
	$("#study_center_box").css("display","none");
	$("#person_center_box").css("display","none");
	$("#note_center_box").css("display","none");
	$("#question_center_box").css("display","block");
	$("#MsgBoard_center_box").css("display","none");
	$("#person_main_tag li a").attr("class"," ");
	$("#person_main_tag li a").eq(3).attr("class","active");
	loadMyQuestion();
}

/**显示留言板的div*/
function showMyMsgBoard(){
	$("#study_center_box").css("display","none");
	$("#person_center_box").css("display","none");
	$("#note_center_box").css("display","none");
	$("#question_center_box").css("display","none");
	$("#MsgBoard_center_box").css("display","block");
	$("#person_main_tag li a").attr("class"," ");
	$("#person_main_tag li a").eq(4).attr("class","active");
	var personId=$("#personId").val();
	if(personId!=""){
		loadAllMsgBoard(1);
	}
}

/**显示已收藏课程div*/
function showCollectCourse(){
	$("#recentlyPlayCourse_div").hide();
	$("#personCourse_div").show();
	$("#recentlyPlay_a").attr("class"," ");
	$("#userCourse_a").attr("class","active");
	loadUserCourse();
}

/**显示最近播放课程div*/
function showRecentlyPlay(){
	$("#recentlyPlayCourse_div").show();
	$("#personCourse_div").hide();
	$("#recentlyPlay_a").attr("class","active");
	$("#userCourse_a").attr("class"," ");
	loadRecentlyPlay();
}

/**显示所有的笔记*/
function showAllQuestion(){
	$("#MyOneQuestion").css("display","none");
	$("#MyAllQuestion").css("display","block");
}

/**显示选中笔记的详情*/
function showOneQuestion(id){
	$("#MyOneQuestion").css("display","block");
	$("#MyAllQuestion").css("display","none");
	loadOneQuestion(id);
}

/**点击右侧div课程的数量显示数据*/
function showCollectCourseByNum(){
	showMyStudy();
}

/**点击右侧div笔记的数量显示数据*/
function showMyNoteByNum(){
	showMyNote();
}

/**点击右侧div问题的数量显示数据*/
function showMyQuestionByNum(){
	showMyQuestion();
}

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
					"msgBoard.to_user.id":$("#personId").val(),
					"msgBoard.content":$("#comment_input_div").html(),
					"msgBoard.pid":pid,
					"page.page":$("#nowPage").val(),
				},
				url:"/slowplay/main/main/msgBoard_addMsgBoard.action",
				success:function(data){
					loadAllMsgBoard($("#nowPage").val());
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

/**保存基础信息的触发事件*/
$("#updatePerson-save-btn").click(function(){
	var jsonData=$("#person-msg-form").serializeObject();
	$.ajax({
		type:"post",
		data:jsonData,
		url:"/slowplay/main/main/user_updateUser.action",
		dataType:"json",
		success:function(data){
			$("#_person_autograph").html(data);
			alert("修改成功~！");
		},
	});
});

/**修改密码的触发事件*/
$("#updatePwd-save-btn").click(function(){
	var oldPwd=$("#oldPwd").val();
	var newPwd=$("#newPwd").val();
	var newPwd2=$("#newPwd2").val();
	if(oldPwd==""){
		alert("请输入原始密码~！");
	}else if(newPwd==""){
		alert("请输入新密码~！");
	}else if(newPwd2!=newPwd){
		alert("两次密码不相同~！");
	}else{
		$.ajax({
			type:"post",
			data:{
				"user.password":oldPwd,
				"user.newPwd":newPwd,
			},
			dataType:"json",
			url:"/slowplay/main/main/user_updatePwd.action",
			success:function(data){
				alert(data);
			},
		})
	}
});

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
			},
		});
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
})

/**显示关注的人1*/
function show_attent1(){
	$("#fans_butt1").prop("class","pull-right");
	$("#attent_butt1").prop("class","first active");
	$("#home-attent1").show();
	$("#home-fans1").hide();
}

/**显示粉丝1*/
function show_fans1(){
	$("#attent_butt1").prop("class","first");
	$("#fans_butt1").prop("class","pull-right active");
	$("#home-attent1").hide();
	$("#home-fans1").show();
}

/**显示关注的人2*/
function show_attent2(){
	$("#fans_butt2").prop("class","pull-right");
	$("#attent_butt2").prop("class","first active");
	$("#home-attent2").show();
	$("#home-fans2").hide();
}

/**显示粉丝2*/
function show_fans2(){
	$("#attent_butt2").prop("class","first");
	$("#fans_butt2").prop("class","pull-right active");
	$("#home-attent2").hide();
	$("#home-fans2").show();
}

/**显示关注的人3*/
function show_attent3(){
	$("#fans_butt3").prop("class","pull-right");
	$("#attent_butt3").prop("class","first active");
	$("#home-attent3").show();
	$("#home-fans3").hide();
}

/**显示粉丝3*/
function show_fans3(){
	$("#attent_butt3").prop("class","first");
	$("#fans_butt3").prop("class","pull-right active");
	$("#home-attent3").hide();
	$("#home-fans3").show();
}

/**显示关注的人4*/
function show_attent4(){
	$("#fans_butt4").prop("class","pull-right");
	$("#attent_butt4").prop("class","first active");
	$("#home-attent4").show();
	$("#home-fans4").hide();
}

/**显示粉丝4*/
function show_fans4(){
	$("#attent_butt4").prop("class","first");
	$("#fans_butt4").prop("class","pull-right active");
	$("#home-attent4").hide();
	$("#home-fans4").show();
}

/**保存用户修改的个人头像*/
function saveUserImg(){
	var scrStr=document.getElementById("user_upload_img_box");
	$("#user_upload_img").val(scrStr.src);
	$("#frmm_11").submit();
}


/**用户qq第三方登录初始化信息填写*/
$("#qqInit_butt").click(function(){
	if($("#qq_username").val()==""){
		alert("用户名不能为空~！");
	}else if($("#qq_password").val()==""){
		alert("密码不能为空~！");
	}else if($("#qq_repsd").val()!=$("#qq_password").val()){
		alert("两次密码输入不相同~！");
	}else{
		var jsonData=$("#qqInit-form").serializeObject();
		$.ajax({
			type:"post",
			data:jsonData,
			dataType:"json",
			url:"/slowplay/main/main/user_loadByQQ.action",
			success:function(data){
				if(data==2){
					alert("该用户名已存在~！");
				}else{
					closeLogin('#qq-modal_2');
					window.location="/slowplay/main/person_main.jsp";
				}
			},
		})
	}
});


