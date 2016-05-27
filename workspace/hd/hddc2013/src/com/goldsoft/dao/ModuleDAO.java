package com.goldsoft.dao;

import java.util.List;

import com.goldsoft.model.Module;

public interface ModuleDAO {
	public List<Module> list();
	public Module get(String moduleid);
	public void add(Module module);
	public void update(Module module);
	public void delete(String moduleid);
}
