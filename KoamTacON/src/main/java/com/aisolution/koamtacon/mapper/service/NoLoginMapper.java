package com.aisolution.koamtacon.mapper.service;

import java.util.Map;

import com.aisolution.common.model.SessionInfo;

public interface NoLoginMapper {

	public int CanLogin(Map<String, String> paramMap);
	
	public SessionInfo SelectSessionInfo(Map<String, String> paramMap);
	
	public int isExist(Map<String, String> paramMap);
	
	public void insertUser(Map<String, String> paramMap);
	
	public void insertSign(Map<String, String> paramMap);
	
	public void updateSign(Map<String, String> paramMap);
	
	public Map<String, Object> getUserProfile(Map<String, String> paramMap);
	
	public void resetPassword(Map<String, String> paramMap);
	
	public int verifyOwner(Map<String, String> paramMap);
	
	public int verifyUser(Map<String, String> paramMap);
	
	public void changePassword(Map<String, String> paramMap);
	
	public Map<String, Object> getCountry(Map<String, String> paramMap);
	
	public void insertDemoAccount(Map<String, String> paramMap);
}
