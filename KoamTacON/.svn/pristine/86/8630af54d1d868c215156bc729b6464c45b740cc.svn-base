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
import com.aisolution.koamtacon.mapper.service.KDCMapper;

@Service
public class KDCServiceImpl implements KDCService {
	private static final Logger log = LoggerFactory.getLogger(KDCServiceImpl.class);
	
	@Autowired
	private KDCMapper kdcMapper;
	
	public Map<String, Object> getKDCRegistrationList(Map<String, String> paramMap) {
		log.debug("getKDCRegistrationList paramMap={}", paramMap);
		
		//String userId = paramMap.get("userId");
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("userId", userId);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, kdcMapper.getKDCRegistrationListCount(map)));
		map.put("kdcList", kdcMapper.getKDCRegistrationList(map));
		log.debug("map={}",map);
		
		return map;
	}

	public boolean registKDC(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit) {
		log.debug("registKDC paramMap={}", paramMap);
		boolean pFlag = false;
		
		try {
			List<Map<String, Object>> fileList = FileUtils.fileUpload(multipartRequest, paramMap, path, bakPath, fileSizeLimit);
			
			if (fileList.size() == 1) {
				Map<String, Object> map = (Map<String, Object>)fileList.get(0);
				paramMap.put("productPhoto", map.get("originalFilename").toString());
				paramMap.put("filename", map.get("serverFilename").toString());
				paramMap.put("filesize", map.get("fileSize").toString());
			}
			try {
				kdcMapper.insertKDCRegistration(paramMap);
				pFlag = true;
			} catch(Exception e) {
				log.error(e.getMessage());
				pFlag = false;
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			pFlag = false;
		}
		
		return pFlag;
	}
	
	public Map<String, Object> getKDCPhoto(Map<String, String> paramMap) {
		log.debug("getKDCPhoto paramMap={}", paramMap);
		return kdcMapper.getKDCPhoto(paramMap);
	}
	
	public int checkSerialNoDuplcation(Map<String, String> paramMap) {
		log.debug("checkSerialNoDuplcation paramMap={}", paramMap);
		return kdcMapper.checkSerialNoDuplcation(paramMap);
	}
	
	@Transactional
	public Map<String, Object> registKDCWithExcel(Map<String, String> paramMap, MultipartRequest multipartRequest, String path, String bakPath, long fileSizeLimit) {
		log.debug("registKDCWithExcel paramMap={}",paramMap);
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		int numOfSavedRows = 0;
		int iSuccess = 0;
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
				excelInfo.setTabName("KDC");
				
				List<Map<String, String>> kdcList = ExcelUtils.read(excelInfo);
				StringBuffer sbDupeResult = new StringBuffer();
				Map<String, String> kdcMap = null;
				int iDupe = 0;
				if (kdcList.size() > 0) {
					for(int i=0; i<kdcList.size(); i++) {
						String serialNo = kdcList.get(i).get("A").toString();
						String productName = kdcList.get(i).get("B").toString();
						String rowNum = kdcList.get(i).get("rowNum");
						if (serialNo == null || serialNo.equals("")) {
							break;
						} else {
							kdcMap = new HashMap<String, String>();
							kdcMap.put("userId", paramMap.get("userId"));
							kdcMap.put("serialNo", serialNo);
							kdcMap.put("cbProductName", productName);
							kdcMap.put("rowNum", rowNum);
							if (kdcMapper.checkSerialNoDuplcation(kdcMap) > 0) {
								if (iDupe == 0) {
									sbDupeResult.append("Row [").append(rowNum).append("]");
								} else {
									sbDupeResult.append(", [").append(rowNum).append("]");
								}
								iDupe++;
							} else {
								kdcMapper.insertKDCRegistration(kdcMap);
								iSuccess++;
							}
							numOfSavedRows++;
						}
					}
					StringBuffer sbResult = new StringBuffer();
					if (iSuccess > 0) {
						sbResult.append(MessageUtils.getMessage("MSG-SV099")).append(String.valueOf(iSuccess));
						if (iDupe > 0) {
							sbResult.append("<br>" + MessageUtils.getMessage("MSG-SV100")).append(sbDupeResult.toString());
						}
					} else {
						if (iDupe > 0) {
							sbResult.append(MessageUtils.getMessage("MSG-SV100")).append(sbDupeResult.toString());
						}
					}
					rtnMap.put("flag", "1");
					rtnMap.put("msg", sbResult.toString());
				} else {
					rtnMap.put("flag", "0");
					rtnMap.put("msg", MessageUtils.getMessage("MSG-SV088"));
				}
				FileUtils.deleteFile(filename, path);
			} else {
				rtnMap.put("flag", "-1");
				rtnMap.put("msg", MessageUtils.getMessage("MSG-SV89"));
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			if (FileUtils.isExist(filename, path)) {
				FileUtils.deleteFile(filename, path);
			}
			rtnMap.put("flag", "-9");
			rtnMap.put("msg", MessageUtils.getMessage("MSG-SV042"));
		}
		
		rtnMap.put("numOfSavedRows", String.valueOf(numOfSavedRows));
		rtnMap.put("iSuccess", String.valueOf(iSuccess));
		
		return rtnMap;
	}
	
	public int getApprovalCount(Map<String, String> paramMap) {
		log.debug("getApprovalCount paramMap={}", paramMap);
		return kdcMapper.getApprovalCount(paramMap);
	}
}
