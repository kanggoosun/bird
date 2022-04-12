package com.aisolution.common.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.security.PrivateKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.aisolution.common.service.CommonService;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.FileUtils;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.common.util.RSA;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.service.mdc.AppsService;
import com.aisolution.koamtacon.service.service.SignService;
import com.aisolution.koamtacon.service.service.SystemManagementService;
import com.aisolution.koamtacon.service.service.UserManagementService;

@Controller
@RequestMapping("/common")
public class CommonController {
	private static final Logger log = LoggerFactory.getLogger(CommonController.class);
	
	@Value("#{koamtacon_config['koamtacon.upload.base']}")
	private String uploadedBase;
	@Value("#{koamtacon_config['koamtacon.upload.kdc']}")
	private String kdcUploadPath;
	@Value("#{koamtacon_config['koamtacon.upload.applications']}")
	private String applicationUploadPath;
	
	@Value("#{koamtacon_config['koamtacon.download.base']}")
	private String downloadBase;
	@Value("#{koamtacon_config['koamtacon.download.template']}")
	private String downloadTemplate;
	
	@Autowired
	private SystemManagementService systemManagementService;
	@Autowired
	private UserManagementService userManagementService;
	@Autowired
	private SignService signService;
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private AppsService appsService;
	
	@RequestMapping(value="/getLocal", method={RequestMethod.GET, RequestMethod.POST})
	public String keep(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getLocal");
		
		return "jsonView";
	}
	
	@RequestMapping(value="/list/countryCode", method={RequestMethod.GET, RequestMethod.POST})
	public String getListCountryCode(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getListCountryCode");
		
		return "jsonView";
	}
	
	@RequestMapping(value="/viewImage", method={RequestMethod.GET, RequestMethod.POST})
	public void viewImage(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String fileClass = req.getParameter("fileClass");
		String filename = req.getParameter("filename");
		if (fileClass == null || filename == null) {
			throw new Exception("Wrong parameter");
		}
		
		StringBuffer sbFile = new StringBuffer();
		if (fileClass.equals("KDC")) {
			sbFile.append(uploadedBase).append(kdcUploadPath);
		} else if (fileClass.equals("App")) {
			sbFile.append(uploadedBase).append(applicationUploadPath);
		}
		sbFile.append(File.separator).append(filename);
		
		File file = new File(sbFile.toString());
		@SuppressWarnings("resource")
		FileInputStream fileInputStream = new FileInputStream(file);
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
				
		byte[] by = new byte[(int)file.length()];
		int len = 0;
		
		while((len=fileInputStream.read(by)) != -1) byteArrayOutputStream.write(by, 0, len);
		
		byte[] imgBuf = byteArrayOutputStream.toByteArray();
		
		res.setContentType("image/jpeg");
		res.getOutputStream().write(imgBuf);
		
		res.getOutputStream().flush();
		res.getOutputStream().close();
	}
	
	@RequestMapping(value="/viewPdf", method={RequestMethod.GET, RequestMethod.POST})
	public void viewPdf(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String fileClass = req.getParameter("fileClass");
		String filename = req.getParameter("filename");
		if (fileClass == null || filename == null) {
			throw new Exception("Wrong parameter");
		}
		
		StringBuffer sbFile = new StringBuffer();
		if (fileClass.equals("KDC")) {
			sbFile.append(uploadedBase).append(kdcUploadPath);
		} else if (fileClass.equals("App")) {
			sbFile.append(uploadedBase).append(applicationUploadPath);
		}
		sbFile.append(File.separator).append(filename);
		
		File file = new File(sbFile.toString());
		@SuppressWarnings("resource")
		FileInputStream fileInputStream = new FileInputStream(file);
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
				
		byte[] by = new byte[(int)file.length()];
		int len = 0;
		
		while((len=fileInputStream.read(by)) != -1) byteArrayOutputStream.write(by, 0, len);
		
		byte[] fileBuf = byteArrayOutputStream.toByteArray();
		
		res.setContentType("application/pdf");
		res.setContentLength(by.length);
		res.setHeader("Content-Disposition", "inline; fileName=\""+sbFile.toString());
		
		res.getOutputStream().write(fileBuf);
		
		res.getOutputStream().flush();
		res.getOutputStream().close();
	}
	
	@RequestMapping(value="/getMainMenu", method={RequestMethod.GET, RequestMethod.POST})
	public String getMainMenu(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getMainMenu paramMap={}", paramMap);
		
		String menuDivision = "0";
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String userType = sessionInfo.getUserType();
		if (userType.equals("9")) {
			menuDivision = "1";
		} else {
			menuDivision = "0";
		}
		
		paramMap.put("division", menuDivision);
		List<Map<String, Object>> orgList = new ArrayList<Map<String, Object>>();
		log.debug("sessionInfo={}", sessionInfo.getRoleSeq());
		if (sessionInfo.getRoleSeq() != null && !sessionInfo.getRoleSeq().equals("")) {
			paramMap.put("roleSeq", sessionInfo.getRoleSeq());
			orgList = systemManagementService.getRoleMenuList(paramMap);
		} else {
			orgList = systemManagementService.getMenuListByDivision(paramMap);
		}
		List<Map<String, Object>> menuList = systemManagementService.makeTreeWithMenu(orgList);
		//log.debug("menuList={}", menuList);
		String menuHtml = CommonUtils.getMenuHtml(menuList, userType, sessionInfo.getGroupCode());
		//log.debug("menuHtml={}", menuHtml);
		model.addAttribute("mainMenuHtml", menuHtml);
		//log.debug("model={}",model);
		return "jsonView";
	}
	
	@RequestMapping(value="/getSecu", method={RequestMethod.GET, RequestMethod.POST})
	public String getSecu(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("getSecu paramMap={}", paramMap);
		
		req.getSession().removeAttribute("__rsaPrivateKey__");
		RSA rsa = RSA.getEncKey();
		model.addAttribute("publicKeyModulus", rsa.getPublicKeyModulus());
		model.addAttribute("publicKeyExponent", rsa.getPublicKeyExponent());
		req.getSession().setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());
		
		return "jsonView";
	}
	
	@RequestMapping(value="/checkSecu", method={RequestMethod.GET, RequestMethod.POST})
	public String checkSecu(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("checkSecu paramMap={}", paramMap);
		
		try {
			String encPassword = paramMap.get("encSecuPassword");
			PrivateKey privateKey = (PrivateKey)req.getSession().getAttribute("__rsaPrivateKey__");
			String decPassword = RSA.decryptRsa(privateKey, encPassword);
			log.debug("checkSecu decPassword={}",decPassword);
			paramMap.put("decPassword", CommonUtils.encryptSha512(decPassword));
			
			SessionInfo sessionInfo = SessionUtil.getSessionInfo();
			paramMap.put("userId", sessionInfo.getUserId());
			if (signService.CanLogin(paramMap)) {
				model.addAttribute("flag", "success");
				model.addAttribute("msg", "");
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV008"));
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV044"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/downloadFileCheck", method={RequestMethod.GET, RequestMethod.POST})
	public String downloadFileCheck(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("downloadFileCheck paramMap={}", paramMap);
		
		int result = 0;
		String flag = paramMap.get("flag");
		String filename = paramMap.get("filename");
		String path = getPath(flag);
		
		if (FileUtils.isExist(filename, path)) {
			result = 1;
		}
		
		model.addAttribute("result", String.valueOf(result));
	    model.addAttribute("actionUrl", paramMap.get("actionUrl"));
	    
		return "jsonView";
	}
	
	@RequestMapping(value="/downloadFile", method={RequestMethod.GET, RequestMethod.POST})
	public String downloadFile(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("downloadFile paramMap={}", paramMap);
		
		String flag = paramMap.get("flag");
		String filename = paramMap.get("filename");
		String path = getPath(flag);
		
		Map<String, Object> downloadInfoMap = new HashMap<String, Object>();
		downloadInfoMap.put("filePath", path);
		downloadInfoMap.put("phycFileNm", filename);
		downloadInfoMap.put("logcFileNm", filename);
		
		model.addAttribute("downloadInfoMap", downloadInfoMap);
		
		return "downloadView";
	}
	
	private String getPath(String flag) {
		StringBuffer sbPath = new StringBuffer();
		
		if (flag == null || flag.equals("")) {
			sbPath.append(downloadBase);
		} else if (flag.equals("template")) {
			sbPath.append(downloadBase).append(downloadTemplate);
		} else if (flag.equals("manual")) {
			sbPath.append(uploadedBase).append(applicationUploadPath);
		} else {
			sbPath.append(downloadBase);
		}
		
		log.debug("getPath flag={}, sbPath={}",flag,sbPath.toString());
		
		return sbPath.toString();
	}
	
	@RequestMapping(value="/excelExport", method={RequestMethod.GET, RequestMethod.POST})
	public String excelExport(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("downloadFile paramMap={}", paramMap);
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		String filename = paramMap.get("filename");
		if (filename != null) {
			if (filename.equals("customer-list")) {
				list = userManagementService.getUserInfoListForExcel(paramMap);
				map = makeExportInfoForCustomerList();
			} else if (filename.equals("inventory")) {
				list = appsService.getInventoryForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_INVENTORY", "Item Key");
			} else if (filename.equals("history-of-inventory")) {
				list = appsService.getHisInventoryForExcel(paramMap);
				map = makeExportInfoForTabgen("HIS_INVENTORY_JOB", "History Seq");
			} else if (filename.equals("stock-in")) {
				list = appsService.getStockInForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_INVENTORY_IN", "Barcode");
			} else if (filename.equals("stock-out")) {
				list = appsService.getStockOutForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_INVENTORY_OUT", "Barcode");
			} else if (filename.equals("stock-check")) {
				list = appsService.getStockCheckForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_INVENTORY_CHECK", "Barcode");
			} else if (filename.equals("purchase")) {
				list = appsService.getPurchaseForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_PURCHASE", "Purchase seq");
			} else if (filename.equals("retail")) {
				list = appsService.getRetailForExcel(paramMap);
				map = makeExportInfoForTabgen("HIS_RETAIL", "Retail seq");
			} else if (filename.equals("group-list")) {
				list = userManagementService.getGroupListForExcel(paramMap);
				map = makeExportInfoForGroupList();
			} else if (filename.equals("group-member-list")) {
				list = userManagementService.getMemberListForExcel(paramMap);
				map = makeExportInfoForMemberList();
			} else if (filename.equals("tracking")) {
				list = appsService.getTrackingForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_JOBS", "Job seq");
			} else if (filename.equals("customerD")) {
				list = appsService.getCustomerDForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_CUSTOMERS_D", "Customer seq");
			} else if (filename.equals("rental")) {
				list = appsService.getRentalForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_RENTAL", "Rental seq");
			} else if (filename.equals("customer")) {
				list = appsService.getCustomerForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_CUSTOMERS", "Customer seq");
			} else if (filename.equals("ticket-validation")) {
				list = appsService.getTicketValidationForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_TICKET_VALIDATION", "Validation seq");
			} else if (filename.equals("sold-tickets")) {
				list = appsService.getSoldTicketsForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_TV_SOLD_TICKETS", "Sold seq");
			} else if (filename.equals("projects")) {
				list = appsService.getProjectsForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_TV_PROJECTS", "Project seq");
			} else if (filename.equals("locations")) {
				list = appsService.getLocationsForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_TV_LOCATIONS", "Location seq");
			} else if (filename.equals("time")) {
				list = appsService.getTimeForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_TV_TIME", "Time seq");
			} else if (filename.equals("field-service")) {
				list = appsService.getFieldServiceForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_FIELD_SERVICE", "Service seq");
			} else if (filename.equals("address")) {
				list = appsService.getAddressForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_FS_ADDRESS", "Address seq");
			} else if (filename.equals("product")) {
				list = appsService.getProductForExcel(paramMap);
				map = makeExportInfoForTabgen("MA_PRODUCT", "Product seq");
			} else if (filename.equals("batch-user-list")) {
				list = userManagementService.getBatchUserListForExcel(paramMap);
				map = makeExportInfoForBatchUserList();
			} else if (filename.equals("owner-list")) {
				list = userManagementService.getOwnerListForExcel(paramMap);
				map = makeExportInfoForOwnerList();
			}
			
			model.addAttribute("keyList", map.get("keyList"));
			model.addAttribute("colNameList", map.get("colNameList"));
			model.addAttribute("paramMap", paramMap);
			model.addAttribute("list", list);
		}
		
		return "excelView";
	}
	
	private Map<String, Object> makeExportInfoForCustomerList() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<String> colNameList = new ArrayList<String>();
		List<String> keyList = new ArrayList<String>();
		
		int i=0;
		keyList.add(i, "userId");         colNameList.add(i++, "ID");
		keyList.add(i, "userName");       colNameList.add(i++, "Name");
		keyList.add(i, "userEmail");      colNameList.add(i++, "E-mail");
		keyList.add(i, "userPhone");      colNameList.add(i++, "Phone");
		keyList.add(i, "userCompany");    colNameList.add(i++, "Company");
		keyList.add(i, "userSite");       colNameList.add(i++, "Site");
		keyList.add(i, "countryCode");    colNameList.add(i++, "Country code");
		keyList.add(i, "countryName");    colNameList.add(i++, "Country name");
		keyList.add(i, "userType");       colNameList.add(i++, "User type code");
		keyList.add(i, "userTypeName");   colNameList.add(i++, "User type");
		keyList.add(i, "creationDate");   colNameList.add(i++, "Creation date");
		keyList.add(i, "area");           colNameList.add(i++, "Area");
		keyList.add(i, "groupCode");      colNameList.add(i++, "Group code");
		keyList.add(i, "groupName");      colNameList.add(i++, "Group name");
		keyList.add(i, "mdcId");          colNameList.add(i++, "mdc ID");
		keyList.add(i, "deviceCode");     colNameList.add(i++, "Device code");
		keyList.add(i, "paymentPlan");    colNameList.add(i++, "Payment plan");
		keyList.add(i, "paymentKey");     colNameList.add(i++, "Payment key");
		keyList.add(i, "activationYn");   colNameList.add(i++, "Activated or not");
		keyList.add(i, "activationCode"); colNameList.add(i++, "Activation code");
		keyList.add(i, "activatedDate");  colNameList.add(i++, "Activated date");
		
		rtnMap.put("keyList", keyList);
		rtnMap.put("colNameList", colNameList);
		
		return rtnMap;
	}
	
	private Map<String, Object> makeExportInfoForTabgen(String tabname, String keyDesc) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("tabname", tabname);
		Map<String, Object> defMap = appsService.getTabgenDef(paramMap);
		List<String> colNameList = new ArrayList<String>();
		List<String> keyList = new ArrayList<String>();
		
		int i=0;
		keyList.add(i, "reckey"); colNameList.add(i++, keyDesc);
		keyList.add(i, "val01");  colNameList.add(i++, defMap.get("descval01").toString());
		keyList.add(i, "val02");  colNameList.add(i++, defMap.get("descval02").toString());
		keyList.add(i, "val03");  colNameList.add(i++, defMap.get("descval03").toString());
		keyList.add(i, "val04");  colNameList.add(i++, defMap.get("descval04").toString());
		keyList.add(i, "val05");  colNameList.add(i++, defMap.get("descval05").toString());
		keyList.add(i, "val06");  colNameList.add(i++, defMap.get("descval06").toString());
		keyList.add(i, "val07");  colNameList.add(i++, defMap.get("descval07").toString());
		keyList.add(i, "val08");  colNameList.add(i++, defMap.get("descval08").toString());
		keyList.add(i, "val09");  colNameList.add(i++, defMap.get("descval09").toString());
		keyList.add(i, "val10");  colNameList.add(i++, defMap.get("descval10").toString());
		keyList.add(i, "val11");  colNameList.add(i++, defMap.get("descval11").toString());
		keyList.add(i, "val12");  colNameList.add(i++, defMap.get("descval12").toString());
		keyList.add(i, "val13");  colNameList.add(i++, defMap.get("descval13").toString());
		keyList.add(i, "val14");  colNameList.add(i++, defMap.get("descval14").toString());
		keyList.add(i, "val15");  colNameList.add(i++, defMap.get("descval15").toString());
		keyList.add(i, "val16");  colNameList.add(i++, defMap.get("descval16").toString());
		keyList.add(i, "val17");  colNameList.add(i++, defMap.get("descval17").toString());
		keyList.add(i, "val18");  colNameList.add(i++, defMap.get("descval18").toString());
		keyList.add(i, "val19");  colNameList.add(i++, defMap.get("descval19").toString());
		keyList.add(i, "val20");  colNameList.add(i++, defMap.get("descval20").toString());
		
		rtnMap.put("keyList", keyList);
		rtnMap.put("colNameList", colNameList);
		
		return rtnMap;
	}
	
	@RequestMapping(value="/checkIp", method={RequestMethod.GET, RequestMethod.POST})
	public String checkIp(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest request) {
		log.debug("checkIp paramMap={}", paramMap);
		
		String ip = CommonUtils.getClientIP(request);
		
		String[] ips = ip.split("\\.");
		paramMap.put("ipA", ips[0]);
		paramMap.put("ipB", ips[1]);
		paramMap.put("ipC", ips[2]);
		paramMap.put("ipD", ips[3]);
		
		List<Map<String, Object>> list = null;
		list = commonService.checkIp(paramMap);
		
		boolean flag = true;
		if (list != null && list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				if (list.get(i).get("continent") != null && list.get(i).get("continent").toString().equals("2")) {
					flag = false;
					break;
				}
			}
		}
		
		if (flag) {
			model.addAttribute("flag", "pass");
			model.addAttribute("msg", "");
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV057") + " <br><a href='http://www.gullivernet.com/en'>Click this link. http://www.gullivernet.com/en</a>");
		}
		return "jsonView";
	}
	
	private Map<String, Object> makeExportInfoForGroupList() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<String> colNameList = new ArrayList<String>();
		List<String> keyList = new ArrayList<String>();
		
		int i=0;
		keyList.add(i, "area");           colNameList.add(i++, "Area");
		keyList.add(i, "groupCode");      colNameList.add(i++, "Group code");
		keyList.add(i, "groupName");      colNameList.add(i++, "Group name");
		keyList.add(i, "ownerId");        colNameList.add(i++, "Owner ID");
		keyList.add(i, "ownerName");      colNameList.add(i++, "Owner name");
		keyList.add(i, "company");        colNameList.add(i++, "Company");
		keyList.add(i, "countryCode");    colNameList.add(i++, "Country code");
		keyList.add(i, "countryName");    colNameList.add(i++, "Country name");
		keyList.add(i, "totalKdc");       colNameList.add(i++, "Total number of registered KDCs");
		keyList.add(i, "notApprovedKdc"); colNameList.add(i++, "Number of not approved KDCs");
		keyList.add(i, "approvedKdc");    colNameList.add(i++, "Number of approved KDCs");
		keyList.add(i, "refusedKdc");     colNameList.add(i++, "Number of refused KDCs");
		keyList.add(i, "memberCnt");      colNameList.add(i++, "Number of members");
		keyList.add(i, "activationCnt");  colNameList.add(i++, "Number of issued activation code");
		keyList.add(i, "creationDate");   colNameList.add(i++, "Creation date");
		
		rtnMap.put("keyList", keyList);
		rtnMap.put("colNameList", colNameList);
		
		return rtnMap;
	}
	
	private Map<String, Object> makeExportInfoForMemberList() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<String> colNameList = new ArrayList<String>();
		List<String> keyList = new ArrayList<String>();
		
		int i=0;
		keyList.add(i, "userId");         colNameList.add(i++, "ID");
		keyList.add(i, "userName");       colNameList.add(i++, "Name");
		keyList.add(i, "userEmail");      colNameList.add(i++, "E-mail");
		keyList.add(i, "userType");       colNameList.add(i++, "User type code");
		keyList.add(i, "userTypeNm");     colNameList.add(i++, "User type");
		keyList.add(i, "activationCode"); colNameList.add(i++, "Activation code");
		keyList.add(i, "syncUser");       colNameList.add(i++, "Sync user");
		keyList.add(i, "deviceCode");     colNameList.add(i++, "Device code");
		keyList.add(i, "creationDate");   colNameList.add(i++, "Creation date");
		
		rtnMap.put("keyList", keyList);
		rtnMap.put("colNameList", colNameList);
		
		return rtnMap;
	}
	
	private Map<String, Object> makeExportInfoForBatchUserList() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<String> colNameList = new ArrayList<String>();
		List<String> keyList = new ArrayList<String>();
		
		int i=0;
		keyList.add(i, "area");           colNameList.add(i++, "Area");
		keyList.add(i, "userId");         colNameList.add(i++, "Name");
		keyList.add(i, "mdcId");          colNameList.add(i++, "E-mail");
		keyList.add(i, "deviceCode");     colNameList.add(i++, "User type code");
		keyList.add(i, "groupCode");      colNameList.add(i++, "User type");
		keyList.add(i, "activationCode"); colNameList.add(i++, "Activation code");
		keyList.add(i, "tempPwd");        colNameList.add(i++, "Sync user");
		keyList.add(i, "creationDate");   colNameList.add(i++, "Creation date");
		
		rtnMap.put("keyList", keyList);
		rtnMap.put("colNameList", colNameList);
		
		return rtnMap;
	}
	
	private Map<String, Object> makeExportInfoForOwnerList() {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<String> colNameList = new ArrayList<String>();
		List<String> keyList = new ArrayList<String>();
		
		int i=0;
		keyList.add(i, "userId");    colNameList.add(i++, "Owner ID");
		keyList.add(i, "userName");  colNameList.add(i++, "Owner Name");
		keyList.add(i, "company");   colNameList.add(i++, "Company");
		keyList.add(i, "country");   colNameList.add(i++, "Country");
		keyList.add(i, "kdcCnt");    colNameList.add(i++, "No. of KDC");
		keyList.add(i, "area");      colNameList.add(i++, "Area");
		keyList.add(i, "groupCode"); colNameList.add(i++, "Group Code");
		keyList.add(i, "useYn");     colNameList.add(i++, "Use YN");
		
		rtnMap.put("keyList", keyList);
		rtnMap.put("colNameList", colNameList);
		
		return rtnMap;
	}
}
