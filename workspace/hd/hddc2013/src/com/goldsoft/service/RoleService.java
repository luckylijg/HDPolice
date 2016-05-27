package com.goldsoft.service;

import java.util.List;

import com.goldsoft.model.Role;

public interface RoleService {
	public List<Role> list();
	public Role get(int roleid);
	public void add(Role role);
	public void update(Role role);
	public void delete(int roleid);
	
	public List<String> getModuleid(int roleid);
	public void addModuleToRole(int roleid,String moduleid);
}
