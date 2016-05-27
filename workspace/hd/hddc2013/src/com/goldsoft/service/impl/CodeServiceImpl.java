package com.goldsoft.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.goldsoft.dao.CodeDAO;
import com.goldsoft.model.Code;
import com.goldsoft.service.CodeService;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	@Qualifier("codeDAOImpl")
	CodeDAO codeDAO;

	@Override
	public Code get(int id) {
		// TODO Auto-generated method stub
		return this.codeDAO.get(id);
	}

	@Override
	public void add(Code code) {
		// TODO Auto-generated method stub
		this.codeDAO.add(code);
	}

	@Override
	public void update(Code code) {
		// TODO Auto-generated method stub
		this.codeDAO.update(code);
	}

	@Override
	public void delelte(int id) {
		// TODO Auto-generated method stub
		this.codeDAO.delete(id);
	}

	@Override
	public List<Code> getList() {
		// TODO Auto-generated method stub
		return this.codeDAO.getList();
	}
	
	private  void  codeHandle(Code code){
		
		String nextcode = code.getNextcode();
		String code1 = nextcode.substring(0, 2);
		String code2 =String.valueOf(100000001 + Integer.valueOf(nextcode.substring(2, nextcode.length())).intValue()) ;
		nextcode = code1 + code2.substring(code2.length()+ 2 - nextcode.length(), code2.length());
		//System.out.println("  nextcode:    "+nextcode);
		
		code.setNextcode(nextcode);
		
		this.update(code);
		
	}

	@Override
	public synchronized String getNextCode(int codeid) {
		Code code =this.get(codeid);
		String nextcode = code.getNextcode();
		codeHandle(code);
		return nextcode;
	}
}
