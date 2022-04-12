package com.aisolution.koamtacon.service.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

public interface GroupService {

	public List<Map<String, Object>> getGroupInfo(Map<String, String> paramMap);
	
	public int getGroupMemberCount(Map<String, String> paramMap);
	
	public Map<String, Object> getGroupMember(Map<String, String> paramMap);
	
	public int getGroupCount(Map<String, String> paramMap);
	
	public int getDuplicatedGroupCount(Map<String, String> paramMap);
	
	public String getMaxGroupCode(Map<String, String> paramMap);
	
	public String getGroupCode(Map<String, String> paramMap);
	
	public void createGroup(Map<String, String> paramMap);
	
	public void insertMember(Map<String, String> paramMap);
	
	public List<Map<String, String>> getMemberInfosFromExcel(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit);
	
	public void updateGroupUsable(Map<String, String> paramMap);
	
	public int getNextMemberSeq(Map<String, String> paramMap);
	
	public void updateGroupArea(Map<String, String> paramMap);
	
	public void updateGroupMemberArea(Map<String, String> paramMap);
	
	public void updateUserArea(Map<String, String> paramMap);
	
	public List<String> getAvailabelGroupCodeList();
	
	public String getMinAvailableGroupCode();
}
