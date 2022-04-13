package com.aisolution.koamtacon.controller.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.service.CommonService;
import com.aisolution.common.service.MailService;
import com.aisolution.common.util.InitUtil;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.koamtacon.service.service.CancelReservationService;
import com.aisolution.koamtacon.service.service.KDCService;
import com.aisolution.koamtacon.service.service.UserManagementService;

@Controller
@RequestMapping("/user/cancelReservation")
public class CancelReservationController {
	private static final Logger log = LoggerFactory.getLogger(CancelReservationController.class);

	@Autowired
	private CancelReservationService cancelReservationService;
	
	@Autowired
	private KDCService kdcService;
	@Autowired
	private InitUtil initUtil;
	@Autowired
	private CommonService commonService;
	@Autowired
	private UserManagementService userManagementService;
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value="/kdcRegistration", method={RequestMethod.GET, RequestMethod.POST})
	public String kdcRegistration(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("kdcRegistration paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		Map<String, String> cbParamMap = new HashMap<String, String>();
		cbParamMap.put("masterCode", "kdc_model");
		model.addAttribute("cbProductNameOptions", commonService.getComboCode(cbParamMap));
		
		return "/user/cancelReservation";
	}
	
	@RequestMapping(value="/getKdcApprovalList", method={RequestMethod.GET, RequestMethod.POST})
	public String getKdcApprovalList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getKdcApprovalList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = cancelReservationService.getKDCRegistrationApprovalList(paramMap);
		model.addAttribute("kdcApprovalList", map.get("kdcApprovalList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/kdcApproval", method={RequestMethod.GET, RequestMethod.POST})
	public String kdcApproval(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("kdcApproval paramMap={}", paramMap);
		
		try {
			cancelReservationService.kdcApproval(paramMap);
			String approvalFlag = paramMap.get("cbApproval");
			/*
			String approvalFlag = paramMap.get("cbApproval");
			if (approvalFlag.equals("1")) {
				paramMap.put("area", ConfigConstants.AREA);
				
				if (groupService.getGroupCount(paramMap) < 1) {
					paramMap.put("groupCode", CommonUtils.makeNextGroupCode(groupService.getMaxGroupCode(paramMap)));
					
					try {
						groupService.createGroup(paramMap);
						groupService.insertMember(paramMap);
					} catch(Exception e) {
						log.error(e.getMessage());
						log.error("Group creation error.");
					}
				} else {
					log.error("Group creation error.");
				}
			} else {
				log.error("Group creation error.");
			}
			*/
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV004"));
			
			Map<String, Object> map = userManagementService.getUserInfo(paramMap);
			//String lineBreak = "\r\n";
			String lineBreak = "<br>";
			String sender = ConfigConstants.fromAddress;
			String receiver = map.get("userEmail").toString();
			String cc = ConfigConstants.fromAddress;
			String title = "";
			StringBuffer sbContents = new StringBuffer();
			if (approvalFlag.equals("1")) {
				title = "Your KDC Registration has been approved!";
				
				sbContents.append("Dear ").append(map.get("userName").toString()).append(",").append(lineBreak).append(lineBreak);
				sbContents.append("You recently signed up for KOAMTACON utilizing ").append(map.get("userId")).append(" as the User ID.").append(lineBreak);
				sbContents.append("Congratulations! Your registration for the following KDC has been approved: ").append(lineBreak).append(lineBreak);
				sbContents.append("Model: ").append(paramMap.get("cbProductName")).append(lineBreak);
				sbContents.append("S/N: ").append(paramMap.get("serialNo")).append(lineBreak).append(lineBreak);
				sbContents.append("As a next step, you'll receive ID, Password, and activation code. To ensure you receive this email, please add <a href='mailto:koamtacon@koamtac.com'>koamtacon@koamtac.com</a> to your safe senders list.").append(lineBreak).append(lineBreak);
				sbContents.append("Should you have any questions regarding this process please contact the KOAMTACON team at <a href='mailto:koamtacon@koamtac.com'>koamtacon@koamtac.com</a>.").append(lineBreak).append(lineBreak);
				sbContents.append("Thank you,").append(lineBreak).append(lineBreak);
				sbContents.append("The KOAMTACON team").append(lineBreak);
				
				// Group 积己 咯何 棺 Mobile user 积己 咯何 眉农
				if (userManagementService.getNumberOfMemberWithActivationCode(paramMap) > 0) {
					model.addAttribute("activated", "Y");
				} else {
					model.addAttribute("activated", "N");
				}
			} else if (approvalFlag.equals("2")) {
				title = "More information needed to complete your KOAMTACON registration";
				
				sbContents.append("Dear ").append(map.get("userName").toString()).append(",").append(lineBreak).append(lineBreak);
				sbContents.append("You recently signed up for KOAMTACON utilizing ").append(map.get("userId")).append(" as the User ID.").append(lineBreak);
				sbContents.append("Unfortunately, Your registration for the following KDC has been rejected due to the following reasons: ").append(lineBreak).append(lineBreak);
				sbContents.append("Reason: ").append(paramMap.get("comment")).append(lineBreak);
				sbContents.append("Model: ").append(paramMap.get("cbProductName")).append(lineBreak);
				sbContents.append("S/N: ").append(paramMap.get("serialNo")).append(lineBreak).append(lineBreak);
				sbContents.append("Please review and correct the above information then complete <a href='http://services.koamtacon.com/'>KDC registration again</a>.").append(lineBreak).append(lineBreak);
				sbContents.append("Should you have any questions regarding this process please contact the KOAMTACON team at <a href='mailto:koamtacon@koamtac.com'>koamtacon@koamtac.com</a>.").append(lineBreak).append(lineBreak);
				sbContents.append("Thank you and we look forward to your updated registration,").append(lineBreak).append(lineBreak);
				sbContents.append("The KOAMTACON team").append(lineBreak);
			}
			
			mailService.sendHtmlMail(sender, receiver, cc, title, sbContents.toString());
			//System.out.println("========== Mail OK !!! ==========");
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV003"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/getKDCPhoto", method={RequestMethod.GET, RequestMethod.POST})
	public String getKDCPhoto(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getKDCPhoto paramMap={}", paramMap);
		model.addAttribute("kdcPhoto", kdcService.getKDCPhoto(paramMap));
		model.addAttribute("flag", "success");
		return "jsonView";
	}
	
	@RequestMapping(value="/applicationApproval", method={RequestMethod.GET, RequestMethod.POST})
	public String applicationApproval(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("applicationApproval paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		Map<String, String> cbParamMap = new HashMap<String, String>();
		cbParamMap.put("masterCode", "approval_flag");
		model.addAttribute("cbApprovalFlagOptions", commonService.getComboCode(cbParamMap));
		
		return "/admin/applicationApprovalManagement";
	}
	
	@RequestMapping(value="/getApplicationApprovalList", method={RequestMethod.GET, RequestMethod.POST})
	public String getApplicationApprovalList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getApplicationApprovalList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		paramMap.put("area", ConfigConstants.AREA);
		Map<String, Object> map = cancelReservationService.getApplicationApprovalList(paramMap);
		model.addAttribute("applicationApprovalList", map.get("applicationApprovalList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@Transactional
	@RequestMapping(value="/saveApplicationApproval", method={RequestMethod.GET, RequestMethod.POST})
	public String saveApplicationApproval(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("saveApplicationApproval paramMap={}", paramMap);
		
		try {
			paramMap.put("applicationSeq", paramMap.get("requestTarget"));
			paramMap.put("area", ConfigConstants.AREA);
			cancelReservationService.saveApplicationApproval(paramMap);
			if (paramMap.get("cbApprovalFlag").equals("2")) {
				if (cancelReservationService.getApplicationGroupCount(paramMap) == 0) {
					cancelReservationService.insertApplicationGroup(paramMap);
				} else {
					paramMap.put("useYn", "Y");
					cancelReservationService.updateApplicationGroup(paramMap);
				}
			} else if (paramMap.get("cbApprovalFlag").equals("3")) {
				if (cancelReservationService.getApplicationGroupCount(paramMap) > 0) {
					paramMap.put("useYn", "N");
					cancelReservationService.updateApplicationGroup(paramMap);
				}
			}
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV004"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV003"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/getOwnerInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getOwnerInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getOwnerInfo paramMap={}", paramMap);
		
		paramMap.put("userId", paramMap.get("ownerId"));
		try {
			model.addAttribute("ownerMap", userManagementService.getUserInfo(paramMap));
			model.addAttribute("flag", "success");
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV042"));
		}
		return "jsonView";
	}
}
