package com.aisolution.koamtacon.mapper.service;

import java.util.List;
import java.util.Map;

public interface UserMainMapper {

	public Map<String, Object> getNumberOfUsers();
	
	public Map<String, Object> getNumberOfGroups();
	
	public Map<String, Object> getNumberOfKDC();
	
	public Map<String, Object> getNumberOfQuestions();
	
	public List<Map<String, Object>> getDayEventList(Map<String, Object> map);
}
