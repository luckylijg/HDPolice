package com.goldsoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.core.common.PagingList;
import com.goldsoft.dao.HandleSortDAO;
import com.goldsoft.model.HandleSort;
import com.goldsoft.service.HandleSortService;
@Service
public class HandleSortServiceImpl implements HandleSortService{
	
	@Autowired
	@Qualifier("handleSortDAOImpl")
	HandleSortDAO handleSortDAO;
	
	@Override
	public HandleSort get(int id) {
		// TODO Auto-generated method stub
		return handleSortDAO.get(id);
	}

	@Override
	public void add(HandleSort handleSort) {
		// TODO Auto-generated method stub
		handleSortDAO.add(handleSort);
	}

	@Override
	public void update(HandleSort handleSort) {
		// TODO Auto-generated method stub
		handleSortDAO.update(handleSort);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		handleSortDAO.delete(id);
	}

	@Override
	public List<HandleSort> getList() {
		// TODO Auto-generated method stub
		return this.handleSortDAO.getList();
	}

	@Override
	public PagingList<HandleSort> getListByPage() {
		// TODO Auto-generated method stub
		return this.handleSortDAO.getListByPage();
	}

}
