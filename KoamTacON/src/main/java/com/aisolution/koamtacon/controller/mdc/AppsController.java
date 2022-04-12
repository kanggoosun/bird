package com.aisolution.koamtacon.controller.mdc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.aisolution.common.service.CommonService;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.service.mdc.AppsService;
import com.aisolution.koamtacon.service.mdc.MdcKoamtacService;
import com.aisolution.koamtacon.service.mdc.TabgenService;
import com.aisolution.koamtacon.service.mdc.WSApiService;

@Controller
@RequestMapping("/apps")
public class AppsController {
	private static final Logger log = LoggerFactory.getLogger(AppsController.class);
	
	@Autowired
	private AppsService appsService;
	@Autowired
	private TabgenService tabgenService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private WSApiService wsApiService;
	@Autowired
	private MdcKoamtacService mdcKoamtacService;
	
	@RequestMapping(value="/inventory/getInventory", method={RequestMethod.GET, RequestMethod.POST})
	public String getInventory(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getInventory paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getInventory(paramMap);
		model.addAttribute("inventoryList", map.get("inventoryList"));
		model.addAttribute("inventoryDef", map.get("inventoryDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/inventory/getHisInventory", method={RequestMethod.GET, RequestMethod.POST})
	public String getHisInventory(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getHisInventory paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getHisInventory(paramMap);
		model.addAttribute("hisInventoryList", map.get("hisInventoryList"));
		model.addAttribute("hisInventoryDef", map.get("hisInventoryDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/inventory/getStockIn", method={RequestMethod.GET, RequestMethod.POST})
	public String getStockIn(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getStockIn paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getStockIn(paramMap);
		model.addAttribute("stockInList", map.get("stockInList"));
		model.addAttribute("stockInDef", map.get("stockInDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/inventory/getStockOut", method={RequestMethod.GET, RequestMethod.POST})
	public String getStockOut(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getStockOut paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getStockOut(paramMap);
		model.addAttribute("stockOutList", map.get("stockOutList"));
		model.addAttribute("stockOutDef", map.get("stockOutDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/inventory/getStockCheck", method={RequestMethod.GET, RequestMethod.POST})
	public String getStockCheck(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getStockCheck paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getStockCheck(paramMap);
		model.addAttribute("stockCheckList", map.get("stockCheckList"));
		model.addAttribute("stockCheckDef", map.get("stockCheckDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/purchase/getPurchase", method={RequestMethod.GET, RequestMethod.POST})
	public String getPurchase(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getPurchase paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getPurchase(paramMap);
		model.addAttribute("purchaseList", map.get("purchaseList"));
		model.addAttribute("purchaseDef", map.get("purchaseDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/retail/getRetail", method={RequestMethod.GET, RequestMethod.POST})
	public String getRetail(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getRetail paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getRetail(paramMap);
		model.addAttribute("retailList", map.get("retailList"));
		model.addAttribute("retailDef", map.get("retailDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/tracking/getTracking", method={RequestMethod.GET, RequestMethod.POST})
	public String getTracking(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getTracking paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getTracking(paramMap);
		model.addAttribute("trackingList", map.get("trackingList"));
		model.addAttribute("trackingDef", map.get("trackingDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/tracking/getCustomerD", method={RequestMethod.GET, RequestMethod.POST})
	public String getCustomerD(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getCustomerD paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getCustomerD(paramMap);
		model.addAttribute("customerList", map.get("customerList"));
		model.addAttribute("customerDef", map.get("customerDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/rental/getRental", method={RequestMethod.GET, RequestMethod.POST})
	public String getRental(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getRental paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getRental(paramMap);
		model.addAttribute("rentalList", map.get("rentalList"));
		model.addAttribute("rentalDef", map.get("rentalDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/rental/getCustomer", method={RequestMethod.GET, RequestMethod.POST})
	public String getCustomer(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getCustomer paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getCustomer(paramMap);
		model.addAttribute("customerList", map.get("customerList"));
		model.addAttribute("customerDef", map.get("customerDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/common/getSelectOptions", method={RequestMethod.GET, RequestMethod.POST})
	public String getSelectOptions(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getSelectOptions paramMap={}", paramMap);
		
		Map<String, Object> tmpParamMap = new HashMap<String, Object>();
		tmpParamMap.put("tabname", paramMap.get("tabname"));
		Map<String, Object> map = appsService.getTabgenDef(tmpParamMap);
		List<Map<String, Object>> optionList = new ArrayList<Map<String, Object>>();
		StringBuffer sb = new StringBuffer();
		Map<String, Object> optionMap = null;
		String code = "";
		String value = "";
		for(int i=1; i<=20; i++) {
			sb = new StringBuffer();
			if (i < 10) {
				sb.append("descval").append("0").append(String.valueOf(i));
			} else {
				sb.append("descval").append(String.valueOf(i));
			}
			code = (sb.toString()).substring(4);
			value = map.get(sb.toString()).toString();
			if (value != null && !value.equals("")) {
				optionMap = new HashMap<String, Object>();
				optionMap.put("code", code);
				optionMap.put("value", value);
				optionList.add(optionMap);
			} else {
				break;
			}
		}
		
		model.addAttribute("options", commonService.getOptionString("", optionList));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/getTicketValidation", method={RequestMethod.GET, RequestMethod.POST})
	public String getTicketValidation(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getTicketValidation paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getTicketValidation(paramMap);
		model.addAttribute("ticketValidationList", map.get("ticketValidationList"));
		model.addAttribute("ticketValidationDef", map.get("ticketValidationDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/getSoldTickets", method={RequestMethod.GET, RequestMethod.POST})
	public String getSoldTickets(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getSoldTickets paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getSoldTickets(paramMap);
		model.addAttribute("soldTicketsList", map.get("soldTicketsList"));
		model.addAttribute("soldTicketsDef", map.get("soldTicketsDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/getProjects", method={RequestMethod.GET, RequestMethod.POST})
	public String getProjects(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getProjects paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getProjects(paramMap);
		model.addAttribute("projectsList", map.get("projectsList"));
		model.addAttribute("projectsDef", map.get("projectsDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/getLocations", method={RequestMethod.GET, RequestMethod.POST})
	public String getLocations(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getLocations paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getLocations(paramMap);
		model.addAttribute("locationsList", map.get("locationsList"));
		model.addAttribute("locationsDef", map.get("locationsDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/getTime", method={RequestMethod.GET, RequestMethod.POST})
	public String getTime(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getTime paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getTime(paramMap);
		model.addAttribute("timeList", map.get("timeList"));
		model.addAttribute("timeDef", map.get("timeDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/getProjectInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getProjectInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getProjectInfo paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		paramMap.put("tabname", "MA_TV_PROJECTS");
		
		List<Map<String, Object>> list = tabgenService.getTabgenRecordsWithHeaderByReckey(paramMap);
		model.addAttribute("projectList", list);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/fieldService/getFieldService", method={RequestMethod.GET, RequestMethod.POST})
	public String getFieldService(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getFieldService paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getFieldService(paramMap);
		model.addAttribute("fieldServiceList", map.get("fieldServiceList"));
		model.addAttribute("fieldServiceDef", map.get("fieldServiceDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/fieldService/getProduct", method={RequestMethod.GET, RequestMethod.POST})
	public String getProduct(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getProduct paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		paramMap.put("area", sessionInfo.getArea());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getProduct(paramMap);
		model.addAttribute("productList", map.get("productList"));
		model.addAttribute("productDef", map.get("productDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/fieldService/getAddress", method={RequestMethod.GET, RequestMethod.POST})
	public String getAddress(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getAddress paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		paramMap.put("area", sessionInfo.getArea());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getAddress(paramMap);
		model.addAttribute("addressList", map.get("addressList"));
		model.addAttribute("addressDef", map.get("addressDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/makeEventInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String makeEventInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("makeEventInfo paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		paramMap.put("area", sessionInfo.getArea());
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("eDateList", appsService.getEventDateList(paramMap));
		dataMap.put("eProjecSeqList", appsService.getProjectSeqList(paramMap));
		dataMap.put("eLocationSeqList", appsService.getLocationSeqList(paramMap));
		dataMap.put("eTimeSeqList", appsService.getTimeSeqList(paramMap));
		
		wsApiService.makeEventTables(paramMap, dataMap);
		
		model.addAttribute("result", "OK");
		return "jsonView";
	}
	
	@RequestMapping(value="/ticketValidation/makeTodayEventInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String makeTodayEventInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("makeTodayEventInfo paramMap={}", paramMap);
		
		Map<String, Object> map = mdcKoamtacService.getSyncUser(paramMap);
		paramMap.put("groupCode", map.get("codgruppo").toString());
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("eDateList", appsService.getTodayEventDateList(paramMap));
		dataMap.put("eProjecSeqList", appsService.getTodayProjectSeqList(paramMap));
		dataMap.put("eLocationSeqList", appsService.getTodayLocationSeqList(paramMap));
		dataMap.put("eTimeSeqList", appsService.getTodayTimeSeqList(paramMap));
		
		wsApiService.makeEventTables(paramMap, dataMap);
		
		model.addAttribute("eFlag", "END");
		return "jsonView";
	}
	
	@RequestMapping(value="/rental/getCategoryRental", method={RequestMethod.GET, RequestMethod.POST})
	public String getCategoryRental(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getCategoryRental paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getCategoryRental(paramMap);
		model.addAttribute("categoryList", map.get("categoryList"));
		//model.addAttribute("categoryDef", map.get("categoryDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/delivery/getDelivery", method={RequestMethod.GET, RequestMethod.POST})
	public String getDelivery(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getDelivery paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		
		Map<String, Object> map = appsService.getDelivery(paramMap);
		model.addAttribute("deliveryList", map.get("deliveryList"));
		model.addAttribute("deliveryDef", map.get("deliveryDef"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/delivery/getCustomerInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getCustomerInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getCustomerInfo paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		model.addAttribute("customerInfo", appsService.getCustomerInfo(paramMap));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/delivery/getAddressInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getAddressInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getAddressInfo paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("groupCode", sessionInfo.getGroupCode());
		model.addAttribute("addrInfo", appsService.getAddressInfo(paramMap));
		
		return "jsonView";
	}
}
