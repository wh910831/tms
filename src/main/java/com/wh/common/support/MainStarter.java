/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.support;

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
public class MainStarter {

	private TaskCenter taskCenter;

	public void setTaskCenter(TaskCenter taskCenter) {
		this.taskCenter = taskCenter;
	}

	public void run() {
		if (taskCenter == null) {
			taskCenter = TaskCenterSingleton.getInstance();
		}
		taskCenter.run();
	}
}
