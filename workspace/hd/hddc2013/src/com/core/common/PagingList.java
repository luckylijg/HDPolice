package com.core.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.core.Constants;

public class PagingList<T>{
	private final Log log = LogFactory.getLog(getClass());
	
	public PagingList(){}
	
	public PagingList(final int offset, HibernateTemplate hibernateTemplate, final String hql,final Object... params ){
    	this(offset, Constants.DEFAULT_PAGE_SIZE, hibernateTemplate, hql, params );
    }
    
    @SuppressWarnings("unchecked")
	public PagingList(final int offset, final int pageSize, HibernateTemplate hibernateTemplate, final String hql,final Object... params) {
		this.offset = offset;
    	this.pageSize = pageSize;//(1)
		this.setMaxElements(hibernateTemplate,hql,params);//(2)
		this.setPageNumber(pageNumber);//(3):必须放在(1)(2)之后
		list = getListForPage(offset, this.pageSize, hibernateTemplate, hql, params);
	}
   
    public void setPageNumber(int pageNumber){// 设置当前页码
	    int validPage = pageNumber <= 0 ? 1 : pageNumber;
	    validPage = validPage > getMaxPages() ? getMaxPages() : validPage;
	    this.pageNumber = validPage;
	}
    
	@SuppressWarnings("rawtypes")
	private void setMaxElements(HibernateTemplate hibernateTemplate,final String hql,final Object... params) {
		
		String hql2=hql.substring( hql.indexOf("from"),hql.length());
		
		
		List list = hibernateTemplate.find("select count(*) " + hql2,params);
		this.maxElements = ((Number)list.get(0)).intValue();
		//this.maxElements = hibernateTemplate.find(hql,params).size();//hql:"from Sort"
	}
	
    private int pageSize = Constants.DEFAULT_PAGE_SIZE; // 每页记录数
    
    private int pageNumber = 1; // 当前页码
    
	private int maxElements;// 记录总数
	
	private int offset;
	
	public void setOffset(int offset) {
		log.debug("测试setPager(..)谁先执行>>>>>>>");
		this.offset = offset;
	}
	
	public int getOffset(){ // 不包含，起始索引为0
	     //return (pageNumber-1) * pageSize;
		return offset;
	}
	
	//private int maxPages;// 分页总数
	
	List<T> list;//记录列表
	
	public List<T> getList() {
		return list;
	}
	
	private int getMaxPages() {
		 return (maxElements+(pageSize-1))/pageSize;
	}
    
	public int getMaxElements(){// 得到记录总数
        return this.maxElements;
    }
    
    public int getPageNumber(){
        return pageNumber;
    }
    
    public int getPageSize(){
        return pageSize;
    }
    
    public void setPageSize(int pageSize){
        this.pageSize = pageSize;
    }
    
	/**
	 * 注:不传hibernateTemplate则session出错
	 * 
	 * 使用hql 语句进行操作
	 * @param hql HSQL 查询语句
	 * @param offset 开始取数据的下标
	 * @param length 读取数据记录数
	 * @return List 结果集
	 */
	@SuppressWarnings("rawtypes")
	public List getListForPage( final int offset,
			final int length,HibernateTemplate hibernateTemplate, final String hql,final Object... params) {//jdk5动态参数
		List list = hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				//log.debug("/*"+session+"*/");
				//System.out.println("paginglist          "+hql);
				Query query = session.createQuery(hql);//执行HQL
				//Query query = session.createSQLQuery(sql);//执行原生SQL
				if(params != null)
					for(int i = 0;i < params.length;i++){
						query.setParameter(i, params[i]);
					}
				
				query.setFirstResult(offset);
				query.setMaxResults(length);
				List list = query.list();
				//System.out.println(list.size()+"aaaaaaaaaaaaaaaa");
				return list;
			}
		});
		return list;
	}
	
	
}
