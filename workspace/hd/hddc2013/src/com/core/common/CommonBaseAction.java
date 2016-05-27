package com.core.common;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.core.Constants;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.StringUtil;

/**
 * Action 基类
 */
@SuppressWarnings("serial")
public class CommonBaseAction extends ActionSupport {
	public CommonBaseAction(){//ValueStack:继承一系列构造方法中输出一致，但和list()方法中输出不一致，
		//所以在构造方法中向值栈中保存数据以后使用是行不通的。为什么？
		log.debug("[测试Action多例例运行]this:"+this);
		log.debug("(1)[ValueStack]"+ActionContext.getContext().getValueStack());
		this.actionPath = this.getRequest().getServletPath();// /manage/example/product!list.action,可在LoginInterceptor中放入值栈中(拦截jsp吗？如果拦截则不可将此操作放入LoginInterceptor)
	}
	protected String actionPath;
	protected Map<String,String> paramMap;
	protected int x;
	
	/* 日志 */
	//struts1.x/2.x:commons-logging    hibernate/spring:log4j
	//protected final Log log = LogFactory.getLog(getClass());
	protected final Logger log = (Logger) Logger.getLogger(this.getClass().getName());
	/* 默认返回SUCCESS */
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	/* 获取基本环境 */
	@SuppressWarnings("rawtypes")
	public Map getParameters() {
		return ActionContext.getContext().getParameters();
	} // 封装为Map的request parameters
	
	public Map<String,Object> getSession() {
		return ActionContext.getContext().getSession();
	} // 封装为Map的session attributes

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	} // 原始的request

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	} // 原始的response

	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	} // 原始的ServletContext

	/* 分页信息 */
	@SuppressWarnings("rawtypes")
	protected PagingList pager;
	
	@SuppressWarnings("rawtypes")
	public PagingList getPager() {
		return pager;
	}
	
	@SuppressWarnings("rawtypes")
	public void setPager(PagingList pager) {
		log.debug("(4)[ValueStack]"+ActionContext.getContext().getValueStack());
		this.pager = pager;
		/*Map map = this.getParameters();
		String[] offset = ((String[])map.get("pager.offset"));
		if(offset != null) 
			ActionContext.getContext().put("pager.offset", offset[0]);
		*/
		
		//ActionContext.getContext().put("pager.offset", this.getRequest().getParameter("pager.offset"));
		
		/*String _ACTION_PATH_ = this.getRequest().getServletPath();
		ActionContext.getContext().getValueStack().set("_ACTION_PATH_",  _ACTION_PATH_);//这样放入ValueStack的数据在Property Name不出现,
		//这跟request的parameter集合与attribute集合不同很像
*/		
		//ActionContext.getContext().put("_ACTION_PATH_", _ACTION_PATH_);	
	}
	
	public String getActionPath(){
		log.debug("(7)[ValueStack]"+ActionContext.getContext().getValueStack());
		//return ActionContext.getContext().getValueStack().findString("_ACTION_PATH_");// /manage/example/product!list.action
		//return ActionContext.getContext().get("_ACTION_PATH_").toString();
		return this.actionPath;	
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,String> getParamMap() {
		//比放在构造函数中为好(但放在此处执行次数多些,亦在此角度影响效率),深刻理解
		
		if(this.paramMap == null){//否则每个请求将会重复执行参数提取,即页面只要${paramMap}就会执行一次
			String strMethod = this.getRequest().getMethod();
			
			this.paramMap = new HashMap<String,String>();
			
			if("POST".equals(strMethod)){
				Map<String,Object> map = this.getParameters();
				map.remove("pager.offset");
				for(Object key:map.keySet()){//(1)keySet
					String[] v = (String[])map.get(key);
					
					//log.debug("@@@key|value@@@:"+key+"|"+v[0]);
					this.paramMap.put((String)key, v[0]);
					//this.params += "&"+key+"="+ v[0]; //utf-8
				}
			}/*else{//"GET" 
				Map<String,String[]> map = this.getParameters();
				map.remove("pager.offset");
				for(Map.Entry<String, String[]> m : map.entrySet()){//(2)entrySet
				
					this.paramMap.put(m.getKey(), StringUtil.isoTOgb(m.getValue()[0]));
				}
			}*/
			log.debug("paramMap:"+this.paramMap+"|"+this.getRequest().getMethod());
		}
		return this.paramMap;
	}



	public String getReferUrl() {
		return (String) getSession().get(Constants.REFER_URL);
	}
	
	public String getFullReferUrl() {
		return getRequest().getContextPath() + getReferUrl();
	}
	
	/* 工具类方法 */
	public Date getNow() {
		return new Date();
	}
	
}