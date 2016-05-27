package com.goldsoft.action;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.ArrayList;

import java.util.Arrays;

import java.util.Calendar;
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


public class ComplaintAction extends BaseAction{

	
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
	private Timestamp time3;
	private int visitopinion;
	private int departid;
	private int score;
	private int leader;
	private int leaderapproved;
	private String remark;
	private Timestamp entertime;
	private Timestamp edittime;
	private String ip;
	private List<User> policeUser;
	private Set<QuestionSort> questionSorts = new HashSet<QuestionSort>(0);
	private Set<HandleSort> handleSorts = new HashSet<HandleSort>(0);
	private User users = null;
	private Set<Department> departments = new HashSet<Department>(0);
	private List<Department> departList;
	private List<HandleSort> handleList;
	private List<QuestionSort> questionList;
	private String titles;
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
	
	private Date time2;
	private int yesno;
	private int earlywarning;
	private String nextcode; 
	private List<Department> listDep1;
	private List<Complaint> listByEarlyWarining;
  	private Complaint com;
	private int file;
	private Date date1;
	private Date date2;
	private String year;
	private int bannian;
	private int month;
	private int jidu;
	private int condition;
	
	private List<Complaint> list;
	
	private int handlesortid;
	private int questionsortid;
	private String code;
	private String keyword;
	private int userid;

	public String list()
	{
		type = 0;
		int userid = this.getLoginUser().getUserid();
		this.pager = this.complaintService.getListByPage(0, userid);
		return "list";
	}
	
	public String listprint()
	{
		int userid = this.getLoginUser().getUserid();
		list = this.complaintService.getListPrint(0, userid);
		return "listprint";
	}
	
	public String inAdd()
	{
		//nextcode = this.codeService.getNextCode(1);
		listDep1 = departmentService.getList(0);
		return "inAdd";
	}
	
	public String add()
		{
		//System.out.println("leader  :"+leader);
		com = new Complaint();
		com.setType(0);
		sno = this.codeService.getNextCode(1);
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
		
		com.setTime2(time3);
		com.setScore(score);
		com.setEarlywarning(earlywarning);
		if(leader==1){
			com.setLeaderapproved(leaderapproved+10);
		}else{
			com.setLeaderapproved(leaderapproved);
		}
		com.setRemark(remark);
		java.util.Date date = new java.util.Date();
		com.setEdittime(new Timestamp(date.getTime()));
		com.setEntertime(new Timestamp(date.getTime()));
	
		com.setUserByUserid(this.getLoginUser());
		com.setUserByUserid2(this.getLoginUser());
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
		time3 = com.getTime2();
		return "edit";
	}
	
	public String update() {
		
		//System.out.println("aaaaaaaaaaaaaaa");
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
		
		com.setLeadercomment(leadercomment);
		com.setQuestion(question);
		//System.out.println(leaderapproved+"           ssssssss");
		//System.out.println(leader);
		if(leader==1){
			com.setLeaderapproved(leaderapproved+10);
			//System.out.println("rrrrrrrrrrrrrr"+com.getLeaderapproved());
			
		}else{
			com.setLeaderapproved(leaderapproved);
		}
		com.setInvestigateresult(investigateresult);
		com.setFilename(filename);
		com.setFilename2(filename2);
		com.setVisitopinion(visitopinion);
	    com.setYesno(yesno);
		
		com.setTime2(time3);
		com.setScore(score);
		com.setEarlywarning(earlywarning);
		
		com.setRemark(remark);
		java.util.Date date = new java.util.Date();
		com.setEdittime(new Timestamp(date.getTime()));
		com.setEntertime(new Timestamp(date.getTime()));
		
		com.setUserByUserid2(getLoginUser());
		com.setIp(ip);
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
	
	public String listAll()
	{
		int userid = this.getLoginUser().getUserid();
		type = 5;
		this.pager = this.complaintService.getListByPage(5, userid);
		return "listAll";
	}
	
public String deletelistAll() {

		
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
		
		return "deletelistAll";
	}

	public String show() {
		
		com = this.complaintService.get(complaintid);
		
		Set<User> u = com.getUsers();
		for(User user:u){
			users = user;
		}
		
		handleSorts =com.getHandleSorts();
		departments = com.getDepartments();
		questionSorts = com.getQuestionSorts();
		return "show";
	}
	public String print() {
		com = this.complaintService.get(complaintid);
		//questionSorts = com.getQuestionSorts();
		Set<User> u = com.getUsers();
		for(User user:u){
			users = user;
		}
		//System.out.println("-----getRealname()--------------"+users.getRealname());
		handleSorts =com.getHandleSorts();
		departments = com.getDepartments();
		questionSorts = com.getQuestionSorts();
		return "print";
	}
	
	public String listByEarlyWarining(){
		//System.out.println("aaaaaaaaaaa");
		//System.out.println(this.complaintService);
		listByEarlyWarining=this.complaintService.getListComplaintByEarlyWarning();
		
		double[][] data = new double[2][4];
		for(Complaint complaint:listByEarlyWarining){
			switch(complaint.getType()){
			case 0: data[0][0]++; break;
			case 1: data[0][1]++; break;
			case 2: data[0][2]++; break;
			case 3: data[0][3]++; break;
			}
		}
		for(Complaint complaint:listByEarlyWarining){
			if(complaint.getYesno()==1){
				switch(complaint.getType()){
				case 0: data[1][0]++; break;
				case 1: data[1][1]++; break;
				case 2: data[1][2]++; break;
				case 3: data[1][3]++; break;
				}
			}
		}
		/*for(int i=0;i<data.length;i++){
			for(int j=0;j<data[i].length;j++){
		System.out.print("---"+data[i][j]);}}*/
		this.getRequest().setAttribute("data", data);
		titles="预警信息问题来源柱状统计图";
		//System.out.println(data.length+"----"+data[0].length);
		return "listByEarlyWarning";
	}
	
	
	private double[][] data;
	public String searchListByEarlyWarning(){
		//int yesno=Integer.parseInt(this.getRequest().getParameter("yesno"));
		String date1=null;;
		String date2 = null;
		switch(condition){
		case 0:  date1=year+"-01-01"; date2=year+"-12-31";
				titles=year+"年";
				break;
		case 1: if(bannian==0)
		        {
			      date1=year+"-01-01";
 	              date2=year+"-06-30"; 
 	             titles=year+"年上半年";
		         }
		       if(bannian==1)
		         {
		        	  date1=year+"-07-01";
	        	      date2=year+"-12-31";
	        	      titles=year+"年下半年";
	        	       
		         } break;
		case 2:
			if(jidu==0)
			{
				 date1=year+"-01-01";
   	             date2=year+"-03-31";
   	     
			}if(jidu==1)
			{
				 date1=year+"-04-01";
        	     date2=year+"-06-30";
   
			}if(jidu==2)
			{
			     date1=year+"-07-01";
                 date2=year+"-09-30";
                
			}if(jidu==3)
			{
				   date1=year+"-10-01";
	               date2=year+"-12-31";
			} 
			titles=year+"年第"+(jidu+1)+"季度";
			break;
		case 3: 
			     SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd " );
                 int year1=Integer.parseInt(year);
		    	    Calendar cal = Calendar.getInstance();
		 		  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
		 		  cal.set(Calendar.YEAR,year1);
		 		  cal.set(Calendar.MONTH, month);
		 		  cal.set(Calendar.DAY_OF_MONTH, 1);
		 		  cal.add(Calendar.DAY_OF_MONTH, -1);
		 		  date2 = sdf.format(cal.getTime());
		 		  cal.set(Calendar.DAY_OF_MONTH, 1);
		 		 date1 = sdf.format(cal.getTime());
		 		titles=year+"年"+month+"月";
		 		  break;
		}
		
		
		//System.out.println(yesno+"==========="+date1+"========"+date2);
		listByEarlyWarining=this.complaintService.searchListByEarlyWarning(date1, date2);
		double[][] data = new double[2][4];
		for(Complaint complaint:listByEarlyWarining){
			switch(complaint.getType()){
			case 0: data[0][0]++; break;
			case 1: data[0][1]++; break;
			case 2: data[0][2]++; break;
			case 3: data[0][3]++; break;
			}
		}
		for(Complaint complaint:listByEarlyWarining){
			if(complaint.getYesno()==1){
				switch(complaint.getType()){
				case 0: data[1][0]++; break;
				case 1: data[1][1]++; break;
				case 2: data[1][2]++; break;
				case 3: data[1][3]++; break;
				}
			}
		}
		/*for(int i=0;i<data.length;i++){
			for(int j=0;j<data[i].length;j++){
		//System.out.print("---"+data[i][j]);
			}
		}*/
		//this.getRequest().setAttribute("data", data);
		//System.out.println(data.length+"----"+data[0].length);
		this.getRequest().setAttribute("data", data);
		titles=titles+"预警信息问题来源柱状统计图";
		return "searchListByEarlyWarning";
	}
	
	public String allList(){
		
		//this.pager=this.complaintService.allList();
		this.policeUser=new ArrayList<User>();
		List<Department> depList=this.departmentService.getList(0);
		for(Department depart:depList){
			policeUser.addAll(this.userService.getListByDepart(depart.getDepartmentid()));
			
		}
		this.listDep1=this.departmentService.getList(0);
		departList=this.departmentService.getList(3);
		handleList=this.handleSortService.getList();
		questionList=this.questionSortService.getList();
		
		//System.out.println(departList.size()+"      "+handleList.size()+"      "+questionList.size());
		return "allList";
	}
	
	public String serachAll(){
		//System.out.println(file);
		String fmt = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(fmt);
		String dateStr1="";
		String dateStr2="";
		if(date1!=null){
			dateStr1=sdf.format(date1);
		}
		if(date2!=null){
			dateStr2=sdf.format(date2);
		}
		
		//System.out.println("    "+date2.toString()+"        "+date1.toString()+"     "+departmentid+"        "+questionsortid+"         "+handlesortid+"           0"+code+"         "+keyword+"         "+userid);
		this.policeUser=new ArrayList<User>();
		List<Department> depList=this.departmentService.getList(0);
		for(Department depart:depList){
			policeUser.addAll(this.userService.getListByDepart(depart.getDepartmentid()));
		}
		departList=this.departmentService.getList(3);
		handleList=this.handleSortService.getList();
		questionList=this.questionSortService.getList();
		//departid  type  yesno  filename2
		//System.out.println(file);
//		System.out.println(yesno);
		this.pager=this.complaintService.serachAll(dateStr1,dateStr2,userid,departmentid,questionsortid,handlesortid,code,keyword,departid,type,yesno,file);
		return "serachAll";
	}



	public String getTime3() {
		return time3.toString().substring(0, 11);
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

	public Date getTime2() {
		return time2;
	}

	public void setTime2(Date time2) {
		this.time2 = time2;
	}

	public int getYesno() {
		return yesno;
	}


	public double[][] getData() {
		return data;
	}

	public void setData(double[][] data) {
		this.data = data;
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

	public void setTime3(Timestamp time3) {
		this.time3 = time3;
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
		//System.out.println(departments);
		String dep[] = departments.split(" ");
		List<Department> list = this.departmentService.getList(3);
		//System.out.println("setpsertmrnt-------------");
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

	public int getBannian() {
		return bannian;
	}

	public void setBannian(int bannian) {
		this.bannian = bannian;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getJidu() {
		return jidu;
	}

	public void setJidu(int jidu) {
		this.jidu = jidu;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
		this.condition = condition;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public List<User> getPoliceUser() {
		return policeUser;
	}

	public List<Department> getDepartList() {
		return departList;
	}

	public List<HandleSort> getHandleList() {
		return handleList;
	}

	public List<QuestionSort> getQuestionList() {
		return questionList;
	}
	public void setHandlesortid(int handlesortid) {
		this.handlesortid = handlesortid;
	}

	public void setQuestionsortid(int questionsortid) {
		this.questionsortid = questionsortid;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getLeader() {
		return leader;
	}

	public void setLeader(int leader) {
		this.leader = leader;
	}

	public void setDepartid(int departid) {
		this.departid = departid;
	}

	public void setFile(int file) {
		this.file = file;
	}

	public List<Complaint> getList() {
		return list;
	}

	public String getTitles() {
		return titles;
	}

	public int getType() {
		return type;
	}


}

