package com.goldsoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.goldsoft.dao.ModuleDAO;
import com.goldsoft.model.Module;
import com.goldsoft.service.ModuleService;
@Service
public class ModuleServiceImpl implements ModuleService {

	@Autowired
	@Qualifier("moduleDAOImpl")
	private ModuleDAO moduleDAO;
	
	@Override
	public List<Module> list() {
		
		return this.moduleDAO.list();
	}

	@Override
	public Module get(String moduleid) {
		
		return this.moduleDAO.get(moduleid);
	}

	@Override
	public void add(Module module) {
		this.moduleDAO.add(module);

	}

	@Override
	public void update(Module module) {
		this.moduleDAO.update(module);

	}

	@Override
	public void delete(String moduleid) {
		this.moduleDAO.delete(moduleid);

	}

}
