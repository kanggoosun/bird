package com.aisolution.koamtacon.service.service;

import java.util.Map;

public interface UserMainService {

	public Map<String, Object> getNumberOfUsers();
	
	public Map<String, Object> getNumberOfGroups();
	
	public Map<String, Object> getNumberOfKDC();
	
	public Map<String, Object> getNumberOfQuestions();
	
	public Map<String, Object> getDayEventList(Map<String, String> paramMap);
}
