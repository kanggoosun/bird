package com.aisolution.common.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.aisolution.common.model.SessionInfo;
import com.aisolution.koamtacon.service.service.SystemManagementService;

@Component
public class InitUtil {
	private static final Logger log = LoggerFactory.getLogger(InitUtil.class);
	
	@Autowired
	private SystemManagementService systemManagementService;
	
	public Model initMenu(Map<String, String> paramMap, Model model) {
		log.debug("initMenu paramMap={}, model={}", paramMap, model);
		
		List<Map<String, Object>> orgList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> menuList = new ArrayList<Map<String, Object>>();
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String userId = sessionInfo.getUserId();
		String roleSeq = sessionInfo.getRoleSeq();
		String userType = sessionInfo.getUserType();
		String groupCode = sessionInfo.getGroupCode();
		if (userId.equals("KoamtacON")) {
			paramMap.put("division", "1");
			orgList = systemManagementService.getMenuListByDivision(paramMap);
			menuList = systemManagementService.makeTreeWithMenu(orgList);
			model.addAttribute("mainMenuHtml", CommonUtils.getMenuHtml(menuList, userType, groupCode));
			model.addAttribute("msg", CommonUtils.setRedirectMsg(paramMap));
		} else {
			if (sessionInfo.getUserType().equals("9")) {
				paramMap.put("division", "1");
				paramMap.put("roleSeq", roleSeq);
				orgList = systemManagementService.getRoleMenuList(paramMap);
			} else {
				paramMap.put("division", "0");
				orgList = systemManagementService.getMenuListByDivision(paramMap);
			}
			menuList = systemManagementService.makeTreeWithMenu(orgList);
			
			model.addAttribute("mainMenuHtml", CommonUtils.getMenuHtml(menuList, userType, groupCode));
			model.addAttribute("msg", CommonUtils.setRedirectMsg(paramMap));
		}
		return model;
	}
}
