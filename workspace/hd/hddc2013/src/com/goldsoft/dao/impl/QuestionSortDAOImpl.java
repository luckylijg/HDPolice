package com.goldsoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.core.common.PagingList;
import com.goldsoft.dao.BaseDAOImpl;
import com.goldsoft.dao.QuestionSortDAO;
import com.goldsoft.model.QuestionSort;
@Repository
public class QuestionSortDAOImpl extends BaseDAOImpl implements QuestionSortDAO{

	@SuppressWarnings("unchecked")
	@Override
	public List<QuestionSort> getList() {
		//System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
		//from QuestionSort q,Complaint c where q.questionsortid=c.questionsortid and c.leaderapproved=1
		return this.getHibernateTemplate().find("from QuestionSort order by questionsortid desc");
	}

	@SuppressWarnings("unchecked")
	@Override
	public PagingList<QuestionSort> getListByPage() {
		// TODO Auto-generated method stub
		return this.getPagingList(10, "from QuestionSort order by questionsortid");
	}
	
	@Override
	public void add(QuestionSort questionSort) {
		this.getHibernateTemplate().save(questionSort);
		
	}

	@Override
	public void update(QuestionSort questionSort) {
		this.getHibernateTemplate().saveOrUpdate(questionSort);
		
	}

	@Override
	public void delete(int questionsortid) {
		this.getHibernateTemplate().delete(this.get(questionsortid));
		
	}

	@Override
	public QuestionSort get(int questionsortid) {
		
		return this.getHibernateTemplate().get(QuestionSort.class, questionsortid);
	}

	

}
