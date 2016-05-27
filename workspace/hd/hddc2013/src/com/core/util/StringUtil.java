package com.core.util;

public class StringUtil {
	/*
	 * 将字符存入数据库时进行转码
	 */
	public static String isoTOgb(String qs)	{
		try{
			if (qs == null) {
				return "NULL";
			}else
			{
				return new String(qs.getBytes("iso-8859-1"),"utf-8");
			}
		}catch(Exception e){
			System.err.println("isoTOgb error："+e.getMessage());
		}
		return "NULL";
	}
	
	/*
	 * 字符从数据库取出时进行字符的转码
	 */
	public static String gbTOiso(String qs){
		try{
			if (qs == null){
				return "NULL";
			}else {
				return new String(qs.getBytes("GBK"),"iso-8859-1"); 
			}
		}catch(Exception e){
			System.err.println("gb2iso error："+e.getMessage());
			}
		return "NULL";
	} 
}
