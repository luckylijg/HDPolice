package com.goldsoft.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goldsoft.model.Module;
import com.goldsoft.service.ModuleService;

@SuppressWarnings("serial")
public class ModuleAction extends BaseAction {

	private String moduleid;
	private String name;
	private String link;
	
	Module module;
	List<Module> list;
	
	@Autowired
	@Qualifier("moduleServiceImpl")
	private ModuleService moduleService;
	
	public String list(){
		
		this.list=this.moduleService.list();
		return "list";
	}
	
public String inAdd(){
		
		return "inAdd";
	}
	
	public String add(){
		Module module=new Module();
		System.out.println(moduleid);
	    module.setModuleid(moduleid);
	    module.setName(name);
	    module.setLink(link);
	    this.moduleService.add(module);
		return "add";
	}
	
	public String edit(){
		this.module = this.moduleService.get(moduleid);
		return "edit";
	}

	public String update(){
		Module module=this.moduleService.get(moduleid);
		module.setName(name);
		module.setLink(link);
		this.moduleService.update(module);
		return "update";
	}
	
	public String delete(){
		//System.out.println("+++++++++++++++++++++++++++++++++++++++++++");
		this.moduleService.delete(moduleid);
		return "delete";
	}
	
	public Module getModule() {
		return module;
	}

	public List<Module> getList() {
		return list;
	}

	public String get(){
		
		this.moduleService.get(moduleid);
		
		return "get";
	}
	
	public void setModuleid(String moduleid) {
		this.moduleid = moduleid;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public void setModule(Module module) {
		this.module = module;
	}
	
}
