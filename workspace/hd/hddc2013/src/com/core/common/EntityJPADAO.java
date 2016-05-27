package com.core.common;

import java.io.Serializable;

public interface EntityJPADAO<T,PK extends Serializable>  {
	public void delete(T t);

}
