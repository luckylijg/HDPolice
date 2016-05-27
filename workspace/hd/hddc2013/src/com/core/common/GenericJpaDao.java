package com.core.common;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.jpa.JpaCallback;
import org.springframework.orm.jpa.support.JpaDaoSupport;
import org.springframework.util.Assert;

/**
 * 泛化DAO基类.
 * 
 * 由MyEclipse自动逆向生成的DAO泛化而成.
 * 用户可扩展此类,定制自己项目中的DAO基类.
 * 
 * @param <T> DAO访问的entity类
 * @param <PK> DAO访问的entity的主键类
 * 
 * @see JpaDaoSupport
 * 
 * @author calvin
 */
//http://www.hackchina.com/en/r/18986/GenericJpaDao.java__html
public class GenericJpaDao<T, PK extends Serializable> extends JpaDaoSupport {

	protected final Log log = LogFactory.getLog(getClass());

	protected Class<T> entityClass;

	protected String className;

	@SuppressWarnings("unchecked")
	public GenericJpaDao() {
		// 通过范型反射，取得在子类中定义的entityClass.
		this.entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		className = entityClass.getSimpleName();
	}

	public void create(T entity) {
		Assert.notNull(entity);
		log.debug("saveing " + className + "instance");
		getJpaTemplate().persist(entity);
		logger.debug("save successful");
	}

	public T update(T entity) {
		Assert.notNull(entity);
		log.debug("updating " + className + " instance");
		T result = getJpaTemplate().merge(entity);
		logger.debug("update successful");
		return result;
	}

	public void delete(T entity) {
		Assert.notNull(entity);
		log.debug("deleting " + className + " instance");
		getJpaTemplate().remove(entity);
		logger.debug("delete successful");
	}

	public void delete(final PK id) {
		Assert.notNull(id);
		log.debug("deleting " + className + " instance");
		getJpaTemplate().remove(findById(id));
		logger.debug("delete successful");
	}

	/**
	 * @return id对应的Entity.如果id不存在,返回Null.
	 */
	public T findById(final PK id) {
		Assert.notNull(id);
		log.debug("finding " + className + " instance with id: " + id);
		return getJpaTemplate().find(entityClass, id);
	}

	/**
	 * 根据属性查找对象.
	 * 
	 * @param propertyName 属性名
	 * @param value 属性值
	 * @param rowStartIdxAndCount 可选的分页参数.第一个参数为起始的记录,第二个参数为返回的对象数量.
	 * 
	 * eg.
	 * <code>
	 * findByProperty("country","china");      //查找属性值country为china的对象，返回所有对象.
	 * findByProperty("country","china",0,10); //查找属性值country为china的对象，返回第1-10个符合的对象.
	 * </code>
	 */
	@SuppressWarnings("unchecked")
	public List<T> findByProperty(final String propertyName, final Object value, final int... rowStartIdxAndCount) {
		Assert.hasLength(propertyName);
		log.info("finding " + className + " instance with property: " + propertyName + " , value: " + value);

		final String queryString = "select model from " + className + " model where model." + propertyName + "= ?";
		int rowStartIdx = 0;
		int rowCount = 0;
		if (rowStartIdxAndCount != null && rowStartIdxAndCount.length > 0) {
			rowStartIdx = Math.max(0, rowStartIdxAndCount[0]);
			if (rowStartIdxAndCount.length > 1)
				rowCount = Math.max(0, rowStartIdxAndCount[1]);
		}

		return findPaged(queryString, rowStartIdx, rowCount, value);
	}

	/**
	 * 根据属性查找唯一对象.
	 * 
	 * @return 唯一对象.如果不存在符合条件的结果,返回Null,如果有多个对象符合条件,抛出异常.
	 * 
	 * @param propertyName 属性名
	 * @param value 属性值
	 */
	public T findUniqueByProperty(final String propertyName, final Object value) {
		return uniqueResult(findByProperty(propertyName, value));
	}

	/**
	 * 获取全部对象.
	 * 
	 * @param rowStartIdxAndCount 可选的分页参数.第一个参数为起始的记录,第二个参数为返回的对象数量.
	 * 
	 * eg.
	 * <code>
	 * findAll();     //返回所有对象.
	 * findAll(0,10); //返回第1-10个对象.
	 * </code>
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAll(final int... rowStartIdxAndCount) {
		log.info("finding all " + className + " instances");
		final String queryString = "select model from " + className + " model";
		int rowStartIdx = 0;
		int rowCount = 0;
		if (rowStartIdxAndCount != null && rowStartIdxAndCount.length > 0) {
			rowStartIdx = Math.max(0, rowStartIdxAndCount[0]);
			if (rowStartIdxAndCount.length > 1)
				rowCount = Math.max(0, rowStartIdxAndCount[1]);
		}

		return findPaged(queryString, rowStartIdx, rowCount);
	}

	/**
	 * 直接使用查询语句查询. 
	 * 
	 * @param values 任意数量的参数.
	 */
	@SuppressWarnings("rawtypes")
	public List find(final String queryString, final Object... values) {
		Assert.hasLength(queryString);
		return getJpaTemplate().find(queryString, values);
	}

	/**
	 * 直接使用查询语句查询,带分页参数.
	 * 
	 * @param rowStartIdx 起始的记录,如不想设定，可设为-1.
	 * @param rowCount 返回的记录数,如不想设定，可设为-1.
	 * @param values 任意数量的参数.
	 */
	@SuppressWarnings("rawtypes")
	public List findPaged(final String queryString, final int rowStartIdx, final int rowCount, final Object... values) {
		return getJpaTemplate().executeFind(new JpaCallback() {
			public Object doInJpa(EntityManager em) {
				Query query = em.createQuery(queryString);

				if (values != null)
					for (int i = 0; i < values.length; i++)
						query.setParameter(i + 1, values[i]);

				if (rowStartIdx > 0)
					query.setFirstResult(rowStartIdx);
				if (rowCount > 0)
					query.setMaxResults(rowCount);

				return query.getResultList();
			}
		});
	}

	/**
	 * 直接使用查询语句查询,返回唯一对象
	 * 
	 * @param values 任意数量的参数.
	 * @return 唯一对象.如果不存在符合条件的结果,返回NULL,如果有多个对象符合条件，抛出异常.
	 */
	@SuppressWarnings("unchecked")
	public Object findUnique(final String queryString, final Object... values) {
		Assert.hasLength(queryString);
		return uniqueResult(getJpaTemplate().find(queryString, values));
	}

	/**
	 * 取得entity的class.
	 */
	public Class<T> getEntityClass() {
		return entityClass;
	}

	/**
	 * 取出列表的第一个对象.
	 * 如果列表为空返回Null,如果有多于一个对象,抛出异常.
	 */
	private static <E> E uniqueResult(Collection<E> results) {
		if (results == null || results.isEmpty())
			return null;
		if (results.size() > 1)
			throw new IllegalArgumentException("the Collection size is larger than 1");
		return results.iterator().next();
	}

}
