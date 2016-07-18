/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2016年7月11日      593722         Create
 * ****************************************************************************
 * </pre>
 * @author 593722
 * @since 2.4
 */
public interface ICommonDao<T> {

	public T findById(Long id);
	
	public List<T> findBy(DetachedCriteria criteria);
	
	public int getResultCountBy(DetachedCriteria criteria);
}
