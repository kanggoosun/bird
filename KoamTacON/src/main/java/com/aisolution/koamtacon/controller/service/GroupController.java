package com.aisolution.koamtacon.controller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

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
import com.aisolution.common.model.SessionInfo;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.InitUtil;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.common.util.SessionUtil;
import com.aisolution.koamtacon.service.service.GroupService;
import com.aisolution.koamtacon.service.service.KDCService;
import com.aisolution.koamtacon.service.service.SignService;

@Controller
@Transactional
@RequestMapping("/group")
public class GroupController {
	private static final Logger log = LoggerFactory.getLogger(GroupController.class);
	
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
	private GroupService groupService;
	@Autowired
	private SignService signService;
	@Autowired
	private KDCService kdcService;
	@Autowired
	private InitUtil initUtil;
	//@Autowired
	//private MailService mailService;
	
	@RequestMapping(value="/groupInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String groupInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("groupInfo paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/group/groupInfo";
	}
	
	@RequestMapping(value="/getGroupInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getGroupInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getGroupInfo paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		paramMap.put("userId", sessionInfo.getUserId());
		int approvalCnt = kdcService.getApprovalCount(paramMap);
		List<Map<String, Object>> groupInfoList = groupService.getGroupInfo(paramMap);
		model.addAttribute("approvalCnt", approvalCnt);
		model.addAttribute("groupInfoList", groupInfoList);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/createGroupByCustomer", method={RequestMethod.GET, RequestMethod.POST})
	public String createGroupByCustomer(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("createGroupByCustomer paramMap={}", paramMap);
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String userType = sessionInfo.getUserType();
		if (userType.equals("8") || userType.equals("9")) {
			paramMap.put("userId", sessionInfo.getUserId());
			paramMap.put("userType", sessionInfo.getUserType());
			paramMap.put("area", ConfigConstants.AREA);
			
			if (groupService.getGroupCount(paramMap) < 1) {
				paramMap.put("groupCode", CommonUtils.makeNextGroupCode(groupService.getMaxGroupCode(paramMap)));
				
				try {
					groupService.createGroup(paramMap);
					groupService.insertMember(paramMap);
					
					sessionInfo.setGroupCode(paramMap.get("groupCode"));
					model.addAttribute("flag", "success");
					model.addAttribute("groupInfoList", groupService.getGroupInfo(paramMap));
				} catch(Exception e) {
					log.error(e.getMessage());
					model.addAttribute("flag", "fail");
				}
			} else {
				model.addAttribute("flag", "exist");
			}
		} else {
			model.addAttribute("flag", "fail");
		}
		
		return "jsonView";
	}
	
	private Map<String, Object> insertMember(Map<String, String> paramMap) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			Map<String, String> memberParamMap = new HashMap<String, String>();
			memberParamMap.put("ownerId", sessionInfo.getUserId());
			memberParamMap.put("groupCode", paramMap.get("groupCode"));
			memberParamMap.put("area", paramMap.get("area"));
			memberParamMap.put("phone", paramMap.get("memberPhone"));
			log.debug("insertMember ::: area={},groupCode={}",memberParamMap.get("area"),memberParamMap.get("groupCode"));
			int nextMemberSeq = groupService.getNextMemberSeq(memberParamMap);
			StringBuffer sbMemberId = new StringBuffer();
			sbMemberId.append(sessionInfo.getUserId()).append(".").append(String.format("%03d", nextMemberSeq));
			//System.out.println("sbMemberId="+sbMemberId.toString());
			log.debug("insertMember ::: memberId={}", sbMemberId.toString());
			memberParamMap.put("userId", sbMemberId.toString());
			int iFlag = signService.isExist(memberParamMap);
			if (iFlag < 1) {
				String memberEmail = paramMap.get("memberEmail").toString();
				
				if (CommonUtils.isValidEmail(memberEmail)) {
					
					try {
						String tempPassword = CommonUtils.makeRandomString(8);
						String decPassword = CommonUtils.encryptSha512(tempPassword);
						String memberName = paramMap.get("memberName").toString();
						memberParamMap.put("decPassword", decPassword);
						memberParamMap.put("password", decPassword);
						memberParamMap.put("email", memberEmail);
						memberParamMap.put("name", memberName);
						memberParamMap.put("site", sessionInfo.getSite());
						memberParamMap.put("company", sessionInfo.getCompany());
						memberParamMap.put("cbCountry", sessionInfo.getCountry());
						memberParamMap.put("userType", "1");
						
						groupService.insertMember(memberParamMap);
						signService.insertSign(memberParamMap);
						
						//String title = "[KoamtacON] Member ID added.";
						StringBuffer sbContents = new StringBuffer();
						sbContents.append("The customer below added member.").append(" \r\n").append(" \r\n");
						sbContents.append("Owner ID: ").append(memberParamMap.get("ownerId")).append(" \r\n");
						sbContents.append("Member ID: ").append(sbMemberId.toString()).append(" \r\n").append(" \r\n");
						sbContents.append("Please proceed to the next step.").append(" \r\n").append(" \r\n");
						sbContents.append("Thank you");
												
						//mailService.sendMail(ConfigConstants.fromAddress, ConfigConstants.fromAddress, title, sbContents.toString());
						
						rtnMap.put("flag", "success");
						rtnMap.put("msg", MessageUtils.getMessage("MSG-SV059"));
					} catch(Exception e) {
						e.printStackTrace();
						log.error("exception class={}, exception={}",e.getClass(), e.getMessage());
						rtnMap.put("flag", "fail");
						rtnMap.put("msg", MessageUtils.getMessage("MSG-SV060"));
					}
				} else {
					rtnMap.put("flag", "fail");
					rtnMap.put("msg", MessageUtils.getMessage("MSG-SV061"));
				}
			} else {
				rtnMap.put("flag", "exist");
				rtnMap.put("msg", MessageUtils.getMessage("MSG-SV062"));
			}
		} else {
			rtnMap.put("flag", "fail");
			rtnMap.put("msg", MessageUtils.getMessage("MSG-SV063"));
		}
		
		return rtnMap;
	}
	
	@RequestMapping(value="/addMember", method={RequestMethod.GET, RequestMethod.POST})
	public String addMember(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("addMember paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			if (!sessionInfo.getCountry().equals("")) {
				paramMap.put("area", sessionInfo.getArea());
				paramMap.put("groupCode", sessionInfo.getGroupCode());
				Map<String, Object> map = insertMember(paramMap);
				groupService.updateUserArea(paramMap);
				model.addAttribute("flag", map.get("flag"));
				model.addAttribute("msg", map.get("msg"));
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV030"));
			}
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		
		return "jsonView";		
	}
	
	@RequestMapping(value="/getMemberList", method={RequestMethod.GET, RequestMethod.POST})
	public String getMemberList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getMemberList paramMap={}", paramMap);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			paramMap.put("ownerId", sessionInfo.getUserId());
			
			int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
			paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
			Map<String, Object> map = groupService.getGroupMember(paramMap);
			model.addAttribute("memberList", map.get("memberList"));
			model.addAttribute("pageInfo", map.get("pageInfo"));
			paramMap.put("userId", sessionInfo.getUserId());
			model.addAttribute("memberLimit", kdcService.getApprovalCount(paramMap));
			model.addAttribute("memberCnt", groupService.getGroupMemberCount(paramMap));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/addMemberWithExcel", method={RequestMethod.GET, RequestMethod.POST})
	public String addMemberWithExcel(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("addMemberWithExcel paramMap={}", paramMap);
		
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(tempUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(tempBakPath);
		
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		if (sessionInfo.getUserType().equals("0")) {
			if (!sessionInfo.getCountry().equals("")) {
				int added = 0;
				int dup = 0;
				int failed = 0;
				try {
					List<Map<String, String>> list = groupService.getMemberInfosFromExcel(paramMap, multipartRequest, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit);
					if (list != null && list.size() > 0) {
						paramMap.put("userId", sessionInfo.getUserId());
						int approvalCnt = kdcService.getApprovalCount(paramMap);
						paramMap.put("ownerId", sessionInfo.getUserId());
						int memberCnt = groupService.getGroupMemberCount(paramMap);
						int addableCnt = approvalCnt - memberCnt;
						String area = sessionInfo.getArea();
						String groupCode = sessionInfo.getGroupCode();
						log.debug("addMemberWithExcel ::: area={}, groupCode={}",area,groupCode);
						
						if (addableCnt >= list.size()) {
							Map<String, String> map = null;
							Map<String, Object> resultMap = null;
							StringBuffer sbDup = new StringBuffer();
							sbDup.append("Duplicated ID : ");
							StringBuffer sbFailed = new StringBuffer();
							sbFailed.append("Row with error : ");
							for(int i=0; i<list.size(); i++) {
								map = new HashMap<String, String>();
								map = list.get(i);
								
								String memberName = map.get("A").toString();
								String memberEmail = map.get("B").toString();
								String memberPhone = map.get("C").toString();
								log.debug("memberName={}, memberEmail={}, memberPhone={}", memberName, memberEmail, memberPhone);
								
								if (memberName == null || memberName.equals("")
										|| memberEmail == null || memberEmail.equals("")) {
									if (failed > 1) {
										sbFailed.append(", ");
									}
									sbFailed.append("[").append(map.get("A")).append("]");
									failed++;
								} else {
									String regexEmail = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
										
									if (!Pattern.matches(regexEmail, memberEmail)) {
										if (failed > 1) {
											sbFailed.append(", ");
										}
										sbFailed.append("[").append(map.get("A")).append("]");
										failed++;
									} else {
										map.put("area", area);
										map.put("groupCode", groupCode);
										map.put("memberName", memberName);
										map.put("memberEmail", memberEmail);
										map.put("memberPhone", memberPhone);
										map.put("site", sessionInfo.getSite());
										map.put("cbCountry", sessionInfo.getCountry());
										map.put("company", sessionInfo.getCompany());
										map.put("userId", sessionInfo.getUserId());
									
										resultMap = insertMember(map);
										groupService.updateUserArea(map);
										
										if (resultMap.get("flag").equals("success")) {
											added++;
										} else if (resultMap.get("flag").equals("exist")) {
											if (dup > 1) {
												sbDup.append(", ");
											}
											sbDup.append("[").append(memberName).append("]");
											dup++;
										} else {
											if (failed > 1) {
												sbFailed.append(", ");
											}
											sbFailed.append("[").append(memberName).append("]");
											failed++;
										}
									}
								}
							}
							model.addAttribute("flag", "success");
							StringBuffer sbMsg = new StringBuffer();
							if (added > 0) {
								sbMsg.append(MessageUtils.getMessage("MSG-SV066") + " ").append(String.valueOf(added));
								if (added > 1) {
									sbMsg.append(" "+MessageUtils.getMessage("MSG-SV064")+"</br>");
								} else {
									sbMsg.append(" "+MessageUtils.getMessage("MSG-SV065")+"</br>");
								}
							}
							if (dup > 0) {
								sbMsg.append(MessageUtils.getMessage("MSG-SV066") + " ").append(String.valueOf(dup));
								if (dup > 1) {
									sbMsg.append(" "+MessageUtils.getMessage("MSG-SV067")+"</br>");
								} else {
									sbMsg.append(" "+MessageUtils.getMessage("MSG-SV068")+"</br>");							
								}
								sbMsg.append(sbDup.toString()).append("</br>");
							}
							if (failed > 0) {
								sbMsg.append(MessageUtils.getMessage("MSG-SV066") + " ").append(String.valueOf(failed));
								if (failed > 1) {
									sbMsg.append(" "+MessageUtils.getMessage("MSG-SV069")+" </br>");
								} else {
									sbMsg.append(" "+MessageUtils.getMessage("MSG-SV070")+" </br>");
								}
								sbMsg.append(sbFailed.toString()).append("</br>");
							}
							model.addAttribute("flag", "success");
							model.addAttribute("msg", sbMsg.toString());
						} else {
							StringBuffer sbMsg = new StringBuffer();
							sbMsg.append(MessageUtils.getMessage("MSG-SV060")).append("</br>");
							sbMsg.append(MessageUtils.getMessage("MSG-SV071") + " ").append(String.valueOf(addableCnt)).append(" "+MessageUtils.getMessage("MSG-SV072")).append("</br>");
							sbMsg.append(MessageUtils.getMessage("MSG-SV073") + " ").append(String.valueOf(list.size())).append(" "+MessageUtils.getMessage("MSG-SV072"));
							model.addAttribute("flag", "fail");
							model.addAttribute("msg", sbMsg.toString());
						}
					} else {
						model.addAttribute("flag", "fail");
						model.addAttribute("msg", MessageUtils.getMessage("MSG-SV048"));
					}
				} catch(Exception e) {
					log.error(e.getMessage());
					model.addAttribute("flag", "fail");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV042"));
				}
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV030"));
			}
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV005"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/createGroup", method={RequestMethod.GET, RequestMethod.POST})
	public String createGroup(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("createGroup paramMap={}", paramMap);
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String userType = sessionInfo.getUserType();
		if (userType.equals("8") || userType.equals("9")) {
			if (groupService.getGroupCount(paramMap) < 1) {
				//paramMap.put("groupCode", CommonUtils.makeNextGroupCode(groupService.getMaxGroupCode(paramMap)));
				
				try {
					groupService.createGroup(paramMap);
					groupService.insertMember(paramMap);
					groupService.updateUserArea(paramMap);
					
					sessionInfo.setGroupCode(paramMap.get("groupCode"));
					model.addAttribute("flag", "success");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV022"));
					//model.addAttribute("groupInfoList", groupService.getGroupInfo(paramMap));
				} catch(Exception e) {
					log.error(e.getMessage());
					model.addAttribute("flag", "fail");
					model.addAttribute("msg", MessageUtils.getMessage("MSG-SV021"));
				}
			} else {
				model.addAttribute("flag", "exist");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV023"));
			}
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV032"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/updateGroupUsable", method={RequestMethod.GET, RequestMethod.POST})
	public String updateGroupUsable(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateGroupUsable paramMap={}", paramMap);
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String userType = sessionInfo.getUserType();
		if (userType.equals("8") || userType.equals("9")) {
			try {
				groupService.updateGroupUsable(paramMap);
				model.addAttribute("flag", "success");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV025"));
			} catch(Exception e) {
				log.error(e.getMessage());
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV024"));
			}
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV032"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateGroupArea", method={RequestMethod.GET, RequestMethod.POST})
	public String updateGroupArea(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateGroupUsable paramMap={}", paramMap);
		SessionInfo sessionInfo = SessionUtil.getSessionInfo();
		String userType = sessionInfo.getUserType();
		if (userType.equals("8") || userType.equals("9")) {
			try {
				groupService.updateGroupArea(paramMap);
				groupService.updateGroupMemberArea(paramMap);
				groupService.updateUserArea(paramMap);
				
				model.addAttribute("flag", "success");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV025"));
			} catch(Exception e) {
				log.error(e.getMessage());
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV024"));
			}
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV032"));
		}
		return "jsonView";
	}
}