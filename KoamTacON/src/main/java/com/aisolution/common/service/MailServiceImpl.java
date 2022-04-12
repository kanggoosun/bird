package com.aisolution.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.aisolution.common.mapper.MailMapper;

@Repository
@Service("mailService")
public class MailServiceImpl implements MailService {
	private static final Logger log = LoggerFactory.getLogger(MailServiceImpl.class);
	
	@Autowired
	private MailSender mailSender;
	@Autowired
	private MailMapper mailMapper;
	@Autowired
	private JavaMailSenderImpl javaMailSender;
	
	public void sendMail(String from, String to, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		mailSender.send(message);
	}
	
	public void sendMail(String from, String[] to, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		mailSender.send(message);
	}
	
	public void sendMail(String from, String to, String[] cc, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setCc(cc);
		message.setSubject(subject);
		message.setText(text);
		mailSender.send(message);
	}
	
	public void sendMail(String from, String[] to, String[] cc, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setCc(cc);
		message.setSubject(subject);
		message.setText(text);
		mailSender.send(message);
	}
	
	public void sendHtmlMail(String from, String to, String subject, String text) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		
		try {
			Address fromAddr = new InternetAddress(from);
			Address toAddr = new InternetAddress(to);
			
			mimeMessage.setFrom(fromAddr);
			mimeMessage.setRecipient(RecipientType.TO, toAddr);
			mimeMessage.setSubject(subject);
			mimeMessage.setText(text, "UTF-8", "html");
			
			javaMailSender.send(mimeMessage);
		} catch(Exception ex) {
			log.error(ex.getMessage());
		}
		
	}
	
	public void sendHtmlMail(String from, String to, String cc, String subject, String text) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		
		try {
			Address fromAddr = new InternetAddress(from);
			Address toAddr = new InternetAddress(to);
			Address ccAddr = new InternetAddress(cc);
			
			mimeMessage.setFrom(fromAddr);
			mimeMessage.setRecipient(RecipientType.TO, toAddr);
			mimeMessage.setRecipient(RecipientType.CC, ccAddr);
			mimeMessage.setSubject(subject);
			mimeMessage.setText(text, "UTF-8", "html");
			
			javaMailSender.send(mimeMessage);
		} catch(Exception ex) {
			log.error(ex.getMessage());
		}
		
	}
	
	public void sendHtmlMail(String from, String to, String[] cc, String subject, String text) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		
		try {
			Address fromAddr = new InternetAddress(from);
			Address toAddr = new InternetAddress(to);
			Address buffer = null;
	        Address[] addressCC = new Address[cc.length];
	        for (int i=0; i<cc.length; i++) {
	            buffer = new InternetAddress(cc[i], cc[i], "UTF-8");
	            addressCC[i] = buffer;
	        }
			
			mimeMessage.setFrom(fromAddr);
			mimeMessage.setRecipient(RecipientType.TO, toAddr);
			mimeMessage.setRecipients(RecipientType.CC, addressCC);
			mimeMessage.setSubject(subject);
			mimeMessage.setText(text, "UTF-8", "html");
			
			javaMailSender.send(mimeMessage);
		} catch(Exception ex) {
			log.error(ex.getMessage());
		}
		
	}
	
	public void insertMailNotification(Map<String, String> paramMap) {
		log.debug("insertMailNotification paramMap={}", paramMap);
		paramMap.put("notificationSeq", String.valueOf(mailMapper.getMaxNotificationSeq(paramMap)));
		mailMapper.insertMailNotification(paramMap);
	}
	
	public void updateMailNotification(Map<String, String> paramMap) {
		log.debug("insertMailNotification paramMap={}", paramMap);
		mailMapper.updateMailNotification(paramMap);
	}
	
	public List<Map<String, Object>> getMailNotificationToday(Map<String, String> paramMap) {
		log.debug("getMailNotificationToday paramMap={}", paramMap);
		return mailMapper.getMailNotificationToday(paramMap);
	}
	
	public List<Map<String, Object>> getMailNotificationPast(Map<String, String> paramMap) {
		log.debug("getMailNotificationPast paramMap={}", paramMap);
		return mailMapper.getMailNotificationPast(paramMap);
	}
	
	public Map<String, Object> sendMultipleMail(List<Map<String, String>> list) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		int totalCnt = 0;
		int successCnt = 0;
		int failCnt = 0;
		if (list != null && list.size() > 0) {
			SimpleMailMessage message = new SimpleMailMessage();
			for(int i=0; i<list.size(); i++) {
				totalCnt++;
				Map<String, String> map = (Map<String, String>)list.get(i);
				message.setFrom(map.get("from"));
				message.setTo(map.get("to"));
				message.setCc(map.get("cc"));
				message.setSubject(map.get("subject"));
				message.setText(map.get("text"));
				try {
					mailSender.send(message);
					successCnt++;
				} catch(Exception ex) {
					log.error(ex.getMessage());
					failCnt++;
				}
			}
		}
		
		rtnMap.put("totalCnt", totalCnt);
		rtnMap.put("successCnt", successCnt);
		rtnMap.put("failCnt", failCnt);
		
		return rtnMap;
	}
}
