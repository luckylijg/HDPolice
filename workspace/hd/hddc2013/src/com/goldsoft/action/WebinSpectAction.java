package com.goldsoft.action;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goldsoft.model.Complaint;
import com.goldsoft.model.Department;
import com.goldsoft.model.HandleSort;
import com.goldsoft.model.QuestionSort;
import com.goldsoft.model.Role;
import com.goldsoft.model.User;
import com.goldsoft.service.ComplaintService;
import com.goldsoft.service.DepartmentService;
import com.goldsoft.service.HandleSortService;
import com.goldsoft.service.QuestionSortService;
import com.goldsoft.service.RoleService;
import com.goldsoft.service.UserService;


@SuppressWarnings("serial")


public class WebinSpectAction extends BaseAction{

	
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
	private String profession;
	private String address;
	private int mode;
	private String idnumber;
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
	private String usersName="";
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
	
	@Autowired
	@Qualifier("roleServiceImpl")
	RoleService roleService;
	
	private String nextcode; 
	private List<Department> listDep1;
	private List<Department> listDep2;
	private List<User> listUsers;
	private List<QuestionSort> listQue;
	private List<HandleSort> listHan;
	
	private int realname;
	private int depname;
	private int que;
	private int  han;
	
	private String type1;
	private String title;
  	private Complaint com;
  	boolean R = false;
  	boolean R2 = false;
	private int leader;
	private String time1;
	private String time3;
	private int scores;
	private int yesno2;
  	private String temp;
	private List<Complaint> list;
	

	public String list()
	{
		int userid = this.getLoginUser().getUserid();
		type = 2;
		this.pager = this.complaintService.getListByPage(2, userid);
		return "list";

	}
	
	public String listprint()
	{
		int userid = this.getLoginUser().getUserid();
		//System.out.println("aaaaaaaaaaaaaaaa");
		list = this.complaintService.getListPrint(2, userid);
		return "listprint";

	}
	
	public String inAdd()
	{
		//nextcode = this.codeService.getNextCode(3);
		listDep1 = departmentService.getList(0);
		
		
		
		
		return "inAdd";
	}
	
	public String add()
		{
		//System.out.println(sno);
		com = new Complaint();
		com.setType(2);
		sno = this.codeService.getNextCode(3);
		com.setSno(sno);
		com.setTime(time);
		com.setDepartment(this.departmentService.get(departmentid));
		com.setName(name);
		com.setSex(sex);
		com.setAge(age);
		com.setProfession(profession);
		com.setAddress(address);
		com.setMode(mode);
		com.setIdnumber(idnumber);
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
		com.setIp(this.getRequest().getRemoteAddr());
		this.complaintService.add(com);
		
		//多对多插入
		
		
		com = this.complaintService.getComplaintBySno(sno);
		
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
		
		for(Department depart:departments){
			
			depart.getComplaints_1().add(com);
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
		
		
		com=this.complaintService.get(complaintid);
		com.setType(2);
		com.setSno(sno);
		com.setTime(time);
		com.setDepartment(this.departmentService.get(departmentid));
		//com.setUsers(users); //涉及人员
		com.setName(name);
		com.setSex(sex);
		com.setAge(age);
		com.setProfession(profession);
		com.setAddress(address);
		com.setMode(mode);
		com.setIdnumber(idnumber);
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
	
		//com.setUserByUserid(userByUserid);
		com.setUserByUserid2(getLoginUser());
		com.setIp(this.getRequest().getRemoteAddr());
		this.complaintService.update(com);
		
		
		
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
		//System.out.println(leaderapproved+"     "+complaintid);
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
		
		Set<User> u = com.getUsers();
		for(User user:u){
			users = user;
		}
		questionSorts = com.getQuestionSorts();
		handleSorts =com.getHandleSorts();
		departments = com.getDepartments();
		return "show";
	}
	
	public String auditList() {
		listDep1 = this.departmentService.getList(0);
		listDep2 = this.departmentService.getList(1);
		listQue = this.questionSortService.getList();
		this.pager = this.complaintService.getListByType(4);
		return "auditList";
	}
	
	public  String auditSearch()
	{	
		
		listDep1 = this.departmentService.getList(0);
		listDep2 = this.departmentService.getList(3);
		listQue = this.questionSortService.getList();
		
		SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd " );
        
   	    Calendar cal = Calendar.getInstance();
		if(!time1.isEmpty()){
			int year = Integer.parseInt(time1.substring(0, 4));
			int month = Integer.parseInt(time1.substring(5, 7));
			int date = Integer.parseInt(time1.substring(8, 10));
			cal.set(Calendar.YEAR,year );
			
			if(date==1){
				cal.set(Calendar.MONTH, month-1);
				cal.set(Calendar.DATE, date-1);
				
			}else {
				cal.set(Calendar.MONTH, month-1);
				cal.set(Calendar.DATE, date-1);
			}
			
			
			time1 = sdf.format(cal.getTime())+"23:59:59";
		}
		
		if(!time3.isEmpty()){
			time3 = time3+" 23:59:59";
		}
		if(temp.equals("1")){
			this.pager=this.complaintService.getListForAudit(time1,time3, departmentid, realname, 
					depname, que, yesno,leaderapproved);	
			return "auditSearch";
		}else{

		this.list=this.complaintService.getListForAuditPrint(time1,time3, departmentid, realname, 
				depname, que, yesno,leaderapproved);


		//this.list=this.complaintService.getList(type);
		return "auditPrint";
		}
	}
	
	
	

	public String auditEdit()
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
		switch (com.getType()) {
		case 0:
			type1 = "complaint";
			break;
		case 1:
			type1 = "fieldinspect";
			break;
		case 2:
			type1 = "webinspect";
			break;
		case 3:
			type1 = "popularfeelings";
			break;
		
		}
		
		return "auditEdit";
	}
	
	public String auditUpdate()
	{
		com=this.complaintService.get(complaintid);
		com.setType(type);
		com.setSno(sno);
		
		
		
		com.setTime(time);
		com.setDepartment(this.departmentService.get(departmentid));
		
		com.setName(name);
		com.setSex(sex);
		com.setAge(age);
		com.setProfession(profession);
		com.setAddress(address);
		com.setMode(mode);
		com.setIdnumber(idnumber);
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
		com.setLeaderapproved(leaderapproved);
		com.setRemark(remark);
		java.util.Date date = new java.util.Date();
		com.setEdittime(new Timestamp(date.getTime()));
		com.setEntertime(new Timestamp(date.getTime()));
	
		
		com.setUserByUserid2(getLoginUser());
		com.setIp(ip);
		
		switch (com.getType()) {
		case 0:
			type1 = "complaint";
			break;
		case 1:
			type1 = "fieldInspect";
			break;
		case 2:
			type1 = "webInspect";
			break;
		case 3:
			type1 = "popularFeelings";
			break;
		
		}
		
		this.complaintService.update(com);
		
		
		
		//多对多插入
		
	
		
		com = this.complaintService.getComplaintBySno(sno);
		//清空数据com相关多对多数据

		List<Department> departList=this.departmentService.getList(2);
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
				
//				
//				for(User user:users){
//					user.getComplaints().add(com);
//					this.userService.update(user);	
//				}
				for(HandleSort handleSort:handleSorts){
				
					handleSort.getComplaints().add(com);
					this.handleSortService.update(handleSort);
				}
				for (QuestionSort questionSort:questionSorts) {
					questionSort.getComplaints().add(com);
					this.questionSortService.update(questionSort);
				}
				
				
				return "auditUpdate";
	}
	
	public String auditShow() {
		
		com = this.complaintService.get(complaintid);
		
		Set<Role> roles= this.getLoginUser().getRoles();
		

		for(Role role:roles){
			if(role.getRoleid()==4)
			{R = true;}
		}
		
		
		Set<User> u = com.getUsers();
		for(User user:u){
			users = user;
			usersName=usersName+user.getRealname()+"  ";
		}
		questionSorts = com.getQuestionSorts();
		handleSorts =com.getHandleSorts();
		departments = com.getDepartments();
		switch (com.getType()) {
		case 0:
			type1 = "complaint";
			break;
		case 1:
			type1 = "fieldinspect";
			break;
		case 2:
			type1 = "webinspect";
			break;
		case 3:
			type1 = "popularfeelings";
			break;
		
		}
		return "auditShow";
	}
		public String print() {
		
		com = this.complaintService.get(complaintid);
		
		
		Set<Role> roles= this.getLoginUser().getRoles();
		

		for(Role role:roles){
			if(role.getRoleid()==4)
			{R = true;}
		}
		
		
		Set<User> u = com.getUsers();
		for(User user:u){
			users = user;
			usersName=usersName+user.getRealname()+"  ";
		}
		questionSorts = com.getQuestionSorts();
		handleSorts =com.getHandleSorts();
		departments = com.getDepartments();
		switch (com.getType()) {
		case 0:
			type1 = "complaint";
			break;
		case 1:
			type1 = "fieldinspect";
			break;
		case 2:
			type1 = "webinspect";
			break;
		case 3:
			type1 = "popularfeelings";
			break;
		
		}
		return "print";
	}
	
	public String statisticsList()
	{	
		listDep1 = this.departmentService.getList(0);
		listDep2 = this.departmentService.getList(3);
		listQue = this.questionSortService.getList();
		listHan = this.handleSortService.getList();
		
		int userDepartid = this.getLoginUser().getDepartment().getDepartmentid();
		
		Set<Role> roles= this.getLoginUser().getRoles();
		

		for(Role role:roles){
			if(role.getRoleid()==3)
			{R = true;}
			if(role.getRoleid() == 4) {
				R2 = true;
				R = false;
			}
		}
		if(R){
			this.pager =  this.complaintService.getListByStatistic(type,R, -1);
		}else {
			this.pager =  this.complaintService.getListByStatistic(type,R, userDepartid);
			@SuppressWarnings("unchecked")
			List<Complaint> list = this.pager.getList();
			scores = 0;
			for(Complaint com: list){
				scores = scores + com.getScore();
			}
			
			
			
			
			int id  = this.getLoginUser().getDepartment().getDepartmentid();
			
			name = this.departmentService.get(id).getName();
			earlywarning = Integer.parseInt(this.departmentService.get(id).getDescription());
			
			
		}
		
		
		
		switch (type) {
		case 0:
			title = "受理举报投诉统计表";
			break;

		case 1:
			title = "现场督察统计表";
			break;
		case 2:
			title = "网上督察统计表";
			break;
		case 3:
			title = "网络舆情调查统计表";
			break;
		}
		return "statisticsList";
	}
	
	
	@SuppressWarnings("unchecked")
	public String statisticsSearch(){
		
		
		listDep1 = this.departmentService.getList(0);
		listDep2 = this.departmentService.getList(3);
		listQue = this.questionSortService.getList();
		listHan = this.handleSortService.getList();
		int userDepartid = this.getLoginUser().getDepartment().getDepartmentid();

		SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd " );
        
   	    Calendar cal = Calendar.getInstance();
		if(!time1.isEmpty()){
			int year = Integer.parseInt(time1.substring(0, 4));
			int month = Integer.parseInt(time1.substring(5, 7));
			int date = Integer.parseInt(time1.substring(8, 10));
			cal.set(Calendar.YEAR,year );
			
			if(date==1){
				cal.set(Calendar.MONTH, month-1);
				cal.set(Calendar.DATE, date-1);
				
			}else {
				cal.set(Calendar.MONTH, month-1);
				cal.set(Calendar.DATE, date-1);
			}
			
			
			time1 = sdf.format(cal.getTime())+"23:59:59";
		}
		
		if(!time3.isEmpty()){
			time3 = time3+" 23:59:59";
		}
		Set<Role> roles= this.getLoginUser().getRoles();
		

		for(Role role:roles){
			if(role.getRoleid()==3)
			{R = true;}
			if(role.getRoleid() == 4) {
				R2 = true;
				R = false;
			}
		}
		
		

		switch (type) {
		case 0:
			title = "受理举报投诉统计表";
			break;

		case 1:
			title = "现场督察统计表";
			break;
		case 2:
			title = "网上督察统计表";
			break;
		case 3:
			title = "网络舆情调查统计表";
			break;
		}

		

		if(temp.equals("1")){
			if(R==true){
				if(type==0){
					this.pager = this.complaintService.getListForStatistics(type,time1,time3, departmentid, realname, 
							depname, que,han, mode,yesno,leaderapproved,yesno2);
				}else{
				this.pager = this.complaintService.getListForStatistics(type,time1,time3, departmentid, realname, 
						depname, que,han, 3,yesno,leaderapproved,yesno2);
				}
			}else {
				if(type==0){
					this.pager = this.complaintService.getListForStatistics(type,time1,time3, -1, -1, 
							userDepartid, -1, -1,3,-1,leaderapproved,0);
				}else {
					this.pager = this.complaintService.getListForStatistics(type,time1,time3, -1, -1, 
							userDepartid, -1, -1,3,-1,leaderapproved,0);
				}

			}
				

		return "statisticsSearch";
		}else{

			if(R==true){
				
				if(type==0){
					this.list = this.complaintService.getListForStatisticsPrint(type,time1,time3, departmentid, realname, 
							depname, que,han, mode,yesno,leaderapproved);
				}else{
				this.list = this.complaintService.getListForStatisticsPrint(type,time1,time3, departmentid, realname, 
						depname, que,han, 3,yesno,leaderapproved);
				}
			}else {
				if(type==0){
					this.list = this.complaintService.getListForStatisticsPrint(type,time1,time3, departmentid, realname, 
							userDepartid, que, han,mode,yesno,leaderapproved);
				}else {
					this.list = this.complaintService.getListForStatisticsPrint(type,time1,time3, departmentid, realname, 
							userDepartid, que, han,3,yesno,leaderapproved);
				}


			}

			return "statisticsPrint";
		}
	}

	
	public String Search(){
		
		
		
		int userid = this.getLoginUser().getUserid();

			SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd " );
	        
	   	    Calendar cal = Calendar.getInstance();
			if(!time1.isEmpty()){
				int year = Integer.parseInt(time1.substring(0, 4));
				int month = Integer.parseInt(time1.substring(5, 7));
				int date = Integer.parseInt(time1.substring(8, 10));
				cal.set(Calendar.YEAR,year );
				
				if(date==1){
					cal.set(Calendar.MONTH, month-1);
					cal.set(Calendar.DATE, date-1);
					
				}else {
					cal.set(Calendar.MONTH, month-1);
					cal.set(Calendar.DATE, date-1);
				}
				
				
				time1 = sdf.format(cal.getTime())+"23:59:59";
			}
			
			if(!time3.isEmpty()){
				time3 = time3+" 23:59:59";
			}
			
			switch (type) {
			case 0:
				type1 = "complaint";
				break;
			case 1:
				type1 = "fieldinspect";
				break;
			case 2:
				type1 = "webinspect";
				break;
			case 3:
				type1 = "popularfeelings";
				break;
			case 5:
				type1 = "all";
				break;
			
			}
			
			System.out.println(type);
			
			
						this.pager = this.complaintService.getListForsearch(type, time1, time3,userid);
			

			return "search";
			}

	

	
	public String getName() {
		return name;
	}

	public int getScores() {
		return scores;
	}

	public int getR() {
		return R?1:0;
	}
	public int getR2() {
		return R2?1:0;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public void setTime3(String time3) {
		this.time3 = time3;
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
	public String getUserName() {
		return users.getRealname();
		
		
		
	}
	public  String getUserRealName()
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

	
	public int getType() {
		return type;
	}

	public String getType1() {
		return type1;
	}

	public List<Department> getListDep2() {
		return listDep2;
	}

	public List<User> getListUsers() {
		return listUsers;
	}

	public List<QuestionSort> getListQue() {
		return listQue;
	}

	public String getTitle() {
		return title;
	}
	
	public List<HandleSort> getListHan() {
		return listHan;
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

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setMode(int mode) {
		this.mode = mode;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
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
		System.out.println(list.size());
		
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
	public void setRealname(int realname) {
		
		this.realname = realname;
	}

	public void setDepname(Integer depname) {
		this.depname = depname;
	}

	public void setQue(Integer que) {
		this.que = que;
	}

	public void setHan(int han) {
		this.han = han;
	}


	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}


	public void setLeader(int leader) {
		this.leader = leader;
	}

	public String getUsersName() {
		return usersName;
	}


	public void setList(List<Complaint> list) {
		this.list = list;
	}

	public List<Complaint> getList() {
		return list;
	}

	public void setYesno2(int yesno2) {
		this.yesno2 = yesno2;
	}
	
}

