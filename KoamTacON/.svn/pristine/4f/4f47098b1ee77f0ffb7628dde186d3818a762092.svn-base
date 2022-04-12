package com.aisolution.koamtacon.service.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.koamtacon.mapper.service.DashboardMapper;

@Service
public class DashboardServiceImpl implements DashboardService {
	private static final Logger log = LoggerFactory.getLogger(DashboardServiceImpl.class);
	
	@Autowired
	private DashboardMapper dashboardMapper;
	
	public Map<String, Object> getNumberOfUsers() {
		log.debug("getNumberOfUsers");
		return dashboardMapper.getNumberOfUsers();
	}

	public Map<String, Object> getNumberOfGroups() {
		log.debug("getNumberOfGroups");
		return dashboardMapper.getNumberOfGroups();
	}
	
	public Map<String, Object> getNumberOfKDC(){
		log.debug("getNumberOfKDC");
		return dashboardMapper.getNumberOfKDC();
	}
	
	public Map<String, Object> getNumberOfQuestions() {
		log.debug("getNumberOfQuestions");
		return dashboardMapper.getNumberOfQuestions();
	}
}
