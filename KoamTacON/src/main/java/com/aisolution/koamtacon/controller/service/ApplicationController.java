package com.aisolution.koamtacon.controller.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aisolution.common.model.SessionInfo;
import com.aisolution.common.util.InitUtil;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.service.mdc.AppsService;
import com.aisolution.koamtacon.service.service.ApplicationService;

@Controller
@RequestMapping(value="/applications")
public class ApplicationController {
	private final static Logger log = LoggerFactory.getLogger(ApplicationController.class);
	
	@Value("#{koamtacon_config['mdc.url']}")
	private String mdcUrl;
	@Value("#{koamtacon_config['mdc.area']}")
	private String mdcArea;
	@Value("#{koamtacon_config['mdc.image.resource.detail']}")
	private String detailImage;
	@Value("#{koamtacon_config['mdc.image.uploaded']}")
	private String uploadImage;
	
	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private InitUtil initUtil;
	
	@Autowired
	AppsService appsService;
	
	@RequestMapping(value="/introduction", method={RequestMethod.GET, RequestMethod.POST})
	public String introduction(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("introduction paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		model.addAttribute("applicationSeq", paramMap.get("applicationSeq"));
		
		return "/applications/introduction";
	}
	
	@RequestMapping(value="/application", method={RequestMethod.GET, RequestMethod.POST})
	public String application(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("application paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("userId", sessionInfo.getUserId());
		if (paramMap.get("applicationSeq") == null || paramMap.get("applicationSeq").equals("")) {
			paramMap.put("applicationSeq", "0");
		}
		Map<String, Object> applicationMap = applicationService.getApplicationInfo(paramMap);
		StringBuffer sbUrl = new StringBuffer();
		sbUrl.append("forward:").append("/applications").append(applicationMap.get("applicationUrl").toString());
		log.debug("sbUrl={}", sbUrl.toString());
		
		model.addAttribute("detailImage", mdcUrl+mdcArea+detailImage+"/");
		model.addAttribute("uploadImage", mdcUrl+mdcArea+uploadImage+"/");
		
		return sbUrl.toString();
	}
	
	@RequestMapping(value="/getApplicationMap", method={RequestMethod.GET, RequestMethod.POST})
	public String getApplicationMap(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("inventory paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("userId", sessionInfo.getUserId());
		
		Map<String, Object> applicationMap = applicationService.getApplicationInfo(paramMap);
		model.addAttribute("applicationMap", applicationMap);
		paramMap.put("linkedSeq", applicationMap.get("applicationSeq").toString());
		paramMap.put("linkedTable", "tb_applications");
		paramMap.put("fileType", "00");
		paramMap.put("fileUsage", "003");
		List<Map<String, Object>> screenShots = applicationService.getFileList(paramMap);
		model.addAttribute("screenShots", screenShots);
		paramMap.put("fileType", "01");
		paramMap.put("fileUsage", "002");
		List<Map<String, Object>> manual = applicationService.getFileList(paramMap);
		model.addAttribute("manual", manual);
		model.addAttribute("applicationSeq", applicationMap.get("applicationSeq").toString());
		
		return "jsonView";
	}
	
	@RequestMapping(value="/requestForApproval", method={RequestMethod.GET, RequestMethod.POST})
	public String requestForApproval(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("requestForApproval paramMap={}", paramMap);
		
		try {
			SessionInfo sessionInfo = SessionUtil.getSessionInfo();
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("requestType", "0");
			paramMap.put("requestKind", "0");
			paramMap.put("requestTarget", paramMap.get("applicationSeq"));
			paramMap.put("approvalFlag", "0");
			applicationService.insertApplicationRequest(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV035"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV013"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/inventory", method={RequestMethod.GET, RequestMethod.POST})
	public String inventory(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("inventory paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("detailImage", mdcUrl+mdcArea+detailImage+"/");
		model.addAttribute("uploadImage", mdcUrl+mdcArea+uploadImage+"/");
		
		return "/applications/inventory";
	}
	
	@RequestMapping(value="/purchase", method={RequestMethod.GET, RequestMethod.POST})
	public String purchase(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("purchase paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("detailImage", mdcUrl+mdcArea+detailImage+"/");
		model.addAttribute("uploadImage", mdcUrl+mdcArea+uploadImage+"/");
		
		return "/applications/purchase";
	}
	
	@RequestMapping(value="/retail", method={RequestMethod.GET, RequestMethod.POST})
	public String retail(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("retail paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("detailImage", mdcUrl+mdcArea+detailImage+"/");
		model.addAttribute("uploadImage", mdcUrl+mdcArea+uploadImage+"/");
		
		return "/applications/retail";
	}
	
	@RequestMapping(value="/delivery", method={RequestMethod.GET, RequestMethod.POST})
	public String delivery(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("delivery paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		return "/applications/delivery";
	}
	
	@RequestMapping(value="/rental", method={RequestMethod.GET, RequestMethod.POST})
	public String rental(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("rental paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("detailImage", mdcUrl+mdcArea+detailImage+"/");
		model.addAttribute("uploadImage", mdcUrl+mdcArea+uploadImage+"/");
		
		return "/applications/rental";
	}
	
	@RequestMapping(value="/fieldService", method={RequestMethod.GET, RequestMethod.POST})
	public String fieldService(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("fieldService paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		return "/applications/fieldService";
	}
	
	@RequestMapping(value="/ticketValidation", method={RequestMethod.GET, RequestMethod.POST})
	public String ticketValidation(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("ticketValidation paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("detailImage", mdcUrl+mdcArea+detailImage+"/");
		model.addAttribute("uploadImage", mdcUrl+mdcArea+uploadImage+"/");
		
		return "/applications/ticketValidation";
	}
	
	@RequestMapping(value="/tracking", method={RequestMethod.GET, RequestMethod.POST})
	public String tracking(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("tracking paramMap={}", paramMap);
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("detailImage", mdcUrl+mdcArea+detailImage+"/");
		model.addAttribute("uploadImage", mdcUrl+mdcArea+uploadImage+"/");
		
		return "/applications/tracking";
	}
}