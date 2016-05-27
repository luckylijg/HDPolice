package com.goldsoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.core.common.PagingList;
import com.goldsoft.dao.QuestionSortDAO;
import com.goldsoft.model.QuestionSort;
import com.goldsoft.service.QuestionSortService;
@Service
public class QuestionSortServiceImpl implements QuestionSortService {
	
	@Autowired
	@Qualifier("questionSortDAOImpl")
	QuestionSortDAO questionSortDAO;
	@Override
	public QuestionSort get(int questionsortid) {
		// TODO Auto-generated method stub
		return this.questionSortDAO.get(questionsortid);
	}

	@Override
	public void add(QuestionSort questionSort) {
		// TODO Auto-generated method stub
		this.questionSortDAO.add(questionSort);
	}

	@Override
	public void update(QuestionSort questionSort) {
		this.questionSortDAO.update(questionSort);
	}

	@Override
	public void delete(int questionsortid) {
		// TODO Auto-generated method stub
		this.questionSortDAO.delete(questionsortid);
	}

	@Override
	public List<QuestionSort> getList() {
		// TODO Auto-generated method stub
		//System.out.println("sssssssssssssssssssssssss");
		return this.questionSortDAO.getList();
	}

	@Override
	public PagingList<QuestionSort> getListByPage() {
		// TODO Auto-generated method stub
		return this.questionSortDAO.getListByPage();
	}

}
