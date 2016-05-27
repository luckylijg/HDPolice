package com.goldsoft.service;

import java.util.List;

import com.core.common.PagingList;
import com.goldsoft.model.Department;

public interface DepartmentService {
	public Department get(int id);
	public void add(Department department);
	public void update(Department department);
	public void delete(int id);
	
	public List<Department> getList(int type);
	public PagingList<Department> getListByPage(int type);
	public List<Department> getDepartmentServiceList();
	public List<Department> getDepartmentScoreServiceList();
}
