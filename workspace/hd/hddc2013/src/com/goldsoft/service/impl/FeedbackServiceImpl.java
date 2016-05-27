package com.goldsoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.core.common.PagingList;
import com.goldsoft.dao.FeedbackDAO;
import com.goldsoft.model.Feedback;
import com.goldsoft.service.FeedbackService;
@Service
public class FeedbackServiceImpl implements FeedbackService{
	
	@Autowired
	@Qualifier("feedbackDAOImpl")
	FeedbackDAO feedbackDAO;
	
	
	@Override
	public Feedback get(int id) {
		
		return this.feedbackDAO.get(id);
	}

	@Override
	public void add(Feedback feedback) {
		this.feedbackDAO.add(feedback);
		
	}

	@Override
	public void update(Feedback feedback) {
		this.feedbackDAO.update(feedback);
	}

	@Override
	public void delete(int id) {
		this.feedbackDAO.delete(id);
		
	}

	@Override
	public List<Feedback> getList() {
		return this.feedbackDAO.getList();
	}

	@Override
	public PagingList<Feedback> getListByPagingList() {
		return this.feedbackDAO.getListByPagingList();
	}

}
