package com.goldsoft.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goldsoft.model.Complaint;
import com.goldsoft.model.Department;
import com.goldsoft.model.QuestionSort;
import com.goldsoft.model.Role;
import com.goldsoft.model.User;
import com.goldsoft.service.ComplaintService;
import com.goldsoft.service.DepartmentService;
import com.goldsoft.service.QuestionSortService;
import com.goldsoft.util.DepartComparator;
import com.goldsoft.util.MapComparator;
import com.goldsoft.util.QianfenComparator;

@SuppressWarnings("serial")
public class DepartmentAction extends BaseAction {

	private List<QuestionSort> list1;
	private List<Department> list;
	private Date date1;
	private Date date2;
	private int departmentName;
	private int year;
	private int newYear;
	private int month;
	private String dename;
	private List<Complaint> listByEarlyWarining;
	@Autowired
	@Qualifier("departmentServiceImpl")
	private DepartmentService departmentService;
	private int departmentid;
	private int type;
	private String name;
	private String address;
	private String phone;
	private String description;
	private Department department;
	//private String year;
	private int bannian;
	//private int month;
	private int jidu;
	private int condition;
	private String year1;
	List<Complaint> list2;	
	List<Complaint> list3;
	List<Complaint> list4;
	List<Complaint> list5;

	List<List<String>> outlist;
	List<String> innerList;
	private int x=1;

	private List<Department> list8;
	Integer score2 = 0;
	Integer score3 =0 ;
	Integer score4=0;
	Integer score5=0;
	private String temp;
	private boolean R;
	List list7;
	List list6;
	List<Complaint> departmentnameList;
	int deptype;
	String titles;
	@Autowired
	@Qualifier("questionSortServiceImpl")
	private QuestionSortService questionSortService;
	private String result;
	List<Map<String,String>> paimingList = new ArrayList<Map<String,String>>();
	List<Map<String,String>> paimingLists = new ArrayList<Map<String,String>>();
	@Autowired
	@Qualifier("complaintServiceImpl")
	private ComplaintService complaintService;
	
	int a;

	//根据部门名称得到该部门问题列表
	public String departmentnamelist() throws ParseException{
		//System.out.println("---------------------------");
		//System.out.println(year1+"------"+month+"-----------------"+departmentid);
		list=this.departmentService.getList(3);
		
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

		int year=Integer.parseInt(year1);
	    Calendar cal = Calendar.getInstance();
		  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
		  cal.set(Calendar.YEAR,year);
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
		 
		  departmentnameList=new ArrayList<Complaint>();
		  
		  for(Department de:list){
			  for(Complaint com:de.getComplaints_1()){
				  
					  if(com.getTime().compareTo(date1)>=0&&com.getTime().compareTo(date2)<=0&&departmentid==de.getDepartmentid()&&com.getScore()!=0){
						  departmentnameList.add(com);
				  }
			  }
		  }
		return "departmentnamelist";
	}
	
	//大队柱状图
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String list(){
		list=this.departmentService.getList(deptype);	
		Map<String, Integer> map=new HashMap<String, Integer>();		
		Map<String,Integer> map1=new HashMap<String,Integer>();
		for(Department de:list){
			int count=0;
			int count1=0;
			for(Complaint com:de.getComplaints_1()){
				if(com.getLeaderapproved()==1){
					count++;
				}
				if(com.getLeaderapproved()==1&&com.getYesno()==1){
					count1++;
			}
			}
			map.put(de.getName(), count);
			map1.put(de.getName(),count1);
		 
		}
		String[] str=new String[map1.size()];
		double[][] data = new double[2][map1.size()];
		List list1=new ArrayList();
		List list2=new ArrayList();
		List list3=new ArrayList();
		
		for(Entry<String,Integer> entry:map.entrySet()){	
		list1.add(entry.getKey());
		list2.add(entry.getValue());
		}
		
		for(Entry<String, Integer> entry:map1.entrySet()){	
			//list2.add(entry.getKey());
			list3.add(entry.getValue());
			}
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
		this.getRequest().setAttribute("list",list);
		return "list";
	}
	//大队柱状图搜索
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String searchList() throws ParseException{
		/*System.out.println("=======");
		System.out.println("---------------"+deptype);*/
		Date date1 = null;
		Date date2 = null;
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		switch(condition){
		case 0:  date1=format1.parse(year1+"-01-01"); date2=format1.parse(year1+"-12-31");
					titles=year1+"年";
				break;
		case 1: if(bannian==0)
		        {
			     String date3=year1+"-01-01";
 	             String date4=year1+"-06-30";  
	             date1 = format1.parse(date3);
	             date2=format1.parse(date4);
	             titles=year1+"年上半年";
		         }
		       if(bannian==1)
		         {
		        	   String date5=year1+"-07-01";
	        	       String date6=year1+"-12-31";
	        	       date1 = format1.parse(date5);
				       date2=format1.parse(date6);
				       titles=year1+"年下半年";
		         } 
		       
		       break;
		case 2:
			if(jidu==0)
			{
				 String date3=year1+"-01-01";
   	             String date4=year1+"-03-31";
   	             date1 = format1.parse(date3);
		         date2=format1.parse(date4);
			}else if(jidu==1)
			{
				 String date5=year1+"-04-01";
        	     String date6=year1+"-06-30";
        	     date1 =format1.parse(date5);
			     date2= format1.parse(date6); 
			}else if(jidu==2)
			{
				String date7=year1+"-07-01";
                 String date8=year1+"-09-30";
                 date1 = format1.parse(date7);
	             date2=format1.parse(date8);
			}else if(jidu==3)
			{
				  String date9=year1+"-10-01";
	              String date10=year1+"-12-31";
	              date1 = format1.parse(date9);
		          date2=format1.parse(date10);
			} 
			titles=year1+"年第"+(jidu+1)+"季度";
			break;
		case 3:   int year2=Integer.parseInt(year1);
		    	    Calendar cal = Calendar.getInstance();
		 		  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
		 		  cal.set(Calendar.YEAR,year2);
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
		 		 titles=year1+"年"+month+"月";
		 		  break;
		}
		
		if(deptype==1){
		titles=titles+"大队预警信息柱状统计图";
		}else if(deptype==2){
			titles=titles+"科室预警信息柱状统计图";
		}else{
			titles=titles+"各单位预警信息柱状统计图";
		}
		list=this.departmentService.getList(deptype);
	
		List<List> countList =new ArrayList<List>();
		
		for(Department de:list){
			List cou=new ArrayList();
			int count=0;
			int count1=0;
			for(Complaint com:de.getComplaints_1()){
				if(com.getTime().compareTo(date1)>=0&&com.getTime().compareTo(date2)<=0&&com.getLeaderapproved()==1){
					count++;
				}
				if(com.getTime().compareTo(date1)>=0&&com.getTime().compareTo(date2)<=0&&com.getLeaderapproved()==1&&com.getYesno()==1){
					count1++;
				}
			}
			if(count!=0){
			cou.add(de.getName());
			cou.add(count);
			cou.add(count1);
			countList.add(cou);
			}else if(deptype!=3){
				cou.add(de.getName());
				cou.add(count);
				cou.add(count1);
				countList.add(cou);
			}
			
			}
		
			

			DepartComparator dc = new DepartComparator();
			Collections.sort(countList, dc);
			
		
			String[] str=new String[countList.size()];
			double[][] data = new double[2][countList.size()];
			
			
			for(int i=0;i<countList.size();i++){
				str[i]=countList.get(i).get(0).toString();
			}
			
			for(int i=0;i<countList.size();i++){
				data[0][i]=Double.parseDouble(countList.get(i).get(1).toString()) ;
			}
			for(int i=0;i<countList.size();i++){
				data[1][i]=Double.parseDouble(countList.get(i).get(2).toString()) ;
			}
			//System.out.println(list1+"------"+list2+"-------"+list3);
			this.getRequest().setAttribute("str",str);
			this.getRequest().setAttribute("data",data);		
		return "searchList";
	}
	
	
	//科室柱状图
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String listbykeshi(){
		list=this.departmentService.getList(2);	
		Map<String, Integer> map=new HashMap<String, Integer>();		
		Map<String,Integer> map1=new HashMap<String,Integer>();
		for(Department de:list){

	/*		//System.out.println(de.getComplaints().size());
			for(Complaint complaint:de.getComplaints_1()){
				//System.out.println(complaint.getTime2().compareTo(date1));
				if(complaint.getTime().compareTo(date1)>=0&&complaint.getTime().compareTo(date2)<=0&&complaint.getLeaderapproved()==1){
*/
			int count=0;
			int count1=0;
			for(Complaint com:de.getComplaints_1()){
				if(com.getLeaderapproved()==1){

					count++;
				}
				if(com.getLeaderapproved()==1&&com.getYesno()==1){
					count1++;
			}
			}
			map.put(de.getName(), count);
			map1.put(de.getName(),count1);
		 
		}
		String[] str=new String[map1.size()];
		double[][] data = new double[2][map1.size()];
		List list1=new ArrayList();
		List list2=new ArrayList();
		List list3=new ArrayList();
		
		for(Entry<String,Integer> entry:map.entrySet()){	
		list1.add(entry.getKey());
		list2.add(entry.getValue());
		}
		
		for(Entry<String, Integer> entry:map1.entrySet()){	
			//list2.add(entry.getKey());
			list3.add(entry.getValue());
			}
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
		System.out.println(list1+"------"+list2+"-------"+list3);
		this.getRequest().setAttribute("str",str);
		this.getRequest().setAttribute("data",data);
		this.getRequest().setAttribute("list",list);
		return "listbykeshi";
	}
	//科室柱状图搜索
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String searchListbykeshi() throws ParseException{
		Date date1 = null;
		Date date2 = null;
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); 
		switch(condition){
		case 0:  date1=format1.parse(year1+"-01-01"); date2=format1.parse(year1+"-12-31");break;
		case 1: if(bannian==0)
		        {
			     String date3=year1+"-01-01";
 	             String date4=year1+"-06-30";  
	             date1 = format1.parse(date3);
	             date2=format1.parse(date4);
		         }
		       if(bannian==1)
		         {
		        	   String date5=year1+"-07-01";
	        	       String date6=year1+"-12-31";
	        	       date1 = format1.parse(date5);
				       date2=format1.parse(date6); 
		         } break;
		case 2:
			if(jidu==0)
			{
				 String date3=year1+"-01-01";
   	             String date4=year1+"-03-31";
   	             date1 = format1.parse(date3);
		         date2=format1.parse(date4);
			}else if(jidu==1)
			{
				 String date5=year1+"-04-01";
        	     String date6=year1+"-06-30";
        	     date1 =format1.parse(date5);
			     date2= format1.parse(date6); 
			}else if(jidu==2)
			{
				String date7=year1+"-07-01";
                 String date8=year1+"-09-30";
                 date1 = format1.parse(date7);
	             date2=format1.parse(date8);
			}else if(jidu==3)
			{
				  String date9=year1+"-10-01";
	              String date10=year1+"-12-31";
	              date1 = format1.parse(date9);
		          date2=format1.parse(date10);
			} break;
		case 3:   int year2=Integer.parseInt(year1);
		    	    Calendar cal = Calendar.getInstance();
		 		  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
		 		  cal.set(Calendar.YEAR,year2);
		 		  cal.set(Calendar.MONTH, month);
		 		  cal.set(Calendar.DAY_OF_MONTH, 1);
		 		  cal.add(Calendar.DAY_OF_MONTH, -1);
		 		  date2 = cal.getTime();
		 		  cal.set(Calendar.DAY_OF_MONTH, 1);
		 		  date1  = cal.getTime();
		 		  break;
		}
		list=this.departmentService.getList(2);
		Map<String, Integer> map=new HashMap<String, Integer>();		
		Map<String,Integer> map1=new HashMap<String,Integer>();
		for(Department de:list){
			int count=0;
			int count1=0;
			for(Complaint com:de.getComplaints_1()){
				if(com.getTime2().compareTo(date1)>=0&&com.getTime2().compareTo(date2)<=0&&com.getLeaderapproved()==1){
					count++;
				}
				if(com.getTime2().compareTo(date1)>=0&&com.getTime2().compareTo(date2)<=0&&com.getLeaderapproved()==1&&com.getYesno()==1){
					count1++;
				}
			}
			map.put(de.getName(), count);
			map1.put(de.getName(),count1);
			 
			}
			String[] str=new String[map1.size()];
			double[][] data = new double[2][map1.size()];
			List list1=new ArrayList();
			List list2=new ArrayList();
			List list3=new ArrayList();
			
			for(Entry<String,Integer> entry:map.entrySet()){	
			list1.add(entry.getKey());
			list2.add(entry.getValue());
			}
			
			for(Entry<String, Integer> entry:map1.entrySet()){	
				//list2.add(entry.getKey());
				list3.add(entry.getValue());
				}
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
			System.out.println(list1+"------"+list2+"-------"+list3);
			this.getRequest().setAttribute("str",str);
			this.getRequest().setAttribute("data",data);		
		return "searchListbykeshi";
	}
	
	//千分制考核的方法
	DateFormat fm = new SimpleDateFormat("yyyy-MM-dd"); //可以方便地修改日期格式
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	@SuppressWarnings({ "unchecked", "rawtypes" })


	public String qianfen() throws Exception{
		//System.out.println("-------------------");
		this.list=this.departmentService.getList(3);
		this.list8=this.departmentService.getList(2);

		//list1=this.questionSortService.getList();
		//String year=this.getRequest().getParameter("year");
		//String month=this.getRequest().getParameter("month");
		//int year1=Integer.parseInt("year");
		//int month1=Integer.parseInt("month");

		  Calendar cal = Calendar.getInstance();
		  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
		  cal.set(Calendar.YEAR,year);
		  cal.set(Calendar.MONTH, month);
		  cal.set(Calendar.DAY_OF_MONTH, 1);
		  cal.add(Calendar.DAY_OF_MONTH, -1);
		  Date lastDate = cal.getTime();
		  cal.set(Calendar.DAY_OF_MONTH, 1);
		  Date firstDate = cal.getTime();
		  
		  String last1 = fm.format( lastDate );
		  Date lastDate1=fm.parse(last1);
		  
		  String first=fm.format(firstDate);
		  Date firstDate1=fm.parse(first);
		  
		list2=new ArrayList();
		list3=new ArrayList();
		list4=new ArrayList();
		list5=new ArrayList();
		
		Set<Role> roles= this.getLoginUser().getRoles();

		for(Role role:roles){
			if(role.getRoleid()==3)
			{R = true;}
		}
		Department de;
		
			if(departmentName!=0){
				de=this.departmentService.get(departmentName);
				dename=de.getName();
				//System.out.println("size"+de.getComplaints_1().size());
				for(Complaint com2:de.getComplaints_1()){
					if(com2.getTime().compareTo(firstDate1)>=0&&com2.getTime().compareTo(lastDate1)<=0&&com2.getLeaderapproved()==1){
				    switch(com2.getType()){
						case 0:list2.add(com2);								
								break;
						case 1: list3.add(com2);//问题类别的名称								
								break;
						case 2: list4.add(com2); 								
								break;
						case 3: list5.add(com2); 								
								break;
					}
				}			
			}
		}
			for(Complaint com2:list2){
				score2=score2+com2.getScore();
			}
			for(Complaint com2:list3){
				score3=score3+com2.getScore();
			}
			for(Complaint com2:list4){
				score4=score4+com2.getScore();
			}
			for(Complaint com2:list5){
				score5=score5+com2.getScore();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
			String time = sdf.format( new Date() );
			 String str1=time.substring(0,4);	 
			 a=Integer.parseInt(str1);
			
			
			this.getRequest().getSession().setAttribute("complaint_list", list2);
			this.getRequest().getSession().setAttribute("xianchang_list", list3);
			this.getRequest().getSession().setAttribute("wangshang_list", list4);
			this.getRequest().getSession().setAttribute("wangluo_list", list5);
			
			newYear=new Date().getYear()+1900;
			
			//System.out.println(temp+"--------------------"+"2".equals(temp));
			//System.out.println(score2+"===="+score3+"===="+score4+"==="+score5+"");
			if("5".equals(temp)){
				return "wangluo";
			}else if("2".equals(temp)){
				return "tousu";
			}else if("3".equals(temp)){
				return "xianchang";
			}else if("4".equals(temp)){
				return "wangshang";
			}else{
				return "qianfen";
			}
		
	}
	
	public String dep_qianfen() throws Exception{
		
		User user=(User)this.getRequest().getSession().getAttribute("currentUser");
		department=departmentService.get(user.getDepartment().getDepartmentid());
		
		
		//System.out.println("-------------------");
		this.list=this.departmentService.getList(3);
		//this.list8=this.departmentService.getList(2);

		//list1=this.questionSortService.getList();
		//String year=this.getRequest().getParameter("year");
		//String month=this.getRequest().getParameter("month");
		//int year1=Integer.parseInt("year");
		//int month1=Integer.parseInt("month");

		  Calendar cal = Calendar.getInstance();
		  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
		  cal.set(Calendar.YEAR,year);
		  cal.set(Calendar.MONTH, month);
		  cal.set(Calendar.DAY_OF_MONTH, 1);
		  cal.add(Calendar.DAY_OF_MONTH, -1);
		  Date lastDate = cal.getTime();
		  cal.set(Calendar.DAY_OF_MONTH, 1);
		  Date firstDate = cal.getTime();
		  
		  String last1 = fm.format( lastDate );
		  Date lastDate1=fm.parse(last1);
		  
		  String first=fm.format(firstDate);
		  Date firstDate1=fm.parse(first);
		  
		list2=new ArrayList();
		list3=new ArrayList();
		list4=new ArrayList();
		list5=new ArrayList();

		Department de;
		
			if(departmentName!=0){
				de=this.departmentService.get(departmentName);
				dename=de.getName();
				//System.out.println("size"+de.getComplaints_1().size());
				for(Complaint com2:de.getComplaints_1()){
					if(com2.getTime().compareTo(firstDate1)>=0&&com2.getTime().compareTo(lastDate1)<=0&&com2.getLeaderapproved()==1){
						switch(com2.getType()){
						case 0:list2.add(com2);								
								break;
						case 1: list3.add(com2);//问题类别的名称								
								break;
						case 2: list4.add(com2); 								
								break;
						case 3: list5.add(com2); 								
								break;
					}
				}			
			}
		}
			for(Complaint com2:list2){
				score2=score2+com2.getScore();
			}
			for(Complaint com2:list3){
				score3=score3+com2.getScore();
			}
			for(Complaint com2:list4){
				score4=score4+com2.getScore();
			}
			for(Complaint com2:list5){
				score5=score5+com2.getScore();
			}
			this.getRequest().getSession().setAttribute("complaint_list", list2);
			this.getRequest().getSession().setAttribute("xianchang_list", list3);
			this.getRequest().getSession().setAttribute("wangshang_list", list4);
			this.getRequest().getSession().setAttribute("wangluo_list", list5);
			
			newYear=new Date().getYear()+1900;
			//System.out.println(newYear);
			
			//System.out.println(temp+"--------------------"+"2".equals(temp));
			//System.out.println(score2+"===="+score3+"===="+score4+"==="+score5+"");
			if("5".equals(temp)){
				return "wangluo";
			}else if("2".equals(temp)){
				return "tousu";
			}else if("3".equals(temp)){
				return "xianchang";
			}else if("4".equals(temp)){
				return "wangshang";
			}else{
				return "dep_qianfen";
			}
		
	}
	
	//涉及单位千分制考核扣分排名统计表----大队 科室  搜索
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String paimingdadui() throws Exception{
			this.list=this.departmentService.getList(1);
			  Calendar cal = Calendar.getInstance();
			  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
			  cal.set(Calendar.YEAR,year);
			  cal.set(Calendar.MONTH, month);
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  cal.add(Calendar.DAY_OF_MONTH, -1);
			  Date lastDate = cal.getTime();
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  Date firstDate = cal.getTime();
			  
			  String last1 = fm.format( lastDate );
			  Date lastDate1=fm.parse(last1);
			  
			  String first=fm.format(firstDate);
			  Date firstDate1=fm.parse(first);
			  
			int score=0;	
			int count=0;
				for(Department de:list){
					Map<String, String> di = new HashMap<String,String>(); 
					for(Complaint com2: de.getComplaints_1()){
						//？？？？？？？？？？？？？？？？？？
						if(com2.getTime().compareTo(firstDate)>=0&&com2.getTime().compareTo(lastDate)<=0&&com2.getLeaderapproved()==1&&com2.getEarlywarning()==1){
					        score+=com2.getScore();
					        count++;
				        }
					}
					//System.out.println(score);
						di.put("dname",de.getName());
						di.put("score",score+"");
						di.put("cishu",count+"");
						di.put("departmentid",de.getDepartmentid()+"");
						di.put("type", de.getType()+"");
						di.put("warning",de.getDescription());
						di.put("type", de.getType()+"");
						paimingList.add(di);
						score=0;
						count=0;
				}
			MapComparator mc=new MapComparator();
			Collections.sort(paimingList, mc);	
			//System.out.println(type+"          "+this.paimingList.size());
			
				return "paimingdadui";
			
			
		}
		
		//涉及单位千分制考核扣分排名统计表----科室 soususo
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String paimingkeshi() throws Exception{
			this.list=this.departmentService.getList(2);
			  Calendar cal = Calendar.getInstance();
			  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
			  cal.set(Calendar.YEAR,year);
			  cal.set(Calendar.MONTH, month);
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  cal.add(Calendar.DAY_OF_MONTH, -1);
			  Date lastDate = cal.getTime();
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  Date firstDate = cal.getTime();
			  
			  String last1 = fm.format( lastDate );
			  Date lastDate1=fm.parse(last1);
			  
			  String first=fm.format(firstDate);
			  Date firstDate1=fm.parse(first);
			  
			int score=0;
			int count=0;
				for(Department de:list){
					Map<String, String> di = new HashMap<String,String>(); 
					for(Complaint com2: de.getComplaints_1()){
						//？？？？？？？？？？？？？？？？？？
						if(com2.getTime().compareTo(firstDate)>=0&&com2.getTime().compareTo(lastDate)<=0&&com2.getLeaderapproved()==1&&com2.getEarlywarning()==1){
					        score+=com2.getScore();
					        count++;
				        }
					}
					//System.out.println(score);
						di.put("dname",de.getName());
						di.put("score",score+"");
						di.put("cishu",count+"");
						di.put("departmentid",de.getDepartmentid()+"");
						di.put("type", de.getType()+"");
						di.put("warning",de.getDescription());
						di.put("type", de.getType()+"");
						paimingList.add(di);
						score=0;
						count=0;
				}
			MapComparator mc=new MapComparator();
			Collections.sort(paimingList, mc);	
			//System.out.println(type+"          "+this.paimingList.size());
			
				return "keshipaiming";
			
			
		}
		
		//打印--
		public String printqianfen() throws Exception{
			//System.out.println(month+"----===-------"+year);
			this.list=this.departmentService.getList(1);
			this.list8=this.departmentService.getList(2);
			
			//list1=this.questionSortService.getList();
			//String year=this.getRequest().getParameter("year");
			//String month=this.getRequest().getParameter("month");
			//int year1=Integer.parseInt("year");
			//int month1=Integer.parseInt("month");
			
			  Calendar cal = Calendar.getInstance();
			  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
			  cal.set(Calendar.YEAR,year);
			  cal.set(Calendar.MONTH, month);
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  cal.add(Calendar.DAY_OF_MONTH, -1);
			  Date lastDate = cal.getTime();
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  Date firstDate = cal.getTime();
			  
			  String last1 = fm.format( lastDate );
			  Date lastDate1=fm.parse(last1);
			  
			  String first=fm.format(firstDate);
			  Date firstDate1=fm.parse(first);
			  
			list2=new ArrayList();
			list3=new ArrayList();
			list4=new ArrayList();
			list5=new ArrayList();
			
			Department de;
			
				if(departmentName!=0){
					de=this.departmentService.get(departmentName);
					dename=de.getName();
					System.out.println("size"+de.getComplaints_1().size());
					for(Complaint com2:de.getComplaints_1()){
						if(com2.getTime().compareTo(firstDate1)>=0&&com2.getTime().compareTo(lastDate1)<=0&&com2.getLeaderapproved()==1){
					    switch(com2.getType()){
				case 0:
						list2.add(com2);break;
				case 1: list3.add(com2);//问题类别的名称
						 break;
				case 2: list4.add(com2); break;
				case 3: list5.add(com2); break;
				        }
					}			
				}
			}
						
			return "printqianfen";
		}
		

		public String qianfenall() throws Exception{
			//System.out.println("-------------------");
			this.list=this.departmentService.getList(1);
			this.list8=this.departmentService.getList(2);
			
			
				Date date = new  Date();
				
				this.newYear=date.getYear()+1900;
			

			  Calendar cal = Calendar.getInstance();
			  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
			 // System.out.println(year+"  "+month);
			  cal.set(Calendar.YEAR,year);
			  cal.set(Calendar.MONTH, month);
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  cal.add(Calendar.DAY_OF_MONTH, -1);
			  Date lastDate = cal.getTime();
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  Date firstDate = cal.getTime();
			  
			  String last1 = fm.format(lastDate);
			  Date lastDate1=fm.parse(last1);
			  
			  String first=fm.format(firstDate);
			  Date firstDate1=fm.parse(first);
			  //System.out.println(lastDate.toString()+" "+firstDate.toString());
			  outlist = new ArrayList<List<String>>(); 
			for(Department de:this.departmentService.getList(3)){
				int score1=0;
				for(Complaint com: this.complaintService.getList(5))
				{
					if(com.getTime().compareTo(firstDate1)>=0&&com.getTime().compareTo(lastDate1)<=0&&com.getLeaderapproved()==1&&com.getDepartments().contains(de)){

						score1=score1+com.getScore();
					}
				}
				innerList = new ArrayList<String>();
				innerList.add(de.getName());
				innerList.add(de.getDepartmentid().toString());
				innerList.add(score1+"");
				outlist.add(innerList);
			}
			QianfenComparator mc = new QianfenComparator();
			Collections.sort(outlist, mc);
			
			
			return "qianfenall";
		}
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String printpaimingkeshi() throws Exception{
			this.list=this.departmentService.getList(2);
			  Calendar cal = Calendar.getInstance();
			  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
			  cal.set(Calendar.YEAR,year);
			  cal.set(Calendar.MONTH, month);
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  cal.add(Calendar.DAY_OF_MONTH, -1);
			  Date lastDate = cal.getTime();
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  Date firstDate = cal.getTime();
			  
			  String last1 = fm.format( lastDate );
			  Date lastDate1=fm.parse(last1);
			  
			  String first=fm.format(firstDate);
			  Date firstDate1=fm.parse(first);
			  
			int score=0;
			int count=0;
				for(Department de:list){
					Map<String, String> di = new HashMap<String,String>(); 
					for(Complaint com2: de.getComplaints_1()){
						//？？？？？？？？？？？？？？？？？？
						if(com2.getTime().compareTo(firstDate)>=0&&com2.getTime().compareTo(lastDate)<=0&&com2.getLeaderapproved()==1&&com2.getEarlywarning()==1){
					        score+=com2.getScore();
					        count++;
				        }
					}
					//System.out.println(score);
						di.put("dname",de.getName());
						di.put("score",score+"");
						di.put("cishu",count+"");
						di.put("departmentid",de.getDepartmentid()+"");
						di.put("type", de.getType()+"");
						di.put("warning",de.getDescription());
						di.put("type", de.getType()+"");
						paimingList.add(di);
						score=0;
						count=0;
				}
			MapComparator mc=new MapComparator();
			Collections.sort(paimingList, mc);	

				return "printpaimingkeshi";

			
		}
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String printpaimingdadui() throws Exception{

			this.list=this.departmentService.getList(1);
			  Calendar cal = Calendar.getInstance();
			  // 不加下面2行，就是取当前时间前一个月的第一天及最后一天
			  cal.set(Calendar.YEAR,year);
			  cal.set(Calendar.MONTH, month);
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  cal.add(Calendar.DAY_OF_MONTH, -1);
			  Date lastDate = cal.getTime();
			  cal.set(Calendar.DAY_OF_MONTH, 1);
			  Date firstDate = cal.getTime();
			  
			  String last1 = fm.format( lastDate );
			  Date lastDate1=fm.parse(last1);
			  
			  String first=fm.format(firstDate);
			  Date firstDate1=fm.parse(first);
			  
			int score=0;	
			int count=0;
				for(Department de:list){
					Map<String, String> di = new HashMap<String,String>(); 
					for(Complaint com2: de.getComplaints_1()){
						//？？？？？？？？？？？？？？？？？？
						if(com2.getTime().compareTo(firstDate)>=0&&com2.getTime().compareTo(lastDate)<=0&&com2.getLeaderapproved()==1&&com2.getEarlywarning()==1){
					        score+=com2.getScore();
					        count++;
				        }
					}
					//System.out.println(score);
						di.put("dname",de.getName());
						di.put("score",score+"");
						di.put("cishu",count+"");
						di.put("departmentid",de.getDepartmentid()+"");
						di.put("type", de.getType()+"");
						di.put("warning",de.getDescription());
						di.put("type", de.getType()+"");
						paimingList.add(di);
						score=0;
						count=0;
				}
			MapComparator mc=new MapComparator();
			Collections.sort(paimingList, mc);	
			//System.out.println(type+"          "+this.paimingList.size());
		
				return "printpaimingdadui";
		
		}
		
		
	public String ajaxList(){
		List<Department> list=this.departmentService.getList(3);
		Map<Integer,String> map=new HashMap<Integer,String>();
		for(Department depart:list){
			map.put(depart.getDepartmentid(), depart.getName());
		}
		JSONObject obj = JSONObject.fromObject(map);   
		this.result=obj.toString();
		return SUCCESS;
	}
	
	public String changewarning(){
		//System.out.println(description+"aaaaaaaaaaaaaaaaaaa"+departmentid);
		Department depart=this.departmentService.get(departmentid);
		depart.setDescription(description);
		this.departmentService.update(depart);
		return SUCCESS;
	}
	
	
	public String list1(){
		pager=this.departmentService.getListByPage(3);
		return "list";
	}
	
	public String inAdd(){
		return "inAdd";
	}
	public String add(){
		Department department= new Department();
		department.setName(name);
		department.setType(type);
		department.setPhone(phone);
		department.setAddress(address);
		department.setDescription(0+"");
		this.departmentService.add(department);
		return "add";
	}
	
	public String edit(){
		department=this.departmentService.get(departmentid);
		return "edit";
	}
	
	public String update(){
		Department department=this.departmentService.get(departmentid);
		department.setName(name);
		department.setType(type);
		department.setPhone(phone);
		department.setAddress(address);
		this.departmentService.update(department);
		return "update";
	}
	
	public String delete(){
		this.departmentService.delete(departmentid);
		return "delete";
	}
	
	
	public List<Department> getList() {
		return list;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}
	public List<QuestionSort> getList1() {
		return list1;
	}
	public void setList1(List<QuestionSort> list1) {
		this.list1 = list1;
	}
	public int getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(int departmentName) {
		this.departmentName = departmentName;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public List<Complaint> getListByEarlyWarining() {
		return listByEarlyWarining;
	}
	public List<Complaint> getList2() {
		return list2;
	}
	public List<Complaint> getList3() {
		return list3;
	}
	public List<Complaint> getList4() {
		return list4;
	}
	public List<Complaint> getList5() {
		return list5;
	}
	
	
	public List getList7() {
		return list7;
	}
	public void setList7(List list7) {
		this.list7 = list7;
	}
	public List getList6() {
		return list6;
	}
	public void setList6(List list6) {
		this.list6 = list6;
	}
	public String getResult() {
		return result;
	}
	public String getDename() {
		return dename;
	}
	public void setDename(String dename) {
		this.dename = dename;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}
	public void setType(int type) {
		this.type = type;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Department getDepartment() {
		return department;
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

	public int getCondition() {
		return condition;
	}


	public void setCondition(int condition) {
		this.condition = condition;
	}
	public String getYear1() {
		return year1;
	}
	public void setYear1(String year1) {
		this.year1 = year1;
	}
	public List<Map<String, String>> getPaimingList() {
		return paimingList;
	}
	public List<Map<String, String>> getPaimingLists() {
		return paimingLists;
	}
	public void setList8(List<Department> list8) {
		this.list8 = list8;
	}
	public List<Department> getList8() {
		return list8;
	}
	public Integer getScore2() {
		return score2;
	}
	public void setScore2(Integer score2) {
		this.score2 = score2;
	}
	public Integer getScore3() {
		return score3;
	}
	public void setScore3(Integer score3) {
		this.score3 = score3;
	}
	public Integer getScore4() {
		return score4;
	}
	public void setScore4(Integer score4) {
		this.score4 = score4;
	}
	public Integer getScore5() {
		return score5;
	}
	public void setScore5(Integer score5) {
		this.score5 = score5;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public int getR() {
		return R?1:0;
	}
	
	public void setR(int r) {
		R = r==1?true:false;
	}

	public int getA() {
		return a;
	}
	public int getNewYear() {
		return newYear;
	}
	public int getDeptype() {
		return deptype;
	}
	public void setDeptype(int deptype) {
		this.deptype = deptype;
	}
	public String getTitles() {
		return titles;
	}

	public List getDepartmentnameList() {
		return departmentnameList;
	}

	public void setDepartmentnameList(List departmentnameList) {
		this.departmentnameList = departmentnameList;
	}
	
	public List<List<String>> getOutlist() {
		return outlist;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}


}
