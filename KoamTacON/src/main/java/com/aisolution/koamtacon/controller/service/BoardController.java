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
import com.aisolution.koamtacon.service.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private InitUtil initUtil;
	
	@Autowired
	private BoardManagementService boardManagementService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value="/question", method={RequestMethod.GET, RequestMethod.POST})
	public String question(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("question paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/board/question";
	}
	
	@RequestMapping(value="/saveQuestion", method={RequestMethod.GET, RequestMethod.POST})
	public String saveQuestion(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("saveQuestion paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String to = ConfigConstants.fromAddress;
		String from = ConfigConstants.fromAddress;
		String subject = paramMap.get("questionTitle");
		String text = paramMap.get("questionContents");
		try {
			//paramMap.put("boardSeq", String.valueOf(boardManagementService.getMaxBoardSeq(paramMap)));
			paramMap.put("boardTitle", subject);
			paramMap.put("boardContents", text);
			paramMap.put("writerId", sessionInfo.getUserId());
			boardManagementService.insertBoard(paramMap);
			mailService.sendMail(from, to, subject, text +"\r\n"+" Question from "+sessionInfo.getEmail());
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV027"));
		} catch (Exception e) {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV016"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/faq", method={RequestMethod.GET, RequestMethod.POST})
	public String faq(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("faq paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/board/faq";
	}
	
	@RequestMapping(value="/getFaqList", method={RequestMethod.GET, RequestMethod.POST})
	public String getFaqList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getFaqList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = boardService.getFaqListForUser(paramMap);
		model.addAttribute("faqList", map.get("faqList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		return "jsonView";
	}
	
	@RequestMapping(value="/notice", method={RequestMethod.GET, RequestMethod.POST})
	public String notice(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("notice paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/board/notice";
	}
	
	@RequestMapping(value="/getNoticeList", method={RequestMethod.GET, RequestMethod.POST})
	public String getNoticeList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getNoticeList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = boardService.getNoticeListForUser(paramMap);
		model.addAttribute("noticeList", map.get("noticeList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		return "jsonView";
	}
	
	@RequestMapping(value="/noticeDetail", method={RequestMethod.GET, RequestMethod.POST})
	public String noticeDetail(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("noticeDetail paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("noticeDetailMap", boardService.getNoticeDetailForUser(paramMap));
		
		return "/board/noticeDetail";
	}
	
	@RequestMapping(value="/noticeList", method={RequestMethod.GET, RequestMethod.POST})
	public String noticeList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("noticeList paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/board/noticeList";
	}
	
	@RequestMapping(value="/barcode", method={RequestMethod.GET, RequestMethod.POST})
	public String barcode(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("barcode paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/board/barcode";
	}
}
