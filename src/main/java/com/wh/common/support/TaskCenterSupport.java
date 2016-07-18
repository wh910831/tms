/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.support;

import java.util.ArrayList;
import java.util.List;

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
public class TaskCenterSupport implements TaskCenter {

	private List<Task> tasks;

	@Override
	public void loadTask(Task task) {
		if (tasks == null) {
			tasks = new ArrayList<Task>();
		}

		tasks.add(task);
	}

	@Override
	public List<Task> getTasks() {
		return tasks;
	}

	@Override
	public void run() {
		if (!CollectionUtils.isEmpty(tasks)) {
			for (Task task : tasks) {
				task.setAlive(true);
				task.start();
			}
		}
	}

	@Override
	public void terminate() {
		if (!CollectionUtils.isEmpty(tasks)) {
			for (Task task : tasks) {
				if (task != null) {
					task.setAlive(false);
					task.makeNotify();
				}
			}

			tasks.clear();
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

}
