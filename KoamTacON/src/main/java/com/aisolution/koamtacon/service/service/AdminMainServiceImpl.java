package com.aisolution.koamtacon.service.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.koamtacon.mapper.service.AdminMainMapper;

@Service
public class AdminMainServiceImpl implements AdminMainService {
	private static final Logger log = LoggerFactory.getLogger(AdminMainServiceImpl.class);
	
	@Autowired
	private AdminMainMapper adminMainMapper;
	
	public Map<String, Object> getNumberOfUsers() {
		log.debug("getNumberOfUsers");
		return adminMainMapper.getNumberOfUsers();
	}

	public Map<String, Object> getNumberOfGroups() {
		log.debug("getNumberOfGroups");
		return adminMainMapper.getNumberOfGroups();
	}
	
	public Map<String, Object> getNumberOfKDC(){
		log.debug("getNumberOfKDC");
		return adminMainMapper.getNumberOfKDC();
	}
	
	public Map<String, Object> getNumberOfQuestions() {
		log.debug("getNumberOfQuestions");
		return adminMainMapper.getNumberOfQuestions();
	}
}
