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
import com.aisolution.koamtacon.service.service.DashboardService;

@Controller
@RequestMapping("/admin/dashboard")
public class DashboardController {
	private static final Logger log = LoggerFactory.getLogger(DashboardController.class);
	
	@Autowired
	private DashboardService dashboardService;
	@Autowired
	private InitUtil initUtil;
	
	@RequestMapping(value="/view", method={RequestMethod.GET, RequestMethod.POST})
	public String dashboard(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("dashboard paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("usersMap", dashboardService.getNumberOfUsers());
		model.addAttribute("groupsMap", dashboardService.getNumberOfGroups());
		model.addAttribute("kdcMap", dashboardService.getNumberOfKDC());
		
		return "/admin/dashboard";
	}
}
