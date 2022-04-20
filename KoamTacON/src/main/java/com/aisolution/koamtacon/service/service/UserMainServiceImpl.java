package com.aisolution.koamtacon.service.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.common.util.CommonUtils;
import com.aisolution.koamtacon.mapper.service.UserMainMapper;

@Service
public class UserMainServiceImpl implements UserMainService {
	private static final Logger log = LoggerFactory.getLogger(UserMainServiceImpl.class);
	
	@Autowired
	private UserMainMapper userMainMapper;
	
	public Map<String, Object> getNumberOfUsers() {
		log.debug("getNumberOfUsers");
		return userMainMapper.getNumberOfUsers();
	}

	public Map<String, Object> getNumberOfGroups() {
		log.debug("getNumberOfGroups");
		return userMainMapper.getNumberOfGroups();
	}
	
	public Map<String, Object> getNumberOfKDC(){
		log.debug("getNumberOfKDC");
		return userMainMapper.getNumberOfKDC();
	}
	
	public Map<String, Object> getNumberOfQuestions() {
		log.debug("getNumberOfQuestions");
		return userMainMapper.getNumberOfQuestions();
	}
	
	public Map<String, Object> getDayEventList(Map<String, String> paramMap) {
		log.debug("getDayEventList ServiceImple paramMap={}", paramMap);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		
		map.put("applicationList", userMainMapper.getDayEventList(map));
		
		log.debug("getDayEventList ServiceImple return={}", map.get("applicationList"));
		
		return map;
	}
}
