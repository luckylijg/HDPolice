package com.core.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA1 {
	public static String encrypt(String inStr) {
        MessageDigest md = null;
        String outStr = null;
        try {
            md = MessageDigest.getInstance("SHA-1"); //SHA-1或MD5
            byte[] digest = md.digest(inStr.getBytes()); //返回的是byet[]，要转化为String存储比较方便
            outStr = bytetoString(digest);
        }
        catch (NoSuchAlgorithmException nsae) {
            nsae.printStackTrace();
        }
        return outStr.substring(22);//SHA1:38位(若要短些就截字串);MD5:30位
    }
	
    public static String bytetoString(byte[] digest) {
        String str = "";
        String tempStr = "";
        
        for (int i = 1; i < digest.length; i++) {
            tempStr = (Integer.toHexString(digest[i] & 0xff));
            if (tempStr.length() == 1) {
                str = str + "0" + tempStr;
            }
            else {
                str = str + tempStr;
            }
        }
        return str.toLowerCase();
    }
    
	public static void main(String[] args) {
		System.out.println(SHA1.encrypt("1")+" | "+SHA1.encrypt("1").length());
		System.out.println(SHA1.encrypt("123")+" | "+SHA1.encrypt("123").length());
		//登录密码判断:判断报文加密后与数据库表摘要相等
	}

}
