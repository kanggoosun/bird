package com.aisolution.koamtacon.mapper.service;

import java.util.List;
import java.util.Map;

public interface BoardMapper {

	public int getNoticeListForUserCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getNoticeListForUser(Map<String, Object> paramMap);
	
	public Map<String, Object> getNoticeDetailForUser(Map<String, String> paramMap);
	
	public int getFaqListForUserCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getFaqListForUser(Map<String, Object> paramMap);
}
