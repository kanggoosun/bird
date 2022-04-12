package com.aisolution.koamtacon.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

public interface UserManagementService {

	public Map<String, Object> getOwnerList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getOwnerListForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getUserInfoList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getUserInfoListForExcel(Map<String, String> paramMap);
	
	public void updateUserInfo(Map<String, String> paramMap);
	
	public Map<String, Object> getAdminInfoList(Map<String, String> paramMap);
	
	public void updateAdminInfo(Map<String, String> paramMap);
	
	public Map<String, Object> getGroupList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getGroupListForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getMemberList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMemberListForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getUserInfo(Map<String, String> paramMap);
	
	public void updateSendYn(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getNotSendMemberList(Map<String, String> paramMap);
	
	public void activateUser(Map<String, String> paramMap);
	
	public Map<String, Object> getDemoAccountsList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getDemoAccountsListForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getDemoAccount(Map<String, String> paramMap);
	
	public void updateDemoAccount(Map<String, String> paramMap);
	
	public Map<String, Object> getDemoAccountInfo(Map<String, String> paramMap);
	
	public void updateDemoAccountStartDate(Map<String, String> paramMap);
	
	public int getNumberOfMemberWithActivationCode(Map<String, String> paramMap);
	
	public Map<String, Object> getBatchUserList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getBatchUserListForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> createMobileUserBatch(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit);
	
	public void createBatchUser(Map<String, String> paramMap);
	
	public Map<String, Object> createMobileUserBatchWithGroupCode(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit);
	
	public String getOwnerId(Map<String, String> paramMap);
	
	public void deleteGroup(Map<String, String> paramMap);
	
	public void updateGroupCodeByMember(Map<String, String> paramMap);
	
	public void updateUserTypeAsMember(Map<String, String> paramMap);
}
