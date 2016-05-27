package com.goldsoft.filter;



import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * Example filter that sets the character encoding to be used in parsing the
 * incoming request
 */
public class SetCharacterEncodingInterceptor implements Interceptor {

    
    public void doFilter(ServletRequest request, ServletResponse response,
    FilterChain chain)throws IOException, ServletException {

    

    // 传递控制到下一个过滤器
    chain.doFilter(request, response);
    }

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		
		return null;
	}

   
}
