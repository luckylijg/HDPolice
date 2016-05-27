package com.goldsoft.dao.impl;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Repository;

import com.core.common.PagingList;
import com.core.util.QueryHelper;
import com.goldsoft.dao.BaseDAOImpl;
import com.goldsoft.dao.ComplaintDAO;
import com.goldsoft.model.Complaint;
import com.opensymphony.xwork2.ActionContext;
@Repository
public class ComplaintDAOImpl extends BaseDAOImpl implements ComplaintDAO {

	
	
	private static final String yesno2 = null;
	@Override
	public Complaint get(int id) {
		
		return this.getHibernateTemplate().get(Complaint.class, id);
	}

	@Override
	public void add(Complaint complaint) {
		
		this.getHibernateTemplate().save(complaint);
	}

	@Override
	public void update(Complaint complaint) {
		
		this.getHibernateTemplate().saveOrUpdate(complaint);
	}

	@Override
	public void delete(int id) {
		this.getHibernateTemplate().delete(this.get(id));
		
	}
	
	@SuppressWarnings({ "unchecked" })
	@Override
	public PagingList<Complaint> getListForsearch(int type,String time1,String time2,int userid){
	
	
		
		
		String hql="select com from Complaint as com  ";

		QueryHelper qHelper = new QueryHelper(hql);
		
	
		qHelper.setParam(type!=5, "com.type=?", type);
		
		qHelper.setParam(qHelper.isNotNullOrBlank(time1), "com.time>='"+time1+"'");
		qHelper.setParam(qHelper.isNotNullOrBlank(time2), "com.time<='"+time2+"'");
		qHelper.setParam(userid!=-1, "com.userByUserid.userid=?",userid);
		
		PagingList<Complaint> list= null;
			list = this.getPagingList(10, qHelper.getQuerySql()+" order by com.time desc", qHelper.getParams());

		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Complaint> getList(int type) {
		List<Complaint> list;
		switch (type) {
		case 0:
			
			list = this.getHibernateTemplate().find("from Complaint com where com.type = ?", type);
			break;
		case 1:
			list = this.getHibernateTemplate().find("from Complaint com where com.type = ?", type);
			break;
		case 2:
			list = this.getHibernateTemplate().find("from Complaint com where com.type = ?", type);
			break;
		case 3:
			list = this.getHibernateTemplate().find("from Complaint com where com.type = ?", type);
			break;
		default:
			list = this.getHibernateTemplate().find("from Complaint");
			break;
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PagingList<Complaint> getListByType(int type) {
		
		PagingList<Complaint> list;

		ServletActionContext.getRequest().getSession().setAttribute("auditSql", "from Complaint com  where com.leaderapproved<"+5);
		
		if(ServletActionContext.getRequest().getSession().getAttribute("auditparSql")!=null){
			ServletActionContext.getRequest().getSession().removeAttribute("auditparSql");
		}
		//Object[] obj=new Object[5];
		//ServletActionContext.getRequest().getSession().setAttribute("auditparSql", obj);
		
			list = this.getPagingList(10,"from Complaint com  where com.leaderapproved<?" +  "order by com.time desc",5);
			ServletActionContext.getRequest().getSession().setAttribute("auditsql", this.getHibernateTemplate().find("from Complaint com  where com.leaderapproved<?" +  "order by com.time desc",5));
		return list;
	}
	
	@SuppressWarnings({ "unchecked" })
	@Override
	public PagingList<Complaint> getListForAudit(String time1,String time2,
			int departmentid, int realname, int depname, int que,
			int yesno,int leaderapproved) {

		String temp=""; 
		if(depname!=-1){
			 temp=temp+" inner join com.departments as depart";
		 }
		if(que!=-1){
			 temp=temp+" inner join com.questionSorts as question";
		}
		if(realname!=-1){
			 temp=temp+" inner join com.users as user";
		}

		String hql="select com from Complaint as com "+temp;

		QueryHelper qHelper = new QueryHelper(hql);
		qHelper.setParam(true, "com.leaderapproved!=3");
		qHelper.setParam(leaderapproved!=3?true:false, "com.leaderapproved=?",leaderapproved);

		qHelper.setParam(qHelper.isNotNullOrBlank(time1), "com.time>'"+time1+"'");
		qHelper.setParam(qHelper.isNotNullOrBlank(time2), "com.time<='"+time2+"'");

		qHelper.setParam(departmentid==-1?false:true, "com.department.departmentid=?", departmentid);

		qHelper.setParam(depname!=-1?true:false, "depart.departmentid=?",depname);
		qHelper.setParam(que!=-1?true:false, "question.questionsortid=?", que);
		qHelper.setParam(realname!=-1?true:false, "user.userid=?", realname);
		qHelper.setParam(yesno!=-1?true:false, "com.earlywarning=?", yesno);
		

		ServletActionContext.getRequest().getSession().setAttribute("auditSql", qHelper.getQuerySql());
		ServletActionContext.getRequest().getSession().setAttribute("auditparSql", qHelper.getParams());

		PagingList<Complaint> list= this.getPagingList(10, qHelper.getQuerySql()+" order by com.time desc", qHelper.getParams());

		return list;
	}
	
	
	

	@SuppressWarnings("unchecked")
	@Override
	public List<Complaint> getListByEarlyWarning() {
		List<Complaint> list=this.getHibernateTemplate().find("from Complaint where earlywarning=1 and leaderapproved=1");

		
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Complaint> searchListByEarlyWarning(String date1,String date2) {
		
			/*if(yesno!=3){		
		return this.getHibernateTemplate().find("from Complaint where yesno="+yesno+
				"and earlywarning=1 and leaderapproved=1 and time>= '"+date1+"' and  time<= '"+date2+"'");
		}else{*/
			return this.getHibernateTemplate().find("from Complaint where earlywarning=1 and leaderapproved=1 and time>= '"+date1+"' and  time<= '"+date2+"'");
			
		//}			
	}
	

	@Override
	public Complaint getComplaintBySno(String sno) {
		
		
		return (Complaint) this.getHibernateTemplate().find("from Complaint com where com.sno = ?", sno).get(0);
	
	}
	
	
	@SuppressWarnings({ "unchecked" })
	@Override
	public PagingList<Complaint> getListForStatistics(int type,String time1,String time2,
			int departmentid, int realname, int depname, int que,int han,
			int mode ,int yesno,int leaderapproved,int yesno2){
	
	
		String temp=""; 
		if(depname!=-1){
			 temp=temp+" inner join com.departments as depart";
		 }
		if(que!=-1){
			 temp=temp+" inner join com.questionSorts as question";
		}
		if(realname!=-1){
			 temp=temp+" inner join com.users as user";
		}

		if(han!=-1){
			temp = temp +" inner join com.handleSorts  as handle";
		}

		String hql="select com from Complaint as com  "+temp;

		QueryHelper qHelper = new QueryHelper(hql);
		
		qHelper.setParam(true, "com.leaderapproved=?",1);
		qHelper.setParam(true, "com.type=?", type);
		qHelper.setParam(mode!=3?true:false, "com.mode=?",mode);
		qHelper.setParam(yesno!=-1?true:false, "com.yesno=?", yesno);
		//qHelper.setParam(yesno!=-1?true:false, "com.yesno=?", yesno);
		qHelper.setParam(qHelper.isNotNullOrBlank(time1), "com.time>='"+time1+"'");
		qHelper.setParam(qHelper.isNotNullOrBlank(time2), "com.time<='"+time2+"'");
//System.out.println(yesno2);
		qHelper.setParam(departmentid==-1?false:true, "com.department.departmentid=?", departmentid);
		/*qHelper.setParam(yesno2!=0, yesno2==2?"com.filename2 is not empty":"com.filename2 is empty");*/
		qHelper.setParam(yesno2==2, "com.filename2=?","");
		qHelper.setParam(yesno2==1, "com.filename2!=?","");
		qHelper.setParam(depname!=-1?true:false, "depart.departmentid=?",depname);
		qHelper.setParam(que!=-1?true:false, "question.questionsortid=?", que);
		qHelper.setParam(realname!=-1?true:false, "user.userid=?", realname);
		qHelper.setParam(han!=-1, "handle.handlesortid=?", han);
		
		PagingList<Complaint> list= null;

		ServletActionContext.getRequest().getSession().setAttribute("StatisticSql", qHelper.getQuerySql());
		ServletActionContext.getRequest().getSession().setAttribute("StatisticparSql", qHelper.getParams());

			list = this.getPagingList(10, qHelper.getQuerySql()+" order by com.time desc", qHelper.getParams());

		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PagingList<Complaint> getListByPage(int type, int userid) {
		
		PagingList<Complaint> list;
		QueryHelper qh = new QueryHelper("from Complaint as com ");
		qh.setParam(type!=5, "com.type = ?", type);
		qh.setParam(userid!=-1, "com.userByUserid.userid=?",userid);
		
		ServletActionContext.getRequest().getSession().setAttribute("complaint_list_sql", qh.getQuerySql());
		ServletActionContext.getRequest().getSession().setAttribute("complaint_list_params", qh.getParams());
		
		list = this.getPagingList(10,qh.getQuerySql()+" order by com.time desc", qh.getParams());
		return list;
	}

	@SuppressWarnings("unchecked")//打印
	@Override
	public List<Complaint> getListPrint(int type, int userid) {
		
		List<Complaint> list;
		/*QueryHelper qh = new QueryHelper("from Complaint as com ");
		qh.setParam(true, "com.type = ?", type);
		qh.setParam(userid!=-1, "com.userByUserid.userid=?",userid);
		*/
		String sql=ServletActionContext.getRequest().getSession().getAttribute("complaint_list_sql").toString();
		Object []params=(Object [])ServletActionContext.getRequest().getSession().getAttribute("complaint_list_params");
		
		list = this.getHibernateTemplate().find(sql,params);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public PagingList<Complaint> getListByStatistic(int type, boolean t,int departid) {
		String temp=""; 
		if(!t){
			 temp=temp+" inner join com.departments as depart";
		 }
		String hql="select com from Complaint as com "+temp;
		QueryHelper qh = new QueryHelper(hql);
		qh.setParam(true, "com.type = ?", type);
		
		qh.setParam(true, "com.leaderapproved=?", 1);
		qh.setParam(!t, "depart.departmentid=?",departid);

		ServletActionContext.getRequest().getSession().setAttribute("StatisticSql", qh.getQuerySql());
		ServletActionContext.getRequest().getSession().setAttribute("StatisticparSql", qh.getParams());

		return this.getPagingList(10,qh.getQuerySql()+" order by com.time desc", qh.getParams());
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Complaint> getListForAuditPrint(String time1, String time2,
			int departmentid, int realname, int depname, int que,
			int yesno, int leaderapproved) {
		String sql=ServletActionContext.getRequest().getSession().getAttribute("auditSql").toString();
		Object []obj=(Object [])ServletActionContext.getRequest().getSession().getAttribute("auditparSql");
		List<Complaint> list;
		if(obj==null){
			list=this.getHibernateTemplate().find(sql);
		}else{

			list=this.getHibernateTemplate().find(sql, obj);
		}

		return list;
	}
	
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Complaint> getListForStatisticsPrint(int type,String time1,String time2,
	int departmentid, int realname, int depname, int que,int han,
	int mode, int yesno,int leaderapproved){
		
	
		//System.out.println(ServletActionContext.getRequest().getSession().getAttribute("StatisticparSql"));
		String sql=ServletActionContext.getRequest().getSession().getAttribute("StatisticSql").toString();
		Object []obj=(Object [])ServletActionContext.getRequest().getSession().getAttribute("StatisticparSql");
		List<Complaint> list;
		
		if(obj==null){
			list=this.getHibernateTemplate().find(sql);
		}else{

			list=this.getHibernateTemplate().find(sql, obj);
		}
		//System.out.println(list.size());
		return list;
	}
	

	@SuppressWarnings("unchecked")
	public PagingList<Complaint> allList(){
		return this.getPagingList(10,"from Complaint where leaderapproved=?  order by time desc",1);
	}
	@SuppressWarnings("unchecked")
	public PagingList<Complaint> serachAll(String date1,String date2,int userid,int departmentid,int questionsortid,
			int handlesortid,String code,String keyword,int departid,int type,int yesno,int filename2){
		System.out.println(departmentid);
		System.out.println(departid);
		String temp="";
		if(userid!=-1){
			 temp=temp+" inner join com.users as user";
		 }
		if(departmentid!=-1){
			 temp=temp+" inner join com.departments as depart";
		 }
		if(questionsortid!=-1){
			 temp=temp+" inner join com.questionSorts as question";
		 }
		if(handlesortid!=-1){
			 temp=temp+" inner join com.handleSorts as handle";
		 }
		String hql="select com from Complaint as com "+temp;
		QueryHelper qh=new QueryHelper(hql);
		qh.setParam(true, "com.leaderapproved=?",1);

		qh.setParam(qh.isNotNullOrBlank(date1), "com.time>='"+date1+"'");
		qh.setParam(qh.isNotNullOrBlank(date2), "com.time<='"+date2+"'");
		qh.setParam(userid!=-1, "user.userid=?",userid);
		qh.setParam(departmentid!=-1, "depart.departmentid=?",departmentid);
		qh.setParam(questionsortid!=-1, "question.questionsortid=?",questionsortid);
		qh.setParam(handlesortid!=-1, "handle.handlesortid=?",handlesortid);
		qh.setParam(!code.equals(""), "com.sno=?",code);
		//departid  type  yesno  filename2
		qh.setParam(departid!=-1,"com.department.departmentid=?",departid);
		qh.setParam(type!=-1,"com.type=?",type);

		qh.setParam(filename2==2, "com.filename2=?","");
		qh.setParam(filename2==1, "com.filename2!=?","");
		qh.setParam(yesno!=-1,"com.yesno=?",yesno);
		//System.out.println(filename2);
		if(filename2==1){
			qh.setParam(true,"com.filename2  is not null");
		}else if(filename2==2){
			qh.setParam(true,"com.filename2  is null");
		}
		
		
		qh.setParam(qh.isNotNullOrBlank(keyword), "com.leadercomment like '%"+keyword+"%'  or com.question like '%"+
							keyword+"%' or com.investigateresult like '%"+keyword+"%'") ;// question  investigateresult

		return this.getPagingList(10,qh.getQuerySql()+" order by com.time desc ", qh.getParams());
	}
}
