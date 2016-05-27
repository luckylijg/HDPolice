package com.core.common;

import java.util.List;

public interface EntityDAO {

	/**
	 * 获取实体
	 * @param <T>
	 * @param entityClass
	 * @param id
	 * @return
	 */
	public abstract <T> T find(Class<T> entityClass, Object id);

	/**
	 * 保存实体
	 * @param object
	 */
	public abstract void save(Object object);

	/**
	 * 更新实体
	 * @param object
	 */
	public abstract void update(Object object);

	/**
	 * 删除实体
	 * @param <T>
	 * @param entityClass
	 * @param id
	 */
	public abstract <T> void delete(Class<T> entityClass, Object id);

	/**删除实体
	 * @param <T>
	 * @param entityClass
	 * @param ids
	 */
	public abstract <T> void delete(Class<T> entityClass, Object[] ids);
	
	/**
	 * 获取实体list
	 * @param <T>
	 * @param jpql
	 * @return
	 */
	public abstract <T> List<T> queryEntityList(String jpql,Object...objects);

}
