package com.goldsoft.dao;

import java.util.List;

import com.core.common.PagingList;
import com.goldsoft.model.QuestionSort;

public interface QuestionSortDAO {
	
	public QuestionSort get(int questionsortid);
	public void add(QuestionSort questionSort);
	public void update(QuestionSort questionSort);
	public void delete(int questionsortid);
	
	public List<QuestionSort> getList();
	public PagingList<QuestionSort> getListByPage();
}
