package com.goldsoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.core.common.PagingList;
import com.goldsoft.dao.BaseDAOImpl;
import com.goldsoft.dao.HandleSortDAO;
import com.goldsoft.model.HandleSort;
@Repository
public class HandleSortDAOImpl extends BaseDAOImpl implements HandleSortDAO{

	@Override
	public void add(HandleSort handleSort) {
		this.getHibernateTemplate().save(handleSort);
		
	}

	@Override
	public void update(HandleSort handleSort) {
		this.getHibernateTemplate().saveOrUpdate(handleSort);
		
	}

	@Override
	public void delete(int id) {
		this.getHibernateTemplate().delete(this.get(id));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HandleSort> getList() {
		
		return this.getHibernateTemplate().find("from HandleSort order by handlesortid");
	}

	@Override
	public HandleSort get(int id) {
		
		return this.getHibernateTemplate().get(HandleSort.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public PagingList<HandleSort> getListByPage() {
		// TODO Auto-generated method stub
		return this.getPagingList(10, "from HandleSort order by handlesortid");
	}

}
