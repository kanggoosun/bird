package com.aisolution.koamtacon.service.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.common.util.CommonUtils;
import com.aisolution.koamtacon.mapper.service.BoardManagementMapper;

@Service
public class BoardManagementServiceImpl implements BoardManagementService {
	private static final Logger log = LoggerFactory.getLogger(BoardManagementServiceImpl.class);
	
	@Autowired
	private BoardManagementMapper boardManagementMapper;
	
	public Map<String, Object> getBoardList(Map<String, String> paramMap) {
		log.debug("getBoardList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		map.put("boardType", paramMap.get("boardType"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, boardManagementMapper.getBoardListCount(map)));
		map.put("boardList", boardManagementMapper.getBoardList(map));
		
		return map;
	}
	
//	public int getMaxBoardSeq(Map<String, String> paramMap) {
//		log.debug("getMaxBoardSeq paramMap={}", paramMap);
//		return boardManagementMapper.getMaxBoardSeq(paramMap);
//	}
	
	public void insertBoard(Map<String, String> paramMap) {
		log.debug("insertBoard paramMap={}", paramMap);
		paramMap.put("boardSeq", String.valueOf(boardManagementMapper.getMaxBoardSeq(paramMap)));
		boardManagementMapper.insertBoard(paramMap);
	}
	
	public void updateBoard(Map<String, String> paramMap){
		log.debug("updateBoard paramMap={}", paramMap);
		boardManagementMapper.updateBoard(paramMap);
	}
	
	public Map<String, Object> getBoard(Map<String, String> paramMap) {
		log.debug("getBoard paramMap={}", paramMap);
		return boardManagementMapper.getBoard(paramMap);
	}
	
	public void deleteBoard(Map<String, String> paramMap){
		log.debug("deleteBoard paramMap={}", paramMap);
		boardManagementMapper.deleteBoard(paramMap);
	}
	
	public Map<String, Object> getFaqList(Map<String, String> paramMap) {
		log.debug("getFaqList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("boardType", paramMap.get("boardType"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, boardManagementMapper.getFaqListCount(map)));
		map.put("faqList", boardManagementMapper.getFaqList(map));
		
		return map;
	}
	
	public Map<String, Object> getQnaList(Map<String, String> paramMap) {
		log.debug("getQnaList paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("boardType", paramMap.get("boardType"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, boardManagementMapper.getQnaListCount(map)));
		map.put("qnaList", boardManagementMapper.getQnaList(map));
		
		return map;
	}
	
	public void updateAnswerDate(Map<String, String> paramMap) {
		log.debug("updateAnswerDate paramMap={}", paramMap);
		boardManagementMapper.updateAnswerDate(paramMap);
	}
	
}
