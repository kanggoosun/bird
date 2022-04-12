package com.aisolution.koamtacon.controller.service;

import java.util.HashMap;
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
import com.aisolution.common.util.MessageUtils;
import com.aisolution.koamtacon.service.service.KDCService;

@Controller
@RequestMapping("/kdc")
public class KDCController {
	private static final Logger log = LoggerFactory.getLogger(KDCController.class);
	
	@Value("#{koamtacon_config['koamtacon.upload.base']}")
	private String uploadedBase;
	@Value("#{koamtacon_config['koamtacon.upload.kdc']}")
	private String kdcUploadPath;
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
	private KDCService kdcService;
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value="/registrationInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String registrationInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("registrationInfo paramMap={}", paramMap);
		String pageUrl = "";
		if (paramMap == null || paramMap.size() == 0) {
			model.addAttribute("flag", "fail");
			model.addAttribute("redirectMsg", MessageUtils.getMessage("MSG-SV001"));
			pageUrl = "redirect:/sign/signup";
		} else {
			String userId = paramMap.get("userId");
			String email = paramMap.get("email");
			if (userId.equals("") || email.equals("")) {
				model.addAttribute("flag", "fail");
				model.addAttribute("redirectMsg", MessageUtils.getMessage("MSG-SV001"));
				pageUrl = "redirect:/sign/signUp";
			} else {
				Map<String, String> cbParamMap = new HashMap<String, String>();
				cbParamMap.put("masterCode", "kdc_model");
				model.addAttribute("cbProductNameOptions", commonService.getComboCode(cbParamMap));
				model.addAttribute("flag", "success");
				model.addAttribute("userId", userId);
				model.addAttribute("email", "email");
				pageUrl = "/kdc/kdcRegistration";
			}
		}
		
		return pageUrl;
	}
	
	/*
	@RequestMapping(value="/registrationInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String registrationInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("registrationInfo paramMap={}", paramMap);
		String pageUrl = "";
		
		model = initUtil.initMenu(paramMap, model);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			model.addAttribute("auth", "Y");
			Map<String, String> cbParamMap = new HashMap<String, String>();
			cbParamMap.put("masterCode", "kdc_model");
			model.addAttribute("cbProductNameOptions", commonService.getComboCode(cbParamMap));
			pageUrl = "/kdc/kdcRegistration";
		} else {
			model.addAttribute("auth", "N");
			model.addAttribute("redirectMsg", "Authentication failed. You don't have permission for KDC Registration.");
			pageUrl = "redirect:/main";
		}
		log.debug("model={}", model);
		
		return pageUrl;
	}
	*/
	
	@RequestMapping(value="/getKDCList", method={RequestMethod.GET, RequestMethod.POST})
	public String getKDCList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getKDCList paramMap={}", paramMap);
		
		if (paramMap == null || paramMap.size() == 0) {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
		} else {
			String userId = paramMap.get("userId");
			String email = paramMap.get("email");
			if (userId.equals("") || email.equals("")) {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
			} else {
				int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
				paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
				Map<String, Object> map = kdcService.getKDCRegistrationList(paramMap);
				model.addAttribute("kdcList", map.get("kdcList"));
				model.addAttribute("pageInfo", map.get("pageInfo"));
				model.addAttribute("flag", "success");
			}
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/registKDC", method={RequestMethod.GET, RequestMethod.POST})
	public String registKDC(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("registKDC paramMap={}", paramMap);
		
		if (paramMap == null || paramMap.size() == 0) {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
		} else {
			String userId = paramMap.get("sUserId");
			String email = paramMap.get("sEmail");
			if (userId.equals("") || email.equals("")) {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
			} else {
				if (paramMap.get("serialNo") != null && !paramMap.get("serialNo").equals("")) {
					paramMap.put("userId", userId);
					paramMap.put("email", email);
					if (kdcService.checkSerialNoDuplcation(paramMap) == 0) {
						StringBuffer sbUploadPath = new StringBuffer();
						sbUploadPath.append(uploadedBase).append(kdcUploadPath);
						StringBuffer sbBakPath = new StringBuffer();
						sbBakPath.append(bakBase).append(kdcBakPath);
						if (kdcService.registKDC(paramMap, multipartRequest, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit)) {
							model.addAttribute("flag", "success");
							model.addAttribute("msg", MessageUtils.getMessage("MSG-SV041"));
							// mail to admin.
							String lineBreak = "\r\n";
							String sender = ConfigConstants.fromAddress;
							String receiver = ConfigConstants.fromAddress;
							String title = "[KoamtacON] KDC registration occured.";
							StringBuffer sbContents = new StringBuffer(); 
							sbContents.append("The customer below has registered 1 KDC product.").append(lineBreak).append(lineBreak);
							sbContents.append("Please review the above registration and proceed with the approval process.").append(lineBreak).append(lineBreak);
							sbContents.append("User ID: ").append(userId).append(lineBreak).append(lineBreak);
							sbContents.append("Thank you");
							mailService.sendMail(sender, receiver, title, sbContents.toString());
						} else {
							model.addAttribute("flag", "fail");
							model.addAttribute("msg", MessageUtils.getMessage("MSG-SV018"));
						}
					} else {
						model.addAttribute("flag", "fail");
						model.addAttribute("msg", MessageUtils.getMessage("MSG-SV050"));
					}
				} else {
					model.addAttribute("flag", "fail");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV049"));
				}
			}
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getKDCPhoto", method={RequestMethod.GET, RequestMethod.POST})
	public String getKDCPhoto(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getKDCPhoto paramMap={}", paramMap);
		
		if (paramMap == null || paramMap.size() == 0) {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
		} else {
			String userId = paramMap.get("userId");
			if (userId.equals("")) {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
			} else {
				model.addAttribute("flag", "success");
				model.addAttribute("kdcPhoto", kdcService.getKDCPhoto(paramMap));
			}
		}
		
		return "jsonView";
	}
	
	@Transactional
	@RequestMapping(value="/registKDCWithExcel", method={RequestMethod.GET, RequestMethod.POST})
	public String registKDCWithExcel(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("registKDCWithExcel paramMap={}", paramMap);
		
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(tempUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(tempBakPath);
		
		if (paramMap == null || paramMap.size() == 0) {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
		} else {
			String userId = paramMap.get("eUserId");
			String email = paramMap.get("eEmail");
			if (userId.equals("") || email.equals("")) {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV001"));
			} else {
				paramMap.put("userId", userId);
				paramMap.put("email", email);
				Map<String, Object> map = kdcService.registKDCWithExcel(paramMap, multipartRequest, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit);
				model.addAttribute("msg", map.get("msg"));
				if (map.get("flag").toString().equals("1")) {
					model.addAttribute("flag", "success");
					// mail to admin.
					String iSuccess = map.get("iSuccess").toString();
					if (Integer.parseInt(iSuccess) > 0) {
						String lineBreak = "\r\n";
						String sender = ConfigConstants.fromAddress;
						String receiver = ConfigConstants.fromAddress;
						String title = "[KoamtacON] KDC registration occured.";
						StringBuffer sbContents = new StringBuffer(); 
						sbContents.append("The customer below has registered ").append(iSuccess).append(" KDC product(s).").append(lineBreak).append(lineBreak);
						sbContents.append("Please review the above registration and proceed with the approval process.").append(lineBreak).append(lineBreak);
						sbContents.append("User ID: ").append(userId).append(lineBreak).append(lineBreak);
						sbContents.append("Thank you");
						 
						mailService.sendMail(sender, receiver, title, sbContents.toString());
					}
				} else {
					model.addAttribute("flag", "fail");
				}
			}
		}
		
		return "jsonView";
	}
}
