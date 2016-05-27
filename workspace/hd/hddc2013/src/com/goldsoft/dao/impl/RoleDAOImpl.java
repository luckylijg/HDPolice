package com.goldsoft.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.goldsoft.dao.RoleDAO;
import com.goldsoft.model.Module;
import com.goldsoft.model.Role;
@Repository
public class RoleDAOImpl extends HibernateDaoSupport implements RoleDAO{

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> list() {
		
		return (List<Role>)this.getHibernateTemplate().find("from Role");
	}

	@Override
	public Role get(int roleid) {
		//System.out.println("roledaoimpl");
		Role role=this.getHibernateTemplate().get(Role.class,roleid);
		//System.out.println("roledaoimpl2");
		return role;
	}

	@Override
	public void add(Role role) {
		this.getHibernateTemplate().save(role);

	}

	@Override
	public void update(Role role) {
		//System.out.println("roleDAOImpl11111111111");
		this.getHibernateTemplate().update(role);
		//System.out.println("roleDAOImpl22222222222222");
	}

	@Override
	public void delete(int roleid) {
		this.getHibernateTemplate().delete(this.get(roleid));

	}

}
