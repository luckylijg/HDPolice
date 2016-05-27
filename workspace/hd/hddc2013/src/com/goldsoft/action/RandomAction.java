package com.goldsoft.action;


import java.io.ByteArrayInputStream;
import java.util.Date;

import com.goldsoft.util.RandomNumUtil;
import com.opensymphony.xwork2.ActionContext;

public class RandomAction extends BaseAction{ 
	
	private ByteArrayInputStream inputStream; 
	
	public String execute() throws Exception{ 
		RandomNumUtil rdnu=RandomNumUtil.Instance(); 
		this.setInputStream(rdnu.getImage());//取得带有随机字符串的图片 
		//ActionContext.getContext().getSession().put("random", rdnu.getString());//取得随机字符串放入HttpSession 

		Date date=new Date();
		this.getRequest().getSession().setAttribute("month", date.getMonth());
		//System.out.println(Integer.parseInt((String)this.getRequest().getSession().getAttribute("time"))+1);
		if(Integer.parseInt(this.getRequest().getSession().getAttribute("month").toString())<Integer.parseInt(this.getRequest().getSession().getAttribute("time").toString())+1){
			this.getRequest().getSession().setAttribute("random", rdnu.getString());
		}
		//System.out.println("//////////////////////////////"+rdnu.getString());
		return SUCCESS; 
	} 
	
	public void setInputStream(ByteArrayInputStream inputStream) { 
		this.inputStream = inputStream; 
	} 
	
	public ByteArrayInputStream getInputStream() { 
		return inputStream; 
	} 
} 
