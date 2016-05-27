package com.core.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.core.HibernateSessionFactory;
/**
 * org.springframework.orm.hibernate3.support.OpenSessionInViewFilter仅保证每一次request过程一个session，但没有将事务定义到整个session上，
 * 由于我们在applicationContext.xml中将事务定义在service接口层，如此一个request过程的session将可能有多个事务，这样如果一个action调用了两个没有任何关系的
 * service方法一定为两个事务，而我们无法控制程序员不这样做，所以为保险起见，这里将事务定义在request全过程(即其对应的整个session上)
 * 
 */
/** OSIV模式的Filter */
public class OpenSessionInViewFilter implements Filter {
	private SessionFactory sf;

	public void destroy() {

	}
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		Session session = null;//好像不是线程安全的？每次进入都会创建不同的session，好像安全。在这里ThreadLocal<Session>也许合适
		try{
			//请求到达时，打开session并启动事务
			session = sf.getCurrentSession();
			session.getTransaction().begin();
			//执行请求处理链
			filterChain.doFilter(request, response);
			//返回响应时，提交事务，关闭session
			session.getTransaction().commit();
			
		}catch(RuntimeException re){
			//执行过程，如果有异常，则必须回滚事务
			if(session.getTransaction().isActive()){
				session.getTransaction().rollback();
			}
		}

	}
	/*这段代码在请求处理完毕之后，并没有书写关闭Session的代码，这是因为当使用SessionFactory的getCurrentSession()来获取Session实例，在当前线程上的事务被
	提交或回滚时，当前Session会自动清除和关闭。所以无需手工关闭。*/
	
	public void init(FilterConfig filterConfig) throws ServletException {
		sf = HibernateSessionFactory.getSessionFactory();//HibernateSessionFactory.getSession()(提供代码线程绑定样板)中手工(用的是sessionFactory.openSession())将Session绑定到当前线程，
		//spring容器中的SessionFactory之Session默认不与当前线程绑定吗?
	}

}
/*《Struts基础与案例开发详解》 徐明华 邱加永 编著 清华大学出版社 P324
 * 12.4.3 OpenSessionInView模式
 *    在Web应用程序中，视图(JSP获Servlet)可能会通过导航从某个脱管对象中拖出它的关联对象或集合数据，这些关联对象或集合如果是被延迟加载的，
 * Hibernate就会抛出LazyInitializationException。因为没有持久化上下文存在时，是无法加载未被初始化的代理和集合的。
 *    针对这类问题，Hibernate的作者提出了OpenSessionInView模式作为解决方案，这个模式的主要思想是：在用户的每一次请求过程始终保持一个持久化上下文打开着。
 *    OpenSessionInView模式的具体实现有以下三个步骤。
 *    
 *    第1步 把Session实例绑定到当前线程上。
 *    要保证在一次请求中只有一个持久化上下文，首先要把Session实例绑定到当前线程上，这需要在Hibernate的全局配置文件(默认是hibernate.cfg.xml)中进行如下配置。
 *    <hibernate-configuration>
 *    <session-factory>
 *    		...
 *          <!--把session附加到当前线程上-->
 *    		<property name="hibernate.current_session_context_class">thread</property>
 *    		...
 *    </hibernate-configuration>
 *    然后，在程序代码中获取Session实例时，使用SessionFactory的getCurrentSession()方法。这样，可以保证在每一次请求的处理线程上只有一个持久化上下文的存在。
 *    
 *    第2步 用Servlet过滤器在请求到达之前打开Session，在响应返回前关闭Session。代码见上OpenSessionInViewFilter
 *    
 *    第3步 在web.xml中配置过滤器。建议只把它应用到执行期间需要操作数据库的url上。
 *    <!-- osiv模式的过滤器 -->
 *    <filter>
 *    	<filter-name>osiv</filter-name>
 *      <filter-class>com.core.common.OpenSessionInViewFilter</filter-class>
 *    </filer>
 *    <filter-mapping>
 *    	<filter-name>osiv</filter-name>
 *      <url-pattern>/*</url-pattern>
 *    </filter-mapping>
 *    
 * 
 */
