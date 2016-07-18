/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.support.worker;

import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

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
public class Coordinator<T> {

	private static final Logger logger = LoggerFactory
			.getLogger(Coordinator.class);

	private static ExecutorService pool = new ThreadPoolExecutor(0, 1000, 60L,
			TimeUnit.SECONDS, new SynchronousQueue<Runnable>(),
			new DefaultThreadFactory("commonWorker"));

	public void execute(List<T> list, Worker<T> worker, int concurrentSize) {
		logger.debug("execute start...");

		int size = 0;
		if (list == null || (size = list.size()) == 0) {
			logger.info("Argument[list] is null, or it's size is zero");
			return;
		}

		if (worker == null) {
			throw new IllegalArgumentException("Argument[worker] is null");
		}

		if (concurrentSize <= 0) {
			throw new IllegalArgumentException(
					"Argument[concurrentSize] must be greater than zero");
		}

		ConcurrentLinkedQueue<T> queue = new ConcurrentLinkedQueue<T>();

		for (T t : list) {
			if (t != null) {
				queue.add(t);
			}
		}

		size = queue.size();

		if (size == 0) {
			logger.info("Data of Argument[list] is null");
			return;
		}

		CountDownLatch latch = new CountDownLatch(size);
		worker.setLatch(latch);
		worker.setQueue(queue);

		if (size < concurrentSize) {
			concurrentSize = size;
		}

		for (int i = 0; i < concurrentSize; i++) {
			pool.execute(worker);
		}

		try {
			// 调用此方法会一直阻塞当前线程，直到计时器的值为0
			latch.await();
		} catch (InterruptedException e) {
			logger.error(e.getMessage(), e);
		}
		logger.debug("execute end...");
	}
}
