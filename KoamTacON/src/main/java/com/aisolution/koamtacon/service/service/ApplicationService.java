package com.aisolution.koamtacon.service.service;

import java.util.List;
import java.util.Map;

public interface ApplicationService {
	
	public Map<String, Object> getApplicationInfo(Map<String, String> paramMap);
	
	public void insertApplicationRequest(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getFileList(Map<String, String> paramMap);
}
