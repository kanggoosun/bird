package com.aisolution.koamtacon.service.mdc;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.koamtacon.mapper.mdc.MdcKoamtacMapper;

@Service
public class MdcKoamtacServiceImpl implements MdcKoamtacService {
	private static final Logger log = LoggerFactory.getLogger(MdcKoamtacServiceImpl.class);

	@Autowired
	private MdcKoamtacMapper mdcKoamtacMapper;
	
	public Map<String, Object> getSyncUser(Map<String, String> paramMap) {
		log.debug("getSyncUser paramMap={}",paramMap);
		return mdcKoamtacMapper.getSyncUser(paramMap);
	}
	
	public List<String> getUsedDeviceCodes() {
		log.debug("getUsedDeviceCodes");
		return mdcKoamtacMapper.getUsedDeviceCodes();
	}
	
	public List<String> getUsedGroupCodes() {
		log.debug("getUsedGroupCodes");
		return mdcKoamtacMapper.getUsedGroupCodes();
	}
	
	public int getUsedCodesCount(Map<String, String> paramMap) {
		log.debug("getUsedCodesCount paramMap={}",paramMap);
		return mdcKoamtacMapper.getUsedCodesCount(paramMap);
	}
	
	public Map<String, Object> getSyncUserByDeviceCode(Map<String, String> paramMap) {
		log.debug("getSyncUserByDeviceCode paramMap={}",paramMap);
		return mdcKoamtacMapper.getSyncUserByDeviceCode(paramMap);
	}
}