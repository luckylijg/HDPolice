package com.goldsoft.service;

import java.util.Date;
import java.util.List;

import com.core.common.PagingList;
import com.goldsoft.model.Complaint;


public interface ComplaintService {
	public Complaint get(int id);
	public void add(Complaint complaint);
	public void update(Complaint complaint);
	public void delete(int id);
	
	public List<Complaint> getList(int type);
	public PagingList<Complaint> getListByType(int type);
	public PagingList<Complaint> getListByPage(int type, int userid);
	public List<Complaint> getListPrint(int type, int userid);
	public Complaint getComplaintBySno(String sno);
	public List<Complaint> getListComplaintByEarlyWarning();
	public PagingList<Complaint> getListForsearch(int type,String time1,String time2,int userid);
	public List<Complaint> searchListByEarlyWarning(String date1, String date2);

	
	public PagingList<Complaint> getListByStatistic(int type,boolean t,int departid);
	
	PagingList<Complaint> getListForAudit( String time1, String time2,
			int departmentid, int realname, int depname, int que,
			int yesno,int leaderapproved);

	List<Complaint> getListForAuditPrint( String time1, String time2,
			int departmentid, int realname, int depname, int que,
			int yesno,int leaderapproved);


	public PagingList<Complaint> allList();
	public PagingList<Complaint> serachAll(String date1,String date2,int userid,int departmentid,int questionsortid,
			int handlesortid,String code,String keyword,int departid,int type,int yesno,int filename2);


	PagingList<Complaint> getListForStatistics(int type, String time1,
			String time2, int departmentid, int realname, int depname, int que,
			int han, int mode, int yesno,int leaderapproved,int yesno2);

	
	List<Complaint> getListForStatisticsPrint(int type, String time1,
			String time2, int departmentid, int realname, int depname, int que,
			int han, int mode, int yesno,int leaderapproved);

}
