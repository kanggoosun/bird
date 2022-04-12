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

import com.aisolution.common.util.InitUtil;
import com.aisolution.koamtacon.service.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private InitUtil initUtil;
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="", method={RequestMethod.GET,RequestMethod.POST})
	public String main(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("main paramMap={}",paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/main/main";
	}
	
	@RequestMapping(value="/getApplicationList", method={RequestMethod.GET, RequestMethod.POST})
	public String getApplicationList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getApplicationList paramMap={}", paramMap);
		model.addAttribute("applicationList", mainService.getApplicationListWithFiles(paramMap));
		return "jsonView";
	}
}
