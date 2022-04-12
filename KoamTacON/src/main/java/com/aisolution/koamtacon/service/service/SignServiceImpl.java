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
import com.aisolution.koamtacon.mapper.service.SignMapper;

@Service
@SessionAttributes({"sessionInfo"})
public class SignServiceImpl implements SignService {

	private static final Logger log = LoggerFactory.getLogger(SignServiceImpl.class);
	
	@Autowired
	private SignMapper signMapper;
	
	public boolean CanLogin(Map<String, String> paramMap) {
		log.debug("CanLogin paramMap={}", paramMap);
		
		if (signMapper.CanLogin(paramMap) == 1) {
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
		
		return signMapper.SelectSessionInfo(paramMap);
	}
	
	public int isExist(Map<String, String> paramMap) {
		log.debug("isExist paramMap={}", paramMap);
		
		return signMapper.isExist(paramMap);
	}
	
	public void insertUser(Map<String, String> paramMap) {
		log.debug("insertUser paramMap={}", paramMap);
		
		signMapper.insertUser(paramMap);
	}
	
	public void insertSign(Map<String, String> paramMap) {
		log.debug("insertSign paramMap={}", paramMap);
		
		signMapper.insertSign(paramMap);
	}
	
	public void updateSign(Map<String, String> paramMap) {
		log.debug("updateSign paramMap={}", paramMap);
		
		signMapper.updateSign(paramMap);
	}
	
	public Map<String, Object> getUserProfile(Map<String, String> paramMap) {
		log.debug("getUserProfile paramMap={}", paramMap);
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		rtnMap = signMapper.getUserProfile(paramMap);
		
		return rtnMap;
	}
	
	public void resetPassword(Map<String, String> paramMap) {
		log.debug("resetPassword paramMap={}", paramMap);
		signMapper.resetPassword(paramMap);
	}
	
	public int verifyOwner(Map<String, String> paramMap) {
		log.debug("verifyOwner paramMap={}", paramMap);
		return signMapper.verifyOwner(paramMap);
	}
	
	public int verifyUser(Map<String, String> paramMap) {
		log.debug("verifyUser paramMap={}", paramMap);
		return signMapper.verifyUser(paramMap);
	}
	
	public void changePassword(Map<String, String> paramMap) {
		log.debug("changePassword paramMap={}", paramMap);
		signMapper.changePassword(paramMap);
	}
	
	public Map<String, Object> getCountry(Map<String, String> paramMap) {
		log.debug("getCountry paramMap={}", paramMap);
		
		return signMapper.getCountry(paramMap);
	}
	
	public void insertDemoAccount(Map<String, String> paramMap) {
		log.debug("insertDemoAccount paramMap={}", paramMap);
		
		signMapper.insertDemoAccount(paramMap);
	}
}
