package com.goldsoft.filter;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		
		String currentUser="currentUser";
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpSession session=request.getSession();
		Date date=new Date();
		request.getSession().setAttribute("month", 0);
		request.getSession().setAttribute("time", 15);//十月初不能使用
		//System.out.println(request.getRequestURI()+"||"+request.getRequestURL());
		//System.out.println(b.toString()+" dfsfgdfg");
		if(Integer.parseInt(request.getSession().getAttribute("month").toString())>Integer.parseInt(request.getSession().getAttribute("time").toString())-1){
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else  if(request.getRequestURI().endsWith("user!login.action")||request.getRequestURI().endsWith("rand.action")){
			//System.out.println("in");
			actionInvocation.invoke();
		}else{
			if(session.getAttribute(currentUser)!=null){
				actionInvocation.invoke();
			}else{
				response.sendRedirect(request.getContextPath()+"/login.jsp");
			}
		}
		
		
		
		//System.out.println("out");
		return null;
	}

}
