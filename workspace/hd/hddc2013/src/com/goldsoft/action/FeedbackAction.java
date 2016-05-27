package com.goldsoft.action;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goldsoft.model.Complaint;
import com.goldsoft.model.Department;
import com.goldsoft.model.Feedback;
import com.goldsoft.model.Role;
import com.goldsoft.model.User;
import com.goldsoft.service.ComplaintService;
import com.goldsoft.service.DepartmentService;
import com.goldsoft.service.FeedbackService;
import com.goldsoft.service.UserService;

public class FeedbackAction extends BaseAction{
	private int id;
	private int departmentid;
	private int complaintid;
	private int userid;
	private String message;
	private String description;
	
	private Department department;
	private Complaint complaint;
	private User user;
	private Feedback fd;
	@Autowired
	@Qualifier("departmentServiceImpl")
	DepartmentService departmentService;
	@Autowired
	@Qualifier("complaintServiceImpl")
	ComplaintService complaintService;
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;
	@Autowired
	@Qualifier("feedbackServiceImpl")
	FeedbackService feedbackService;
	
	
	
	public String feedback(){
		String result = null;
		
		Set<Feedback> fdSet = this.complaintService.get(complaintid).getFeedbacks();
		if(fdSet.size()==0)
		{
			id=0;
		}else {
			for(Feedback f: fdSet){
				id = f.getFeedbackid();
			}
		}
		
		Set<Role> roles= this.getLoginUser().getRoles();
		boolean R = false;

		for(Role role:roles){
			if(role.getRoleid()==3)
			{R = true;}
		}
		
		
		if(R==true&&id!=0)
		{
			fd = this.feedbackService.get(id);
			complaint = fd.getComplaint();
			user = fd.getUser();
			department = fd.getDepartment();
			
			result = "show";
		}
		
		if (R!=true&&id==0) {
			
			complaint = this.complaintService.get(complaintid);
			
			
			result = "inAdd";
		}
		if (R!=true&&id!=0) {
			fd = this.feedbackService.get(id);
			complaint = fd.getComplaint();
			
			result = "edit";
		}
		
		return result;
	}
	
	
	public String update()
	{
		
		String result= null;
		Set<Feedback> fdSet = this.complaintService.get(complaintid).getFeedbacks();
		if(fdSet.size()==0)
		{
			id=0;
		}else {
			for(Feedback f: fdSet){
				id = f.getFeedbackid();
			}
		}
		
		
		if (id==0) {
			fd = new Feedback();
			fd.setComplaint(this.complaintService.get(complaintid));
			fd.setDepartment(this.getLoginUser().getDepartment());
			fd.setUser(this.getLoginUser());
			fd.setMessage(message);
			fd.setDescription(description);
			this.feedbackService.add(fd);
			
			result = "add";
		}
		
		if (id!=0) {
			System.out.println(message);
			fd = this.feedbackService.get(id);
			fd.setDepartment(this.getLoginUser().getDepartment());
			fd.setUser(this.getLoginUser());
			fd.setMessage(message);
			fd.setDescription(description);
			this.feedbackService.update(fd);
			
			result = "update";
		}
		
		
		return result;
	}
	public String delete()
	{
		this.feedbackService.delete(id);
		return "delete";
	}
	
	public String list() {
		this.pager = this.feedbackService.getListByPagingList();
		return "list";
	}
	
	
	public Department getDepartment() {
		return department;
	}


	public Complaint getComplaint() {
		return complaint;
	}


	public User getUser() {
		return user;
	}

	public Feedback getFd() {
		return fd;
	}


	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	


	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}


	public void setComplaintid(int complaintid) {
		this.complaintid = complaintid;
	}



	public void setUserid(int userid) {
		this.userid = userid;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public void setDescription(String description) {
		this.description = description;
	}


	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}



	public void setComplaintService(ComplaintService complaintService) {
		this.complaintService = complaintService;
	}



	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}


	
	
	
	
	
	
	
}
