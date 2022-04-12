package com.aisolution.common.scheduler;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class SchedulerTodayBean extends QuartzJobBean {
	private static final Logger log = LoggerFactory.getLogger(SchedulerTodayBean.class);
	
	private SchedulerTask schedulerTask;
	
	@Override
	protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
		log.debug("executeInternal");
		schedulerTask.sendMailTypeZeroToday();
	}
	
	public void setSchedulerTask(SchedulerTask schedulerTask) {
		log.debug("setSchedulerTask");
		this.schedulerTask = schedulerTask;
	}
}
