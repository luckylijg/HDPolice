package com.goldsoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.core.common.PagingList;
import com.goldsoft.dao.DepartmentDAO;
import com.goldsoft.model.Department;
import com.goldsoft.service.DepartmentService;
@Service
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	@Qualifier("departmentDAOImpl")
	DepartmentDAO departmentDAO;
	
	@Override
	public Department get(int id) {
		// TODO Auto-generated method stub
		return this.departmentDAO.get(id);
	}

	@Override
	public void add(Department department) {
		// TODO Auto-generated method stub
		this.departmentDAO.add(department);
	}

	@Override
	public void update(Department department) {
		// TODO Auto-generated method stub
		this.departmentDAO.update(department);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		this.departmentDAO.delete(id);
	}

	@Override
	public List<Department> getList(int type) {
		// TODO Auto-generated method stub
		return this.departmentDAO.getList(type);
	}

	@Override
	public PagingList<Department> getListByPage(int type) {
		// TODO Auto-generated method stub
		return this.departmentDAO.getListByType(type);
	}

	@Override
	public List<Department> getDepartmentServiceList() {
		// TODO Auto-generated method stub
		return this.departmentDAO.getDepartementList();
	}

	@Override
	public List<Department> getDepartmentScoreServiceList() {
		// TODO Auto-generated method stub
		return  this.departmentDAO.getDepartementScoreList();
	}

}
