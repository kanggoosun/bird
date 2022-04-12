package com.aisolution.common.mapper;

import java.util.List;
import java.util.Map;

public interface MailMapper {

	public int getMaxNotificationSeq(Map<String, String> paramMap);
	
	public void insertMailNotification(Map<String, String> paramMap);
	
	public void updateMailNotification(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMailNotificationToday(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMailNotificationPast(Map<String, String> paramMap);
}
