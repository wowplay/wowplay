package com.xtkj.wowplay.action;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

/**
 * 获取servlet API
 * @author Wangyan
 *
 */
public class BaseAction {
	
	public Map getRequest(){
		return (Map) ActionContext.getContext().get("request");
	}
	
	public Map getSession(){
		
		return (Map)ActionContext.getContext().getSession();
	}
	
	public Map getApplication(){
		
		return (Map)ActionContext.getContext().getApplication();
	}
	
	public HttpServletResponse getResponse(){
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		return response;
	}
	
}
