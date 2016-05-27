package com.goldsoft.action;


import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goldsoft.model.Complaint;
import com.goldsoft.model.Department;
import com.goldsoft.model.HandleSort;
import com.goldsoft.model.QuestionSort;
import com.goldsoft.model.User;
import com.goldsoft.service.ComplaintService;
import com.goldsoft.service.DepartmentService;
import com.goldsoft.service.HandleSortService;
import com.goldsoft.service.QuestionSortService;
import com.goldsoft.service.UserService;


@SuppressWarnings("serial")


public class PopularFeelingsAction extends BaseAction{

	
	private int complaintid;
	private int departmentid;
	private User userByUserid;
	private User userByUserid2;
	private Department department;
	private int type;
	private String sno;
	private Timestamp time;
	
	
	private String name;
	private int sex;
	private int age;
	private String address;	
	private String phone;
	
	
	private String people;
	private String question;
	private String filename;
	private String leadercomment;
	private String investigateresult;
	private String filename2;
	private Timestamp time2;
	private int visitopinion;

	private int score;
	private int yesno;
	private int earlywarning;
	private int leaderapproved;
	private String remark;
	private Timestamp entertime;
	private Timestamp edittime;
	private String ip;
	private Set<QuestionSort> questionSorts = new HashSet<QuestionSort>(0);
	private Set<HandleSort> handleSorts = new HashSet<HandleSort>(0);
	private User users = null;
	private Set<Department> departments = new HashSet<Department>(0);
	@Autowired
	@Qualifier("complaintServiceImpl")
	ComplaintService complaintService;
	@Autowired
	@Qualifier("departmentServiceImpl")
	DepartmentService departmentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;
	
	@Autowired
	@Qualifier("handleSortServiceImpl")
	HandleSortService handleSortService;
	
	@Autowired
	@Qualifier("questionSortServiceImpl")
	QuestionSortService questionSortService;
	
	
	
	private String nextcode; 
	private List<Department> listDep1;
	
	private List<Complaint> list;
	
  	private Complaint com;
	
	private Date date1;
	private Date date2;
	private int leader;
	
	public String list()
	{
		type = 3;
		int userid = this.getLoginUser().getUserid();
		this.pager = this.complaintService.getListByPage(3, userid);
		return "list";
	}
	
	public String listprint()
	{
		int userid = this.getLoginUser().getUserid();
		list = this.complaintService.getListPrint(3, userid);
		return "listprint";
	}
	
	public String inAdd()
	{
		//nextcode = this.codeService.getNextCode(4);
		listDep1 = departmentService.getList(0);
		
		
		
		
		return "inAdd";
	}
	
	public String add()
		{
		
		Complaint com = new Complaint();
		com.setType(3);
		sno = this.codeService.getNextCode(4);
		com.setSno(sno);
		com.setTime(time);
		com.setDepartment(this.departmentService.get(departmentid));
		
		com.setName(name);
		com.setSex(sex);
		com.setAge(age);
		
		com.setAddress(address);
		com.setPhone(phone);
		com.setPeople(people);
		
		
		
		
		
		
		com.setQuestion(question);
		
		com.setLeadercomment(leadercomment);
		com.setInvestigateresult(investigateresult);
		com.setFilename(filename);
		com.setFilename2(filename2);
		com.setVisitopinion(visitopinion);
	    com.setYesno(yesno);
		
		com.setTime2(time2);
		com.setScore(score);
		com.setEarlywarning(earlywarning);
		if(leader==1){
			//System.out.println("leader==1");
			com.setLeaderapproved(leaderapproved+10);
		}else{
			com.setLeaderapproved(leaderapproved);
		}
		com.setRemark(remark);
		java.util.Date date = new java.util.Date();
		com.setEdittime(new Timestamp(date.getTime()));
		com.setEntertime(new Timestamp(date.getTime()));
		com.setUserByUserid(getLoginUser());
		com.setUserByUserid2(getLoginUser());
		com.setIp(ip);
		this.complaintService.add(com);
		
		//多对多插入
		Complaint comp = null;
		
		comp = this.complaintService.getComplaintBySno(sno);
		
		users.getComplaints().add(comp);
		this.userService.update(users);	
		

		for(HandleSort handleSort:handleSorts){
			handleSort.getComplaints().add(comp);
			this.handleSortService.update(handleSort);
		}
		for (QuestionSort questionSort:questionSorts) {
			questionSort.getComplaints().add(comp);
			this.questionSortService.update(questionSort);
		}
		
		for(Department depart:departments){
			
			depart.getComplaints_1().add(comp);
			this.departmentService.update(depart);
		}
		return "add";
	}
	
	public String edit()
	{
		
		listDep1 = departmentService.getList(0);
		com = this.complaintService.get(complaintid);
		questionSorts = com.getQuestionSorts();
		Set<User> u = com.getUsers();
		for(User user:u){
			users = user;
		}
		handleSorts =com.getHandleSorts();
		departments = com.getDepartments();
		time = com.getTime();
		time2 = com.getTime2();
		return "edit";
	}
	
	public String update() {
		
		
		com = this.complaintService.get(complaintid);
		com.setType(3);
		com.setSno(sno);
		com.setTime(time);
		com.setDepartment(this.departmentService.get(departmentid));
		
		com.setName(name);
		com.setSex(sex);
		com.setAge(age);
		
		com.setAddress(address);
		
		com.setPhone(phone);
		com.setPeople(people);
		com.setLeadercomment(leadercomment);
		com.setQuestion(question);
		
		if(leader==1){
			com.setLeaderapproved(leaderapproved+10);
		}else{
			com.setLeaderapproved(leaderapproved);
		}
		com.setInvestigateresult(investigateresult);
		com.setFilename(filename);
		com.setFilename2(filename2);
		com.setVisitopinion(visitopinion);
	    com.setYesno(yesno);
		
		com.setTime2(time2);
		com.setScore(score);
		com.setEarlywarning(earlywarning);
		
		com.setRemark(remark);
		java.util.Date date = new java.util.Date();
		com.setEdittime(new Timestamp(date.getTime()));
		com.setEntertime(new Timestamp(date.getTime()));
		com.setUserByUserid(getLoginUser());
		com.setUserByUserid2(getLoginUser());
		com.setIp(ip);
		this.complaintService.add(com);
		
		
		
		//多对多插入
		
				
				
				com = this.complaintService.getComplaintBySno(sno);
				//清空数据com相关多对多数据

				List<Department> departList=this.departmentService.getList(3);
				for(Department depart:departList){
					if(depart.getComplaints_1().contains(com)){
						depart.getComplaints_1().remove(com);
						this.departmentService.update(depart);
					}
				}
				List<User> users1 = this.userService.getlist();
				for(User user:users1){
					if(user.getComplaints().contains(com)){
						user.getComplaints().remove(com);
						this.userService.update(user);
					}
				}
				List<HandleSort> handleSorts1 = this.handleSortService.getList();
				for(HandleSort han:handleSorts1){
					if(han.getComplaints().contains(com)){
						han.getComplaints().remove(com);
						this.handleSortService.update(han);
					}
				}
				List<QuestionSort> questionSorts1 = this.questionSortService.getList();
				for(QuestionSort questionSort:questionSorts1){
					if(questionSort.getComplaints().contains(com)){
						questionSort.getComplaints().remove(com);
						this.questionSortService.update(questionSort);
					}
				}
				
				
				
				
				//更新新数据
				
				for(Department depart:departments){
					depart.getComplaints_1().add(com);
					this.departmentService.update(depart);
				}
				
				users.getComplaints().add(com);
				this.userService.update(users);	

				for(HandleSort handleSort:handleSorts){
					handleSort.getComplaints().add(com);
					this.handleSortService.update(handleSort);
				}
				for (QuestionSort questionSort:questionSorts) {
					questionSort.getComplaints().add(com);
					this.questionSortService.update(questionSort);
				}
		
		return "update";
	}
	
	public String update1(){
		
		com=this.complaintService.get(complaintid);
		com.setLeaderapproved(leaderapproved);
		this.complaintService.update(com);
		
		return "update1";
	}
	
	
	public String delete() {
		Complaint com=this.complaintService.get(complaintid);
		
		List<User> userList=this.userService.getlist();
		for(User user:userList){
			if(user.getComplaints().contains(com)){
				user.getComplaints().remove(com);
			}
			if(user.getComplaintsForUserid().contains(com)){
				user.getComplaintsForUserid().remove(com);
			}
			if(user.getComplaintsForUserid2().contains(com)){
				user.getComplaintsForUserid2().remove(com);
			}
			this.userService.update(user);
		}
		List<Department> departList=this.departmentService.getList(3);
		for(Department depart:departList){
			if(depart.getComplaints_1().contains(com)){
				depart.getComplaints_1().remove(com);
			}
			this.departmentService.update(depart);
		}
		List<HandleSort> handletList=this.handleSortService.getList();
		for(HandleSort handle:handletList){
			if(handle.getComplaints().contains(com)){
				handle.getComplaints().remove(com);
			}
			this.handleSortService.update(handle);
		}
		List<QuestionSort> questionList=this.questionSortService.getList();
		for(QuestionSort question:questionList){
			if(question.getComplaints().contains(com)){
				question.getComplaints().remove(com);
			}
			this.questionSortService.update(question);
		}

		this.complaintService.delete(complaintid);
		
		return "delete";
	}
	
	
	public String show() {
		
		com = this.complaintService.get(complaintid);
		questionSorts = com.getQuestionSorts();
		Set<User> u = com.getUsers();
		for(User user:u){
			users = user;
		}
		handleSorts =com.getHandleSorts();
		departments = com.getDepartments();
		return "show";
	}
	
	

	
	
	public String getTime2() {
		return time2.toString().substring(0, 11);
	}

	public String getTime() {
		return time.toString().substring(0, 11);
	}



	public ComplaintService getComplaintService() {
		return complaintService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public UserService getUserService() {
		return userService;
	}

	public HandleSortService getHandleSortService() {
		return handleSortService;
	}

	public QuestionSortService getQuestionSortService() {
		return questionSortService;
	}

	public String getNextcode() {
		return nextcode;
	}

	public List<Department> getListDep1() {
		return listDep1;
	}

	
	public String getQuestionSorts() {
		String que = " ";
		for (QuestionSort q:questionSorts) {
			que = que + q.getName() +" ";
		}
		return que;
	}

	public String getHandleSorts() {
		String han = " ";
		for(HandleSort h:handleSorts)
		{
			han = han + h.getName() + " ";
		}
		
		return han;
	}

	public int getUsers() {
		int user= users.getUserid();
		
		
		return user;
	}
	public String getUserRealName()
	{
		return users.getRealname();
	}

	public String getDepartments() {
		String dep = " ";
		for(Department d:departments)
		{
			dep = dep + d.getName() + " ";
		}
			
		return dep;
	}

	public int getEarlywarning() {
		return earlywarning;
	}
	
	
	
	public Complaint getComplaint() {
		return com;
	}

	

	

	public int getYesno() {
		return yesno;
	}


	
	

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}


	public void setComplaintid(int complaintid) {
		this.complaintid = complaintid;
	}

	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}

	public void setUserByUserid(User userByUserid) {
		this.userByUserid = userByUserid;
	}

	public void setUserByUserid2(User userByUserid2) {
		this.userByUserid2 = userByUserid2;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	
	public void setAge(int age) {
		this.age = age;
	}

	
	public void setAddress(String address) {
		this.address = address;
	}

	
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public void setQuestion(String question) {
	
		this.question = question;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setLeadercomment(String leadercomment) {
		this.leadercomment = leadercomment;
	}

	public void setInvestigateresult(String investigateresult) {
		this.investigateresult = investigateresult;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public void setYesno(int yesno) {
		this.yesno = yesno;
	}

	public void setVisitopinion(int visitopinion) {
		this.visitopinion = visitopinion;
	}

	public void setTime2(Timestamp time2) {
		this.time2 = time2;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public void setEarlywarning(int earlywarning) {
		this.earlywarning = earlywarning;
	}

	public void setLeaderapproved(int leaderapproved) {
		this.leaderapproved = leaderapproved;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setEntertime(Timestamp entertime) {
		this.entertime = entertime;
	}

	public void setEdittime(Timestamp edittime) {
		this.edittime = edittime;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setQuestionSorts(String questionSorts) {

		Set<QuestionSort> queSet = new HashSet<QuestionSort>(0);
		String que[] = questionSorts.split(" ");
		List<QuestionSort> list = this.questionSortService.getList();
		for(String q : que)
		{
			for (QuestionSort questionSort:list) {
				if (q.equals(questionSort.getName())) {
					queSet.add(questionSort);
				}
			}
			
		}
		this.questionSorts = queSet;
	}

	public void setHandleSorts(String handleSorts) {

		Set<HandleSort> handleSet = new HashSet<HandleSort>(0);
		String handle[] = handleSorts.split(" ");
		List<HandleSort> list = this.handleSortService.getList();
		
		for (String hanString:handle) {
			for (HandleSort han: list) {
				if(hanString.equals(han.getName()))
				{
					handleSet.add(han);
				}
			}
		}
		this.handleSorts = handleSet;
	}

	public void setUsers(Integer users) {
		
		
		this.users = this.userService.get(users);
		

		
		

	}

	public void setDepartments(String departments) {
		
		Set<Department> depSet = new HashSet<Department>(0);
		String dep[] = departments.split(" ");
		List<Department> list = this.departmentService.getList(3);
		
		for(String d:dep)
		{
			for (Department department:list) {
				if (d.equals(department.getName())) {
					depSet.add(department);
				}   
				
			}
		}
		
		this.departments = depSet;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public void setLeader(int leader) {
		this.leader = leader;
	}

	public List<Complaint> getList() {
		return list;
	}

	public int getType() {
		return type;
	}

}

