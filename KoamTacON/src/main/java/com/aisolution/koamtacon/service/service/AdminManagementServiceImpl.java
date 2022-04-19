package com.aisolution.koamtacon.service.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartRequest;

import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.FileUtils;
import com.aisolution.koamtacon.mapper.service.AdminManagementMapper;

@Service
public class AdminManagementServiceImpl implements AdminManagementService {
	private static final Logger log = LoggerFactory.getLogger(AdminManagementServiceImpl.class);
	
	@Autowired
	private AdminManagementMapper adminManagementMapper;
	
	public List<Map<String, Object>> makeTreeWithMenu(List<Map<String, Object>> tgtList) {
		List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();
		
		//rtnList = addMenuList(rtnList, tgtList, 0, -1);
		
		return addMenuList(rtnList, tgtList, 0, -1);
	}
	
	private List<Map<String, Object>> addMenuList(List<Map<String, Object>> menuList, List<Map<String, Object>> rsList, int curLevel, int parentSeq) {
		if (rsList == null || rsList.size() == 0) {
			return menuList;
		}
		
		Map<String, Object> menuMap = new HashMap<String, Object>();
		StringBuffer sb = null;
		if (parentSeq == -1) {
			menuMap = rsList.get(0);
			menuList.add(menuMap);
			rsList.remove(0);
			menuList = addMenuList(menuList, rsList, curLevel+1, Integer.parseInt(menuList.get(0).get("menuSeq").toString()));
		} else {
			boolean bAdd = false;
			for(int i=0; i<rsList.size(); i++) {
				if (bAdd) {
					i = 0;
					bAdd = false;
				}
				
				int cParentSeq = Integer.parseInt(rsList.get(i).get("parentMenuSeq").toString());
				int selfLevel = Integer.parseInt(rsList.get(i).get("menuLevel").toString());
				if (selfLevel == curLevel && cParentSeq == parentSeq) {
					int curSeq = Integer.parseInt(rsList.get(i).get("menuSeq").toString());
					menuMap = rsList.get(i);
					sb = new StringBuffer();
					for(int j=0; j<selfLevel; j++) {
						sb.append("&emsp;");
					}
					menuMap.put("menuLevelChar", sb.toString());
					menuList.add(menuMap);
					rsList.remove(i);
					i = i-1;
					menuList = addMenuList(menuList, rsList, curLevel+1, curSeq);
					bAdd = true;
				}
			}
			if (rsList.size() == 1) {
				menuMap = rsList.get(0);
				int selfLevel = Integer.parseInt(rsList.get(0).get("menuLevel").toString());
				sb = new StringBuffer();
				for(int j=0; j<selfLevel; j++) {
					sb.append("&emsp;");
				}
				menuMap.put("menuLevelChar", sb.toString());
				menuList.add(menuMap);
				rsList.remove(0);
			}
		}
		
		return menuList;
	}
	public List<Map<String, Object>> getDivisionList() {
		log.debug("getDivisionList");
		return adminManagementMapper.getDivisionList();
	}
	
	public int getMaxLevel() {
		log.debug("getMaxLevel");
		return adminManagementMapper.getMaxLevel();
	}
	
	public List<Map<String, Object>> getMenuListByDivision(Map<String, String> paramMap) {
		log.debug("getMenuListByDivision paramMap={}",paramMap);
		return adminManagementMapper.getMenuListByDivision(paramMap);
	}
	
	public List<Map<String, Object>> getMenuList(Map<String, String> paramMap) {
		log.debug("getMenuList paramMap={}",paramMap);
		return adminManagementMapper.getMenuList(paramMap);
	}
	
	public List<Map<String, Object>> getMenuListInUse(Map<String, String> paramMap) {
		log.debug("getMenuListInUse paramMap={}",paramMap);
		return adminManagementMapper.getMenuListInUse(paramMap);
	}
	
	public void insertMenu(Map<String, String> paramMap) {
		log.debug("insertMenu paramMap={}", paramMap);
		paramMap.put("menuSeq", String.valueOf(adminManagementMapper.getMaxMenuSeq()));
		adminManagementMapper.insertMenu(paramMap);
	}
	
	public void updateMenu(Map<String, String> paramMap) {
		log.debug("updateMenu paramMap={}", paramMap);
		adminManagementMapper.updateMenu(paramMap);
	}
	
	public Map<String, Object> getMenuInfo(Map<String, String> paramMap) {
		log.debug("getMenuInfo paramMap={}", paramMap);
		return adminManagementMapper.getMenuInfo(paramMap);
	}
	
	public void insertRole(Map<String, String> paramMap) {
		log.debug("insertRole paramMap={}", paramMap);
		paramMap.put("roleSeq", String.valueOf(adminManagementMapper.getMaxRoleSeq()));
		adminManagementMapper.insertRole(paramMap);
	}
	
	public void updateRole(Map<String, String> paramMap) {
		log.debug("updateRole paramMap={}", paramMap);
		adminManagementMapper.updateRole(paramMap);
	}
	
	public Map<String, Object> getRoleList(Map<String, String> paramMap) {
		log.debug("getRoleList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, adminManagementMapper.getRoleListCount(map)));
		map.put("roleList", adminManagementMapper.getRoleList(map));
		
		return map;
	}
	
	public Map<String, Object> getRoleUserList(Map<String, String> paramMap) {
		log.debug("getRoleUserList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		//map.put("roleSeq", paramMap.get("roleSeq"));
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, adminManagementMapper.getRoleUserListCount(map)));
		map.put("roleUserList", adminManagementMapper.getRoleUserList(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getUserList(Map<String, String> paramMap) {
		log.debug("getUserList paramMap={}", paramMap);
		return adminManagementMapper.getUserList(paramMap);
	}
	
	public void insertRoleUser(Map<String, String> paramMap) {
		log.debug("insertRoleUser paramMap={}", paramMap);
		adminManagementMapper.insertRoleUser(paramMap);
	}
	
	public void deleteRoleUser(Map<String, String> paramMap) {
		log.debug("deleteRoleUser paramMap={}", paramMap);
		adminManagementMapper.deleteRoleUser(paramMap);
	}
	
	public List<Map<String, Object>> getRoleMenuList(Map<String, String> paramMap) {
		log.debug("getRoleMenuList paramMap={}", paramMap);
		return adminManagementMapper.getRoleMenuList(paramMap);
	}
	
	public List<Map<String, Object>> getMenuListNotInRole(Map<String, String> paramMap) {
		log.debug("getMenuListNotInRole paramMap={}", paramMap);
		return adminManagementMapper.getMenuListNotInRole(paramMap);
	}
	
	public void insertRoleMenu(Map<String, String> paramMap) {
		log.debug("insertRoleMenu paramMap={}", paramMap);
		adminManagementMapper.insertRoleMenu(paramMap);
	}
	
	public void deleteRoleMenu(Map<String, String> paramMap) {
		log.debug("deleteRoleMenu paramMap={}", paramMap);
		adminManagementMapper.deleteRoleMenu(paramMap);
	}
	
	public Map<String, Object> getCodeMasterList(Map<String, String> paramMap) {
		log.debug("getCodeMasterList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		//map.put("sCodeName", paramMap.get("sCodeName"));
		//map.put("sTableName", paramMap.get("sTableName"));
		//map.put("sColumnName", paramMap.get("sColumnName"));
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, adminManagementMapper.getCodeMasterListCount(map)));
		map.put("codeMasterList", adminManagementMapper.getCodeMasterList(map));
		log.debug("map={}",map);
		return map;
	}
	
	public Map<String, Object> getCodeDetailList(Map<String, String> paramMap) {
		log.debug("getCodeDetailList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		//map.put("masterCode", paramMap.get("masterCode"));
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, adminManagementMapper.getCodeDetailListCount(map)));
		map.put("codeDetailList", adminManagementMapper.getCodeDetailList(map));
		
		return map;
	}
	
	public int checkCodeMasterDuplication(Map<String, String> paramMap) {
		log.debug("checkCodeMasterDuplication paramMap={}", paramMap);
		return adminManagementMapper.checkCodeMasterDuplication(paramMap);
	}
	
	public void insertCodeMaster(Map<String, String> paramMap) {
		log.debug("insertCodeMaster paramMap={}", paramMap);
		adminManagementMapper.insertCodeMaster(paramMap);
	}
	
	public void updateCodeMaster(Map<String, String> paramMap) {
		log.debug("updateCodeMaster paramMap={}", paramMap);
		adminManagementMapper.updateCodeMaster(paramMap);
	}
	
	public void insertCodeDetail(Map<String, String> paramMap) {
		log.debug("insertCodeDetail paramMap={}", paramMap);
		adminManagementMapper.insertCodeDetail(paramMap);
	}
	
	public void updateCodeDetail(Map<String, String> paramMap) {
		log.debug("updateCodeDetail paramMap={}", paramMap);
		adminManagementMapper.updateCodeDetail(paramMap);
	}
	
	public Map<String, Object> getApplicationList(Map<String, String> paramMap) {
		log.debug("getApplicationList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		//map.put("linkedSeq", paramMap.get("linkedSeq"));
		//map.put("linkedTable", paramMap.get("linkedTable"));
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, adminManagementMapper.getApplicationListCount(map)));
		map.put("applicationList", adminManagementMapper.getApplicationList(map));
		
		return map;
	}
	
	public Map<String, Object> getApplicationInfo(Map<String, String> paramMap) {
		log.debug("getApplicationInfo paramMap={}", paramMap);
		return adminManagementMapper.getApplicationInfo(paramMap);
	}
	
	public int getMaxApplicationSeq() {
		log.debug("getMaxApplicationSeq");
		return adminManagementMapper.getMaxApplicationSeq();
	}
	
	public void insertApplication(Map<String, String> paramMap) {
		log.debug("insertApplication paramMap={}", paramMap);
		paramMap.put("applicationSeq", String.valueOf(adminManagementMapper.getMaxApplicationSeq()));
		adminManagementMapper.insertApplication(paramMap);
	}
	
	public void updateApplication(Map<String, String> paramMap) {
		log.debug("updateApplication paramMap={}", paramMap);
		adminManagementMapper.updateApplication(paramMap);
	}
	
	public Map<String, Object> getFileList(Map<String, String> paramMap) {
		log.debug("getFileList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		//map.put("linkedSeq", paramMap.get("linkedSeq"));
		//map.put("linkedTable", paramMap.get("linkedTable"));
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, adminManagementMapper.getFileListCount(map)));
		map.put("fileList", adminManagementMapper.getFileList(map));
		
		return map;
	}
	
	public Map<String, Object> getFileInfo(Map<String, String> paramMap) {
		log.debug("getFileInfo paramMap={}", paramMap);
		return adminManagementMapper.getFileInfo(paramMap);
	}
	
	public int getMaxFilesSeq() {
		log.debug("getMaxFilesSeq");
		return adminManagementMapper.getMaxFilesSeq();
	}
	
	@Transactional
	public boolean insertFiles(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit) {
		log.debug("insertFiles paramMap={}", paramMap);
		boolean pFlag = false;
		int filesSeq = adminManagementMapper.getMaxFilesSeq();
		
		try {
			List<Map<String, Object>> rtnList = FileUtils.fileUpload(multipartRequest, paramMap, path, bakPath, fileSizeLimit);
			
			if (rtnList.size() > 0) {
				Map<String, Object> resultMap = null;
				Map<String, String> nParamMap = null;
				for(int i=0; i<rtnList.size(); i++) {
					resultMap = new HashMap<String, Object>();
					resultMap = (Map<String, Object>)rtnList.get(i);
					nParamMap = new HashMap<String, String>();
					nParamMap.put("originalName", resultMap.get("originalFilename").toString());
					nParamMap.put("filename", resultMap.get("serverFilename").toString());
					nParamMap.put("filesize", resultMap.get("fileSize").toString());
					nParamMap.put("filesSeq", String.valueOf(filesSeq));
					nParamMap.put("linkedSeq", paramMap.get("linkedSeq"));
					nParamMap.put("linkedTable", paramMap.get("linkedTable"));
					nParamMap.put("cbFileType", paramMap.get("cbFileType"));
					nParamMap.put("cbFileUsage", paramMap.get("cbFileUsage"));
					adminManagementMapper.insertFiles(nParamMap);
				}
				pFlag = true;
			} else {
				pFlag = false;
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			pFlag = false;
		}
		return pFlag;
	}
	
	@Transactional
	public boolean updateFiles(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit){
		log.debug("updateFiles paramMap={}", paramMap);
		boolean pFlag = false;
		
		try {
			if (FileUtils.deleteFile(paramMap.get("filename"), path)) {
				List<Map<String, Object>> rtnList = FileUtils.fileUpload(multipartRequest, paramMap, path, bakPath, fileSizeLimit);
				
				if (rtnList.size() > 0) {
					Map<String, Object> resultMap = null;
					Map<String, String> nParamMap = null;
					for(int i=0; i<rtnList.size(); i++) {
						resultMap = new HashMap<String, Object>();
						resultMap = (Map<String, Object>)rtnList.get(i);
						nParamMap = new HashMap<String, String>();
						nParamMap.put("originalName", resultMap.get("originalFilename").toString());
						nParamMap.put("filename", resultMap.get("serverFilename").toString());
						nParamMap.put("filesize", resultMap.get("fileSize").toString());
						nParamMap.put("filesSeq", paramMap.get("filesSeq"));
						nParamMap.put("linkedSeq", paramMap.get("linkedSeq"));
						nParamMap.put("linkedTable", paramMap.get("linkedTable"));
						nParamMap.put("cbFileType", paramMap.get("cbFileType"));
						nParamMap.put("cbFileUsage", paramMap.get("cbFileUsage"));
						adminManagementMapper.updateFiles(nParamMap);
					}
					pFlag = true;
				} else {
					pFlag = false;
				}
			} else {
				pFlag = false;
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			pFlag = false;
		}
		
		return pFlag;
	}
	
	public void updateFilesWithNoFile(Map<String, String> paramMap) {
		log.debug("updateFilesWithNoFile paramMap={}", paramMap);
		adminManagementMapper.updateFilesWithNoFile(paramMap);
	}
	
	public boolean deleteFiles(Map<String, String> paramMap, String path) {
		log.debug("deleteFiles paramMap={}", paramMap);
		boolean pFlag = false;
		
		try {
			if (FileUtils.deleteFile(paramMap.get("filename"), path)) {
				adminManagementMapper.deleteFiles(paramMap);
				pFlag = true;
			} else {
				pFlag = false;
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			pFlag = false;
		}
		return pFlag;
	}
}
