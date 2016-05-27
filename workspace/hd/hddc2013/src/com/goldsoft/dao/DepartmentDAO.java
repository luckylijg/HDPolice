package com.goldsoft.dao;

import java.util.List;

import com.core.common.PagingList;
import com.goldsoft.model.Department;


public interface DepartmentDAO {
	
	public Department get(int id);
	public void add(Department department);
	public void update(Department department);
	public void delete(int id);
	
	public List<Department> getList(int type);
	public PagingList<Department> getListByType(int type);
	public Department getDepartmentByUserName(String username);
	public List<Department> getDepartementList();
	public List<Department> getDepartementScoreList();//督察处千分制考核明细表
}
