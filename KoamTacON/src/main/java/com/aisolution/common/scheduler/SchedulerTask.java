package com.aisolution.common.scheduler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aisolution.common.service.MailService;

public class SchedulerTask {
	private static final Logger log = LoggerFactory.getLogger(SchedulerTask.class);
	
	private MailService mailService;
	
	@Autowired
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	public void sendMailTypeZeroToday() {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("notificationType", "0");
		List<Map<String, Object>> mailList = mailService.getMailNotificationToday(paramMap);
		
		for(int i=0; i<mailList.size(); i++) {
			Map<String, Object> map = mailList.get(i);
			mailService.sendMail(map.get("sender").toString(), map.get("recipients").toString(), map.get("title").toString(), map.get("contents").toString());
			paramMap = new HashMap<String, String>();
			paramMap.put("notificationSeq", map.get("notificationSeq").toString());
			mailService.updateMailNotification(paramMap);
		}
	}
	
	public void sendMailTypeZeroPast() {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("notificationType", "0");
		List<Map<String, Object>> mailList = mailService.getMailNotificationPast(paramMap);
		
		for(int i=0; i<mailList.size(); i++) {
			Map<String, Object> map = mailList.get(i);
			mailService.sendMail(map.get("sender").toString(), map.get("recipients").toString(), map.get("title").toString(), map.get("contents").toString());
			paramMap = new HashMap<String, String>();
			paramMap.put("notificationSeq", map.get("notificationSeq").toString());
			mailService.updateMailNotification(paramMap);
		}
	}
	
	public void schedulerTest() {
		log.debug("schedulerTest");
		
		log.info("===================================================");
		log.info("================= Scheduler Test ==================");
		log.info("===================================================");
	}
	
	public void schedulerTest2() {
		log.debug("schedulerTest2");
		
		log.info("===================================================");
		log.info("================= Scheduler Test2 =================");
		log.info("===================================================");
	}
}
