package com.core.common;

import java.io.Serializable;

import org.springframework.orm.jpa.support.JpaDaoSupport;

public class EntityJPADAOImpl<T,PK extends Serializable> extends JpaDaoSupport implements EntityJPADAO<T,PK> {

	public void delete(Object t) {
		this.getJpaTemplate().remove(t);
	}

}
