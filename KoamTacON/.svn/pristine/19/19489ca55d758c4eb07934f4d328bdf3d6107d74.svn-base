package com.aisolution.common.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.common.mapper.CommonMapper;
import com.aisolution.common.util.CommonUtils;

@Service
public class CommonServiceImpl implements CommonService {
	private static final Logger log = LoggerFactory.getLogger(CommonServiceImpl.class);
	
	@Autowired
	private CommonMapper commonMapper;
	
	private static String makeSelectBoxOptionString(String selectedValue, List<Map<String, Object>> dataList) {
		log.debug("makeSelectBoxOptionString");
		
		if (dataList == null || dataList.size() == 0) {
			log.debug("The dataList is null or Size of the dataList is zero.");
			return null;
		}
		
		if (selectedValue == null) {
			log.debug("The selectedValue is null.");
			selectedValue = "";
		}
		
		StringBuffer sbOptionString = new StringBuffer();
		String strCode = "";
		String strValue = "";
		String strSelected = "";
		
		for(int i=0; i<dataList.size(); i++) {
			Map<String, Object> dataMap = dataList.get(i);
			strCode = dataMap.get("code") != null ? dataMap.get("code").toString() : "";
			strValue = dataMap.get("value") != null ? dataMap.get("value").toString() : "";
			
			if (strCode.equals(selectedValue)) {
				strSelected = "selected";
			} else {
				strSelected = "";
			}
			
			sbOptionString.append("<option value=\"").append(strCode).append("\" ").append(strSelected).append(">").append(strValue).append("</option>");
		}
		
		return sbOptionString.toString();
	}
	
	public String getComboCountry(String defaultValue) {
		log.debug("getComboCode defaultValue={}", defaultValue);
		return makeSelectBoxOptionString(defaultValue, commonMapper.getListCountryCode());
	}
	
	public String getComboCode(Map<String, String> paramMap) {
		log.debug("getComboCode paramMap={}", paramMap);
		return makeSelectBoxOptionString(paramMap.get("selectedValue"), commonMapper.getComboCode(paramMap));
	}
	
	public List<Map<String, Object>> checkIp(Map<String, String> paramMap) {
		log.debug("checkIp paramMap={}", paramMap);
		return commonMapper.checkIp(paramMap);
	}
	
	public String getOptionString(String defaultValue, List<Map<String, Object>> dataList) {
		log.debug("getOptionString");
		return makeSelectBoxOptionString(defaultValue, dataList);
	}
	
	public String getVersionString() {
		StringBuffer sb = new StringBuffer();
		
		sb.append("version=").append(CommonUtils.getToday());
		
		return sb.toString();
	}
}
