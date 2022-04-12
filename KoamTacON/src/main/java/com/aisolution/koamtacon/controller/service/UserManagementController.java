package com.aisolution.koamtacon.controller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.service.CommonService;
import com.aisolution.common.service.MailService;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.InitUtil;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.koamtacon.service.mdc.MdcKoamtacService;
import com.aisolution.koamtacon.service.mdc.WSApiService;
import com.aisolution.koamtacon.service.service.GroupService;
import com.aisolution.koamtacon.service.service.SignService;
import com.aisolution.koamtacon.service.service.UserManagementService;

@Controller
@RequestMapping("/admin/userManagement")
public class UserManagementController {
	private static final Logger log = LoggerFactory.getLogger(UserManagementController.class);
	
	@Value("#{koamtacon_config['koamtacon.upload.base']}")
	private String uploadedBase;
	@Value("#{koamtacon_config['koamtacon.upload.temp']}")
	private String tempUploadPath;
	@Value("#{koamtacon_config['koamtacon.upload.file.size.limit']}")
	private long fileSizeLimit;
	
	@Value("#{koamtacon_config['koamtacon.bak.base']}")
	private String bakBase;
	@Value("#{koamtacon_config['koamtacon.bak.kdc']}")
	private String kdcBakPath;
	@Value("#{koamtacon_config['koamtacon.bak.temp']}")
	private String tempBakPath;
	
	@Autowired
	private CommonService commonService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private SignService signService;
	@Autowired
	private UserManagementService userManagementService;
	@Autowired
	private MdcKoamtacService mdcKoamtacService;
	@Autowired
	private InitUtil initUtil;
	@Autowired
	private MailService mailService;
	
	@Autowired
	private WSApiService wsApiService;
	
	@RequestMapping(value="/group", method={RequestMethod.GET, RequestMethod.POST})
	public String group(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("group paramMap={}",paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/groupManagement";
	}
	
	@RequestMapping(value="/getOwnerList", method={RequestMethod.GET, RequestMethod.POST})
	public String getOwnerList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getOwnerList paramMap={}",paramMap);
		
		Map<String, Object> map = userManagementService.getOwnerList(paramMap);
		model.addAttribute("ownerList", map.get("list"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/customer", method={RequestMethod.GET, RequestMethod.POST})
	public String customer(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("customer paramMap={}",paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/customerManagement";
	}
	
	@RequestMapping(value="/getUserInfoList", method={RequestMethod.GET, RequestMethod.POST})
	public String getUserInfoList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getUserInfoList paramMap={}",paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = userManagementService.getUserInfoList(paramMap);
		model.addAttribute("userInfoList", map.get("userInfoList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/updateUserInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String updateUserInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("updateUserInfo paramMap={}",paramMap);
		try {
			userManagementService.updateUserInfo(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV052"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV017"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/admin", method={RequestMethod.GET, RequestMethod.POST})
	public String admin(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("admin paramMap={}",paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		model.addAttribute("listCountryCode", commonService.getComboCountry(""));
		return "/admin/adminManagement";
	}
	
	@RequestMapping(value="/getAdminInfoList", method={RequestMethod.GET, RequestMethod.POST})
	public String getAdminInfoList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getAdminInfoList paramMap={}",paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = userManagementService.getAdminInfoList(paramMap);
		model.addAttribute("adminInfoList", map.get("adminInfoList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/insertAdminInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String insertAdminInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("insertAdminInfo paramMap={}",paramMap);
		try {
			paramMap.put("decPassword", CommonUtils.encryptSha512("aisolution"));
			paramMap.put("userType", "9");
			signService.insertSign(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV051"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV014"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateAdminInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String updateAdminInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("updateAdminInfo paramMap={}",paramMap);
		try {
			userManagementService.updateAdminInfo(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV052"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV017"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/getGroupList", method={RequestMethod.GET, RequestMethod.POST})
	public String getGroupList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getGroupList paramMap={}",paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = userManagementService.getGroupList(paramMap);
		model.addAttribute("groupList", map.get("groupList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getMemberList", method={RequestMethod.GET, RequestMethod.POST})
	public String getMemberList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getMemberList paramMap={}",paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = userManagementService.getMemberList(paramMap);
		model.addAttribute("memberList", map.get("memberList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/updateMemberInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String updateMemberInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("updateMemberInfo paramMap={}",paramMap);
		try {
			userManagementService.updateUserInfo(paramMap);			
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV052"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV017"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/sendMail", method={RequestMethod.GET, RequestMethod.POST})
	public String sendMail(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("sendMail paramMap={}",paramMap);
		
		Map<String, Object> userInfo = userManagementService.getUserInfo(paramMap);
		
		//String accountActivationYn = CommonUtils.getValue(userInfo.get("accountActivationYn"), "");
		//String initialPwdYn = CommonUtils.getValue(userInfo.get("initialPwdYn"), "");
		
		//String lineBreak = "\r\n";
		String lineBreak = "<br>";
		String sender = ConfigConstants.fromAddress;
		String receiver = userInfo.get("userEmail").toString();
		String userType = userInfo.get("userType").toString();
		
		String appleAppStore = "<a href='https://itunes.apple.com/us/app/koamtacon/id976617297?mt=8'>Apple App Store</a>";
		String googlePlayStore = "<a href='https://play.google.com/store/apps/details?id=com.gullivernet.mdc.android.gui.k&amp;hl=en_US'>Google Play Store</a>";
		String microsoftAppStore = "<a href='https://www.microsoft.com/en-us/p/koamtacon/9nblggh5265t'>Microsoft App Store</a>";
		
		String title = "Welcome to KOAMTACON!";
		
		StringBuffer sbContents = new StringBuffer();
		sbContents.append("Dear ").append(userInfo.get("userName")).append(",").append(lineBreak).append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Congratulations! Your KOAMTACON registration for ").append(userInfo.get("company")).append(" is complete.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("To log in to <a href='http://services.koamtacon.com/'>KOAMTACON's web console</a> your credentials are: ").append(lineBreak);
		sbContents.append("User ID: ").append(userInfo.get("userId")).append(lineBreak);
		String newPassword = CommonUtils.makeRandomString(8);
		sbContents.append("Password: ").append(newPassword).append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("To begin using KOAMTACON with your KDC, please download the application from either the ").append(appleAppStore).append(", ").append(googlePlayStore).append(", or ").append(microsoftAppStore).append(".").append(lineBreak);
		sbContents.append("Your activation code is <font face='consolas'>").append(userInfo.get("activationCode")).append("</font>.").append(lineBreak);
		if (userType.equals("0")) {
			sbContents.append(lineBreak);
			sbContents.append("Now you can register more members to your organization using the web console. Your organization's allowed number of members directly correlates to the number of KDCs registered. Additionally, your User ID counts as one member for your organization.").append(lineBreak);
		} else if (userType.equals("1")) {
			
		}
		paramMap.put("newPassword", CommonUtils.encryptSha512(newPassword));
		paramMap.put("email", receiver);
		signService.resetPassword(paramMap);
		userManagementService.activateUser(paramMap);
		sbContents.append(lineBreak);
		sbContents.append("Please refer to the <a href='http://koamtacon.com/product/documentation/'>KOAMTACON User Manual</a> for assistance or contact our support team at <a href='mailto:koamtacon@koamtac.com'>koamtacon@koamtac.com</a>.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Thank you and welcome!").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("The KOAMTACON Team").append(lineBreak);
		
		/*
		if (accountActivationYn.equals("N") && initialPwdYn.equals("Y")) {
			sbContents.append("Dear ").append(userInfo.get("userName")).append(lineBreak);
			sbContents.append(lineBreak);
			sbContents.append("Thank you for signing up to KoamtacON.").append(lineBreak);
			sbContents.append(lineBreak);
			sbContents.append("Here is your account information for services.koamtacon.com.").append(lineBreak);
			sbContents.append("ID: ").append(userInfo.get("userId")).append(lineBreak);
			String newPassword = CommonUtils.makeRandomString(8);
			sbContents.append("Password: ").append(newPassword).append(lineBreak);
			sbContents.append("** The above password is a temporary password.").append(lineBreak);
			sbContents.append("   Please make sure to change to a new password after logging in.").append(lineBreak);
			sbContents.append("E-mail: ").append(userInfo.get("userEmail")).append(lineBreak);
			sbContents.append(lineBreak);
			sbContents.append("Here is an activation code that allows mobile programs to be used.").append(lineBreak);
			sbContents.append("Activation code: ").append(userInfo.get("activationCode")).append(lineBreak);
			
			paramMap.put("newPassword", CommonUtils.encryptSha512(newPassword));
			paramMap.put("email", receiver);
			signService.resetPassword(paramMap);
			userManagementService.activateUser(paramMap);
			sbContents.append("You can sign in with above information.").append(lineBreak);
			sbContents.append("Please sign in to services.koamtacon.com and change you password.").append(lineBreak);
			sbContents.append(lineBreak);
			sbContents.append("Thank you.");
		}
		*/
		
		try {
			//mailService.sendMail(sender, receiver, title, sbContents.toString());
			mailService.sendHtmlMail(sender, receiver, title, sbContents.toString());
			paramMap.put("sendYn", "Y");
			userManagementService.updateSendYn(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV038"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV016"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/sendMailAll", method={RequestMethod.GET, RequestMethod.POST})
	public String sendMailAll(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("sendMailAll paramMap={}",paramMap);
		int totalCnt = 0;
		int successCnt = 0;
		int failCnt = 0;
		
		String lineBreak = "\r\n";
		
		List<Map<String, Object>> memberList = userManagementService.getNotSendMemberList(paramMap);
		
		if (memberList != null && memberList.size() > 0) {
			for(int i=0; i<memberList.size(); i++) {
				totalCnt++;
				Map<String, Object> memberMap = (Map<String, Object>)memberList.get(i);
				
				String sender = ConfigConstants.fromAddress;
				String receiver = memberMap.get("userEmail").toString();
				String title = "[KoamtacON] Mobile application information";
				StringBuffer sbContents = new StringBuffer();
				
				sbContents.append("Dear ").append(memberMap.get("userName")).append(lineBreak);
				sbContents.append(lineBreak);
				sbContents.append("You can use the KoamtacON mobile application with the following information.").append(lineBreak);
				sbContents.append(lineBreak);
				sbContents.append("Your ID: ").append(memberMap.get("syncUser")).append(lineBreak);
				sbContents.append("Activation code: ").append(memberMap.get("activationCode")).append(lineBreak);
				sbContents.append(lineBreak);
				sbContents.append("Thank you.");
				
				try {
					mailService.sendMail(sender, receiver, title, sbContents.toString());
					paramMap.put("userId", memberMap.get("userId").toString());
					paramMap.put("sendYn", "Y");
					userManagementService.updateSendYn(paramMap);
					successCnt++;
				} catch(Exception e) {
					log.error(e.getMessage());
					failCnt++;
				}
			}
		}
		StringBuffer sbResult = new StringBuffer();
		sbResult.append(MessageUtils.getMessage("MSG-SV074")+" ").append(String.valueOf(totalCnt)).append(lineBreak);
		sbResult.append(MessageUtils.getMessage("MSG-SV075")+" ").append(String.valueOf(successCnt)).append(lineBreak);
		sbResult.append(MessageUtils.getMessage("MSG-SV076")+" ").append(String.valueOf(failCnt)).append(lineBreak);
		
		model.addAttribute("msg", sbResult.toString());
		
		return "jsonView";
	}
	
	@RequestMapping(value="/sendWelcomeMail", method={RequestMethod.GET, RequestMethod.POST})
	public String sendWelcomeMail(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("sendHtmlMail paramMap={}",paramMap);
		
		if (this.sendHtmlMail(paramMap)) {
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV038"));
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV016"));
		}
		
		return "jsonView";
	}
	
	private boolean sendHtmlMail(@RequestParam Map<String, String> paramMap) throws Exception {
		log.debug("sendHtmlMail paramMap={}",paramMap);
		
		boolean rFlag = false;
		
		Map<String, Object> userInfo = userManagementService.getUserInfo(paramMap);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("lineBreak", "<br>");
		map.put("sender", ConfigConstants.fromAddress);
		map.put("receiver", userInfo.get("userEmail").toString());
		map.put("userType", userInfo.get("userType").toString());
		
		map.put("userName", userInfo.get("userName").toString());
		map.put("company", userInfo.get("company").toString());
		map.put("userId", userInfo.get("userId").toString());
		String newPassword = CommonUtils.makeRandomString(8);
		map.put("password", newPassword);
		map.put("activationCode", userInfo.get("activationCode").toString());
		
		paramMap.put("newPassword", CommonUtils.encryptSha512(newPassword));
		paramMap.put("tmpPassword", newPassword);
		paramMap.put("email", userInfo.get("userEmail").toString());
		signService.resetPassword(paramMap);
		userManagementService.activateUser(paramMap);
		
		Map<String, String> mailMap = makeWelcomeMailContents(map);
		try {
			if (userInfo.get("userType").toString().equals("0")) {
				String cc = ConfigConstants.fromAddress;
				mailService.sendHtmlMail(mailMap.get("sender"), mailMap.get("receiver"), cc, mailMap.get("title"), mailMap.get("contents"));
			} else if (userInfo.get("userType").toString().equals("1")) {
				String[] cc = {userInfo.get("ownerEmail").toString(), ConfigConstants.fromAddress};
				mailService.sendHtmlMail(mailMap.get("sender"), mailMap.get("receiver"), cc, mailMap.get("title"), mailMap.get("contents"));
			}
			//System.out.println("== Send mail succeed. ================================");
			paramMap.put("sendYn", "Y");
			userManagementService.updateSendYn(paramMap);
			rFlag = true;
		} catch(Exception e) {
			log.error(e.getMessage());
			rFlag = false;
		}
		
		return rFlag;
	}
	
	@RequestMapping(value="/demoAccountsManagement", method={RequestMethod.GET, RequestMethod.POST})
	public String demoAccountsManagement(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("demoAccountsManagement paramMap={}",paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/demoAccountsManagement";
	}
	
	@RequestMapping(value="/getDemoAccountsList", method={RequestMethod.GET, RequestMethod.POST})
	public String getDemoAccountsList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getDemoAccountsList paramMap={}",paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = userManagementService.getDemoAccountsList(paramMap);
		model.addAttribute("demoAccountsList", map.get("demoAccountsList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		model.addAttribute("demoAccount", userManagementService.getDemoAccount(paramMap));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/updateDemoAccount", method={RequestMethod.GET, RequestMethod.POST})
	public String updateDemoAccount(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateDemoAccount paramMap={}",paramMap);
		
		try {
			userManagementService.updateDemoAccount(paramMap);
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV040"));
		} catch(Exception ex) {
			log.error("[ERROR] {}",ex.getMessage());
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV008"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/sendDemoAccount", method={RequestMethod.GET, RequestMethod.POST})
	public String sendDemoAccount(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("sendDemoAccount paramMap={}",paramMap);
		
		Map<String, Object> userInfo = userManagementService.getDemoAccountInfo(paramMap);
		
		String lineBreak = "<br>";
		String sender = ConfigConstants.fromAddress;
		String receiver = userInfo.get("email").toString();
		String cc = ConfigConstants.fromAddress;
		
		String appleAppStore = "<a href='https://itunes.apple.com/us/app/koamtacon/id976617297?mt=8'>Apple App Store</a>";
		String googlePlayStore = "<a href='https://play.google.com/store/apps/details?id=com.gullivernet.mdc.android.gui.k&amp;hl=en_US'>Google Play Store</a>";
		String microsoftAppStore = "<a href='https://www.microsoft.com/en-us/p/koamtacon/9nblggh5265t'>Microsoft App Store</a>";
		
		String title = "Welcome to KOAMTACON Demo Trial!";
		
		StringBuffer sbContents = new StringBuffer();
		sbContents.append("Dear ").append(userInfo.get("name")).append(",").append(lineBreak).append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Congratulations! Your KOAMTACON demo registration for ").append(userInfo.get("company")).append(" is complete.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("To log in to <a href='http://services.koamtacon.com/'>KOAMTACON's web console</a> your demo credentials are: ").append(lineBreak);
		sbContents.append("User ID: ").append(userInfo.get("webId")).append(lineBreak);
		sbContents.append("Password: ").append(userInfo.get("password")).append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Demo trial will be expired in one month.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("To begin using KOAMTACON with your KDC, please download the application from either the ").append(appleAppStore).append(", ").append(googlePlayStore).append(", or ").append(microsoftAppStore).append(".").append(lineBreak);
		sbContents.append("Your activation code is <font face='consolas'>").append(userInfo.get("activationCode")).append("</font>.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Please refer to the <a href='http://koamtacon.com/product/documentation/'>KOAMTACON User Manual</a> for assistance or contact our support team at <a href='mailto:koamtacon@koamtac.com'>koamtacon@koamtac.com</a>.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Thank you and welcome!").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("The KOAMTACON Team").append(lineBreak);
		
		try {
			mailService.sendHtmlMail(sender, receiver, cc, title, sbContents.toString());
			
			userManagementService.updateDemoAccountStartDate(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV038"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV016"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/userCreation", method={RequestMethod.GET, RequestMethod.POST})
	public String userCreation(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("userCreation paramMap={}",paramMap);

		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/userCreation";
	}
	
	@Transactional
	@RequestMapping(value="/createMobileUser", method={RequestMethod.GET, RequestMethod.POST})
	public String createMobileUser(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("createMobileUser paramMap={}",paramMap);
		
		try {
			// ��� ������ �׷��ڵ� �� ���� ���� ���� ���Ѵ�.
			String groupCode = groupService.getMinAvailableGroupCode();
			log.debug("Min available group code: {}", groupCode);
			paramMap.put("groupCode", groupCode);
			
			if (groupService.getGroupCount(paramMap) < 1 && groupService.getDuplicatedGroupCount(paramMap) < 1) {
				// MDC DB�� Mobile User �� Activation Code ����
				Map <String, String> mdcMap = wsApiService.createMobileUserAndActivationCode(paramMap);
				if (mdcMap != null && mdcMap.size() > 0) {
					// services DB�� group ����
					groupService.createGroup(paramMap);
					// services DB�� group member �߰�
					groupService.insertMember(paramMap);
					// services DB�� user ���� �� area �׸� ������Ʈ
					groupService.updateUserArea(paramMap);
					// services DB�� user ���� �� Mobile user & activation code ���� ������Ʈ
					userManagementService.updateUserInfo(mdcMap);
					if (this.sendHtmlMail(paramMap)) {
						model.addAttribute("flag", "success");
						model.addAttribute("msg", MessageUtils.getMessage("MSG-SV029"));
					} else {
						model.addAttribute("flag", "fail");
						model.addAttribute("msg", MessageUtils.getMessage("MSG-SV028"));
					}
				} else {
					model.addAttribute("flag", "fail");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV010") + " " + MessageUtils.getMessage("MSG-SV047"));
				}
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV010") + " " + MessageUtils.getMessage("MSG-SV046"));
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV010"));
		}
		
		return "jsonView";
	}
	
	private Map<String, String> makeWelcomeMailContents(Map<String, String> mailMap) {
		String lineBreak = mailMap.get("lineBreak");
		
		String appleAppStore = "<a href='https://itunes.apple.com/us/app/koamtacon/id976617297?mt=8'>Apple App Store</a>";
		String googlePlayStore = "<a href='https://play.google.com/store/apps/details?id=com.gullivernet.mdc.android.gui.k&amp;hl=en_US'>Google Play Store</a>";
		String microsoftAppStore = "<a href='https://www.microsoft.com/en-us/p/koamtacon/9nblggh5265t'>Microsoft App Store</a>";
		
		mailMap.put("title", "Welcome to KOAMTACON!");
		
		StringBuffer sbContents = new StringBuffer();
		sbContents.append("Dear ").append(mailMap.get("userName")).append(",").append(lineBreak).append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Congratulations! Your KOAMTACON registration for ").append(mailMap.get("company")).append(" is complete.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("To log in to <a href='http://services.koamtacon.com/'>KOAMTACON's web console</a> your credentials are: ").append(lineBreak);
		sbContents.append("User ID: ").append(mailMap.get("userId")).append(lineBreak);
		
		sbContents.append("Password: ").append(mailMap.get("password").toString()).append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("To begin using KOAMTACON with your KDC, please download the application from either the ").append(appleAppStore).append(", ").append(googlePlayStore).append(", or ").append(microsoftAppStore).append(".").append(lineBreak);
		sbContents.append("Your activation code is <font face='consolas'>").append(mailMap.get("activationCode")).append("</font>.").append(lineBreak);
		String userType = mailMap.get("userType").toString();
		if (userType.equals("0")) {
			sbContents.append(lineBreak);
			sbContents.append("Now you can register more members to your organization using the web console. Your organization's allowed number of members directly correlates to the number of KDCs registered. Additionally, your User ID counts as one member for your organization.").append(lineBreak);
		} else if (userType.equals("1")) {
			
		}
		sbContents.append(lineBreak);
		sbContents.append("Please refer to the <a href='http://koamtacon.com/product/documentation/'>KOAMTACON User Manual</a> for assistance or contact our support team at <a href='mailto:koamtacon@koamtac.com'>koamtacon@koamtac.com</a>.").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("Thank you and welcome!").append(lineBreak);
		sbContents.append(lineBreak);
		sbContents.append("The KOAMTACON Team").append(lineBreak);
		
		mailMap.put("contents", sbContents.toString());
		
		return mailMap;
	}
	
	@RequestMapping(value="/createMobileUserAsMember", method={RequestMethod.GET, RequestMethod.POST})
	public String createMobileUserAsMember(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
		log.debug("createMobileUserAsMember paramMap={}",paramMap);
		
		try {
			// MDC DB�� Mobile User �� Activation Code ����
			Map <String, String> mdcMap = wsApiService.createMobileUserAndActivationCode(paramMap);
			if (mdcMap != null && mdcMap.size() > 0) {
				userManagementService.updateUserInfo(mdcMap);
				if (this.sendHtmlMail(paramMap)) {
					model.addAttribute("flag", "success");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV029"));
				} else {
					model.addAttribute("flag", "fail");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV028"));
				}
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV010") + " " + MessageUtils.getMessage("MSG-SV047"));
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV010"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getBatchUserList", method={RequestMethod.GET, RequestMethod.POST})
	public String getBatchUserList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getBatchUserList paramMap={}",paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = userManagementService.getBatchUserList(paramMap);
		model.addAttribute("batchUserList", map.get("batchUserList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/createMobileUserBatch", method={RequestMethod.GET, RequestMethod.POST})
	public String createMobileUserBatch(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("createMobileUserBatch paramMap={}",paramMap);
		
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(tempUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(tempBakPath);
		
		//Map<String, Object> map = userManagementService.createMobileUserBatch(paramMap, multipartRequest, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit);
		Map<String, Object> map = userManagementService.createMobileUserBatchWithGroupCode(paramMap, multipartRequest, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit);
		model.addAttribute("msg", map.get("msg"));
		if (map.get("flag").toString().equals("1")) {
			model.addAttribute("flag", "success");
		} else {
			model.addAttribute("flag", "fail");
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/changeAsMember", method={RequestMethod.GET, RequestMethod.POST})
	public String changeAsMember(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("changeAsMember paramMap={}",paramMap);
		
		String curGroupCode = paramMap.get("curGroupCode");
		String newGroupCode = paramMap.get("groupCode");
		if (groupService.getDuplicatedGroupCount(paramMap) == 1) {
			Map<String, Object> userInfo = userManagementService.getUserInfo(paramMap);
			if (userInfo != null && !userInfo.isEmpty()
				&& userInfo.get("syncUser") != null && !userInfo.get("syncUser").toString().equals("")
				&& userInfo.get("deviceCode") != null && !userInfo.get("deviceCode").toString().equals("")
				) 
			{
				paramMap.put("deviceCode", userInfo.get("deviceCode").toString());
				paramMap.put("syncUser", userInfo.get("syncUser").toString());
				Map<String, Object> mobileUserInfo = mdcKoamtacService.getSyncUserByDeviceCode(paramMap);
				if (mobileUserInfo.get("groupCode") != null && mobileUserInfo.get("groupCode").toString().equals(curGroupCode)
					&& mobileUserInfo.get("deviceCode") != null && mobileUserInfo.get("deviceCode").toString().equals(userInfo.get("deviceCode").toString())
					&& mobileUserInfo.get("syncUser") != null && mobileUserInfo.get("syncUser").toString().equals(userInfo.get("syncUser").toString())
					) 
				{
					// find owner id
					String ownerId = userManagementService.getOwnerId(paramMap);
					// find mobile user info of owner id
					Map<String, String> ownerParamMap = new HashMap<String, String>();
					ownerParamMap.put("userId", ownerId);
					Map<String, Object> ownerInfo = userManagementService.getUserInfo(ownerParamMap);
					
					if (ownerInfo != null && !ownerInfo.isEmpty()
						&& ownerInfo.get("syncUser") != null && !ownerInfo.get("syncUser").toString().equals("")
						&& ownerInfo.get("deviceCode") != null && !ownerInfo.get("deviceCode").toString().equals("")
						) 
					{
						// find mobile group with owner id in MDC
						ownerParamMap.put("deviceCode", ownerInfo.get("deviceCode").toString());
						Map<String, Object> ownersMobileUserInfo = mdcKoamtacService.getSyncUserByDeviceCode(ownerParamMap);
						// compare mobile user info and user info of owner
						if (ownersMobileUserInfo.get("groupCode") != null && ownersMobileUserInfo.get("groupCode").toString().equals(newGroupCode)
							&& ownersMobileUserInfo.get("deviceCode") != null && ownersMobileUserInfo.get("deviceCode").toString().equals(ownerInfo.get("deviceCode").toString())
							&& ownersMobileUserInfo.get("syncUser") != null && ownersMobileUserInfo.get("syncUser").toString().equals(ownerInfo.get("syncUser").toString())
							) {
							// update group code of mobile user in MDC
							if (wsApiService.changeGroupCode(paramMap) == 1) {
								// delete previous group 
								Map<String, String> deleteMap = new HashMap<String, String>();
								deleteMap.put("area", paramMap.get("area"));
								deleteMap.put("groupCode", paramMap.get("curGroupCode"));
								deleteMap.put("userId", paramMap.get("userId"));
								userManagementService.deleteGroup(deleteMap);
								
								// update group code of tb_member table as new one
								Map<String, String> updateMap = new HashMap<String, String>();
								updateMap.put("area", paramMap.get("area"));
								updateMap.put("groupCode", paramMap.get("groupCode"));
								updateMap.put("userId", paramMap.get("userId"));
								userManagementService.updateGroupCodeByMember(updateMap);
								
								// update user type of tb_user as member
								userManagementService.updateUserTypeAsMember(updateMap);
								
								model.addAttribute("flag", "success");
								model.addAttribute("msg", MessageUtils.getMessage("MSG-SV077"));
							} else {
								model.addAttribute("flag", "fail");
								model.addAttribute("msg", MessageUtils.getMessage("MSG-SV078"));
							}
						} else {
							model.addAttribute("flag", "fail");
							model.addAttribute("msg", MessageUtils.getMessage("MSG-SV079"));
						}
					} else {
						model.addAttribute("flag", "fail");
						model.addAttribute("msg", MessageUtils.getMessage("MSG-SV080"));
					}
				} else {
					model.addAttribute("flag", "fail");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV081"));
				}
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV082"));
			}
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV083"));
		}
		
		
		return "jsonView";
	}
}