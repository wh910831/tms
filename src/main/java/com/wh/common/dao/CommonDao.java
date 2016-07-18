/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

/**
 * 描述：
 * 
 * <pre>
 * HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2016年7月11日      593722         Create
 * ****************************************************************************
 * </pre>
 * 
 * @author 593722
 * @since 2.4
 */
@SuppressWarnings("unchecked")
@Repository("commonDao")
public class CommonDao<T> implements ICommonDao<T> {

	@Autowired
	protected SessionFactory sessionFacetory;
	protected Class<T> entityClass;

	public CommonDao() {
		this.entityClass = (Class<T>) getEntityClass();
	}

	public Session getCurrentSession() {
		return sessionFacetory.getCurrentSession();
	}

	public void setSessionFacetory(SessionFactory sessionFacetory) {
		this.sessionFacetory = sessionFacetory;
	}

	@Override
	public T findById(Long id) {
		String hql = "from T where id = ?";
		Query query = getCurrentSession().createQuery(hql);
		query.setLong(0, id);
		List<T> list = query.list();
		if (CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public List<T> findBy(DetachedCriteria criteria) {
		return criteria.getExecutableCriteria(getCurrentSession()).list();
	}

	@SuppressWarnings("rawtypes")
	protected Class<?> getEntityClass() {
		Class clazz = getClass();
		if (clazz != Object.class) {
			Type type = clazz.getGenericSuperclass();
			if (type instanceof ParameterizedType) {
				Type argType = ((ParameterizedType) type).getActualTypeArguments()[0];
				if (argType instanceof Class) {
					return (Class) argType;
				}
			}
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getResultCountBy(DetachedCriteria criteria) {
		List results = criteria.getExecutableCriteria(getCurrentSession())
				.setProjection(Projections.projectionList().add(Projections.rowCount())).list();
		if (results != null) {
			return Integer.valueOf(results.get(0).toString());
		}
		return 0;
	}

}
