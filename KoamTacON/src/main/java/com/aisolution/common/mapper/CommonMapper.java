package com.aisolution.common.mapper;

import java.util.List;
import java.util.Map;

public interface CommonMapper {

	public List<Map<String, Object>> getListCountryCode();
	
	public List<Map<String, Object>> getComboCode(Map<String, String> paramMap);
	
	public List<Map<String, Object>> checkIp(Map<String, String> paramMap);
}
