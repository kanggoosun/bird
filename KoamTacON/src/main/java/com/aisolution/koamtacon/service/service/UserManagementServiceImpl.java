package com.aisolution.koamtacon.service.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartRequest;

import com.aisolution.common.model.ExcelInfo;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.ExcelUtils;
import com.aisolution.common.util.FileUtils;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.koamtacon.mapper.service.UserManagementMapper;
import com.aisolution.koamtacon.service.mdc.MdcKoamtacService;
import com.aisolution.koamtacon.service.mdc.WSApiService;

@Service
public class UserManagementServiceImpl implements UserManagementService {
	private static final Logger log = LoggerFactory.getLogger(UserManagementServiceImpl.class);
	
	@Autowired
	private GroupService groupService;
	@Autowired
	private SignService signService;
	@Autowired
	private MdcKoamtacService mdcKoamtacService;
	@Autowired
	private WSApiService wsApiService;
	
	@Autowired
	private UserManagementMapper userManagementMapper;
	
	public Map<String, Object> getOwnerList(Map<String, String> paramMap) {
		log.debug("getOwnerList paramMap={}", paramMap);
		
		Map<String, Object> map = CommonUtils.setParamsWithPaging(paramMap);
		log.debug("getOwnerList map={}", map);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, userManagementMapper.getOwnerListCount(map)));
		map.put("list", userManagementMapper.getOwnerList(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getOwnerListForExcel(Map<String, String> paramMap) {
		log.debug("getOwnerListForExcel paramMap={}", paramMap);
		return userManagementMapper.getOwnerListForExcel(paramMap);
	}
	
	public Map<String, Object> getUserInfoList(Map<String, String> paramMap) {
		log.debug("getUserInfo paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		//map.put("cbActivationYn", paramMap.get("cbActivationYn").toString());
		//map.put("cbJoinDate", paramMap.get("cbJoinDate").toString());
		//map.put("cbSearchField", paramMap.get("cbSearchField").toString());
		//map.put("sKeyword", paramMap.get("sKeyword").toString());
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		log.debug("getUserInfoList map={}", map);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, userManagementMapper.getUserInfoListCount(map)));
		map.put("userInfoList", userManagementMapper.getUserInfoList(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getUserInfoListForExcel(Map<String, String> paramMap) {
		log.debug("getUserInfoListForExcel paramMap={}", paramMap);
		return userManagementMapper.getUserInfoListForExcel(paramMap);
	}
	
	public void updateUserInfo(Map<String, String> paramMap) {
		log.debug("updateUserInfo paramMap={}", paramMap);
		userManagementMapper.updateUserInfo(paramMap);
	}
	
	public Map<String, Object> getAdminInfoList(Map<String, String> paramMap) {
		log.debug("getAdminInfoList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		//map.put("sUser", paramMap.get("sUser"));
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, userManagementMapper.getAdminInfoListCount(map)));
		map.put("adminInfoList", userManagementMapper.getAdminInfoList(map));
		
		return map;
	}
	
	public void updateAdminInfo(Map<String, String> paramMap) {
		log.debug("updateAdminInfo paramMap={}", paramMap);
		userManagementMapper.updateAdminInfo(paramMap);
	}
	
	public Map<String, Object> getGroupList(Map<String, String> paramMap) {
		log.debug("getGroupList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, userManagementMapper.getGroupListCount(map)));
		map.put("groupList", userManagementMapper.getGroupList(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getGroupListForExcel(Map<String, String> paramMap) {
		log.debug("getGroupListForExcel paramMap={}", paramMap);
		return userManagementMapper.getGroupListForExcel(paramMap);
	}
	
	public Map<String, Object> getMemberList(Map<String, String> paramMap) {
		log.debug("getMemberList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, userManagementMapper.getMemberListCount(map)));
		map.put("memberList", userManagementMapper.getMemberList(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getMemberListForExcel(Map<String, String> paramMap) {
		log.debug("getMemberListForExcel paramMap={}", paramMap);
		return userManagementMapper.getMemberListForExcel(paramMap);
	}
	
	public Map<String, Object> getUserInfo(Map<String, String> paramMap) {
		log.debug("getUserInfo paramMap={}", paramMap);
		return userManagementMapper.getUserInfo(paramMap);
	}
	
	public void updateSendYn(Map<String, String> paramMap) {
		log.debug("updateSendYn paramMap={}", paramMap);
		userManagementMapper.updateSendYn(paramMap);
	}
	
	public List<Map<String, Object>> getNotSendMemberList(Map<String, String> paramMap) {
		log.debug("getNotSendMemberList paramMap={}", paramMap);
		return userManagementMapper.getNotSendMemberList(paramMap);
	}
	
	public void activateUser(Map<String, String> paramMap) {
		log.debug("activateUser paramMap={}", paramMap);
		userManagementMapper.activateUser(paramMap);
	}
	
	public Map<String, Object> getDemoAccountsList(Map<String, String> paramMap) {
		log.debug("getDemoAccountsList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, userManagementMapper.getDemoAccountsListCount(map)));
		map.put("demoAccountsList", userManagementMapper.getDemoAccountsList(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getDemoAccountsListForExcel(Map<String, String> paramMap) {
		log.debug("getDemoAccountsListForExcel paramMap={}", paramMap);
		return userManagementMapper.getDemoAccountsListForExcel(paramMap);
	}
	
	public Map<String, Object> getDemoAccount(Map<String, String> paramMap) {
		log.debug("getDemoAccount paramMap={}", paramMap);
		return userManagementMapper.getDemoAccount(paramMap);
	}
	
	public void updateDemoAccount(Map<String, String> paramMap) {
		log.debug("updateDemoAccount paramMap={}", paramMap);
		userManagementMapper.updateDemoAccount(paramMap);
	}
	
	public Map<String, Object> getDemoAccountInfo(Map<String, String> paramMap) {
		log.debug("getDemoAccountInfo paramMap={}", paramMap);
		return userManagementMapper.getDemoAccountInfo(paramMap);
	}
	
	public void updateDemoAccountStartDate(Map<String, String> paramMap) {
		log.debug("updateDemoAccountStartDate paramMap={}", paramMap);
		userManagementMapper.updateDemoAccountStartDate(paramMap);
	}
	
	public int getNumberOfMemberWithActivationCode(Map<String, String> paramMap) {
		log.debug("getNumberOfMemberWithActivationCode paramMap={}", paramMap);
		return userManagementMapper.getNumberOfMemberWithActivationCode(paramMap);
	}
	
	public Map<String, Object> getBatchUserList(Map<String, String> paramMap) {
		log.debug("getBatchUserList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, userManagementMapper.getBatchUserListCount(map)));
		map.put("batchUserList", userManagementMapper.getBatchUserList(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getBatchUserListForExcel(Map<String, String> paramMap) {
		log.debug("getBatchUserListForExcel paramMap={}", paramMap);
		return userManagementMapper.getBatchUserListForExcel(paramMap);
	}
	
	@Transactional
	public Map<String, Object> createMobileUserBatch(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit) {
		log.debug("createMobileUserBatch paramMap={}",paramMap);
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		int iSuccess = 0;
		int iDupe = 0;
		int iFail = 0;
		String filename = "";
		try {
			List<Map<String, Object>> fileList = FileUtils.fileUpload(multipartRequest, paramMap, path, bakPath, fileSizeLimit);
			
			if (fileList.size() == 1) {
				Map<String, Object> map = null;
				map = new HashMap<String, Object>();
				map = (Map<String, Object>)fileList.get(0);
				filename = map.get("serverFilename").toString();
				ExcelInfo excelInfo = new ExcelInfo();
				excelInfo.setPath(path);
				excelInfo.setFilename(filename);
				excelInfo.setColumnNames("A", "B");
				excelInfo.setLastCellNumber(2);
				excelInfo.setStartRow(3);
				excelInfo.setTabName("MOBILE_USER_BATCH");
				
				List<Map<String, String>> batchList = ExcelUtils.read(excelInfo);
				Map<String, String> batchMap = null;
				if (batchList.size() > 0) {
					String area = paramMap.get("area");
					List<String> groupCodeList = groupService.getAvailabelGroupCodeList();
					if (groupCodeList.size() > 0) {
						for(int i=0; i<batchList.size(); i++) {
							String model = batchList.get(i).get("A").toString();
							String serialNo = batchList.get(i).get("B").toString();
							StringBuffer sb = new StringBuffer();
							//sb.append(model).append(".").append(serialNo);
							sb.append(model).append("_").append(serialNo);
							if (sb.length() > 15) {
								iFail++;
								continue;
							}
							String userId = sb.toString();
							
							if (model == null || model.equals("") || serialNo == null || serialNo.equals("")) {
								break;
							} else {
								if (i<groupCodeList.size()) {
									batchMap = new HashMap<String, String>();
									batchMap.put("groupCode", groupCodeList.get(i));
									batchMap.put("area", area);
									batchMap.put("userId", userId);
									// One owner must have only one group code. Same group code is not allowed in same area. 
									if (groupService.getGroupCount(batchMap) < 1 && groupService.getDuplicatedGroupCount(batchMap) < 1) {
										// User ID has to be unique.
										if (signService.isExist(batchMap) == 0) {
											// MDC DB에 Mobile User 및 Activation Code 생성
											Map <String, String> mdcMap = wsApiService.createMobileUserAndActivationCode(batchMap);
											if (mdcMap != null && mdcMap.size() > 0) {
												// services DB에 user 생성
												//String tmpPassword = CommonUtils.makeRandomString(8);
												batchMap.put("decPassword", CommonUtils.encryptSha512(userId));
												batchMap.put("tmpPassword", userId);
												createBatchUser(batchMap);
												// services DB에 group 생성
												groupService.createGroup(batchMap);
												// services DB에 group member 추가
												groupService.insertMember(batchMap);
												// services DB에 user 정보 중 area 항목 업데이트
												groupService.updateUserArea(batchMap);
												// services DB에 user 정보 중 Mobile user & activation code 정보 업데이트
												updateUserInfo(mdcMap);
												activateUser(batchMap);
												
												iSuccess++;
											} else {
												iFail++;
												continue;
											}
										} else {
											iDupe++;
											continue;
										}
									} else {
										iFail++;
										continue;
									}
								}
							}
						}
						StringBuffer sbResult = new StringBuffer();
						if (iSuccess > 0) {
							sbResult.append(MessageUtils.getMessage("MSG-SV084") + " ").append(String.valueOf(iSuccess));
						}
						if (iDupe > 0) {
							if (sbResult.length() > 0) {
								sbResult.append("<br>");
							}
							sbResult.append(MessageUtils.getMessage("MSG-SV085") + " ").append(String.valueOf(iDupe));
						}
						if (iFail > 0) {
							if (sbResult.length() > 0) {
								sbResult.append("<br>");
							}
							sbResult.append(MessageUtils.getMessage("MSG-SV086") + " " ).append(String.valueOf(iFail));
						}
						rtnMap.put("flag", "1");
						rtnMap.put("msg", sbResult.toString());
					} else {
						rtnMap.put("flag", "0");
						rtnMap.put("msg", MessageUtils.getMessage("MSG-SV087"));
					}
				} else {
					rtnMap.put("flag", "0");
					rtnMap.put("msg", MessageUtils.getMessage("MSG-SV088"));
				}
			} else {
				rtnMap.put("flag", "-1");
				rtnMap.put("msg", MessageUtils.getMessage("MSG-SV089"));
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			if (FileUtils.isExist(filename, path)) {
				FileUtils.deleteFile(filename, path);
			}
			rtnMap.put("flag", "-9");
			rtnMap.put("msg", MessageUtils.getMessage("MSG-SV042"));
		}
		
		return rtnMap;
	}
	
	public void createBatchUser(Map<String, String> paramMap) {
		log.debug("createBatchUser paramMap={}",paramMap);
		userManagementMapper.createBatchUser(paramMap);
	}
	
	@Transactional
	public Map<String, Object> createMobileUserBatchWithGroupCode(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit) {
		log.debug("createMobileUserBatchWithGroupCode paramMap={}",paramMap);
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		int iSuccess = 0;
		int iDupe = 0;
		int iFail = 0;
		String filename = "";
		try {
			List<Map<String, Object>> fileList = FileUtils.fileUpload(multipartRequest, paramMap, path, bakPath, fileSizeLimit);
			
			if (fileList.size() == 1) {
				Map<String, Object> map = null;
				map = new HashMap<String, Object>();
				map = (Map<String, Object>)fileList.get(0);
				filename = map.get("serverFilename").toString();
				ExcelInfo excelInfo = new ExcelInfo();
				excelInfo.setPath(path);
				excelInfo.setFilename(filename);
				excelInfo.setColumnNames("A", "B", "C", "D");
				excelInfo.setLastCellNumber(4);
				excelInfo.setStartRow(3);
				excelInfo.setTabName("MOBILE_USER_BATCH");
				
				List<Map<String, String>> batchList = ExcelUtils.read(excelInfo);
				Map<String, String> batchMap = null;
				if (batchList.size() > 0) {
					String area = paramMap.get("area");
					for(int i=0; i<batchList.size(); i++) {
						String model = batchList.get(i).get("A").toString();
						String serialNo = batchList.get(i).get("B").toString();
						String groupCode = batchList.get(i).get("C").toString();
						String userType = batchList.get(i).get("D").toString();
						
						if (model == null || model.equals("")
							|| serialNo == null || serialNo.equals("")
							|| groupCode == null || groupCode.equals("")
							|| userType == null || userType.equals("")
							) {
							iFail++;
							continue;
							
						}
						
						StringBuffer sb = new StringBuffer();
						//sb.append(model).append(".").append(serialNo);
						sb.append(model).append("_").append(serialNo);
						if (sb.length() > 15) {
							iFail++;
							continue;
						}
						String userId = sb.toString();
						
						batchMap = new HashMap<String, String>();
						batchMap.put("groupCode", groupCode);
						batchMap.put("area", area);
						batchMap.put("userId", userId);
						batchMap.put("userType", userType);
						
						int result = -1;
						if (userType.equals("0")) {
							result = createMobileUserAsOwner(batchMap);
						} else if (userType.equals("1")) {
							result = createMobileUserAsMember(batchMap);
						} else {
							result = -1;
						}
						
						if (result == 1) {
							iSuccess++;
						} else if (result == -1) {
							iFail++;
						} else if (result == -2) {
							iDupe++;
						} else {
							iFail++;
						}
					}
					StringBuffer sbResult = new StringBuffer();
					if (iSuccess > 0) {
						sbResult.append(MessageUtils.getMessage("MSG-SV084") + " ").append(String.valueOf(iSuccess));
					}
					if (iDupe > 0) {
						if (sbResult.length() > 0) {
							sbResult.append("<br>");
						}
						sbResult.append(MessageUtils.getMessage("MSG-SV085") + " ").append(String.valueOf(iDupe));
					}
					if (iFail > 0) {
						if (sbResult.length() > 0) {
							sbResult.append("<br>");
						}
						sbResult.append(MessageUtils.getMessage("MSG-SV086") + " " ).append(String.valueOf(iFail));
					}
					rtnMap.put("flag", "1");
					rtnMap.put("msg", sbResult.toString());
				} else {
					rtnMap.put("flag", "0");
					rtnMap.put("msg", MessageUtils.getMessage("MSG-SV088"));
				}
			} else {
				rtnMap.put("flag", "-1");
				rtnMap.put("msg", MessageUtils.getMessage("MSG-SV089"));
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			if (FileUtils.isExist(filename, path)) {
				FileUtils.deleteFile(filename, path);
			}
			rtnMap.put("flag", "-9");
			rtnMap.put("msg", MessageUtils.getMessage("MSG-SV042"));
		}
		
		return rtnMap;
	}
	
	private int createMobileUserAsOwner(Map<String, String> paramMap) {
		log.debug("createMobileUserAsOwner paramMap={}",paramMap);
		int rtnFlag = -1;
		
		try {
			// One owner must have only one group code. Same group code is not allowed in same area. 
			if (groupService.getGroupCount(paramMap) < 1 && groupService.getDuplicatedGroupCount(paramMap) < 1 && mdcKoamtacService.getUsedCodesCount(paramMap) < 1) {
				// User ID has to be unique.
				if (signService.isExist(paramMap) == 0) {
					// MDC DB에 Mobile User 및 Activation Code 생성
					Map <String, String> mdcMap = wsApiService.createMobileUserAndActivationCode(paramMap);
					if (mdcMap != null && mdcMap.size() > 0) {
						// services DB에 user 생성
						//String tmpPassword = CommonUtils.makeRandomString(8);
						paramMap.put("decPassword", CommonUtils.encryptSha512(paramMap.get("userId").toString()));
						paramMap.put("tmpPassword", paramMap.get("userId"));
						createBatchUser(paramMap);
						// services DB에 group 생성
						groupService.createGroup(paramMap);
						// services DB에 group member 추가
						groupService.insertMember(paramMap);
						// services DB에 user 정보 중 area 항목 업데이트
						groupService.updateUserArea(paramMap);
						// services DB에 user 정보 중 Mobile user & activation code 정보 업데이트
						updateUserInfo(mdcMap);
						activateUser(paramMap);
						
						rtnFlag = 1;
					} else {
						rtnFlag = -1;
					}
				} else {
					rtnFlag = -2;
				}
			} else {
				rtnFlag = -1;
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			rtnFlag = -9;
		}
		
		return rtnFlag;
	}
	
	private int createMobileUserAsMember(Map<String, String> paramMap) {
		log.debug("createMobileUserAsMember paramMap={}",paramMap);
		int rtnFlag = -1;
		
		//String ownerId = userManagementMapper.getOwnerId(paramMap);
		try {
			if (signService.isExist(paramMap) == 0 && groupService.getDuplicatedGroupCount(paramMap) == 1 && mdcKoamtacService.getUsedCodesCount(paramMap) > 0) {
				// MDC DB에 Mobile User 및 Activation Code 생성
				Map <String, String> mdcMap = wsApiService.createMobileUserAndActivationCode(paramMap);
				if (mdcMap != null && mdcMap.size() > 0) {
					// services DB에 user 생성
					//String tmpPassword = CommonUtils.makeRandomString(8);
					paramMap.put("decPassword", CommonUtils.encryptSha512(paramMap.get("userId").toString()));
					paramMap.put("tmpPassword", paramMap.get("userId"));
					createBatchUser(paramMap);
					// services DB에 group member 추가
					groupService.insertMember(paramMap);
					// services DB에 user 정보 중 area 항목 업데이트
					groupService.updateUserArea(paramMap);
					// services DB에 user 정보 중 Mobile user & activation code 정보 업데이트
					updateUserInfo(mdcMap);
					activateUser(paramMap);
					
					rtnFlag = 1;
				} else {
					rtnFlag = -1;
				}
			} else {
				rtnFlag = -2;
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			rtnFlag = -9;
		}
		
		return rtnFlag;
	}
	
	public String getOwnerId(Map<String, String> paramMap) {
		log.debug("getOwnerId paramMap={}",paramMap);
		return userManagementMapper.getOwnerId(paramMap);
	}
	
	public void deleteGroup(Map<String, String> paramMap) {
		log.debug("deleteGroup paramMap={}",paramMap);
		userManagementMapper.deleteGroup(paramMap);
	}
	
	public void updateGroupCodeByMember(Map<String, String> paramMap) {
		log.debug("updateGroupCodeByMember paramMap={}",paramMap);
		userManagementMapper.updateGroupCodeByMember(paramMap);
	}
	
	public void updateUserTypeAsMember(Map<String, String> paramMap) {
		log.debug("updateUserTypeAsMember paramMap={}",paramMap);
		userManagementMapper.updateUserTypeAsMember(paramMap);
	}
}
