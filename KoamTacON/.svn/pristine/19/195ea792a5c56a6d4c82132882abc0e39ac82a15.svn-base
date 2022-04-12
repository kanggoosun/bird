package com.aisolution.common.scheduler;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class SchedulerPastBean extends QuartzJobBean {
	private static final Logger log = LoggerFactory.getLogger(SchedulerPastBean.class);
	
	private SchedulerTask schedulerTask;
	
	@Override
	protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
		log.debug("executeInternal");
		schedulerTask.sendMailTypeZeroPast();
	}
	
	public void setSchedulerTask(SchedulerTask schedulerTask) {
		log.debug("setSchedulerTask");
		this.schedulerTask = schedulerTask;
	}
}
