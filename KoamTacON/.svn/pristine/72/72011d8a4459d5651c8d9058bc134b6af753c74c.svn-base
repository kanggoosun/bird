package com.aisolution.koamtacon.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

public interface SystemManagementService {
	
	public List<Map<String, Object>> makeTreeWithMenu(List<Map<String, Object>> tgtList);
	
	public List<Map<String, Object>> getDivisionList();
	
	public int getMaxLevel();

	public List<Map<String, Object>> getMenuListByDivision(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMenuList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMenuListInUse(Map<String, String> paramMap);
	
	public void insertMenu(Map<String, String> paramMap);
	
	public void updateMenu(Map<String, String> paramMap);
	
	public Map<String, Object> getMenuInfo(Map<String, String> paramMap);
	
	public void insertRole(Map<String, String> paramMap);
	
	public void updateRole(Map<String, String> paramMap);
	
	public Map<String, Object> getRoleList(Map<String, String> paramMap);
	
	public Map<String, Object> getRoleUserList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getUserList(Map<String, String> paramMap);
	
	public void insertRoleUser(Map<String, String> paramMap);
	
	public void deleteRoleUser(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getRoleMenuList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getMenuListNotInRole(Map<String, String> paramMap);
	
	public void insertRoleMenu(Map<String, String> paramMap);
	
	public void deleteRoleMenu(Map<String, String> paramMap);
	
	public Map<String, Object> getCodeMasterList(Map<String, String> paramMap);
	
	public Map<String, Object> getCodeDetailList(Map<String, String> paramMap);
	
	public int checkCodeMasterDuplication(Map<String, String> paramMap);
	
	public void insertCodeMaster(Map<String, String> paramMap);
	
	public void updateCodeMaster(Map<String, String> paramMap);
	
	public void insertCodeDetail(Map<String, String> paramMap);
	
	public void updateCodeDetail(Map<String, String> paramMap);
	
	public Map<String, Object> getApplicationList(Map<String, String> paramMap);
	
	public Map<String, Object> getApplicationInfo(Map<String, String> paramMap);
	
	public int getMaxApplicationSeq();
	
	public void insertApplication(Map<String, String> paramMap);
	
	public void updateApplication(Map<String, String> paramMap);
	
	public Map<String, Object> getFileList(Map<String, String> paramMap);
	
	public Map<String, Object> getFileInfo(Map<String, String> paramMap);
	
	public int getMaxFilesSeq();
	
	public boolean insertFiles(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit);
	
	public boolean updateFiles(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit);
	
	public void updateFilesWithNoFile(Map<String, String> paramMap);
	
	public boolean deleteFiles(Map<String, String> paramMap, String path);
}
