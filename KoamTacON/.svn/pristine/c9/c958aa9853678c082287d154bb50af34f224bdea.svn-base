package com.aisolution.koamtacon.service.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

public interface KDCService {

	public Map<String, Object> getKDCRegistrationList(Map<String, String> paramMap);
	
	public boolean registKDC(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit);
	
	public Map<String, Object> getKDCPhoto(Map<String, String> paramMap);
	
	public int checkSerialNoDuplcation(Map<String, String> paramMap);
	
	public Map<String, Object> registKDCWithExcel(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit);
	
	public int getApprovalCount(Map<String, String> paramMap);
}
