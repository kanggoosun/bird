package com.aisolution.koamtacon.mapper.service;

import java.util.Map;

public interface AdminMainMapper {

	public Map<String, Object> getNumberOfUsers();
	
	public Map<String, Object> getNumberOfGroups();
	
	public Map<String, Object> getNumberOfKDC();
	
	public Map<String, Object> getNumberOfQuestions();
}
