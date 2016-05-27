package com.goldsoft.service;

import java.util.List;

import com.core.common.PagingList;
import com.goldsoft.model.HandleSort;

public interface HandleSortService {
	public HandleSort get(int id);
	public void add(HandleSort handleSort);
	public void update(HandleSort handleSort);
	public void delete(int id);
	
	public List<HandleSort> getList();
	public PagingList<HandleSort> getListByPage();
}
