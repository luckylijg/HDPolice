package com.goldsoft.service;


import java.util.List;

import com.core.common.PagingList;
import com.goldsoft.model.Feedback;

public interface FeedbackService {
	public  Feedback get(int id);
	public void add(Feedback feedback);
	public void update(Feedback feedback);
	public void delete(int id);
	public List<Feedback> getList();
	public PagingList<Feedback> getListByPagingList() ;
}
