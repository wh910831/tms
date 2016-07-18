/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.config.service;

import com.wh.common.RequestParams;
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
public interface UserService {

	public User findUserById(Long id);
	
	public boolean validateUserInfo(RequestParams params);
}
