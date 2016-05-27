package com.goldsoft.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.core.common.PagingList;
import com.goldsoft.model.Complaint;
import com.goldsoft.model.QuestionSort;
import com.goldsoft.service.QuestionSortService;

@SuppressWarnings("serial")
public class QuestionSortAction extends BaseAction {
	
	private String name;
	private String description;
	private int questionsortid;
	private QuestionSort questionsort;
	private PagingList<QuestionSort> list1;
	
	private List<QuestionSort> list;
	private String year;
	private int bannian;
	private int month;
	private int jidu;
	private int condition;
	private String titles;
	
	@Autowired
	@Qualifier("questionSortServiceImpl")
	private QuestionSortService questionSortService;

	
	private String result;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String list(){
		list=this.questionSortService.getList();
		Map<String, Integer> map=new HashMap<String, Integer>();		
		Map<String,Integer> map1=new HashMap<String,Integer>();
		for(QuestionSort qu:list){	
			int count=0;
			int count1=0;
			for(Complaint com:qu.getComplaints()){
				if(com.getLeaderapproved()==1){
					count++;
			}
				if(com.getLeaderapproved()==1&&com.getYesno()==1){
					count1++;
			}
		}
			map.put(qu.getName(), count);
			map1.put(qu.getName(),count1);
		}
		//System.out.println("--------------map---"+map.size()+"---"+map1.size()+"--hhh-"+map+"--ff-"+map1);
		//将map转为数组
		String[] str=new String[map1.size()];
		double[][] data = new double[2][map1.size()];
		List list1=new ArrayList();
		List list2=new ArrayList();
		List list3=new ArrayList();
		
		Integer othercount=0;
		for(Entry<String,Integer> entry:map.entrySet()){	
			if(entry.getKey().equals("其它")){
				othercount=entry.getValue();
			}else{
				list1.add(entry.getKey());
				list2.add(entry.getValue());
			}
		}
	
		Integer othercount2=0;
		for(Entry<String, Integer> entry:map1.entrySet()){	
			//list2.add(entry.getKey());
			if(entry.getKey().equals("其它")){
				othercount2=entry.getValue();
			}else{
				list3.add(entry.getValue());
			}
		}
		
		list2.add(othercount);
		list1.add("其它");
		list3.add(othercount2);
		
		for(int i=0;i<list1.size();i++){
			//System.out.println(list1.get(i));
			str[i]=(String) list1.get(i).toString();
		}
		//System.out.println(list1+"------"+list2+"---"+list3);
		for(int i=0;i<list2.size();i++){
			data[0][i]=Double.parseDouble(list2.get(i).toString()) ;
		}
		for(int i=0;i<list3.size();i++){
			data[1][i]=Double.parseDouble(list3.get(i).toString()) ;
		}
		//System.out.println(list1+"------"+list2+"-------"+list3);
		this.getRequest().setAttribute("str",str);
		this.getRequest().setAttribute("data",data);
		titles="预警信息问题类别柱状统计图";
		return "list";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String searchList() throws ParseException {
		Date date1 = null;
		Date date2 = null;
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		switch(condition){
		case 0:  date1=format1.parse(year+"-01-01"); date2=format1.parse(year+"-12-31");
					titles=year+"年";
					break;
		case 1: if(bannian==0)
		        {
			     String date3=year+"-01-01";
 	             String date4=year+"-06-30";  
	             date1 = format1.parse(date3);
	             date2=format1.parse(date4);
	             titles=year+"年上半年";
		         }
		       if(bannian==1)
		         {
		        	   String date5=year+"-07-01";
	        	       String date6=year+"-12-31";
	        	       date1 = format1.parse(date5);
				       date2=format1.parse(date6); 
				       titles=year+"年下半年";
		         } break;
		case 2:
			if(jidu==0)
			{
				 String date3=year+"-01-01";
   	             String date4=year+"-03-31";
   	             date1 = format1.parse(date3);
		         date2=format1.parse(date4);
			} if(jidu==1)
			{
				 String date5=year+"-04-01";
        	     String date6=year+"-06-30";
        	     date1 =format1.parse(date5);
			     date2= format1.parse(date6); 
			} if(jidu==2)
			{
				String date7=year+"-07-01";
                 String date8=year+"-09-30";
                 date1 = format1.parse(date7);
	             date2=format1.parse(date8);
			} if(jidu==3)
			{
				  String date9=year+"-10-01";
	              String date10=year+"-12-31";
	              date1 = format1.parse(date9);
		          date2=format1.parse(date10);
			} 
			titles=year+"年第"+(jidu+1)+"季度";
			break;
		case 3:   int year1=Integer.parseInt(year);
		    	    Calendar cal = Calendar.getInstance();
		 		  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
		 		  cal.set(Calendar.YEAR,year1);
		 		  cal.set(Calendar.MONTH, month);
		 		  cal.set(Calendar.DAY_OF_MONTH, 1);
		 		  cal.add(Calendar.DAY_OF_MONTH, -1);
		 		  Date dat2 = cal.getTime();
		 		  cal.set(Calendar.DAY_OF_MONTH, 1);
		 		  Date dat1  = cal.getTime();
		 		 String d1=sdf.format(dat1);
		 		  date1=format1.parse(d1);
		 		  String d2=sdf.format(dat2);
		 		  date2=format1.parse(d2);
		 		 titles=year+"年"+month+"月";
		 		  break;
		}
		//System.out.println(condition+"---"+year+"=========="+date1+"-----------------------"+date2);
		list=this.questionSortService.getList();
		Map<String, Integer> map=new HashMap<String, Integer>();		
		Map<String,Integer> map1=new HashMap<String,Integer>();
		for(QuestionSort qu:list){	
			int count=0;
			int count1=0;
			for(Complaint com:qu.getComplaints()){
				if(com.getTime().compareTo(date1)>=0&&com.getTime().compareTo(date2)<=0&&com.getLeaderapproved()==1){
					count++;
			}
				if(com.getTime().compareTo(date1)>=0&&com.getTime().compareTo(date2)<=0&&com.getLeaderapproved()==1&&com.getYesno()==1){
					count1++;
			}
		}
			map.put(qu.getName(), count);
			map1.put(qu.getName(),count1);
		}
		//System.out.println("--------------map---"+map.size()+"---"+map1.size()+"--hhh-"+map+"--ff-"+map1);
		String[] str=new String[map1.size()];
		double[][] data = new double[2][map1.size()];
		List list1=new ArrayList();
		List list2=new ArrayList();
		List list3=new ArrayList();
		
		Integer othercount=0;
		for(Entry<String,Integer> entry:map.entrySet()){	
			if(entry.getKey().equals("其它")){
				othercount=entry.getValue();
			}else{
				list1.add(entry.getKey());
				list2.add(entry.getValue());
			}
		}
		
		
		Integer othercount2=0;
		for(Entry<String, Integer> entry:map1.entrySet()){	
			if(entry.getKey().equals("其它")){
				othercount2=entry.getValue();
			}else{
				list3.add(entry.getValue());
			}
		}
		
		list2.add(othercount);
		list1.add("其它");
		list3.add(othercount2);
		
		
		for(int i=0;i<list1.size();i++){
			str[i]=(String) list1.get(i).toString();
		}
		//System.out.println(list1+"------"+list2+"---"+list3);
		for(int i=0;i<list2.size();i++){
			data[0][i]=Double.parseDouble(list2.get(i).toString()) ;
		}
		for(int i=0;i<list3.size();i++){
			data[1][i]=Double.parseDouble(list3.get(i).toString()) ;
		}
		//System.out.println(list1+"------"+list2+"-------"+list3);
		this.getRequest().setAttribute("str",str);
		this.getRequest().setAttribute("data",data);
		titles=titles+"预警信息问题类别柱状统计图";
		return "searchList";
	}
	

	public String ajaxList(){
		
		//System.out.println("handlesortaction");
		List<QuestionSort> list=this.questionSortService.getList();
		
		Map<Integer,String> map=new HashMap<Integer,String>();
		
		for(QuestionSort question:list){
			map.put(question.getQuestionsortid(), question.getName());
		}
		JSONObject obj = JSONObject.fromObject(map);   
		
		this.result=obj.toString();
		
		return SUCCESS;
	}
	
	
	
	
	public String list1(){
		this.pager=this.questionSortService.getListByPage();
		return "list1";
	}
	
	public String inAdd(){
		return "inAdd";
	}
	
	public String add(){
		
		QuestionSort questionSort=new QuestionSort();
		questionSort.setName(name);
		questionSort.setDescription(description);
		this.questionSortService.add(questionSort);
		
		return "add";
	}
	
	public String edit(){
		questionsort=this.questionSortService.get(questionsortid);
		return "edit";
	}
	
	public String update(){
		QuestionSort questionSort=this.questionSortService.get(questionsortid);
		questionSort.setName(name);
		questionSort.setDescription(description);
		this.questionSortService.update(questionSort);
		
		
		return "update";
	}
	
	public String delete(){
		this.questionSortService.delete(questionsortid);
		return "delete";
	}
	
	
	
	
	
	public List<QuestionSort> getList() {
		return list;
	}


	public String getResult() {
		return result;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public void setQuestionsortid(int questionsortid) {
		this.questionsortid = questionsortid;
	}


	public void setList1(PagingList<QuestionSort> list1) {
		this.list1 = list1;
	}


	public QuestionSort getQuestionsort() {
		return questionsort;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public int getBannian() {
		return bannian;
	}


	public void setBannian(int bannian) {
		this.bannian = bannian;
	}


	public int getJidu() {
		return jidu;
	}


	public void setJidu(int jidu) {
		this.jidu = jidu;
	}


	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
		this.month = month;
	}


	public int getCondition() {
		return condition;
	}


	public void setCondition(int condition) {
		this.condition = condition;
	}


	public String getTitles() {
		return titles;
	}
	
	
	
	
	
	

}
