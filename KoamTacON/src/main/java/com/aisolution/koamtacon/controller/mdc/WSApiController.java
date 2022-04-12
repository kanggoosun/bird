package com.aisolution.koamtacon.controller.mdc;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import com.aisolution.common.model.SessionInfo;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.service.mdc.WSApiService;

@Controller
@RequestMapping("/WSApi")
public class WSApiController {
	private static final Logger log = LoggerFactory.getLogger(WSApiController.class);
	
	@Autowired
	private WSApiService wsApiService;
	
	@RequestMapping(value="/importInventory", method={RequestMethod.GET, RequestMethod.POST})
	public String importInventory(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importInventory paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "15");
			paramMap.put("TABNAME", "MA_INVENTORY");
			//paramMap.put("TABNAME", "TEST_UPLOAD");
			//Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			Map<String, Object> map = wsApiService.importTabgenListWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importTracking", method={RequestMethod.GET, RequestMethod.POST})
	public String importTracking(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importTracking paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "19");
			paramMap.put("TABNAME", "MA_JOBS");
			//paramMap.put("TABNAME", "TEST_UPLOAD");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importCustomerD", method={RequestMethod.GET, RequestMethod.POST})
	public String importCustomerD(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importCustomerD paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "12");
			paramMap.put("TABNAME", "MA_CUSTOMERS_D");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importCustomer", method={RequestMethod.GET, RequestMethod.POST})
	public String importCustomer(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importCustomer paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "12");
			paramMap.put("TABNAME", "MA_CUSTOMERS");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importTVProjects", method={RequestMethod.GET, RequestMethod.POST})
	public String importTVProjects(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importTVProjects paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "7");
			paramMap.put("TABNAME", "MA_TV_PROJECTS");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importTVLocations", method={RequestMethod.GET, RequestMethod.POST})
	public String importTVLocations(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importTVLocations paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "10");
			paramMap.put("TABNAME", "MA_TV_LOCATIONS");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importTVTime", method={RequestMethod.GET, RequestMethod.POST})
	public String importTVTime(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importTVTime paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "3");
			paramMap.put("TABNAME", "MA_TV_TIME");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importTVSoldTickets", method={RequestMethod.GET, RequestMethod.POST})
	public String importTVSoldTickets(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importTVSoldTickets paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "20");
			paramMap.put("TABNAME", "MA_TV_SOLD_TICKETS");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/uploadProjectImage", method={RequestMethod.GET, RequestMethod.POST})
	public String uploadProjectImage(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("uploadProjectImage paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("area", sessionInfo.getArea());
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		if (wsApiService.uploadDetail(paramMap, multipartRequest)) {
			model.addAttribute("result", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV020"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV019"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importFieldService", method={RequestMethod.GET, RequestMethod.POST})
	public String importFieldService(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importFieldService paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "20");
			paramMap.put("TABNAME", "MA_FIELD_SERVICE");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importProduct", method={RequestMethod.GET, RequestMethod.POST})
	public String importProduct(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importProduct paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "20");
			paramMap.put("TABNAME", "MA_PRODUCT");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/importFSAddress", method={RequestMethod.GET, RequestMethod.POST})
	public String importFSAddress(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("importFSAddress paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("area", sessionInfo.getArea());
			paramMap.put("groupCode", sessionInfo.getGroupCode());
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("lastCellNumber", "12");
			paramMap.put("TABNAME", "MA_FS_ADDRESS");
			Map<String, Object> map = wsApiService.importTabgenWithExcel(paramMap, multipartRequest);
			model.addAttribute("result", map.get("result"));
			model.addAttribute("msg", map.get("msg"));
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	//--------------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/wsTest", method={RequestMethod.GET, RequestMethod.POST})
	public String wsTest(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("WSApiController ::: wsTest ::: paramMap={}",paramMap);
		
		wsApiService.wsTest(paramMap);
		
		return "jsonView";
	}
}
