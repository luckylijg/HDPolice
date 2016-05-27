package com.goldsoft.dao.impl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.core.common.PagingList;
import com.core.util.QueryHelper;
import com.goldsoft.dao.BaseDAOImpl;
import com.goldsoft.dao.UserDAO;
import com.goldsoft.model.User;


@Repository
public class UserDAOImpl extends BaseDAOImpl implements UserDAO {

	@Override
	public void add(User user) {
		this.getHibernateTemplate().save(user);
	}

	@Override
	public void update(User user) {
		this.getHibernateTemplate().saveOrUpdate(user);
	}

	@Override
	public void delete(int userid) {
		this.getHibernateTemplate().delete(this.get(userid));
	}

	@Override
	public User get(int userid) {
		return this.getHibernateTemplate().get(User.class,userid);
	}
	
	
	//@Override
	//public PagingList<User> getList() {
		//return this.getPagingList(10,"from User");
	//}

	@SuppressWarnings("unchecked")
	public List<User> getlist() {
		List<User> list = this.getHibernateTemplate().find("from User");
		System.out.println(list.size());
		return list;
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public User getUserByName(String userName) {
		
		List<User> list=this.getHibernateTemplate().find("from User where username=?",userName);
		if(list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}

	@Override
	public List<User> getlist(int type) {
		return this.getHibernateTemplate().find("from User u where u.department.type=?", type);
		 
	}
	
	public List<User> search(){
		Calendar c=Calendar.getInstance();
		Date date=c.getTime();
		Date date2=c.getTime();
		date2.setDate(1);
		return this.getHibernateTemplate().find("from User where indate<? and indate>?",date,date2);
	}

	@Override
	public List<User> getListByDepart(int departid) {
		return this.getHibernateTemplate().find("from User where departmentid=?",departid);
	}
	
	public PagingList<User> searchlist(int departmentid, String realname, int sex2,Timestamp date1,Timestamp date2) {
		QueryHelper qh = new QueryHelper("from User");
		qh.setParam(departmentid==-2?false:true,"department.departmentid=?",departmentid);
		qh.setParam(qh.isNotNullOrBlank(realname), "realname like ?", "%"+realname+"%");
		qh.setParam(sex2==2?false:true, "sex=?", sex2);
		qh.setParam(date1==null?false:true, "entrytime>='"+date1+"'");
		qh.setParam(date2==null?false:true, "entrytime<='"+date2+"'");
		//Date indate=new Date();
		/*indate.setMonth(4);
		indate.setDate(1);*/
		//Timestamp t=new Timestamp(indate.getYear(), indate.getMonth(), indate.getDate(),indate.getHours(), indate.getMinutes(), indate.getSeconds(), 0);
		//System.out.println(indate);
		//qh.setParam(indate !=null, "indate <", t);
		//this.getHibernateTemplate().find("from User where indate<" +t);
		log.debug(qh.getQuerySql()+"  |  "+qh.getParams());
		return this.getPagingList(10,qh.getQuerySql(),qh.getParams());
		
	}

	@Override
	public PagingList<User> getListByPage() {
		
		return this.getPagingList(10, "from User order by userid");
	}
}
