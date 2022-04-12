package com.aisolution.koamtacon.service.mdc;

import java.util.List;
import java.util.Map;

public interface TabgenService {
	public List<Map<String, Object>> getTabgenRecordsByReckey(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTabgenRecordsWithHeaderByReckey(Map<String, String> paramMap);
}
