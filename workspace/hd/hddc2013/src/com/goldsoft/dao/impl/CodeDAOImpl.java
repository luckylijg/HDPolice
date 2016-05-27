package com.goldsoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.goldsoft.dao.BaseDAOImpl;
import com.goldsoft.dao.CodeDAO;
import com.goldsoft.model.Code;
@Repository
public class CodeDAOImpl extends BaseDAOImpl implements CodeDAO{

	@Override
	public Code get(int id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Code.class, id);
	}

	@Override
	public void add(Code code) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(code);
	}

	@Override
	public void update(Code code) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(code);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(this.get(id));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Code> getList() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find("from Code");
	}

}
