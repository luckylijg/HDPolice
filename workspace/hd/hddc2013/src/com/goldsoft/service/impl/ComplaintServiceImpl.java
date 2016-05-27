package com.goldsoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.core.common.PagingList;
import com.goldsoft.dao.ComplaintDAO;
import com.goldsoft.model.Complaint;
import com.goldsoft.service.ComplaintService;
@Service
public class ComplaintServiceImpl implements ComplaintService{
	
	@Autowired
	@Qualifier("complaintDAOImpl")
	ComplaintDAO complaintDAO;
	@Override
	public Complaint get(int id) {
		
		return this.complaintDAO.get(id);
	}

	@Override
	public void add(Complaint complaint) {
		
		this.complaintDAO.add(complaint);
	}

	@Override
	public void update(Complaint complaint) {
		
		this.complaintDAO.update(complaint);
	}

	@Override
	public void delete(int id) {
		
		this.complaintDAO.delete(id);
	}

	@Override
	public List<Complaint> getList(int type) {
		
		return this.complaintDAO.getList(type);
	}

	@Override
	public PagingList<Complaint> getListByType(int type) {
		
		return this.complaintDAO.getListByType(type);
	}

	@Override
	public List<Complaint> getListComplaintByEarlyWarning() {
		
		return this.complaintDAO.getListByEarlyWarning();
	}

	@Override
	public List<Complaint> searchListByEarlyWarning(String date1,String date2) {
		
		return this.complaintDAO.searchListByEarlyWarning(date1,date2);
	}

	@SuppressWarnings({ "null" })
	@Override
	public PagingList<Complaint> getListForAudit(String time1,String time2,
			int departmentid, int realname, int depname, int que,
			int yesno,int leaderapproved) {
		return this.complaintDAO.getListForAudit(time1, time2, departmentid, realname, depname, que, yesno,leaderapproved);
		
	}
	

	@Override
	public Complaint getComplaintBySno(String sno) {
		
		return this.complaintDAO.getComplaintBySno(sno);
	}
	
	@Override
	public PagingList<Complaint> getListForStatistics(int type,String time1,String time2,
			int departmentid, int realname, int depname, int que,int han,
			int mode ,int yesno,int leaderapproved,int yesno2)
			{
			
				return this.complaintDAO.getListForStatistics(type, time1, time2, departmentid, realname, depname, que,han, mode,yesno ,leaderapproved,yesno2);
			}

	

	@Override
	public PagingList<Complaint> getListByPage(int type, int userid) {
		
		return this.complaintDAO.getListByPage(type, userid);
	}
	
	@Override
	public List<Complaint> getListPrint(int type, int userid) {
		
		return this.complaintDAO.getListPrint(type, userid);
	}
	
	public PagingList<Complaint> getListByStatistic(int type,boolean t,int departid)
	{
		return this.complaintDAO.getListByStatistic(type, t, departid);
	}
	public PagingList<Complaint> allList(){
		return this.complaintDAO.allList();
	}
	public PagingList<Complaint> serachAll(String date1,String date2,int userid,int departmentid,int questionsortid,
			int handlesortid,String code,String keyword,int departid,int type,int yesno,int filename2){
		return this.complaintDAO.serachAll(date1,date2,userid,departmentid,questionsortid,handlesortid,code,keyword,departid,type,yesno,filename2);
	}
	@Override
	public List<Complaint> getListForAuditPrint(String time1,
			String time2, int departmentid, int realname, int depname, int que,
			int yesno, int leaderapproved) {
		
		return this.complaintDAO.getListForAuditPrint(time1, time2, departmentid, realname, depname, que, yesno,leaderapproved);
	}
	

	@Override
	public List<Complaint> getListForStatisticsPrint(int type,String time1,String time2,
			int departmentid, int realname, int depname, int que,int han,
			int mode, int yesno,int leaderapproved)
			{
		
				return this.complaintDAO.getListForStatisticsPrint(type, time1, time2, departmentid, realname, depname, que, han, mode, yesno, leaderapproved);
			}
	@Override
	public PagingList<Complaint> getListForsearch(int type, String time1,
			String time2,int userid) {
		// TODO Auto-generated method stub
		return this.complaintDAO.getListForsearch(type, time1, time2,userid);
	}

	
}
