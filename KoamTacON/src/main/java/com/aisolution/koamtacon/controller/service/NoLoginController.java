package com.aisolution.koamtacon.controller.service;

import java.security.PrivateKey;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.model.SessionInfo;
import com.aisolution.common.service.CommonService;
import com.aisolution.common.service.MailService;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.InitUtil;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.common.util.RSA;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.service.service.NoLoginService;

@Controller
@RequestMapping("/noLogin")
public class NoLoginController {
	private static final Logger log = LoggerFactory.getLogger(NoLoginController.class);
	
	@Autowired
	private CommonService commonService;
	@Autowired
	private MailService mailService;
	@Autowired
	private NoLoginService noLoginService;
	@Autowired
	private InitUtil initUtil;
	@Autowired
	MessageSource messageSource;
	@Autowired
    SessionLocaleResolver localeResolver;

	
		
	@RequestMapping(value="/signin", method={RequestMethod.GET, RequestMethod.POST})
	public String signin(Model model, HttpServletRequest req) {
		log.debug("signin");
		model.addAttribute("listCountryCode", commonService.getComboCountry(""));
		return "/noLogin/signin";
	}
	
	@RequestMapping(value="/getSecurity", method={RequestMethod.GET, RequestMethod.POST})
	public String getSecurity(Model model, HttpServletRequest req) {
		log.debug("getSecurity");
		
		req.getSession().removeAttribute("__rsaPrivateKey__");
		RSA rsa = RSA.getEncKey();
		model.addAttribute("publicKeyModulus", rsa.getPublicKeyModulus());
		model.addAttribute("publicKeyExponent", rsa.getPublicKeyExponent());
		req.getSession().setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());
		log.debug("__rsaPrivateKey__={}",req.getSession().getAttribute("__rsaPrivateKey__"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/checkSign", method={RequestMethod.GET, RequestMethod.POST})
	public String checkSign(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.info("checkSign paramMap={}", paramMap);
		
		String loginFlag = "N";
		String strMsg = "";
		String userType = "";
		String initialPwdYn = "N";
		
		try {
			String encPassword = paramMap.get("encPassword");
			PrivateKey privateKey = (PrivateKey)req.getSession().getAttribute("__rsaPrivateKey__");
			String decPassword = RSA.decryptRsa(privateKey, encPassword);
			paramMap.put("decPassword", CommonUtils.encryptSha512(decPassword));
			log.debug("paramMap={}", paramMap);
			if (noLoginService.CanLogin(paramMap)){
				SessionInfo sessionInfo = SessionUtil.getSessionInfo();
				loginFlag = "Y";
				strMsg = MessageUtils.getMessage("MSG-SV103");
				userType = sessionInfo.getUserType();
				initialPwdYn = sessionInfo.getInitialPwdYn();
				if (initialPwdYn.equals("Y")) {
					StringBuffer sb = new StringBuffer();
					//sb.append("Login succesful!").append("\r\n");
					sb.append(MessageUtils.getMessage("MSG-SV104")).append("\r\n");
					sb.append(MessageUtils.getMessage("MSG-SV105")).append("\r\n");
					strMsg = sb.toString();
				}
				log.debug("Login succesful!");
			} else {
				loginFlag = "N";
				strMsg = MessageUtils.getMessage("MSG-SV106");
				
				log.debug("Login failed");
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			loginFlag = "N";
			strMsg = MessageUtils.getMessage("MSG-SV107");
			
			log.debug("Login failed");
		}
		model.addAttribute("LoginFlag", loginFlag);
		model.addAttribute("Msg", strMsg);
		model.addAttribute("userType", userType);
		model.addAttribute("initialPwdYn", initialPwdYn);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/signup", method={RequestMethod.GET, RequestMethod.POST})
	public String signup(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("signup paramMap={}", paramMap);
		
		model.addAttribute("listCountryCode", commonService.getComboCountry(""));
		
		req.getSession().removeAttribute("__rsaPrivateKey__");
		RSA rsa = RSA.getEncKey();
		model.addAttribute("publicKeyModulus", rsa.getPublicKeyModulus());
		model.addAttribute("publicKeyExponent", rsa.getPublicKeyExponent());
		req.getSession().setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());
		
		return "/noLogin/signup";
	}
	
	@RequestMapping(value="/isExist", method={RequestMethod.GET, RequestMethod.POST})
	public String isExist(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("isExist paramMap={}", paramMap);
		
		int isExist = noLoginService.isExist(paramMap);
		
		model.addAttribute("isExist", isExist);
		log.debug("model={}", model);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/useRequest", method={RequestMethod.GET, RequestMethod.POST})
	public String useRequest(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("useRequest paramMap={}", paramMap);
		
		String result = "";
		try {
			noLoginService.insertUser(paramMap);
			result = "success";
		} catch(Exception e) {
			result = "fail";
			log.error(e.getMessage());
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/insertSign", method={RequestMethod.GET, RequestMethod.POST})
	public String insertSign(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("insertSign paramMap={}", paramMap);
		
		String result = "";
		try {
			String encPassword = paramMap.get("encPassword");
			PrivateKey privateKey = (PrivateKey)req.getSession().getAttribute("__rsaPrivateKey__");
			String decPassword = RSA.decryptRsa(privateKey, encPassword);
			paramMap.put("decPassword", CommonUtils.encryptSha512(decPassword));
			
			noLoginService.insertSign(paramMap);
			result = "success";
		} catch(Exception e) {
			result = "fail";
			log.error(e.getMessage());
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/updateSign", method={RequestMethod.GET, RequestMethod.POST})
	public String updateSign(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateSign paramMap={}", paramMap);
		
		String result = "";
		try {
			noLoginService.updateSign(paramMap);
			result = "success";
		} catch(Exception e) {
			result = "fail";
			log.error(e.getMessage());
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/signout", method={RequestMethod.GET, RequestMethod.POST})
	public String signout(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("signout paramMap={}", paramMap);
		SessionUtil.removeSession();
		return "redirect:/noLogin/signin";
	}
	
	@RequestMapping(value="/userProfile", method={RequestMethod.GET, RequestMethod.POST})
	public String userProfile(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("userProfile paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("userId", sessionInfo.getUserId());
		
		Map<String, Object> infoMap = noLoginService.getUserProfile(paramMap);
		model.addAttribute("infoMap", infoMap);
		log.debug("country={}", CommonUtils.getValue(infoMap.get("country")));
		model.addAttribute("listCountryCode", commonService.getComboCountry(CommonUtils.getValue(infoMap.get("country"))));
		
		model = initUtil.initMenu(paramMap, model);
		
		req.getSession().removeAttribute("__rsaPrivateKey__");
		RSA rsa = RSA.getEncKey();
		model.addAttribute("publicKeyModulus", rsa.getPublicKeyModulus());
		model.addAttribute("publicKeyExponent", rsa.getPublicKeyExponent());
		req.getSession().setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());
		log.debug("__rsaPrivateKey__={}",req.getSession().getAttribute("__rsaPrivateKey__"));
		return "/noLogin/userProfile";
	}
	
	@RequestMapping(value="/resetPassword", method={RequestMethod.GET, RequestMethod.POST})
	public String resetPassword(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("resetPassword paramMap={}", paramMap);
		
		int flag = noLoginService.verifyUser(paramMap);
		
		if (flag == 1) {
			String newPassword = CommonUtils.makeRandomString(8);
			log.debug("newPassword={}",newPassword);
			try {
				paramMap.put("newPassword", CommonUtils.encryptSha512(newPassword));
				
				noLoginService.resetPassword(paramMap);
				
				String to = paramMap.get("email");
				String from = ConfigConstants.fromAddress;
				String subject = "Your personal information is changed.";
				StringBuffer sbContents = new StringBuffer();
				sbContents.append("Your password is changed to ").append(newPassword);
				try {
					mailService.sendMail(from, to, subject, sbContents.toString());
					model.addAttribute("flag", "success");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV054"));
				} catch(Exception e) {
					log.error("Send an email failed.");
					model.addAttribute("flag", "success");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV053"));
				}
			} catch(Exception e) {
				log.error(e.getMessage());
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV036"));
			}
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV036"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/changePassword", method={RequestMethod.GET, RequestMethod.POST})
	public String changePassword(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("changePassword paramMap={}", paramMap);
		
		String userId = paramMap.get("rUserId");
		paramMap.put("userId", userId);
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String encPassword = paramMap.get("encPassword");
		String encNewPassword = paramMap.get("encNewPassword");
		PrivateKey privateKey = (PrivateKey)req.getSession().getAttribute("__rsaPrivateKey__");
		try {
			String decPassword = RSA.decryptRsa(privateKey, encPassword);
			String decNewPassword = RSA.decryptRsa(privateKey, encNewPassword);
			paramMap.put("decPassword", CommonUtils.encryptSha512(decPassword));
			paramMap.put("decNewPassword", CommonUtils.encryptSha512(decNewPassword));
			
			if (noLoginService.CanLogin(paramMap)) {
				if (sessionInfo != null && sessionInfo.getUserId().equals(userId)) {
					try {
						noLoginService.changePassword(paramMap);
						model.addAttribute("flag", "success");
						model.addAttribute("msg", MessageUtils.getMessage("MSG-SV031"));
					} catch(Exception e) {
						log.error(e.getMessage());
						model.addAttribute("flag", "fail");
						model.addAttribute("msg", MessageUtils.getMessage("MSG-SV009"));
					}
				} else {
					model.addAttribute("flag", "fail");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV026"));
				}	
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV026"));
			}
			
		} catch(Exception e) {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV009"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/terms", method={RequestMethod.GET, RequestMethod.POST})
	public String terms(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest request) {
		log.debug("terms paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo != null && !sessionInfo.getUserId().equals("")) {
			model = initUtil.initMenu(paramMap, model);
		}
		
		return "/noLogin/terms";
	}
	
	@RequestMapping(value="/checkCountry", method={RequestMethod.GET, RequestMethod.POST})
	public String checkCountry(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest request) {
		log.debug("checkCountry paramMap={}", paramMap);
		
		Map<String, Object> map = noLoginService.getCountry(paramMap);
		model.addAttribute("continent", map.get("continent"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/checkUserInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String checkUserInfo(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest request) {
		log.debug("checkUserInfo paramMap={}", paramMap);
		
		int chk = noLoginService.verifyOwner(paramMap);
		if (chk > 0) {
			model.addAttribute("flag", "success");
		} else {
			model.addAttribute("flag", "fail");
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/barcode", method={RequestMethod.GET, RequestMethod.POST})
	public String barcode(Model model, HttpServletRequest req) {
		log.debug("barcode");
		
		return "/noLogin/barcode";
	}
	
	@RequestMapping(value="requestDemoAccount", method=RequestMethod.POST)
	public String requestDemoAccount(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest request) {
		log.debug("requestDemoAccount paramMap={}",paramMap);
		
		try {
			noLoginService.insertDemoAccount(paramMap);
		
			String from = ConfigConstants.fromAddress;
			String to = ConfigConstants.fromAddress;
			String subject = "[KoamtacON] Demo account has been requested.";
			StringBuffer sb = new StringBuffer();
			sb.append("The customer below requested a demo account.\r\n");
			sb.append("Name: ").append(paramMap.get("rName")).append("\r\n");
			sb.append("Email: ").append(paramMap.get("rEmail")).append("\r\n");
			sb.append("Company: ").append(paramMap.get("rCompany")).append("\r\n");
			sb.append("Country: ").append(paramMap.get("rCountry")).append("\r\n\r\n");
			sb.append("Please proceed with the account issue process.\r\n");
			String text = sb.toString();
			
			mailService.sendMail(from, to, subject, text);
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV056"));
		} catch(Exception e) {
			log.error("[ERROR] {}",e.getMessage());;
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV008"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/privacyPolicy", method={RequestMethod.GET, RequestMethod.POST})
	public String privacyPolicy(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest request) {
		log.debug("privacyPolicy paramMap={}", paramMap);
		
		return "/noLogin/privacyPolicy";
	}
}
