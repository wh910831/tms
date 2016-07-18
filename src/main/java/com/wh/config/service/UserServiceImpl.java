/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.config.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wh.common.RequestParams;
import com.wh.config.dao.IUserDao;
import com.wh.config.entity.User;

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
@Transactional
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private IUserDao userDao;

	@Override
	public User findUserById(Long id) {
		return userDao.findById(id);
	}

	@Override
	public boolean validateUserInfo(RequestParams params) {
		if(params != null){
			return userDao.validateUserInfo(params);
		}
		return false;
	}
	
	
}
