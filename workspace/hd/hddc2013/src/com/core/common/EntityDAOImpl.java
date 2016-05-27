package com.core.common;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("entityDAOImpl")
@Transactional//这个事务是在测试时用，项目运行时不用
public class EntityDAOImpl implements EntityDAO {
	
	@PersistenceContext
	protected EntityManager em;//允许子类访问
	
	public <T> T find(Class<T> entityClass,Object id){//<T>相当于声明泛型 T表示返回类型
		return em.getReference(entityClass, id);//getReference相当于load，支持延迟加载，find相当于get，不支持延迟加载
	}
	
	public void save(Object object){
		this.em.persist(object);
	}
	
	public void update(Object object){
		this.em.merge(object);
	}
	
	public <T> void delete(Class<T> entityClass,Object id){
		this.em.remove(this.em.getReference(entityClass, id));
	}
	
	public <T> void delete(Class<T> entityClass,Object[] ids){
		for(Object id : ids){
			this.delete(entityClass, id);
		}
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> queryEntityList(String jpql,Object...objects) {
		Query query = em.createQuery(jpql);
		for(int i=1;i<objects.length;i++){
			query.setParameter(i, objects[i-1]);
		}
		return query.getResultList();
	}

}
