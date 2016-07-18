/* 
 * Copyright (c) 2016, S.F. Express Inc. All rights reserved.
 */
package com.wh.common.support;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
public abstract class Task extends Thread {

	private static final Logger logger = LoggerFactory.getLogger(Task.class);
	private boolean isAlive = true;
	
	public Object event = new Object();
	
	public void run(){
		if(isAlive){
			try {
				doRun();
			} catch (Exception e) {
				logger.error("task error : {}", e);
			}
		}
	}
	
	public void makeWait(long timeout){
		synchronized (event) {
			try {
				event.wait(timeout);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void makeNotify(){
		synchronized (event) {
			try {
				event.notify();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void setAlive(boolean isAlive) {
		this.isAlive = isAlive;
	}

	protected abstract void doRun() throws Exception;
}
