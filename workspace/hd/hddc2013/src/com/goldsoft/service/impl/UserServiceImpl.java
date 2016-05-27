package com.goldsoft.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.core.common.PagingList;
import com.goldsoft.dao.UserDAO;
import com.goldsoft.model.User;
import com.goldsoft.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	
	@Override
	public List<User> getlist() {
		return this.userDAO.getlist();
	}

	@Override
	public User get(int userid) {
		return this.userDAO.get(userid);
	}

	@Override
	public void add(User user) {
		this.userDAO.add(user);
	}

	@Override
	public void update(User user) {
		this.userDAO.update(user);
	}

	@Override
	public void delete(int userid) {
		this.userDAO.delete(userid);
	}

	
@Override
	public User getUserByName(String userName) {

		return this.userDAO.getUserByName(userName);
	}

	@Override
	public List<User> getlist(int type) {
	return this.userDAO.getlist(type);
	
	}

	@Override
	public PagingList<User> searchlist(int departmentid, String realname, int sex2,Timestamp date1,Timestamp date2){
		
		return this.userDAO.searchlist(departmentid, realname, sex2, date1, date2);
	}

	@Override
	public List<User> getListByDepart(int departid) {
		
		return this.userDAO.getListByDepart(departid);
	}

	@Override
	public PagingList<User> getListByPage() {
		// TODO Auto-generated method stub
		return this.userDAO.getListByPage();
	}

	
}
