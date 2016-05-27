package com.goldsoft.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.core.common.PagingList;
import com.goldsoft.dao.BaseDAOImpl;
import com.goldsoft.dao.DepartmentDAO;
import com.goldsoft.model.Department;
@Repository
public class DepartmentDAOImpl extends BaseDAOImpl implements DepartmentDAO{

	@SuppressWarnings("unchecked")
	@Override
	public PagingList<Department> getListByType(int type) {
		PagingList<Department> list;
		switch (type) {
		case 1:
			list = this.getPagingList(10, "from Department dep where dep.type = ?", type);
			break;
		case 0:
			list = this.getPagingList(10, "from Department dep where dep.type = ?", type);
			break;
		default:
			list = this.getPagingList(10, "from Department");
			break;
		}
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getList(int type ) {
		List<Department> list;
		switch (type) {
	
		case 1:
		//from Department dep,Complaint c where dep.departmrntid=c.departmrntid and c.leaderapproved=1 and dep.type = ?
			list = this.getHibernateTemplate().find("from Department dep where dep.type = ?", type);
			break;
		case 0:
			list = this.getHibernateTemplate().find("from Department dep where dep.type = ?", type);
			break;
		case 2:
			list = this.getHibernateTemplate().find("from Department dep where dep.type = ?", type);
			break;
		case 3://涉及单位
			list = this.getHibernateTemplate().find("from Department dep where dep.type = ? or dep.type=?", 1,2);
			break;
		default:
			list = this.getHibernateTemplate().find("from Department");
			
		}
		return list;
	}

	@Override
	public Department get(int id) {
		
		Department depart=this.getHibernateTemplate().get(Department.class, id);
		return depart;
	}

	@Override
	public void add(Department department) {
		this.getHibernateTemplate().save(department);
	}

	@Override
	public void update(Department department) {
		this.getHibernateTemplate().saveOrUpdate(department);
	}

	@Override
	public void delete(int id) {
		this.getHibernateTemplate().delete(this.get(id));
		
	}

	@Override
	public Department getDepartmentByUserName(String username) {
		return null;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getDepartementList() {
		return this.getHibernateTemplate().find("from Department");
	}


	//督察处千分制考核明细表
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getDepartementScoreList() {
		
		return this.getHibernateTemplate().find("from Department");
	}

	

	
	
	

}
