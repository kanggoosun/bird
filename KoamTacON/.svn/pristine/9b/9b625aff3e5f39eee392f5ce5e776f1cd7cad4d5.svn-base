package com.aisolution.koamtacon.service.mdc;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.koamtacon.mapper.mdc.TabgenMapper;

@Service
public class TabgenServiceImpl implements TabgenService {
	private static final Logger log = LoggerFactory.getLogger(TabgenServiceImpl.class);
	
	@Autowired
	private TabgenMapper tabgenMapper;
	
	public List<Map<String, Object>> getTabgenRecordsByReckey(Map<String, String> paramMap) {
		log.debug("getTabgenRecordsByReckey paramMap={}", paramMap);
		return tabgenMapper.getTabgenRecordsByReckey(paramMap);
	}
	
	public List<Map<String, Object>> getTabgenRecordsWithHeaderByReckey(Map<String, String> paramMap) {
		log.debug("getTabgenRecordsWithHeaderByReckey paramMap={}", paramMap);
		return tabgenMapper.getTabgenRecordsWithHeaderByReckey(paramMap);
	}
}
