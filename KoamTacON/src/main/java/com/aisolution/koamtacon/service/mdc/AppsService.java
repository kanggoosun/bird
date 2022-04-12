package com.aisolution.koamtacon.service.mdc;

import java.util.List;
import java.util.Map;

public interface AppsService {

	public int getTabgenTableCount(Map<String, String> paramMap);
	
	public int getTabgenRecordCount(Map<String, String> paramMap);
	
	public Map<String, Object> getTabgenDef(Map<String, Object> paramMap);
	
	public Map<String, Object> getInventory(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getInventoryForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getHisInventory(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getHisInventoryForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getStockIn(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getStockInForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getStockOut(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getStockOutForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getStockCheck(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getStockCheckForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getPurchase(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getPurchaseForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getRetail(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getRetailForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getTracking(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTrackingForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getCustomerD(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getCustomerDForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getRental(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getRentalForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getCustomer(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getCustomerForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getTicketValidation(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTicketValidationForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getSoldTickets(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getSoldTicketsForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getProjects(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getProjectsForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getLocations(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getLocationsForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getTime(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTimeForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getFieldService(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getFieldServiceForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getProduct(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getProductForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getAddress(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getAddressForExcel(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getEventDateList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getProjectSeqList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getLocationSeqList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTimeSeqList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTodayEventDateList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTodayProjectSeqList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTodayLocationSeqList(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getTodayTimeSeqList(Map<String, String> paramMap);
	
	public Map<String, Object> getCategoryRental(Map<String, String> paramMap);
	
	public Map<String, Object> getDelivery(Map<String, String> paramMap);
	
	public List<Map<String, Object>> getDeliveryForExcel(Map<String, String> paramMap);
	
	public Map<String, Object> getCustomerInfo(Map<String, String> paramMap);
	
	public Map<String, Object> getAddressInfo(Map<String, String> paramMap);
}
