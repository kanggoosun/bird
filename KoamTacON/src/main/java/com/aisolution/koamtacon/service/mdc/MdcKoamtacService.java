package com.aisolution.koamtacon.service.mdc;

import java.util.List;
import java.util.Map;

public interface MdcKoamtacService {

	public Map<String, Object> getSyncUser(Map<String, String> paramMap);
	
	public List<String> getUsedDeviceCodes();
	
	public List<String> getUsedGroupCodes();
	
	public int getUsedCodesCount(Map<String, String> paramMap);
	
	public Map<String, Object> getSyncUserByDeviceCode(Map<String, String> paramMap);
}