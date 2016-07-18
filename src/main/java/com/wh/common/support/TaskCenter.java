/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.support;

import java.util.List;

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
public interface TaskCenter {

	public void loadTask(Task taskTracker);
	
	public List<Task> getTasks();
	
	public void run();
	
	public void terminate();
}
