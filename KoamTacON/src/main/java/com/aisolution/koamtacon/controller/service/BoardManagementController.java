package com.aisolution.koamtacon.controller.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.model.SessionInfo;
import com.aisolution.common.service.MailService;
import com.aisolution.common.util.InitUtil;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.service.service.BoardManagementService;

@Controller
@RequestMapping("/admin/boardManagement")
public class BoardManagementController {
	private static final Logger log = LoggerFactory.getLogger(BoardManagementController.class);
	
	@Autowired
	private BoardManagementService boardManagementService;
	@Autowired
	private InitUtil initUtil;
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value="/notice", method={RequestMethod.GET, RequestMethod.POST})
	public String notice(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("notice paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/noticeManagement";
	}
	
	@RequestMapping(value="/getBoardList", method={RequestMethod.GET, RequestMethod.POST})
	public String getBoardList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getBoardList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = boardManagementService.getBoardList(paramMap);
		model.addAttribute("boardList", map.get("boardList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/insertBoard", method={RequestMethod.GET, RequestMethod.POST})
	public String insertBoard(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertBoard paramMap={}", paramMap);
		try {
			SessionInfo sessionInfo = SessionUtil.getSessionInfo();
			paramMap.put("writerId", sessionInfo.getUserId());
			//int boardSeq = boardManagementService.getMaxBoardSeq(paramMap);
			//paramMap.put("boardSeq", String.valueOf(boardSeq));
			if (paramMap.get("parentSeq") != null && paramMap.get("parentSeq").toString().equals("")) {
				paramMap.remove("parentSeq");
			}
			boardManagementService.insertBoard(paramMap);
			model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV037"));
			model.addAttribute("flag", "success");
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
			model.addAttribute("flag", "fail");
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/updateBoard", method={RequestMethod.GET, RequestMethod.POST})
	public String updateBoard(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateBoard paramMap={}", paramMap);
		try {
			SessionInfo sessionInfo = SessionUtil.getSessionInfo();
			paramMap.put("writerId", sessionInfo.getUserId());
			boardManagementService.updateBoard(paramMap);
			model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV037"));
			model.addAttribute("flag", "success");
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
			model.addAttribute("flag", "fail");
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getBoard", method={RequestMethod.GET, RequestMethod.POST})
	public String getBoard(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getBoard paramMap={}", paramMap);
		model.addAttribute("boardMap", boardManagementService.getBoard(paramMap));
		return "jsonView";
	}
	
	@RequestMapping(value="/deleteBoard", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteBoard(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("deleteBoard paramMap={}", paramMap);
		try {
			boardManagementService.deleteBoard(paramMap);
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV039"));
			model.addAttribute("flag", "success");
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV011"));
			model.addAttribute("flag", "fail");
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/faq", method={RequestMethod.GET, RequestMethod.POST})
	public String faq(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("faq paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/faqManagement";
	}
	
	@RequestMapping(value="/getFaqList", method={RequestMethod.GET, RequestMethod.POST})
	public String getFaqList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getFaqList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.FIVE_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = boardManagementService.getFaqList(paramMap);
		model.addAttribute("faqList", map.get("faqList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/qna", method={RequestMethod.GET, RequestMethod.POST})
	public String qna(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("qna paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/qnaManagement";
	}
	
	@RequestMapping(value="/getQnaList", method={RequestMethod.GET, RequestMethod.POST})
	public String getQnaList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getQnaList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = boardManagementService.getQnaList(paramMap);
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/saveAnswer", method={RequestMethod.GET, RequestMethod.POST})
	public String saveAnswer(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("saveAnswer paramMap={}", paramMap);
		
		paramMap.put("boardSeq", paramMap.get("parentSeq"));
		Map<String, Object> qMap = boardManagementService.getBoard(paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String to = qMap.get("writerMail").toString();
		String from = ConfigConstants.fromAddress;
		String subject = paramMap.get("answerTitle");
		StringBuffer sb = new StringBuffer();
		sb.append(paramMap.get("answerTitle")).append("\n\n");
		sb.append("[Your Question]\n").append(qMap.get("boardContents"));
		String text = sb.toString();
		try {
			//paramMap.put("boardSeq", String.valueOf(boardManagementService.getMaxBoardSeq(paramMap)));
			paramMap.put("boardTitle", subject);
			paramMap.put("boardContents", text);
			paramMap.put("writerId", sessionInfo.getUserId());
			boardManagementService.insertBoard(paramMap);
			mailService.sendMail(from, to, subject, text);
			boardManagementService.updateAnswerDate(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV027"));
		} catch (Exception e) {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV016"));
		}
		
		return "jsonView";
	}
}
