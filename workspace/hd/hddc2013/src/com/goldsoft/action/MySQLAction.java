package com.goldsoft.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


@SuppressWarnings("serial")
public class MySQLAction extends BaseAction{

	private String filePath;
	private String name;
	private String dbname;
	private String pwd;
	private String error;
	private String error2;
	
	
	//获取hibernate.cfg.xml的配置文件
	/*Configuration cfg = new Configuration().configure();
	//从session工厂中获取session，相当于jdbc中的connection
	SessionFactory factory = cfg.buildSessionFactory();
	Session session = factory.openSession();
	//String se=factory.getReference().getFactoryClassLocation().
	String UserName=cfg.getProperty("connection.username");
	String PassWord=cfg.getProperty("connection.password");
	String Password=cfg.getProperties().getProperty("connection.username");
*/
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");//可以方便地修改日期格式
	String now = dateFormat.format( new Date() ); 
	
	@SuppressWarnings("unused")
	public String sqlDump(){
		//String url=System.getProperty("user.dir");
		String url="D:/";
		//String url=this.getRequest().getSession().getServletContext().getRealPath("/")+"database";
		//String url=(String)this.getRequest().getRequestURL();
		if(name.equals("")||!"root".equals(name)){
			error="请输入正确的用户名";
			return "error";
		}else if(pwd.equals("")||!pwd.equals("root")){
			error="请输入正确的密码";
			return "error";
		}else if(!dbname.equals("police")||dbname.equals("")){
			error="请输入正确的数据库名";
			return "error";
		}else if(name.equals("root")&&pwd.equals("root")&&dbname.equals("police")){
			//System.out.println(name+"-----------"+pwd+"-----------"+filePath);			
			try {
				Runtime rt = Runtime.getRuntime();

				//String backPath =now+".sql";			
				String backPath =url+"/"+now+".sql";			
				String cmd="mysqldump -u" +name+ " -p" +pwd+ " --default-character-set=utf8 -hlocalhost -P3306 "+dbname+">"+"\""+backPath+"\"";
				
				//System.out.println("cmd-----------"+cmd);				
				Process proc = rt.exec("cmd.exe /c "+cmd);// 设置导出编码为utf8。这里必须是utf8				
				int tag = proc.waitFor();// 等待进程终止  
				//error="数据库已经成功备份至:"+url+"\\"+backPath;
				error="数据库已经成功备份至:"+backPath;
			} catch (Exception e) {
				e.printStackTrace();
				error="数据库备份出错,请设置path";
				return error;
			}
		}
		return "error";
	}
	

	//恢复数据库
	/**  
     * 导入  
     *  
     */  
    @SuppressWarnings("unused")
	public String sqlLoad() {   
    	//System.out.println("sqlLoad() action--------------------------");
    	if(name.equals("")||!"root".equals(name)){
			error2="请输入正确的用户名";
			return "error2";
		}else if(pwd.equals("")||!pwd.equals("root")){
			error2="请输入正确的密码";
			return "error2";
		}else if(!dbname.equals("police")||dbname.equals("")){
			error2="请输入正确的数据库名";
			return "error2";
		}else if(filePath.equals("")){
			error2="请选择正确的文件路径";
			return "error2";
		}else if(name.equals("root")&&pwd.equals("root")&&dbname.equals("police")){
			//System.out.println(name+"-----------"+pwd+"-----------"+filePath);	
        try {   
            Runtime rt = Runtime.getRuntime();   
            String cmd= "mysql -hlocalhost -u"+name+" -p"+pwd+" "+dbname+" "+ "<"+filePath;
            Process proc = rt.exec("cmd.exe /c "+cmd);   
            int tag = proc.waitFor();// 等待进程终止  
            //System.out.println("/* Load  SQL File "+filePath+" OK! */");  
            error2="数据库已经成功还原";
        } catch (Exception e) {   
            e.printStackTrace();
            error2="数据库还原失败,请设置Path或选择正确的备份文件";
            return error2;
        } 
	}
        return "error2";
 }



	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}


	public String getError2() {
		return error2;
	}


	public void setError2(String error2) {
		this.error2 = error2;
	}


	public String getDbname() {
		return dbname;
	}


	public void setDbname(String dbname) {
		this.dbname = dbname;
	}
    
}
