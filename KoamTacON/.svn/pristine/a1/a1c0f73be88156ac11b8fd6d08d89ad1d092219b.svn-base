package com.aisolution.koamtacon.service.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.koamtacon.mapper.service.MainMapper;

@Service
public class MainServiceImpl implements MainService {
	private static final Logger log = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Autowired
	private MainMapper mainMapper;
	
	public List<Map<String, Object>> getApplicationListWithFiles(Map<String, String> paramMap) {
		log.debug("getApplicationListWithFiles paramMap={}", paramMap);
		return mainMapper.getApplicationListWithFiles(paramMap);
	}

}
