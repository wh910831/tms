/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common;

import java.util.HashMap;
import java.util.Map;

/**
 * 描述：
 * 
 * <pre>HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2016年7月12日      593722         Create
 * ****************************************************************************
 * </pre>
 * @author 593722
 * @since 2.4
 */
public class RequestParams {

	private Map<String, String> params;
	
	public void setParams(String key, String value){
		if(params == null){
			params = new HashMap<String, String>();
		}
		params.put(key, value);
	}
	
	public String getParamValue(String key){
		if(params == null || params.size() == 0){
			return null;
		}
		return params.get(key);
	}
}
