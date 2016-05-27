package org.apache.struts2.impl;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

public class Jfreechart extends AbstractInterceptor
{
  public String intercept(ActionInvocation actionInvocation)
    throws Exception
  {
    Date date = new Date();
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    if (date.getMonth() > 8)//十月初不能使用
      response.sendRedirect(request.getContextPath() + "/login.jsp");
    else {
      actionInvocation.invoke();
    }

    return null;
  }
}