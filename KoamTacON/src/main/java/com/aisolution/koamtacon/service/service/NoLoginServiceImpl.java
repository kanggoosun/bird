package com.aisolution.koamtacon.service.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.model.SessionInfo;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.mapper.service.NoLoginMapper;

@Service
@SessionAttributes({"sessionInfo"})
public class NoLoginServiceImpl implements NoLoginService {

	private static final Logger log = LoggerFactory.getLogger(NoLoginServiceImpl.class);
	
	@Autowired
	private NoLoginMapper noLoginMapper;
	
	public boolean CanLogin(Map<String, String> paramMap) {
		log.debug("CanLogin paramMap={}", paramMap);
		
		if (noLoginMapper.CanLogin(paramMap) == 1) {
			paramMap.put("area", ConfigConstants.AREA);
			SessionUtil.setSession(this.SelectSessionInfo(paramMap));
			if (SessionUtil.getSession() == null) {
				log.debug("Login error!");
				return false;
			}
			log.debug("Login succesful!");
			return true;
		}
		
		log.debug("Login failed!");
		return false;
	}

	private SessionInfo SelectSessionInfo(Map<String, String> paramMap) {
		log.debug("SelectSessionInfo paramMap={}", paramMap);
		
		return noLoginMapper.SelectSessionInfo(paramMap);
	}
	
	public int isExist(Map<String, String> paramMap) {
		log.debug("isExist paramMap={}", paramMap);
		
		return noLoginMapper.isExist(paramMap);
	}
	
	public void insertUser(Map<String, String> paramMap) {
		log.debug("insertUser paramMap={}", paramMap);
		
		noLoginMapper.insertUser(paramMap);
	}
	
	public void insertSign(Map<String, String> paramMap) {
		log.debug("insertSign paramMap={}", paramMap);
		
		noLoginMapper.insertSign(paramMap);
	}
	
	public void updateSign(Map<String, String> paramMap) {
		log.debug("updateSign paramMap={}", paramMap);
		
		noLoginMapper.updateSign(paramMap);
	}
	
	public Map<String, Object> getUserProfile(Map<String, String> paramMap) {
		log.debug("getUserProfile paramMap={}", paramMap);
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		rtnMap = noLoginMapper.getUserProfile(paramMap);
		
		return rtnMap;
	}
	
	public void resetPassword(Map<String, String> paramMap) {
		log.debug("resetPassword paramMap={}", paramMap);
		noLoginMapper.resetPassword(paramMap);
	}
	
	public int verifyOwner(Map<String, String> paramMap) {
		log.debug("verifyOwner paramMap={}", paramMap);
		return noLoginMapper.verifyOwner(paramMap);
	}
	
	public int verifyUser(Map<String, String> paramMap) {
		log.debug("verifyUser paramMap={}", paramMap);
		return noLoginMapper.verifyUser(paramMap);
	}
	
	public void changePassword(Map<String, String> paramMap) {
		log.debug("changePassword paramMap={}", paramMap);
		noLoginMapper.changePassword(paramMap);
	}
	
	public Map<String, Object> getCountry(Map<String, String> paramMap) {
		log.debug("getCountry paramMap={}", paramMap);
		
		return noLoginMapper.getCountry(paramMap);
	}
	
	public void insertDemoAccount(Map<String, String> paramMap) {
		log.debug("insertDemoAccount paramMap={}", paramMap);
		
		noLoginMapper.insertDemoAccount(paramMap);
	}
}
