package com.goldsoft.dao;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.core.common.PagingList;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;

//这样写不能进行远程调用RMI和WebService，与action耦合性太强了，(页码、pagesize、过滤条件三个参数即可，action->service->dao传递)
public class BaseDAOImpl extends HibernateDaoSupport {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	/* ValueStack */
	public ValueStack getValueStack() {
		return ActionContext.getContext().getValueStack();
	}
	
	/* PagingList */
	
	/**
	 * 
	 */
	@SuppressWarnings("rawtypes")
	public PagingList getPagingList(String hql,Object... params) {
		log.debug("(6)[ValueStack]"+this.getValueStack());	
		int offset = 0;
		Object obj = this.getValueStack().findValue("pager.offset");
		if(obj != null) offset = ((Integer)obj).intValue();
		return new PagingList(offset,this.getHibernateTemplate(),hql,params);
	}

	
	@SuppressWarnings("rawtypes")
	public PagingList getPagingList(int pageSize, String hql, Object... params) {
		log.debug("(6)[ValueStack]"+this.getValueStack());	
		int offset = 0;
		Object obj = this.getValueStack().findValue("pager.offset");
		if(obj != null) offset = ((Integer)obj).intValue();
		return new PagingList(offset,pageSize,this.getHibernateTemplate(),hql,params);
	}
	
	
	
}
