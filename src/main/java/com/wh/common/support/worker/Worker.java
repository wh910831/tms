/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.support.worker;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CountDownLatch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
public abstract class Worker<T> implements Runnable {

	private static final Logger logger = LoggerFactory.getLogger(Worker.class);

	private ConcurrentLinkedQueue<T> queue;

	private CountDownLatch latch;
	
	protected abstract void doRun(T t) throws Exception;

	@Override
	public void run() {
		while (true) {
			T t = queue.poll();

			if (t == null) {
				break;
			}
			
			try {
				doRun(t);
			} catch (Exception e) {
				logger.error("run error : {}", e);
			}
			
			latch.countDown();
		}
	}

	public void setQueue(ConcurrentLinkedQueue<T> queue) {
		this.queue = queue;
	}

	public void setLatch(CountDownLatch latch) {
		this.latch = latch;
	}
	
}
