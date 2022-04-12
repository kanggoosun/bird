package com.aisolution.koamtacon.service.mdc;

import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

public interface WSApiService {

	public Map<String, Object> importTabgenWithExcel(Map<String, String> paramMap, MultipartRequest multipartRequest);
	
	public Map<String, Object> importTabgenListWithExcel(Map<String, String> paramMap, MultipartRequest multipartRequest);
	
	public Map<String, Object> importTabgenWithExcelNoLimit(Map<String, String> paramMap, MultipartRequest multipartRequest);
	
	public boolean uploadDetail(Map<String, String> paramMap, MultipartRequest multipartRequest);
	
	public boolean makeEventTables(Map<String, String> paramMap, Map<String, Object> dataMap);
	
	public Map<String, String> createMobileUserAndActivationCode(Map<String, String> paramMap);
	
	public int changeGroupCode(Map<String, String> paramMap);
	//--------------------------------------------------------------------------------------------------------------------------------------------
	public void wsTest(Map<String, String> paramMap);
	
}
