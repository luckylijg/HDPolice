package com.goldsoft.filter;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import com.goldsoft.model.User;

@Aspect
public class MyInterceptor {

	@Pointcut("execution(* com.goldsoft.service..*(..))")
	public  void anyMethod() {
		//System.out.println("aaaaaa");
	}
	
	@Around("anyMethod()")
	public Object doBasicProfiling(ProceedingJoinPoint pjp)throws Throwable{
		Object result=null;
		
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		Date date=new Date();
		int year=date.getYear()+1900;
		int month=date.getMonth()+1;
		String tomcatPath=session.getServletContext().getRealPath("/")+"log\\";
		
		int oldyear=year-1;
		String oldFilePath=tomcatPath+oldyear+"_"+month+"_log.txt";
		File oldFile=new File(oldFilePath);
		if(oldFile.exists()){
			oldFile.delete();
		}
		
		String path=tomcatPath+year+"_"+month+"_log.txt";
		//System.out.println(oldFilePath+"            "+path);
		File file=new File(path);
		if(!file.exists()){
			file.createNewFile();
		}
		FileOutputStream fos=new FileOutputStream(file,true);
		String s="";
		User user=(User) session.getAttribute("currentUser");
		if(user!=null){
			s=user.getRealname()+"   "+request.getRemoteAddr()+"        "+new Date()+":"+pjp.getTarget()+"    "+pjp.getSignature().getName()+"\r\n";
		}
		byte[] bytes=new byte[1024];
		bytes=s.getBytes();
		fos.write(bytes);
		
		result=pjp.proceed();
		//System.out.println("退出方法");
		
		return result;
	}
	
}
