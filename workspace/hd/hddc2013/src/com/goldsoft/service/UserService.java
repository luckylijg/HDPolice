package com.goldsoft.service;

import java.sql.Timestamp;
import java.util.List;

import com.core.common.PagingList;
import com.goldsoft.model.User;

public interface UserService {

	
	public void add(User user);
	public void update(User user);
	public void delete(int userid);
	
	public List<User> getlist();
	public List<User> getlist(int type);
	public User get(int userid);
	public PagingList<User> getListByPage();
	public User getUserByName(String userName);
	public PagingList<User> searchlist(int departmentid, String realname, int sex2,Timestamp date1,Timestamp date2);
	public List<User> getListByDepart(int departid);
}
