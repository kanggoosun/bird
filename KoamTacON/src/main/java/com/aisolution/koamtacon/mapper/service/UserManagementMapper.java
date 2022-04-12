package com.aisolution.koamtacon.mapper.service;

import java.util.List;
import java.util.Map;

public interface UserManagementMapper {

	public int getOwnerListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getOwnerList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getOwnerListForExcel(Map<String, String> paramMap);
	
	public int getUserInfoListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getUserInfoList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getUserInfoListForExcel(Map<String, String> paramMap);
	
	public void updateUserInfo(Map<String, String> paramMap);
	
	public int getAdminInfoListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getAdminInfoList(Map<String, Object> paramMap);
	
	public void updateAdminInfo(Map<String, String> paramMap);
	
	public int getGroupListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getGroupList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getGroupListForExcel(Map<String, String> paramMap);
	
	public int getMemberListCount(Map<String, Object> paramMap);

	public List<Map<String, Object>> getMemberList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getMemberListForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getUserInfo(Map<String, String> paramMap);
	
	public void updateSendYn(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getNotSendMemberList(Map<String, String> paramMap);
	
	public void activateUser(Map<String, String> paramMap);
	
	public int getDemoAccountsListCount(Map<String, Object> paramMap);

	public List<Map<String, Object>> getDemoAccountsList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getDemoAccountsListForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getDemoAccount(Map<String, String> paramMap);
	
	public void updateDemoAccount(Map<String, String> paramMap);
	
	public Map<String, Object> getDemoAccountInfo(Map<String, String> paramMap);
	
	public void updateDemoAccountStartDate(Map<String, String> paramMap);
	
	public int getNumberOfMemberWithActivationCode(Map<String, String> paramMap);
	
	public int getBatchUserListCount(Map<String, Object> paramMap);

	public List<Map<String, Object>> getBatchUserList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getBatchUserListForExcel(Map<String, String> paramMap);
	
	public void createBatchUser(Map<String, String> paramMap);
	
	public String getOwnerId(Map<String, String> paramMap);
	
	public void deleteGroup(Map<String, String> paramMap);
	
	public void updateGroupCodeByMember(Map<String, String> paramMap);
	
	public void updateUserTypeAsMember(Map<String, String> paramMap);
}