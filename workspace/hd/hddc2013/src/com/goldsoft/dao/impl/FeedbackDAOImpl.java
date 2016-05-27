package com.goldsoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.core.common.PagingList;
import com.goldsoft.dao.BaseDAOImpl;
import com.goldsoft.dao.FeedbackDAO;
import com.goldsoft.model.Feedback;
@Repository
public class FeedbackDAOImpl extends BaseDAOImpl implements FeedbackDAO {

	@Override
	public Feedback get(int id) {
		return this.getHibernateTemplate().get(Feedback.class, id);
	}

	@Override
	public void add(Feedback feedback) {
		this.getHibernateTemplate().save(feedback);
		
	}

	@Override
	public void update(Feedback feedback) {
		this.getHibernateTemplate().saveOrUpdate(feedback);
		
	}

	@Override
	public void delete(int id) {
		this.getHibernateTemplate().delete(this.get(id));
		
	}

	@Override
	public List<Feedback> getList() {
		
		return this.getHibernateTemplate().find("from Feedback");
	}

	@Override
	public PagingList<Feedback> getListByPagingList() {
		
		return this.getPagingList(10, "from Feedback") ;
	}

}
