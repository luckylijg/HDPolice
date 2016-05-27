package com.goldsoft.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goldsoft.model.Module;
import com.goldsoft.model.Role;
import com.goldsoft.service.ModuleService;
import com.goldsoft.service.RoleService;

@SuppressWarnings("serial")
public class RoleAction extends BaseAction {

	private List<Role> roles;
	private List<Module> modules;
	private int roleid;
	private Set<Module> modules2;
	private String result;
	private String moduleid;
	private Role role;
	private String name;
	private String description;
	private List<Role> list;
	
	@Autowired
	@Qualifier("roleServiceImpl")
	private RoleService roleService;
	@Autowired
	@Qualifier("moduleServiceImpl")
	private ModuleService moduleService;
	
	public String list(){
		//System.out.println("+++++++++++++++++++++++++++");
		roles=this.roleService.list();
		list=this.roleService.list();
		
		return "list";
	}
	
	public String inAdd(){
		
		return "inAdd";
	}
	
	public String add(){
		Role role=new Role();
		role.setName(name);
		role.setDescription(description);
		this.roleService.add(role);
		return "add";
	}
	
	public String edit(){
		role=this.roleService.get(roleid);
		
		return "edit";
	}
	
	public String update(){
		Role role=this.roleService.get(roleid);
		role.setName(name);
		role.setDescription(description);
		this.roleService.update(role);
		return "update";
	}
	
	public String delete(){
		this.roleService.delete(roleid);
		return "delete";
	}
	
	public String roleModule(){
		roles=this.roleService.list();

		modules=this.moduleService.list();
		return "roleModule";
	}
	
	public String modules(){
		//System.out.println(roleid);
		List<String> list=this.roleService.getModuleid(roleid);
		Map<String,String> map=new HashMap<String,String>();
		int index=100;
		//System.out.println(list.size());
		for(String s:list){
			map.put("a"+index, s);
			//System.out.println("action"+s);
			index++;
		}
		JSONObject obj = JSONObject.fromObject(map);   
		//JSONArray jsonObject = JSONArray.fromObject(map);   
		// System.out.println("ddddddddddddddddd");
		
		// String json = jsonObject.toString() ;
		result=obj.toString();
		
		 //System.out.println("ccccccccccccc");
		return SUCCESS;
		
	}
	
	public String addModuleToRole(){
		
		//Module module =this.moduleService.get(moduleid);
		//System.out.println(module.getName());
		//System.out.println(roleid+"                  "+moduleid);
		//System.out.println("杩涙潵浜�);
		this.roleService.addModuleToRole(roleid, moduleid);
		return "addModuleToRole";
	}
	
	


	public List<Role> getRoles() {
		return roles;
	}

	public List<Module> getModules() {
		return modules;
	}
	
	public Set<Module> getModules2() {
		return modules2;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public String getResult() {
		return result;
	}

	public void setModuleid(String moduleid) {
		this.moduleid = moduleid;
	}

	public int getRoleid() {
		return roleid;
	}

	public List<Role> getList() {
		return list;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Role getRole() {
		return role;
	}

}
