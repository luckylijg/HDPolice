package com.core;

public class Constants {
    /*  0-举报投诉表 1-现场督察表 2-网上督察表 3-网络舆情表*/
	public static final int  TYPE = -1;
	/* 系统内部编码 */
	public static final String ENCODING = "UTF-8";

	/* 通用操作结果页面返回值 */
	public static final String EXECUTE_RESULT = "executeResult";

	/* 异常结果返回值 */
	public static final String EXCEPTION = "exception";

	/* 异常信息在上下文中的存储值 */
	public static final String CONTEXT_EXCEPTION = "_exception_";

	public static final String CONTEXT_EXCEPTION_INFO = "_exception_info_";

	/* 默认分页尺寸 */
	public static final int DEFAULT_PAGE_SIZE = 3;

	public static final int MAX_PAGE_SIZE = 300;

	/* 记录返回页面地址用的session key */
	public static final String REFER_URL = "_REFER_URL_";

	/* 登录后用户信息在Session中的Key */
	public static final String LOGIN_USER = "_LOGIN_USER_";

	/* 记录用户登录前想要访问的地址在Session中的Key */
	public static final String ORIGINAL_URL = "_ORIGINAL_URL_";
	
/*Excel 模板文件夹路径*/
	
	public static final String TEMPLATE_PATH = "/template";
	
	/* 颜色提取器，对于像Map 这样遍历没有标志位，可以定义一个自加的变量，然后提取颜色 */
	public static final String[] COLOR_PICK = {"429EAD","4249AD","AD42A2","D4AC31","00FF00","660066","6666CC","339999","00CC99","0033FF","008000","FFFF00"};
}
