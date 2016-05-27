package com.goldsoft.dao.impl;

import java.util.List;


import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.goldsoft.dao.ModuleDAO;
import com.goldsoft.model.Module;
@Repository
public class ModuleDAOImpl extends HibernateDaoSupport implements ModuleDAO {

	@Override
	public List<Module> list() {
		
		return (List<Module>)this.getHibernateTemplate().find("from Module");
	}

	@Override
	public Module get(String moduleid) {
		//System.out.println("moduledaoimpl");
		//Module module=this.getHibernateTemplate().get(Module.class, moduleid);
		List<Module> modules=(List<Module>)this.getHibernateTemplate().find("from Module where moduleid="+moduleid);
		Module module=modules.get(0);
		//System.out.println("safdsafa");
		//System.out.println(module.getName());
		return module;
	}

	@Override
	public void add(Module module) {
		this.getHibernateTemplate().save(module);

	}

	@Override
	public void update(Module module) {
		System.out.println("moduledaoupdate");
		this.getHibernateTemplate().update(module);

		System.out.println("moduledaoupdate2");
	}

	@Override
	public void delete(String moduleid) {
		this.getHibernateTemplate().delete(this.get(moduleid));

	}

}
