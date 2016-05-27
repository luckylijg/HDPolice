package com.goldsoft.action;


import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.core.Constants;
import com.core.common.CommonBaseAction;
import com.goldsoft.model.Module;
import com.goldsoft.model.Role;
import com.goldsoft.model.User;
import com.goldsoft.service.CodeService;
import com.goldsoft.service.impl.CodeServiceImpl;
import com.opensymphony.xwork2.ActionContext;
@SuppressWarnings("serial")
public class BaseAction extends CommonBaseAction {
	public BaseAction(){
		log.debug("(2)[ValueStack]"+ActionContext.getContext().getValueStack());
	}
	

	/* 获取登录用户对象 */
	protected User getLoginUser() {
		return (User) this.getRequest().getSession().getAttribute("currentUser");
	}
	
	/* 获取登录用户ID */
	protected int getLoginUserId() {//long
		User user = getLoginUser();
		if (user != null) {//session过期
			//return new Long(((BigDecimal) user.get("USERID")).longValue());
			return user.getUserid();
		}
		return -1;
	}
	
	/* 获取登录用户名 */
	protected String getLoginName() {
		User user = getLoginUser();
		if (user != null) {
			return user.getUsername();
		}
		return null;
	}
	
	/* 获取登录用户真实姓名 */
	protected String getLoginRealName() {
		User user = getLoginUser();
		if (user != null) {
			return user.getRealname();
		}
		return null;
	}
	
	/* 获取登录用户组编号 */
/*	@SuppressWarnings("unchecked")
	public Long getLoginUserGroupId() {
		User user = getLoginUser();
		if (user != null) {
			//return user.getGroup().getGroupid();
		}
		return null;
	}*/
	
	/*获得用户的角色*/
	protected List<Role> getUserRoles() {
		User user = getLoginUser();
		if (user != null) {
			Set<Role> set = user.getRoles();
			//加入list升序排序？？
			return  new ArrayList<Role>(set);//List list = new ArrayList(new HashSet());// Fixed-size list 
		}
		return null;
	}
	
	/*获取moduleid升序排序的TreeSet<Module>*/
	protected TreeSet<Module> getUserModules(){
		User user = getLoginUser();
		if (user == null) return null;
		TreeSet<Module> set = new TreeSet<Module>(new Comparator<Module>(){ 
			@Override
			public int compare(Module o1, Module o2) { 
		        return o1.getModuleid().compareTo(o2.getModuleid()); 
			} 
		});
		Set<Role> roles = user.getRoles();
		for(Role role:roles){
			for(Module module:role.getModules()){
				set.add(module);
			}
		}
		//return  new ArrayList<Role>(set);//List list = new ArrayList(new HashSet());// Fixed-size list 
		return set;
	}
	
	/*获取用户系统默认角色(系统管理员|供应商|客户|...)*/
	protected Role getUserSysRole(){
		List<Role> list = this.getUserRoles();
		return list.size()==0?null:list.get(0);
	}
	
	@Autowired
	@Qualifier("codeServiceImpl")
	CodeService codeService;
	
	protected String getNextCode() {
		String nextcode  = "";
		switch (Constants.TYPE) {
		case 0:
			nextcode = codeService.getNextCode(Constants.TYPE);
			break;
		case 1:
			nextcode = codeService.getNextCode(Constants.TYPE);
			break;
		case 2:
			nextcode = codeService.getNextCode(Constants.TYPE);
			break;
		case 3:
			nextcode = codeService.getNextCode(Constants.TYPE);
			break;
		default:
			break;
		}
		
		return nextcode;
	
		
	}
	
	
	
	
	
	
}
