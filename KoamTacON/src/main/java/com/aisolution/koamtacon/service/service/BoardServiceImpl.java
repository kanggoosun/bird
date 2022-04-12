package com.aisolution.koamtacon.service.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.common.util.CommonUtils;
import com.aisolution.koamtacon.mapper.service.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardMapper boardMapper;
	
	public Map<String, Object> getNoticeListForUser(Map<String, String> paramMap) {
		log.debug("getNoticeListForUser paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, boardMapper.getNoticeListForUserCount(map)));
		map.put("noticeList", boardMapper.getNoticeListForUser(map));
		log.debug("map={}",map);
		
		return map;
	}
	
	public Map<String, Object> getNoticeDetailForUser(Map<String, String> paramMap) {
		log.debug("getNoticeDetailForUser paramMap={}", paramMap);
		return boardMapper.getNoticeDetailForUser(paramMap);
	}
	
	public Map<String, Object> getFaqListForUser(Map<String, String> paramMap) {
		log.debug("getFaqListForUser paramMap={}", paramMap);
		
		//String searchParam = paramMap.get("searchParam");
		//String boardType = paramMap.get("boardType");
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("searchParam", searchParam);
		//map.put("boardType", boardType);
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, boardMapper.getFaqListForUserCount(map)));
		map.put("faqList", boardMapper.getFaqListForUser(map));
		log.debug("map={}",map);
		
		return map;
	}
}
