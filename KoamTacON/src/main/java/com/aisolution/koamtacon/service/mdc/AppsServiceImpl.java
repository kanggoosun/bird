package com.aisolution.koamtacon.service.mdc;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aisolution.common.util.CommonUtils;
import com.aisolution.koamtacon.mapper.mdc.AppsMapper;

@Service
public class AppsServiceImpl implements AppsService {
	private static final Logger log = LoggerFactory.getLogger(AppsServiceImpl.class);
	
	@Autowired
	private AppsMapper appsMapper;

	public int getTabgenTableCount(Map<String, String> paramMap) {
		log.debug("getTabgenTableCount paramMap={}", paramMap);
		return appsMapper.getTabgenTableCount(paramMap);
	}
	
	public int getTabgenRecordCount(Map<String, String> paramMap) {
		log.debug("getTabgenRecordCount paramMap={}", paramMap);
		return appsMapper.getTabgenRecordCount(paramMap);
	}
	
	public Map<String, Object> getTabgenDef(Map<String, Object> paramMap) {
		log.debug("getTabgenDef paramMap={}", paramMap);
		return appsMapper.getTabgenDef(paramMap);
	}
	
	public Map<String, Object> getInventory(Map<String, String> paramMap) {
		log.debug("getInventory paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_INVENTORY");
		
		if (paramMap.get("cbSearch1") != null && !paramMap.get("cbSearch1").equals("")) {
			map.put("cbSearch1", "tg."+paramMap.get("cbSearch1"));
		}
		//map.put("keyword1", paramMap.get("keyword1"));
		if (paramMap.get("cbSearch2") != null && !paramMap.get("cbSearch2").equals("")) {
			map.put("cbSearch2", "tg."+paramMap.get("cbSearch2"));
		}
		//map.put("keyword2", paramMap.get("keyword2"));
		if (paramMap.get("cbSearch3") != null && !paramMap.get("cbSearch3").equals("")) {
			map.put("cbSearch3", "tg."+paramMap.get("cbSearch3"));
		}
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getInventoryCount(map)));
		map.put("inventoryDef", appsMapper.getTabgenDef(map));
		map.put("inventoryList", appsMapper.getInventory(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getInventoryForExcel(Map<String, String> paramMap) {
		log.debug("getInventoryForExcel paramMap={}", paramMap);
		if (paramMap.get("cbSearch1") != null && !paramMap.get("cbSearch1").equals("")) {
			paramMap.put("cbSearch1", "tg."+paramMap.get("cbSearch1"));
		}
		//map.put("keyword1", paramMap.get("keyword1"));
		if (paramMap.get("cbSearch2") != null && !paramMap.get("cbSearch2").equals("")) {
			paramMap.put("cbSearch2", "tg."+paramMap.get("cbSearch2"));
		}
		//map.put("keyword2", paramMap.get("keyword2"));
		if (paramMap.get("cbSearch3") != null && !paramMap.get("cbSearch3").equals("")) {
			paramMap.put("cbSearch3", "tg."+paramMap.get("cbSearch3"));
		}
		return appsMapper.getInventoryForExcel(paramMap);
	}
	
	public Map<String, Object> getHisInventory(Map<String, String> paramMap) {
		log.debug("getHisInventory paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "HIS_INVENTORY_JOB");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getHisInventoryCount(map)));
		map.put("hisInventoryDef", appsMapper.getTabgenDef(map));
		map.put("hisInventoryList", appsMapper.getHisInventory(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getHisInventoryForExcel(Map<String, String> paramMap) {
		log.debug("getHisInventoryForExcel paramMap={}", paramMap);
		return appsMapper.getHisInventoryForExcel(paramMap);
	}
	
	public Map<String, Object> getStockIn(Map<String, String> paramMap) {
		log.debug("getStockIn paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_INVENTORY_IN");
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getStockInCount(map)));
		map.put("stockInDef", appsMapper.getTabgenDef(map));
		map.put("stockInList", appsMapper.getStockIn(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getStockInForExcel(Map<String, String> paramMap) {
		log.debug("getStockInForExcel paramMap={}", paramMap);
		return appsMapper.getStockInForExcel(paramMap);
	}
	
	public Map<String, Object> getStockOut(Map<String, String> paramMap) {
		log.debug("getStockOut paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_INVENTORY_OUT");
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getStockOutCount(map)));
		map.put("stockOutDef", appsMapper.getTabgenDef(map));
		map.put("stockOutList", appsMapper.getStockOut(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getStockOutForExcel(Map<String, String> paramMap) {
		log.debug("getStockOutForExcel paramMap={}", paramMap);
		return appsMapper.getStockOutForExcel(paramMap);
	}
	
	public Map<String, Object> getStockCheck(Map<String, String> paramMap) {
		log.debug("getStockCheck paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_INVENTORY_CHECK");
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getStockCheckCount(map)));
		map.put("stockCheckDef", appsMapper.getTabgenDef(map));
		map.put("stockCheckList", appsMapper.getStockCheck(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getStockCheckForExcel(Map<String, String> paramMap) {
		log.debug("getStockCheckForExcel paramMap={}", paramMap);
		return appsMapper.getStockCheckForExcel(paramMap);
	}
	
	public Map<String, Object> getPurchase(Map<String, String> paramMap) {
		log.debug("getPurchase paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_PURCHASE");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getPurchaseCount(map)));
		map.put("purchaseDef", appsMapper.getTabgenDef(map));
		map.put("purchaseList", appsMapper.getPurchase(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getPurchaseForExcel(Map<String, String> paramMap) {
		log.debug("getPurchaseForExcel paramMap={}", paramMap);
		return appsMapper.getPurchaseForExcel(paramMap);
	}
	
	public Map<String, Object> getRetail(Map<String, String> paramMap) {
		log.debug("getRetail paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "HIS_RETAIL");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getRetailCount(map)));
		map.put("retailDef", appsMapper.getTabgenDef(map));
		map.put("retailList", appsMapper.getRetail(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getRetailForExcel(Map<String, String> paramMap) {
		log.debug("getRetailForExcel paramMap={}", paramMap);
		return appsMapper.getRetailForExcel(paramMap);
	}
	
	public Map<String, Object> getTracking(Map<String, String> paramMap) {
		log.debug("getTracking paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_JOBS");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getTrackingCount(map)));
		map.put("trackingDef", appsMapper.getTabgenDef(map));
		map.put("trackingList", appsMapper.getTracking(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getTrackingForExcel(Map<String, String> paramMap) {
		log.debug("getTrackingForExcel paramMap={}", paramMap);
		return appsMapper.getTrackingForExcel(paramMap);
	}
	
	public Map<String, Object> getCustomerD(Map<String, String> paramMap) {
		log.debug("getCustomerD paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_CUSTOMERS_D");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getCustomerDCount(map)));
		map.put("customerDef", appsMapper.getTabgenDef(map));
		map.put("customerList", appsMapper.getCustomerD(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getCustomerDForExcel(Map<String, String> paramMap) {
		log.debug("getCustomerDForExcel paramMap={}", paramMap);
		return appsMapper.getCustomerDForExcel(paramMap);
	}
	
	public Map<String, Object> getRental(Map<String, String> paramMap) {
		log.debug("getRental paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_RENTAL");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getRentalCount(map)));
		map.put("rentalDef", appsMapper.getTabgenDef(map));
		map.put("rentalList", appsMapper.getRental(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getRentalForExcel(Map<String, String> paramMap) {
		log.debug("getRentalForExcel paramMap={}", paramMap);
		return appsMapper.getRentalForExcel(paramMap);
	}
	
	public Map<String, Object> getCustomer(Map<String, String> paramMap) {
		log.debug("getCustomer paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_CUSTOMERS");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getCustomerCount(map)));
		map.put("customerDef", appsMapper.getTabgenDef(map));
		map.put("customerList", appsMapper.getCustomer(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getCustomerForExcel(Map<String, String> paramMap) {
		log.debug("getCustomerForExcel paramMap={}", paramMap);
		return appsMapper.getCustomerForExcel(paramMap);
	}
	
	public Map<String, Object> getTicketValidation(Map<String, String> paramMap) {
		log.debug("getTicketValidation paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_TICKET_VALIDATION");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getTicketValidationCount(map)));
		map.put("ticketValidationDef", appsMapper.getTabgenDef(map));
		map.put("ticketValidationList", appsMapper.getTicketValidation(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getTicketValidationForExcel(Map<String, String> paramMap) {
		log.debug("getTicketValidationForExcel paramMap={}", paramMap);
		return appsMapper.getTicketValidationForExcel(paramMap);
	}
	
	public Map<String, Object> getSoldTickets(Map<String, String> paramMap) {
		log.debug("getSoldTickets paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_TV_SOLD_TICKETS");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getSoldTicketsCount(map)));
		map.put("soldTicketsDef", appsMapper.getTabgenDef(map));
		map.put("soldTicketsList", appsMapper.getSoldTickets(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getSoldTicketsForExcel(Map<String, String> paramMap) {
		log.debug("getSoldTicketsForExcel paramMap={}", paramMap);
		return appsMapper.getSoldTicketsForExcel(paramMap);
	}
	
	public Map<String, Object> getProjects(Map<String, String> paramMap) {
		log.debug("getProjects paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_TV_PROJECTS");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getProjectsCount(map)));
		map.put("projectsDef", appsMapper.getTabgenDef(map));
		map.put("projectsList", appsMapper.getProjects(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getProjectsForExcel(Map<String, String> paramMap) {
		log.debug("getProjectsForExcel paramMap={}", paramMap);
		return appsMapper.getProjectsForExcel(paramMap);
	}
	
	public Map<String, Object> getLocations(Map<String, String> paramMap) {
		log.debug("getLocations paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_TV_LOCATIONS");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getLocationsCount(map)));
		map.put("locationsDef", appsMapper.getTabgenDef(map));
		map.put("locationsList", appsMapper.getLocations(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getLocationsForExcel(Map<String, String> paramMap) {
		log.debug("getLocationsForExcel paramMap={}", paramMap);
		return appsMapper.getLocationsForExcel(paramMap);
	}
	
	public Map<String, Object> getTime(Map<String, String> paramMap) {
		log.debug("getTime paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_TV_TIME");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getTimeCount(map)));
		map.put("timeDef", appsMapper.getTabgenDef(map));
		map.put("timeList", appsMapper.getTime(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getTimeForExcel(Map<String, String> paramMap) {
		log.debug("getTimeForExcel paramMap={}", paramMap);
		return appsMapper.getTimeForExcel(paramMap);
	}
	
	public Map<String, Object> getFieldService(Map<String, String> paramMap) {
		log.debug("getFieldService paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_FIELD_SERVICE");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getFieldServiceCount(map)));
		map.put("fieldServiceDef", appsMapper.getTabgenDef(map));
		map.put("fieldServiceList", appsMapper.getFieldService(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getFieldServiceForExcel(Map<String, String> paramMap) {
		log.debug("getFieldServiceForExcel paramMap={}", paramMap);
		return appsMapper.getFieldServiceForExcel(paramMap);
	}
	
	public Map<String, Object> getProduct(Map<String, String> paramMap) {
		log.debug("getProduct paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_PRODUCT");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getProductCount(map)));
		map.put("productDef", appsMapper.getTabgenDef(map));
		map.put("productList", appsMapper.getProduct(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getProductForExcel(Map<String, String> paramMap) {
		log.debug("getProductForExcel paramMap={}", paramMap);
		return appsMapper.getProductForExcel(paramMap);
	}
	
	public Map<String, Object> getAddress(Map<String, String> paramMap) {
		log.debug("getAddress paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_FS_ADDRESS");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getAddressCount(map)));
		map.put("addressDef", appsMapper.getTabgenDef(map));
		map.put("addressList", appsMapper.getAddress(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getAddressForExcel(Map<String, String> paramMap) {
		log.debug("getAddressForExcel paramMap={}", paramMap);
		return appsMapper.getAddressForExcel(paramMap);
	}
	
	public List<Map<String, Object>> getEventDateList(Map<String, String> paramMap) {
		log.debug("getEventDateList paramMap={}", paramMap);
		return appsMapper.getEventDateList(paramMap);
	}
	
	public List<Map<String, Object>> getProjectSeqList(Map<String, String> paramMap) {
		log.debug("getProjectSeqList paramMap={}", paramMap);
		return appsMapper.getProjectSeqList(paramMap);
	}
	
	public List<Map<String, Object>> getLocationSeqList(Map<String, String> paramMap) {
		log.debug("getLocationSeqList paramMap={}", paramMap);
		return appsMapper.getLocationSeqList(paramMap);
	}
	
	public List<Map<String, Object>> getTimeSeqList(Map<String, String> paramMap) {
		log.debug("getTimeSeqList paramMap={}", paramMap);
		return appsMapper.getTimeSeqList(paramMap);
	}
	
	public List<Map<String, Object>> getTodayEventDateList(Map<String, String> paramMap) {
		log.debug("getTodayEventDateList paramMap={}", paramMap);
		return appsMapper.getTodayEventDateList(paramMap);
	}
	
	public List<Map<String, Object>> getTodayProjectSeqList(Map<String, String> paramMap) {
		log.debug("getTodayProjectSeqList paramMap={}", paramMap);
		return appsMapper.getTodayProjectSeqList(paramMap);
	}
	
	public List<Map<String, Object>> getTodayLocationSeqList(Map<String, String> paramMap) {
		log.debug("getTodayLocationSeqList paramMap={}", paramMap);
		return appsMapper.getTodayLocationSeqList(paramMap);
	}
	
	public List<Map<String, Object>> getTodayTimeSeqList(Map<String, String> paramMap) {
		log.debug("getTodayTimeSeqList paramMap={}", paramMap);
		return appsMapper.getTodayTimeSeqList(paramMap);
	}
	
	public Map<String, Object> getCategoryRental(Map<String, String> paramMap) {
		log.debug("getCategoryRental paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		//map.put("tabname", "CAT1_RENTAL");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getCategoryRentalCount(map)));
		//map.put("categoryDef", appsMapper.getCategoryRentalCount(map));
		map.put("categoryList", appsMapper.getCategoryRental(map));
		
		return map;
	}
	
	public Map<String, Object> getDelivery(Map<String, String> paramMap) {
		log.debug("getDelivery paramMap={}", paramMap);
		
		int itemNoPerPage = Integer.parseInt(paramMap.get("itemNoPerPage"));
		int curPage = Integer.parseInt(paramMap.get("curPage"));
		int offset = itemNoPerPage * (curPage - 1);
		
		Map<String, Object> map = CommonUtils.setParams(paramMap);
		map.put("itemNoPerPage", itemNoPerPage);
		map.put("offset", offset);
		//map.put("groupCode", paramMap.get("groupCode"));
		map.put("tabname", "MA_DELIVERY_MAST");
		
		//map.put("cbSearch1", paramMap.get("cbSearch1"));
		//map.put("keyword1", paramMap.get("keyword1"));
		//map.put("cbSearch2", paramMap.get("cbSearch2"));
		//map.put("keyword2", paramMap.get("keyword2"));
		//map.put("cbSearch3", paramMap.get("cbSearch3"));
		//map.put("keyword3", paramMap.get("keyword3"));
		//map.put("concat", paramMap.get("concat"));
		
		map.put("pageInfo", CommonUtils.getPageInfo(paramMap, appsMapper.getDeliveryCount(map)));
		map.put("deliveryDef", appsMapper.getTabgenDef(map));
		map.put("deliveryList", appsMapper.getDelivery(map));
		
		return map;
	}
	
	public List<Map<String, Object>> getDeliveryForExcel(Map<String, String> paramMap) {
		log.debug("getDeliveryForExcel paramMap={}", paramMap);
		return appsMapper.getDeliveryForExcel(paramMap);
	}
	
	public Map<String, Object> getCustomerInfo(Map<String, String> paramMap) {
		log.debug("getCustomerInfo paramMap={}", paramMap);
		return appsMapper.getCustomerInfo(paramMap);
	}
	
	public Map<String, Object> getAddressInfo(Map<String, String> paramMap) {
		log.debug("getAddressInfo paramMap={}", paramMap);
		return appsMapper.getAddressInfo(paramMap);
	}
}
