package com.goldsoft.dao;

import java.util.List;

import com.goldsoft.model.Role;

public interface RoleDAO {
	public List<Role> list();
	public Role get(int roleid);
	public void add(Role role);
	public void update(Role role);
	public void delete(int roleid);
}
