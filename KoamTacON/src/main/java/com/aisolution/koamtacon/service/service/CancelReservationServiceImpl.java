package com.aisolution.koamtacon.service.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.common.util.CommonUtils;
import com.aisolution.koamtacon.mapper.service.CancelReservationMapper;

@Service
public class CancelReservationServiceImpl implements CancelReservationService {
	private static final Logger log = LoggerFactory.getLogger(CancelReservationServiceImpl.class);
	
	@Autowired
	private CancelReservationMapper cancelReservationMapper;
	
	public Map<String, Object> getKDCRegistrationApprovalList(Map<String, String> paramMap) {
		log.debug("getKDCRegistrationApprovalList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, cancelReservationMapper.getKDCRegistrationApprovalListCount(map)));
		map.put("kdcApprovalList", cancelReservationMapper.getKDCRegistrationApprovalList(map));
		
		return map;
	}

	public void kdcApproval(Map<String, String> paramMap) {
		log.debug("kdcApproval paramMap={}", paramMap);
		cancelReservationMapper.kdcApproval(paramMap);
	}
	
	public Map<String, Object> getApplicationApprovalList(Map<String, String> paramMap) {
		log.debug("getApplicationApprovalList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, cancelReservationMapper.getApplicationApprovalListCount(map)));
		map.put("applicationApprovalList", cancelReservationMapper.getApplicationApprovalList(map));
		
		return map;
	}
	
	public void saveApplicationApproval(Map<String, String> paramMap) {
		log.debug("saveApplicationApproval paramMap={}", paramMap);
		cancelReservationMapper.saveApplicationApproval(paramMap);
	}
	
	public void insertApplicationGroup(Map<String, String> paramMap) {
		log.debug("insertApplicationGroup paramMap={}", paramMap);
		cancelReservationMapper.insertApplicationGroup(paramMap);
	}
	
	public int getApplicationGroupCount(Map<String, String> paramMap) {
		log.debug("getApplicationGroupCount paramMap={}", paramMap);
		return cancelReservationMapper.getApplicationGroupCount(paramMap);
	}
	
	public void updateApplicationGroup(Map<String, String> paramMap) {
		log.debug("updateApplicationGroup paramMap={}", paramMap);
		cancelReservationMapper.updateApplicationGroup(paramMap);
	}
}
