package com.aisolution.koamtacon.service.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.koamtacon.mapper.service.ApplicationMapper;

@Service
public class ApplicationServiceImpl implements ApplicationService {
	private static final Logger log = LoggerFactory.getLogger(ApplicationServiceImpl.class);
	
	@Autowired
	private ApplicationMapper applicationMapper;
	
	public Map<String, Object> getApplicationInfo(Map<String, String> paramMap) {
		log.debug("getApplicationInfo paramMap={}", paramMap);
		return applicationMapper.getApplicationInfo(paramMap);
	}
	
	public void insertApplicationRequest(Map<String, String> paramMap) {
		log.debug("insertApplicationRequest paramMap={}", paramMap);
		applicationMapper.insertApplicationRequest(paramMap);
	}
	
	public List<Map<String, Object>> getFileList(Map<String, String> paramMap) {
		log.debug("getFileList paramMap={}", paramMap);
		return applicationMapper.getFileList(paramMap);
	}
}
