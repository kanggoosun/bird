package com.aisolution.koamtacon.service.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartRequest;

import com.aisolution.common.model.ExcelInfo;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.ExcelUtils;
import com.aisolution.common.util.FileUtils;
import com.aisolution.koamtacon.mapper.mdc.MdcKoamtacMapper;
import com.aisolution.koamtacon.mapper.service.GroupMapper;

@Service
public class GroupServiceImpl implements GroupService {
	private static final Logger log = LoggerFactory.getLogger(GroupServiceImpl.class);
	
	@Autowired
	private GroupMapper groupMapper;
	@Autowired
	private MdcKoamtacMapper mdcKoamtacMapper;
	
	public List<Map<String, Object>> getGroupInfo(Map<String, String> paramMap) {
		log.debug("getGroupInfo paramMap={}", paramMap);
		return groupMapper.getGroupInfo(paramMap);
	}
	
	public int getGroupMemberCount(Map<String, String> paramMap) {
		log.debug("getGroupMemberCount paramMap={}", paramMap);
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		return groupMapper.getGroupMemberCount(map);
	}
	
	public Map<String, Object> getGroupMember(Map<String, String> paramMap) {
		log.debug("getGroupMember paramMap={}", paramMap);
		
		//String ownerId = paramMap.get("ownerId");
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("ownerId", ownerId);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, groupMapper.getGroupMemberCount(map)));
		map.put("memberList", groupMapper.getGroupMember(map));
		log.debug("map={}",map);
		
		return map;
	}
	
	public int getGroupCount(Map<String, String> paramMap) {
		log.debug("getGroupCount paramMap={}", paramMap);
		return groupMapper.getGroupCount(paramMap);
	}
	
	public int getDuplicatedGroupCount(Map<String, String> paramMap) {
		log.debug("getDuplicatedGroupCount paramMap={}", paramMap);
		return groupMapper.getDuplicatedGroupCount(paramMap);
	}
	
	public String getMaxGroupCode(Map<String, String> paramMap) {
		log.debug("getMaxGroupCode paramMap={}", paramMap);
		return groupMapper.getMaxGroupCode(paramMap);
	}
	
	public String getGroupCode(Map<String, String> paramMap) {
		log.debug("getGroupCode paramMap={}", paramMap);
		return groupMapper.getGroupCode(paramMap);
	}
	
	public void createGroup(Map<String, String> paramMap) {
		log.debug("createGroup paramMap={}", paramMap);
		groupMapper.createGroup(paramMap);
	}
	
	public void insertMember(Map<String, String> paramMap) {
		log.debug("insertMember paramMap={}", paramMap);
		groupMapper.insertMember(paramMap);
	}
	
	public List<Map<String, String>> getMemberInfosFromExcel(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit) {
		log.debug("getMemberInfosFromExcel paramMap={}", paramMap);
		
		List<Map<String, String>> rtnList = null;
		String filename = "";
		
		try {
			List<Map<String, Object>> fileList = FileUtils.fileUpload(multipartRequest, paramMap, path, bakPath, fileSizeLimit);
			
			if (fileList.size() == 1) {
				rtnList = new ArrayList<Map<String, String>>();
				
				Map<String, Object> map = null;
				map = new HashMap<String, Object>();
				map = (Map<String, Object>)fileList.get(0);
				filename = map.get("serverFilename").toString();
				ExcelInfo excelInfo = new ExcelInfo();
				excelInfo.setPath(path);
				excelInfo.setFilename(filename);
				excelInfo.setColumnNames("A","B","C");
				excelInfo.setLastCellNumber(3);
				excelInfo.setStartRow(3);
				excelInfo.setTabName("MEMBER");
				
				rtnList = ExcelUtils.read(excelInfo);
			}
			
			if (FileUtils.isExist(filename, path)) {
				FileUtils.deleteFile(filename, path);
			}
		}  catch(Exception e) {
			log.error(e.getMessage());
			if (FileUtils.isExist(filename, path)) {
				FileUtils.deleteFile(filename, path);
			}
		}
		return rtnList;
	}
	
	public void updateGroupUsable(Map<String, String> paramMap) {
		log.debug("updateGroupUsable paramMap={}", paramMap);
		groupMapper.updateGroupUsable(paramMap);
	}
	
	public int getNextMemberSeq(Map<String, String> paramMap) {
		log.debug("getNextMemberSeq paramMap={}", paramMap);
		return groupMapper.getNextMemberSeq(paramMap);
	}
	
	public void updateGroupArea(Map<String, String> paramMap) {
		log.debug("updateGroupArea paramMap={}", paramMap);
		groupMapper.updateGroupArea(paramMap);
	}
	
	public void updateGroupMemberArea(Map<String, String> paramMap) {
		log.debug("updateGroupMemberArea paramMap={}", paramMap);
		groupMapper.updateGroupMemberArea(paramMap);
	}
	
	public void updateUserArea(Map<String, String> paramMap) {
		log.debug("updateUserArea paramMap={}", paramMap);
		groupMapper.updateUserArea(paramMap);
	}
	
	public List<String> getAvailabelGroupCodeList() {
		log.debug("getAvailabelGroupCodeList");
		
		List<String> usedDeviceCodeList = mdcKoamtacMapper.getUsedDeviceCodes();
		//log.debug("After getUsedDeviceCodes");
		List<String> usedGroupCodeList = mdcKoamtacMapper.getUsedGroupCodes();
		//log.debug("After getUsedGroupCodes");
		List<String> reservedGroupCodeList = CommonUtils.makeAvailableGroupCodeList();
		//log.debug("After makeAvailableGroupCodeList");
		
		reservedGroupCodeList.removeAll(usedDeviceCodeList);
		//log.debug("After remove usedDeviceCodeList");
		reservedGroupCodeList.removeAll(usedGroupCodeList);
		//log.debug("After remover usedGroupCodeList");
		
		return reservedGroupCodeList;
	}
	
	public String getMinAvailableGroupCode() {
		log.debug("getMinAvailableGroupCode");
		
		return getAvailabelGroupCodeList().get(0).toString();
	}
}