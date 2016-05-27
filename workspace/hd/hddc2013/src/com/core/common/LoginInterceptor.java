package com.core.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.core.Constants;
import com.core.util.QueryUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 登录拦截器，用于阻止未登录用户访问系统
 */
@SuppressWarnings("serial")
public class LoginInterceptor implements Interceptor {
	protected final Log log = LogFactory.getLog(getClass());

	public void destroy() {
	}

	public void init() {
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		log.debug("[测试Interceptor单例运行]this:"+this);
		Action action = (Action) invocation.getAction();
		
		String actionName = invocation.getInvocationContext().getName();
//		//这里要求实现了Anonymous接口的Action以及固定的login和logoutAction可以跳过登录拦截
//		//TODO:Action名是否可改为从配置文件读取
//		log.debug("action:"+action);
//		//由控制台输出知:此时ValueStack与构造方法中不同;
//		//执行顺序:Action构造方法->interceptor->...
//		log.debug("ValueStack:"+invocation.getStack());
//		log.debug("ValueStack:"+invocation.getInvocationContext().getValueStack());
//		log.debug("ValueStack:"+ServletActionContext.getValueStack(ServletActionContext.getRequest()));
//		log.debug("ValueStack:"+ActionContext.getContext().getValueStack());
//		log.debug("the name of the current action:"+actionName);
//		log.debug("ActionProxy:"+invocation.getProxy());
//		log.debug("the alias name this ActionProxy is mapped to:"+invocation.getProxy().getActionName());
//		log.debug("Namespace:"+invocation.getProxy().getNamespace());
//		log.debug("Method:"+invocation.getProxy().getMethod());
//		log.debugn("servletPath>>>"+ServletActionContext.getRequest().getServletPath());
//	    //ActionContext.getContext().getValueStack().set("_ACTION_PATH_", ServletActionContext.getRequest().getServletPath());
		String method = invocation.getProxy().getMethod();
		//log.debug("[method]"+method);
		if (action instanceof Anonymous || ("login".equals(actionName) && "execute".equals(method))|| "logout".equals(actionName)) {
			log.debug("if>>>");
			return invocation.invoke();
		} else {
			if (ActionContext.getContext().getSession().get(Constants.LOGIN_USER) != null) {
				return invocation.invoke();
			}
		}

		ActionContext.getContext().getSession().put(Constants.ORIGINAL_URL,
				QueryUtil.getRequestURL(ServletActionContext.getRequest()));
		return Action.LOGIN;//namespace为/
	}

}
