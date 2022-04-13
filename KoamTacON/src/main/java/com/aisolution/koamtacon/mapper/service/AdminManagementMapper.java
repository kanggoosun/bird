package com.aisolution.koamtacon.mapper.service;

import java.util.List;
import java.util.Map;

public interface AdminManagementMapper {

	public int getKDCRegistrationApprovalListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getKDCRegistrationApprovalList(Map<String, Object> paramMap);
	
	public void kdcApproval(Map<String, String> paramMap);
	
	public int getApplicationApprovalListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getApplicationApprovalList(Map<String, Object> paramMap);
	
	public void saveApplicationApproval(Map<String, String> paramMap);
	
	public void insertApplicationGroup(Map<String, String> paramMap);
	
	public int getApplicationGroupCount(Map<String, String> paramMap);
	
	public void updateApplicationGroup(Map<String, String> paramMap);
}
