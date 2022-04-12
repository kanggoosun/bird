package com.aisolution.koamtacon.mapper.service;

import java.util.List;
import java.util.Map;

public interface BoardManagementMapper {

	public int getBoardListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getBoardList(Map<String, Object> paramMap);
	
	public int getMaxBoardSeq(Map<String, String> paramMap);
	
	public void insertBoard(Map<String, String> paramMap);
	
	public void updateBoard(Map<String, String> paramMap);
	
	public Map<String, Object> getBoard(Map<String, String> paramMap);
	
	public void deleteBoard(Map<String, String> paramMap);
	
	public int getFaqListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getFaqList(Map<String, Object> paramMap);
	
	public int getQnaListCount(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getQnaList(Map<String, Object> paramMap);
	
	public void updateAnswerDate(Map<String, String> paramMap);
}
