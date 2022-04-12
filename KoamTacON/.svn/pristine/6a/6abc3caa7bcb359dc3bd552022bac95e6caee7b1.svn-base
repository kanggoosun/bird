package com.aisolution.common.service;

import java.util.List;
import java.util.Map;

public interface MailService {
	public void sendMail(String from, String to, String subject, String text);
	
	public void sendMail(String from, String[] to, String subject, String text);
	
	public void sendMail(String from, String to, String[] cc, String subject, String text);
	
	public void sendMail(String from, String[] to, String[] cc, String subject, String text);
	
	public void sendHtmlMail(String from, String to, String subject, String text);
	
	public void sendHtmlMail(String from, String to, String cc, String subject, String text);
	
	public void sendHtmlMail(String from, String to, String[] cc, String subject, String text);
	
	public void insertMailNotification(Map<String, String> paramMap);
	
	public void updateMailNotification(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMailNotificationToday(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMailNotificationPast(Map<String, String> paramMap);
}
