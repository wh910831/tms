/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.support.worker;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 描述：
 * 
 * <pre>
 * HISTORY
 * ****************************************************************************
 *  ID   DATE           PERSON          REASON
 *  1    2016年7月12日      593722         Create
 * ****************************************************************************
 * </pre>
 * 
 * @author 593722
 * @since 2.4
 */
public class DefaultThreadFactory implements ThreadFactory {

	private static final AtomicInteger poolNumber = new AtomicInteger(1);
	private final AtomicInteger threadNumber = new AtomicInteger(1);
	private final ThreadGroup group;
	private final String namePrefix;

	public DefaultThreadFactory() {
		SecurityManager s = System.getSecurityManager();
		this.group = ((s != null) ? s.getThreadGroup() : Thread.currentThread()
				.getThreadGroup());
		this.namePrefix = "defaule-pool-" + poolNumber.getAndIncrement()
				+ "-thread-";
	}

	public DefaultThreadFactory(String prefix) {
		SecurityManager s = System.getSecurityManager();
		this.group = ((s != null) ? s.getThreadGroup() : Thread.currentThread()
				.getThreadGroup());
		this.namePrefix = "defaule-pool-" + prefix + "-"
				+ poolNumber.getAndIncrement() + "-thread-";
	}

	@Override
	public Thread newThread(Runnable r) {
		Thread t = new Thread(this.group, r, this.namePrefix
				+ this.threadNumber.getAndIncrement(), 0L);
		if (t.isDaemon())
			t.setDaemon(false);
		if (t.getPriority() != 5)
			t.setPriority(5);
		return t;
	}

}
