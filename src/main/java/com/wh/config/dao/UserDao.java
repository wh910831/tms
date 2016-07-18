/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.config.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.alibaba.druid.util.StringUtils;
import com.wh.common.RequestParams;
import com.wh.common.dao.CommonDao;
import com.wh.config.entity.User;

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
@Repository("userDao")
public class UserDao extends CommonDao<User> implements IUserDao {

	@Override
	public boolean validateUserInfo(RequestParams params) {
		DetachedCriteria criteria = generateCriteria(params);
		if (super.getResultCountBy(criteria) >= 1) {
			return true;
		}
		return false;
	}

	public DetachedCriteria generateCriteria(RequestParams params) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		String queryValue = params.getParamValue("username");
		if (!StringUtils.isEmpty(queryValue)) {
			criteria.add(Restrictions.eq("username", queryValue));
		}

		queryValue = params.getParamValue("password");
		if (!StringUtils.isEmpty(queryValue)) {
			criteria.add(Restrictions.eq("password", queryValue));
		}

		criteria.add(Restrictions.eq("status", 1));

		return criteria;
	}
}
