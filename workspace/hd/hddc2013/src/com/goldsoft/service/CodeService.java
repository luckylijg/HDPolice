package com.goldsoft.service;

import java.util.List;

import com.goldsoft.model.Code;

public interface CodeService {
	public Code get(int id);
	public void add(Code code);
	public void update(Code code);
	public void delelte(int id);
	
	public List<Code> getList();
	
	public String getNextCode(int codeid);
}
