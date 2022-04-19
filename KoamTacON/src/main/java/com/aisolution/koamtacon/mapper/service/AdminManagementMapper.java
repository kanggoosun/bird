package com.aisolution.koamtacon.mapper.service;

import java.util.List;
import java.util.Map;

public interface AdminManagementMapper {

	public List<Map<String, Object>> getDivisionList();
	
	public int getMaxLevel();
	
	public List<Map<String, Object>> getMenuListByDivision(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMenuList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMenuListInUse(Map<String, String> paramMap);
	
	public int getMaxMenuSeq();
	
	public void insertMenu(Map<String, String> paramMap);
	
	public void updateMenu(Map<String, String> paramMap);
	
	public Map<String, Object> getMenuInfo(Map<String, String> paramMap);
	
	public int getMaxRoleSeq();
	
	public void insertRole(Map<String, String> paramMap);
	
	public void updateRole(Map<String, String> paramMap);
	
	public int getRoleListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getRoleList(Map<String, Object> paramMap);
	
	public int getRoleUserListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getRoleUserList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getUserList(Map<String, String> paramMap);
	
	public void insertRoleUser(Map<String, String> paramMap);
	
	public void deleteRoleUser(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getRoleMenuList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMenuListNotInRole(Map<String, String> paramMap);
	
	public void insertRoleMenu(Map<String, String> paramMap);
	
	public void deleteRoleMenu(Map<String, String> paramMap);
	
	public int getCodeMasterListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getCodeMasterList(Map<String, Object> paramMap);
	
	public int getCodeDetailListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getCodeDetailList(Map<String, Object> paramMap);
	
	public int checkCodeMasterDuplication(Map<String, String> paramMap);
	
	public void insertCodeMaster(Map<String, String> paramMap);
	
	public void updateCodeMaster(Map<String, String> paramMap);
	
	public void insertCodeDetail(Map<String, String> paramMap);
	
	public void updateCodeDetail(Map<String, String> paramMap);
	
	public int getApplicationListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getApplicationList(Map<String, Object> paramMap);
	
	public Map<String, Object> getApplicationInfo(Map<String, String> paramMap);
	
	public int getMaxApplicationSeq();
	
	public void insertApplication(Map<String, String> paramMap);
	
	public void updateApplication(Map<String, String> paramMap);
	
	public int getFileListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getFileList(Map<String, Object> paramMap);
	
	public Map<String, Object> getFileInfo(Map<String, String> paramMap);
	
	public int getMaxFilesSeq();
	
	public void insertFiles(Map<String, String> paramMap);

	public void updateFiles(Map<String, String> paramMap);
	
	public void updateFilesWithNoFile(Map<String, String> paramMap);
	
	public void deleteFiles(Map<String, String> paramMap);
}
