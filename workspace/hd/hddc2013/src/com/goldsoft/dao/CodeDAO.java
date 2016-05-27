package com.goldsoft.dao;

import java.util.List;

import com.goldsoft.model.Code;

public interface CodeDAO {
	
	public Code get(int id);
	public void add(Code code);
	public void update(Code code);
	public void delete(int id);
	
	public List<Code> getList();
}
