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
import com.aisolution.koamtacon.service.service.UserMainService;

@Controller
@RequestMapping("/user/main")
public class UserMainController {
	private static final Logger log = LoggerFactory.getLogger(UserMainController.class);
	
	@Autowired
	private UserMainService userMainService;
	@Autowired
	private InitUtil initUtil;
	
	@RequestMapping(value="/view", method={RequestMethod.GET, RequestMethod.POST})
	public String dashboard(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("dashboard paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("usersMap", userMainService.getNumberOfUsers());
		model.addAttribute("groupsMap", userMainService.getNumberOfGroups());
		model.addAttribute("kdcMap", userMainService.getNumberOfKDC());
		
		return "/user/userMain";
	}
	
	@RequestMapping(value="/getDayEventList", method={RequestMethod.GET, RequestMethod.POST})
	public String getDayEventList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getDayEventList controller paramMap={}", paramMap);
		
		Map<String, Object> map = userMainService.getDayEventList(paramMap);
		
		log.debug("map.get---------------------- :  "+ map.get("applicationList"));
		
		model.addAttribute("applicationList", map.get("applicationList"));
		
		return "jsonView";
	}
}
