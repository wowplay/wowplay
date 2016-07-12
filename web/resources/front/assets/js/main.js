//form表单中的值封装到一个json对象中
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

/**计时按钮*/
function start_sms_button(obj){
	obj.prop("disabled","disabled").css("background-color","#ccc");
    var count = 1 ;
    var sum = 60;
    var i = setInterval(function(){
	 	if(count > 60){
	 		obj.prop('disabled',false).css("background-color","rgba(16, 182, 124, 1)");
	 		obj.val('发送验证码');
		    clearInterval(i);
		}else{
			obj.val('剩余'+parseInt(sum - count)+'秒');
		}
	 	count++;
    },1000);
}


/**发送短信验证码*/
$("#phone_verify_butt").click(function(){
	if(checkTel()){
		var phone_verify=$("#user_phone").val();
		start_sms_button($("#phone_verify_butt"));
		$.ajax({
			type:"post",
			data:{
				"user.tel":phone_verify,
			},
			url:"/slowplay/main/main/user_getPhoneVerify.action",
			dataType:"json",
			success:function(data){
				var ali=JSON.parse(data); //可以将json字符串转换成json对象
				var ali_send=ali.alibaba_aliqin_fc_sms_num_send_response;
				var ali_error=ali.error_response;
				if(ali_send){
					var ali_result=ali_send.result;
					if(ali_result.success){
						alert("短信发送成功~！");
					}
				}
				if(ali_error){
					alert(ali_error.sub_msg)
				}
			}
		});
	}else{
		alert("手机号码不正确~！");
	}
})

/**验证短信验证码*/
function checkPhoneVerify(){
	var verify=$("#phone_verify").val();
	var telPattern=/^\d{6}$/;
	if(!telPattern.test(verify)){
		$("#phoneverify_msg").html("* 验证码格式错误").css("color","red");
	}else{
		$.ajax({
			type:"post",
			data:{
				"user.tel":verify,
			},
			url:"/slowplay/main/main/user_checkPhoneVerify.action",
			dataType:"json",
			success:function(data){
				if(data=="success"){
					$("#phoneverify_msg").html("<img id=\"code_yes\" src=\"/slowplay/main/assets/img/yes.png\">");
				}else{
					$("#phoneverify_msg").html("* 验证码码错误").css("color","red");
				}
			},
		})
		
	}
}

$("#class_menu").mouseenter(function(){
  $("#class_menu  ul").css("display","block");
});
$("#class_menu").mouseleave(function(){
  $("#class_menu ul").css("display","none");
});
$(".clearfix li").mouseenter(function(){
	var marginLeft=this.value*112;
	marginLeft=marginLeft+"px";
	$("#youbiao_classes").css("margin-left",marginLeft);
	$(".item,.clearfix").removeClass("act");
	var eqNum=this.value+1;
	$(".item,.clearfix").eq(eqNum).addClass("act");
});

function pageScroll(){ 
	//把内容滚动指定的像素数（第一个参数是向右滚动的像素数，第二个参数是向下滚动的像素数） 
	window.scrollBy(0,-100); 
	//延时递归调用，模拟滚动向上效果 
	scrolldelay = setTimeout('pageScroll()',1); 
	//获取scrollTop值，声明了DTD的标准网页取document.documentElement.scrollTop，否则取document.body.scrollTop；因为二者只有一个会生效，另一个就恒为0，所以取和值可以得到网页的真正的scrollTop值 
	var sTop=document.documentElement.scrollTop+document.body.scrollTop; 
	//判断当页面到达顶部，取消延时代码（否则页面滚动到顶部会无法再向下正常浏览页面） 
	if(sTop==0) clearTimeout(scrolldelay); 
} 

function showTuiJian(){
	document.getElementById("tuijian_").style.display="block";
	document.getElementById("hot_").style.display="none";
	document.getElementById("newCourse_").style.display="none";
	$("#tuijianbutt_").css("color","green");
	$("#hotbutt_").css("color","#ccc");
	$("#newbutt_").css("color","#ccc");
}

function showHot(){
	document.getElementById("tuijian_").style.display="none";
	document.getElementById("hot_").style.display="block";
	document.getElementById("newCourse_").style.display="none";
	$("#tuijianbutt_").css("color","#ccc");
	$("#hotbutt_").css("color","green");
	$("#newbutt_").css("color","#ccc");
}

function showNew(){
	document.getElementById("tuijian_").style.display="none";
	document.getElementById("hot_").style.display="none";
	document.getElementById("newCourse_").style.display="block";
	$("#tuijianbutt_").css("color","#ccc");
	$("#hotbutt_").css("color","#ccc");
	$("#newbutt_").css("color","green");
}

$(function(){
	showTuiJian();
	$("#tuijianbutt_").css("color","green");
	$("#hotbutt_").css("color","#ccc");
	$("#newbutt_").css("color","#ccc");
});

/**
 * 此处是登录和注册的验证JS
 */
function checkForm(){
	if($$("username1").value==""||$$("password1").value==""||$$("repsd").value==""||$$("realname").value==""){
		alert("输入不能为空！");
		return false;
	}
	if(checkName()&&checkPsd()&&checkRepsd())
	{
		if($("#code_yes").get(0)){
			return true;
		}
		alert("验证码错误~！")
		return false;
	}else{
		alert("格式错误~！");
		return false;
	}
}

function $$(id){
	return document.getElementById(id);
}

function checkName(){
	var namePattern=/^[A-Za-z0-9](\w|\.|_|@){4,16}[A-Za-z0-9]$/;
	var name=$$("username1").value;

	if(!namePattern.test(name)){
		$$("nameError").innerHTML="*格式错误！";
		$$("nameError").style.color="red";				
		return false;
	}else
	$$("nameError").innerHTML="*格式正确";
	$$("nameError").style.color="green";
	return true;
}
function checkPsd(){
	var psdPattern=/^\w{6,16}$/;
	var psd=$$("password1").value;
	if(!psdPattern.test(psd)){
		$$("psdError").innerHTML="*密码格式有误！";
		$$("psdError").style.color="red";
		return false;
	}else
	$$("psdError").innerHTML="*格式正确";
	$$("psdError").style.color="green";
	return true;
	
}
function checkRepsd(){
	var psd=$$("password1").value;
	var repsd=$$("repsd").value;
	if(psd!=repsd){
		$$("repsdError").innerHTML="*密码不一致！"
		$$("repsdError").style.color="red";
		return false;
	}else if(repsd==""){
		$$("repsdError").innerHTML="*请输入！";
		$$("repsdError").style.color="red";
		return false;		
	}
	else
	
	$$("repsdError").innerHTML="*格式正确";
	$$("repsdError").style.color="green";
	return true;
}

function checkTel(){
	var tel=$$("user_phone");
	var telPattern=/^13\d{9}$|^15\d{9}$|^18\d{9}$|^17\d{9}$/;
	if(!telPattern.test(tel.value)){
		return false;
	}
	return true;
}


function hightLight(id){
	document.getElementById(id).className="focusStyle";

}
function restore(id){
	document.getElementById(id).className="blurStyle";
}

/**
 * 切换验证码
 * @param data
 */
var verifyCode = null;
function changeVerify(data){
	$(data).attr("src"," ");
	$.ajax({
		type:"post",
		url:"/slowplay/main/main/user_createVerifyCode.action",
		success:function(msg){
			var array = msg.split("_");
			$(data).attr("src",array[1]);
			verifyCode = array[0];
		},
		error:function(error){
			
		}
	});
}

/**
 * 验证码正确性验证
 * @returns {Boolean}
 */
function codeVerify(){
	var code = $("#verifyCode").val().toUpperCase();
	if(code != verifyCode.toUpperCase()){
		$("#codeError").html(" <img src=\"/slowplay/main/assets/img/no.png\"/>* 验证码错误~！").css("color","red");
	}else{
		$("#codeError").html(" <img src=\"/slowplay/main/assets/img/ok.png\"/>正确~！").css("color","green");
	}
}

//弹出登录窗体
function showLogin(loginId){
	changeVerify("#imgObj");
	$("#username").val("");
	$("#password").val("");
	$("#verifyCode").val("");
	$("#cover").show();
	$(loginId).show();
}
//隐藏登录窗体
function closeLogin(loginId){
	$(loginId).css("display","none");
	$("#cover").css("display","none");
	$("#codeError").html("");
}
//弹出注册窗体
function showRegister(registerId){
	$("#cover").show();
	$(registerId).show();
}
//隐藏注册窗体
function closeRegister(registerId){
	$(registerId).css("display","none");
	$("#cover").css("display","none");
}

//注册
$("#signup_butt").click(function(){
	var jsonData=$("#signup_form").serializeObject();
	if(checkForm()==true){
		$.ajax({
			type:"post",
			data:jsonData,
			url:"/slowplay/main/main/user_regist.action",
			success:function(data){
				alert(data);
				window.location.reload();
			},
		});
	}
});

//注销
function loginExit(){
	//判断如果是QQ登录，先登出QQ
	if(QC.Login.check()){
		QC.Login.signOut();
	}
	$.ajax({
		type:"post",
		url:"main/user_main_exit.action",
		dataType:"json",
		success:function(data){
			$("#personId").val("");
			$("#login_header").html("<li id=\"login_li\"><a style=\"color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;\" href=\"javascript:showLogin('#login-modal_2')\">登录</a></li><li id=\"register_li\"><a style=\"color:green; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:15px;\" href=\"javascript:showLogin('#signup-modal_2')\">注册</a></li>")
		},
	});
}
//videoplay.jsp退出事件
function loginExit2(){
	$.ajax({
		type:"post",
		url:"main/user_main_exit.action",
		dataType:"json",
		success:function(data){
			$("#personId").val("");
			$("#login_header").html("<li id=\"login_lii\"><a style=\"color:yellow; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:0px;\" href=\"javascript:showLogin('#login-modal_2')\">登录</a></li>"+
				"<li id=\"register_li\"><a style=\"color:yellow; background:#12121; display:block; width:70px; margin:5px auto; font-size:16px;  letter-spacing:3px; height:35px; line-height:0px;\" href=\"javascript:showRegister('#signup-modal_2')\">注册</a></li>");
			$("#biji_input_div").html("");
		},
	});
}

function addCollect(courseId){
	var userId=$("#personId").val();
	if(userId){
		$.ajax({
			type:"post",
			data:{
				"userCourse.user.id":userId,
				"userCourse.course.id":courseId,
			},
			url:"/slowplay/main/main/user_addUserCourse.action",
			success:function(data){
				if(data==1){
					alert("已加入收藏~！");
				}else{
					alert(data);
				}
			},
		});
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
	
}

//登录
$("#login_butt").click(function(){
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
					$("#login_header").html("<li id=\"login_li\" style=\"margin-top: 38px;\">"+
						"<a style=\"display: inline;margin: 0px;padding: 0px;\" href=\"/slowplay/main/person_main.jsp\">【 "+data.realname+"】</a>，"+
					"您好<a style=\"display: inline;\" href=\"javascript:loginExit()\">注销</a>"+
					"</li>");
					$("#personId").val(data.id);
					closeLogin("#login-modal_2");
				}
			}
		});
	}
});

function showFuhao(fuhao) {
	$(fuhao).slideToggle("fast", function() {

	});
}

$('#fuhao a').each(function(){
	$(this).click(function(){
		inimage("#comment_input_div",$(this).html());
	}) 
})

$('#fuhao_1 a').each(function(){
	$(this).click(function(){
		inimage("#biji_input_div",$(this).html());
	}) 
})

/**获得光标位置，将图标插入指定位置*/
function inimage(box_id,text){
	 var obj= $(box_id)[0];
	 var range, node;
	 if(!obj.hasfocus) {
	  obj.focus();
	 }
    if (window.getSelection && window.getSelection().getRangeAt) {
        range = window.getSelection().getRangeAt(0);
	  range.collapse(false);
	        node = range.createContextualFragment(text);
	  var c = node.lastChild;
	        range.insertNode(node);
	  if(c){
	   range.setEndAfter(c);
	   range.setStartAfter(c)
	  }
	  var j = window.getSelection();
	  j.removeAllRanges();
	  j.addRange(range);
  
    } else if (document.selection && document.selection.createRange) {
        document.selection.createRange().pasteHTML(text);
    }
}

/**展开隐藏楼中楼*/
function showLZL(id){
	$(id).slideToggle("fast", function() {

	});
}

/**回复某人*/
function replySomeOne(id,str){
	$("#comment_input_div").html("<span id=\"commentHiddenPerson\" contenteditable=\"false\" style=\"background:yellow;display:inline;width:200px;\">@ "+str+" :<input id=\"hiddenCommentId\" type=\"hidden\" value=\""+id+"\"></span>");
}


/**发表评论*/
$("#comment-btn").click(function(){
	var pid=$("#hiddenCommentId").val();
	var personId=$("#personId").val();
	var videoId=$("#hiddenVideoId").val();
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
			//alert("userId:"+$("#personId").val()+" videoId"+$("#hiddenVideoId").val()+" content:"+$("#comment_input_div").html()+" pid:"+pid);
			$.ajax({
				type:"post",
				data:{
					"comment.user.id":$("#personId").val(),
					"comment.video.id":$("#hiddenVideoId").val(),
					"comment.content":$("#comment_input_div").html(),
					"comment.pid":pid,
					"page.page":$("#nowPage").val(),
				},
				url:"main/comment_addComment.action",
				dataType:"json",
				success:function(ajaxMap){
					data=ajaxMap.commentList;
					pageData=ajaxMap.page;
					pageNum=pageData.page;
					allPage=pageData.allPage;
					$("#comment_input_div").html("");
					var str="";
					$.each(data,function(){
						str=str+"<li id=\"item73929\"><div class=\"userimg\">"+
						"<a class=\" js-user-card\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+
							"<img class=\"img-responsive\" src=\""+this.user.path+"\">"+
						"</a></div><div class=\"userInfo\"><p class=\"head\">"+
							"<a href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a><span>"+this.time+"</span>"+
						"</p><div class=\"body\">"+this.content+"</div><div class=\"pull-right  \">";
						if(this.chdComment!=null){
							str=str+"<a class=\"con\" href=\"javascript:showLZL('#lzl_"+this.id+"');\">收缩/展开("+this.chdComment.length+")</a>";
						}
						str=str+"<a class=\"con\" href=\"javascript:replySomeOne("+this.id+",'"+this.user.realname+"');\">回复</a></div></div>";
						if(this.chdComment!=null){
							str=str+"<div id=\"lzl_"+this.id+"\" style=\"background: rgb(230, 239, 204);margin-left: 70px;\">";
							$.each(this.chdComment,function(){	
								str=str+"<div style=\"margin-left: 10px;\"><div style=\"height: 5px;\"></div>"+
									"<img style=\"width: 30px;display: inline;border-radius:50%\" class=\"img-responsive\" src=\""+this.user.path+"\" alt=\"清水自然\">"+
									"<a style=\"display: inline;\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a><span style=\"margin-left: 30px;\">"+this.time+"</span>"+
									"<div style=\"margin-left: 40px;\">"+this.content+"</div><div style=\"height: 5px;\"></div></div>";			
							});
						}
						if(this.chdComment!=null){
							str=str+"</div>";
						}
						str=str+"</li>";
					});
					$("#commentList").html(str);
					var pageStr="";
					if(pageNum!=1){
						pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showCommentByPage(1)\">首页</a></span>";
					}
					if(pageNum>1){
						pageStr=pageStr+"<span style=\"margin-left:30px;\"><a href=\"javascript:showCommentByPage("+(pageNum-1)+")\">上一页</a></span>";
					}
					if(pageNum<allPage){
						pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showCommentByPage("+(pageNum+1)+")\">下一页</a></span>";
					}
					if(pageNum!=allPage){
						pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showCommentByPage("+allPage+")\">尾页</a></span>";
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
		}else{
			alert("评论类容不能为空");
		}
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
})

/**分页查询评论*/
function showCommentByPage(pageNum){
	$("#nowPage").val(pageNum);
	var allPage=$("#allPage").val();
	var pageStr="";
	if(pageNum!=1){
		pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showCommentByPage(1)\">首页</a></span>";
	}
	if(pageNum>1){
		pageStr=pageStr+"<span style=\"margin-left:30px;\"><a href=\"javascript:showCommentByPage("+(pageNum-1)+")\">上一页</a></span>";
	}
	if(pageNum<allPage){
		pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showCommentByPage("+(pageNum+1)+")\">下一页</a></span>";
	}
	if(pageNum!=allPage){
		pageStr=pageStr+"<span style=\"margin-left:50px;\"><a href=\"javascript:showCommentByPage("+allPage+")\">尾页</a></span>";
	}
	pageStr=pageStr+"<span style=\"margin-left:50px;\">第"+pageNum+"页，共"+allPage+"页</span>";
	$("#pageContent").html(pageStr);
	$.ajax({
		type:"post",
		data:{
			"comment.video.id":$("#hiddenVideoId").val(),
			"page.page":pageNum,
		},
		url:"main/comment_queryCommentByPage.action",
		dataType:"json",
		success:function(data){
			var str="";
			$.each(data,function(){
				str=str+"<li id=\"item73929\"><div class=\"userimg\">"+
				"<a class=\" js-user-card\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+
					"<img class=\"img-responsive\" src=\""+this.user.path+"\">"+
				"</a></div><div class=\"userInfo\"><p class=\"head\">"+
					"<a href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a><span>"+this.time+"</span>"+
				"</p><div class=\"body\">"+this.content+"</div><div class=\"pull-right  \">";
				if(this.chdComment!=null){
					str=str+"<a class=\"con\" href=\"javascript:showLZL('#lzl_"+this.id+"');\">收缩/展开("+this.chdComment.length+")</a>";
				}
				str=str+"<a class=\"con\" href=\"javascript:replySomeOne("+this.id+",'"+this.user.realname+"');\">回复</a></div></div>";
				if(this.chdComment!=null){
					str=str+"<div id=\"lzl_"+this.id+"\" style=\"background: rgb(230, 239, 204);margin-left: 70px;\">";
					$.each(this.chdComment,function(){	
						str=str+"<div style=\"margin-left: 10px;\"><div style=\"height: 5px;\"></div>"+
							"<img style=\"width: 30px;display: inline;border-radius:50%\" class=\"img-responsive\" src=\""+this.user.path+"\">"+
							"<a style=\"display: inline;\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a><span style=\"margin-left: 30px;\">"+this.time+"</span>"+
							"<div style=\"margin-left: 40px;\">"+this.content+"</div><div style=\"height: 5px;\"></div></div>";			
					});
				}
				if(this.chdComment!=null){
					str=str+"</div>";
				}
				str=str+"</li>";
			});
			$("#commentList").html(str);
		},
	});
}

function gotoRight(){
	$("#right_content_box").css("width","20px");
	$("#right_content_ul").hide();
	$("#right_content_div").hide();
	$("#back_left").show();
	$("#back_right").hide();
	$("#video_play_box").css("width","1550px");
	$("#example_video_1").attr("width","1100px;");
	$("#example_video_1").attr("height","610px;");
	$("#example_video_1").css("margin-left","120px");
	$("#video_play_box").css("background","black");
	$("#login_header_div").hide();
	$("#lesson-dashboard").css("height","700px");
	$("html").css("overflow","hidden");
	pageScroll();
}

function gotoLeft(){
	$("#right_content_box").css("width","324px");
	$("#right_content_ul").show();
	$("#right_content_div").show();
	$("#back_right").show();
	$("#back_left").hide();
	$("#video_play_box").css("width","1510px");
	$("#example_video_1").attr("width","1010px;");
	$("#example_video_1").attr("height","580px;");
	$("#example_video_1").css("margin-left","15px");
	$("#video_play_box").css("background","#333");
	$("#login_header_div").show();
	$("html").css("overflow","auto");
}

function showBiji(){
	var personId=$("#personId").val();
	var videoId=$("#hiddenVideoId").val();
	if(personId!=""){
		$.ajax({
			type:"post",
			data:{
				"note.user.id":personId,
				"note.video.id":videoId,
			},
			url:"/slowplay/main/note_queryMyNote.action",
			dataType:"json",
			success:function(data){
				$("#biji_input_div").html(data.content);
				if(data.status=='yes'){
					$("#shareNote").attr("checked","checked");
				}
			},
		});
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
}

function saveNote(){
	var personId=$("#personId").val();
	var videoId=$("#hiddenVideoId").val();
	var status=$("input[name='noteStatus']:checked").val();
	if(status!='yes'){
		status='no';
	}
	if(personId!=""){
		var replyStr=$("#biji_input_div").html();
		//replyStr = replyStr.replace(/<\/?[^>]*>/g,''); //去除HTML tag  
		replyStr = replyStr.replace(/[ | ]* /g,''); //去除行尾空白  
	    replyStr=replyStr.replace(/&nbsp;/ig,'');//去掉  
		if(replyStr!=""){
			replyStr=""+$("#biji_input_div").html()+" ";
			$.ajax({
				type:"post",
				data:{
					"note.user.id":personId,
					"note.video.id":videoId,
					"note.status":status,
					"note.content":replyStr,
				},
				url:"/slowplay/main/note_addNote.action",
				dataType:"json",
				success:function(data){
					alert("添加成功~！");
				},
			});
		}else{
			alert("笔记类容不能为空~！");
		}
	}else{
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
}

function showFriendNote(){
	var videoId=$("#hiddenVideoId").val();
	$.ajax({
		type:"post",
		data:{
			"note.video.id":videoId,
		},
		url:"/slowplay/main/note_queryFriendNote.action",
		dataType:"json",
		success:function(data){
			if(data!=null){
				var strBuff="";
				$.each(data,function(){
					strBuff=strBuff+"<li><div class=\"notes-img\"><a class=\" js-user-card\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\"> "+
						"<img class=\"avatar-mm\" src=\""+this.user.path+"\"></a></div><div class=\"notes-content\">"+
						"<span class=\"name\"><a href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a></span><div class=\"content\">"+
						"<div class=\"short-content\">"+this.content+"</div></div> " +
						"</div></li>";
				});
				$("#friendNotes_ul").html(strBuff);
			}
		},
	});
}

/**显示所有的问题*/
function showQuestion(){
	var videoId=$("#hiddenVideoId").val();
	$.ajax({
		type:"post",
		data:{
			"question.video.id":videoId,
		},
		url:"/slowplay/main/question_queryQuestionByVideo.action",
		dataType:"json",
		success:function(data){
			var strBuff="";
			if(data!=""){
				$.each(data,function(){
					strBuff=strBuff+"<li style=\"padding:18px 0 10px 30px;\">"+
					"<button onclick=\"window.location='/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"&isQuery="+this.id+"'\" class=\"btn submit pull-right\" style=\"margin-top: 10px;margin-right: 30px;\">点击查看</button>"+
					"<div class=\"media-left\"><a class=\" js-user-card\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\"> "+
					"<img class=\"avatar-sm \" src=\""+this.user.path+"\">"+
					"</a></div><div class=\"question-contents media-body\">"+
					"<div class=\"name\"><a class=\"link-light\" href=\"/slowplay/main/main/user_visitFriend.action?user.id="+this.user.id+"\">"+this.user.realname+"</a>"+
					"</div><div class=\"questionList_contents\">"+this.title+"</div></div></li>";
				})
			}
			$("#questionList").html(strBuff);
		}
	});
}

/**发布问题*/
$("#lesson_qustion_form_btn").click(function(){
	var title=$("#question_title").html();
	var content=$("#question_content").html();
	var personId=$("#personId").val();
	var videoId=$("#hiddenVideoId").val();
	if(personId==""){
		alert("请先登录~！");
		showLogin("#login-modal_2");
	}
	else if(title==""){
		alert("标题不能为空");
	}else{
		$.ajax({
			type:"post",
			data:{
				"question.user.id":personId,
				"question.video.id":videoId,
				"question.title":title,
				"question.content":content,
			},
			url:"/slowplay/main/question_addQuestion.action",
			success:function(data){
				alert("提交成功~！");
				$("#question_title").html("");
				$("#question_content").html("");
				showQuestion();
			}
		});
	}
})