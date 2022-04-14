package com.aisolution.koamtacon.controller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.service.CommonService;
import com.aisolution.common.util.InitUtil;
import com.aisolution.common.util.MessageUtils;
import com.aisolution.koamtacon.service.service.ReservationManagementService;

@Controller
@RequestMapping("/manager/reservationManagement")
public class ReservationManagementController {
	private static final Logger log = LoggerFactory.getLogger(ReservationManagementController.class);

	@Value("#{koamtacon_config['koamtacon.upload.base']}")
	private String uploadedBase;
	@Value("#{koamtacon_config['koamtacon.upload.applications']}")
	private String applicationUploadPath;
	@Value("#{koamtacon_config['koamtacon.upload.file.size.limit']}")
	private long fileSizeLimit;
	
	@Value("#{koamtacon_config['koamtacon.bak.base']}")
	private String bakBase;
	@Value("#{koamtacon_config['koamtacon.bak.applications']}")
	private String applicationsBakPath;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private ReservationManagementService reservationManagementService;
	@Autowired
	private InitUtil initUtil;
	
	@RequestMapping(value="/menu", method={RequestMethod.GET, RequestMethod.POST})
	public String menu(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("menu paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/manager/menuManagement";
	}
	
	@RequestMapping(value="/getMenuList", method={RequestMethod.GET, RequestMethod.POST})
	public String getMenuList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getMenuList paramMap={}", paramMap);
		
		paramMap.put("division", "0");
		List<Map<String, Object>> orgList = reservationManagementService.getMenuListByDivision(paramMap);
		List<Map<String, Object>> menuList = reservationManagementService.makeTreeWithMenu(orgList);
		
		paramMap.put("division", "1");
		List<Map<String, Object>> orgList2 = reservationManagementService.getMenuListByDivision(paramMap);
		List<Map<String, Object>> menuList2 = reservationManagementService.makeTreeWithMenu(orgList2);
		
		menuList.addAll(menuList2);
		
		model.addAttribute("tblMenuList", menuList);
		return "jsonView";
	}
	
	@RequestMapping(value="/insertMenu", method={RequestMethod.GET, RequestMethod.POST})
	public String insertMenu(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertMenu paramMap={}", paramMap);
		
		try {
			if (paramMap.get("parentMenuSeq").equals("")) {
				paramMap.remove("parentMenuSeq");
			}
			reservationManagementService.insertMenu(paramMap);
			//model.addAttribute("menuList", reservationManagementService. getMenuList(paramMap));
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/updateMenu", method={RequestMethod.GET, RequestMethod.POST})
	public String updateMenu(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateMenu paramMap={}", paramMap);
		
		try {
			reservationManagementService.updateMenu(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getMenuInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getMenuInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getMenuInfo paramMap={}", paramMap);
		model.addAttribute("menuInfoMap", reservationManagementService.getMenuInfo(paramMap));
		return "jsonView";
	}
	
	@RequestMapping(value="/role", method={RequestMethod.GET, RequestMethod.POST})
	public String role(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("role paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/admin/roleManagement";
	}
	
	@RequestMapping(value="/insertRole", method={RequestMethod.GET, RequestMethod.POST})
	public String insertRole(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertRole paramMap={}", paramMap);
		try {
			reservationManagementService.insertRole(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateRole", method={RequestMethod.GET, RequestMethod.POST})
	public String updateRole(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateRole paramMap={}", paramMap);
		try {
			reservationManagementService.updateRole(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/getRoleList", method={RequestMethod.GET, RequestMethod.POST})
	public String getRoleList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getRoleList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.FIVE_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = reservationManagementService.getRoleList(paramMap);
		model.addAttribute("roleList", map.get("roleList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getRoleUserList", method={RequestMethod.GET, RequestMethod.POST})
	public String getRoleUserList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getRoleUserList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = reservationManagementService.getRoleUserList(paramMap);
		model.addAttribute("roleUserList", map.get("roleUserList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getUserList", method={RequestMethod.GET, RequestMethod.POST})
	public String getUserList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getUserList paramMap={}", paramMap);
		model.addAttribute("userList", reservationManagementService.getUserList(paramMap));
		return "jsonView";
	}
	
	@RequestMapping(value="/insertRoleUser", method={RequestMethod.GET, RequestMethod.POST})
	public String insertRoleUser(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertRoleUser paramMap={}", paramMap);
		try {
			reservationManagementService.insertRoleUser(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/deleteRoleUser", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteRoleUser(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("deleteRoleUser paramMap={}", paramMap);
		try {
			reservationManagementService.deleteRoleUser(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV034"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV012"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/getRoleMenuList", method={RequestMethod.GET, RequestMethod.POST})
	public String getRoleMenuList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getRoleMenuList paramMap={}", paramMap);
		
		paramMap.put("division", "1");
		List<Map<String, Object>> orgList = reservationManagementService.getRoleMenuList(paramMap);
		List<Map<String, Object>> menuList = reservationManagementService.makeTreeWithMenu(orgList);
		
		model.addAttribute("menuList", menuList);
		return "jsonView";
	}
	
	@RequestMapping(value="/getMenuListNotInRole", method={RequestMethod.GET, RequestMethod.POST})
	public String getMenuListNotInRole(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getMenuListNotInRole paramMap={}", paramMap);
		
		paramMap.put("division", "1");
		List<Map<String, Object>> orgList = reservationManagementService.getMenuListNotInRole(paramMap);
		List<Map<String, Object>> menuList = reservationManagementService.makeTreeWithMenu(orgList);
		
		model.addAttribute("tblMenuList", menuList);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/insertRoleMenu", method={RequestMethod.GET, RequestMethod.POST})
	public String insertRoleMenu(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertRoleMenu paramMap={}", paramMap);
		try {
			reservationManagementService.insertRoleMenu(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/deleteRoleMenu", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteRoleMenu(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("deleteRoleMenu paramMap={}", paramMap);
		try {
			reservationManagementService.deleteRoleMenu(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV034"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV012"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/code", method={RequestMethod.GET, RequestMethod.POST})
	public String code(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("code paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		return "/manager/codeManagement";
	}
	
	@RequestMapping(value="/getCodeMasterList", method={RequestMethod.GET, RequestMethod.POST})
	public String getCodeMasterList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getCodeMasterList paramMap={}", paramMap);
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = reservationManagementService.getCodeMasterList(paramMap);
		model.addAttribute("codeMasterList", map.get("codeMasterList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		return "jsonView";
	}
	
	@RequestMapping(value="/getCodeDetailList", method={RequestMethod.GET, RequestMethod.POST})
	public String getCodeDetailList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getCodeDetailList paramMap={}", paramMap);
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = reservationManagementService.getCodeDetailList(paramMap);
		model.addAttribute("codeDetailList", map.get("codeDetailList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		return "jsonView";
	}
	
	@RequestMapping(value="/checkCodeMasterDuplication", method={RequestMethod.GET, RequestMethod.POST})
	public String checkCodeMasterDuplication(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("checkCodeMasterDuplication paramMap={}", paramMap);
		model.addAttribute("flag", reservationManagementService.checkCodeMasterDuplication(paramMap));
		return "jsonView";
	}
	
	@RequestMapping(value="/insertCodeMaster", method={RequestMethod.GET, RequestMethod.POST})
	public String insertCodeMaster(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertCodeMaster paramMap={}", paramMap);
		try {
			reservationManagementService.insertCodeMaster(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateCodeMaster", method={RequestMethod.GET, RequestMethod.POST})
	public String updateCodeMaster(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateCodeMaster paramMap={}", paramMap);
		try {
			reservationManagementService.updateCodeMaster(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/insertCodeDetail", method={RequestMethod.GET, RequestMethod.POST})
	public String insertCodeDetail(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertCodeDetail paramMap={}", paramMap);
		try {
			reservationManagementService.insertCodeDetail(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateCodeDetail", method={RequestMethod.GET, RequestMethod.POST})
	public String updateCodeDetail(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateCodeDetail paramMap={}", paramMap);
		try {
			reservationManagementService.updateCodeDetail(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/application", method={RequestMethod.GET, RequestMethod.POST})
	public String application(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("application paramMap={}", paramMap);
		
		model = initUtil.initMenu(paramMap, model);
		
		Map<String, String> cbParamMap = new HashMap<String, String>();
		cbParamMap.put("masterCode", "file_type");
		model.addAttribute("cbFileTypeOptions", commonService.getComboCode(cbParamMap));
		cbParamMap = new HashMap<String, String>();
		cbParamMap.put("masterCode", "file_usage");
		model.addAttribute("cbFileUsageOptions", commonService.getComboCode(cbParamMap));
		log.debug("model={}",model);
		return "/manager/reservationManagement";
	}
	
	@RequestMapping(value="/getApplicationList", method={RequestMethod.GET, RequestMethod.POST})
	public String getApplicationList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getApplicationList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = reservationManagementService.getApplicationList(paramMap);
		model.addAttribute("applicationList", map.get("applicationList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getApplicationInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getApplicationInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getApplicationInfo paramMap={}", paramMap);
		model.addAttribute("applicationInfo", reservationManagementService.getApplicationInfo(paramMap));
		return "jsonView";
	}
	
	@RequestMapping(value="/insertApplication", method={RequestMethod.GET, RequestMethod.POST})
	public String insertApplication(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("insertApplication paramMap={}", paramMap);
		try {
			reservationManagementService.insertApplication(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateApplication", method={RequestMethod.GET, RequestMethod.POST})
	public String updateApplication(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateApplication paramMap={}", paramMap);
		try {
			reservationManagementService.updateApplication(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/insertApplicationFiles", method={RequestMethod.GET, RequestMethod.POST})
	public String insertApplicationFiles(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("insertApplicationFiles paramMap={}", paramMap);
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(applicationUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(applicationsBakPath);
		
		if (reservationManagementService.insertFiles(paramMap, multipartRequest, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit)) {
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateApplicationFiles", method={RequestMethod.GET, RequestMethod.POST})
	public String updateApplicationFiles(@RequestParam Map<String, String> paramMap, Model model, MultipartRequest multipartRequest) {
		log.debug("updateApplicationFiles paramMap={}", paramMap);
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(applicationUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(applicationsBakPath);
		
		if (reservationManagementService.updateFiles(paramMap, multipartRequest, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit)) {
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} else {
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/updateApplicationFilesWithNofile", method={RequestMethod.GET, RequestMethod.POST})
	public String updateApplicationFilesWithNofile(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("updateApplicationFilesWithNofile paramMap={}", paramMap);
		try {
			reservationManagementService.updateFilesWithNoFile(paramMap);
			model.addAttribute("flag", "success");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV037"));
		} catch(Exception e) {
			log.error(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV015"));
		}
		return "jsonView";
	}
	
	@RequestMapping(value="/getApplicationFileList", method={RequestMethod.GET, RequestMethod.POST})
	public String getApplicationFileList(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getApplicationFileList paramMap={}", paramMap);
		
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		paramMap.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		Map<String, Object> map = reservationManagementService.getFileList(paramMap);
		model.addAttribute("fileList", map.get("fileList"));
		model.addAttribute("pageInfo", map.get("pageInfo"));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/getApplicationFileInfo", method={RequestMethod.GET, RequestMethod.POST})
	public String getApplicationFileInfo(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getApplicationFileInfo paramMap={}", paramMap);
		model.addAttribute("fileInfo", reservationManagementService.getFileInfo(paramMap));
		return "jsonView";
	}
	
	@RequestMapping(value="/deleteApplicationFiles", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteApplicationFiles(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("deleteApplicationFiles paramMap={}", paramMap);
		try {
			StringBuffer sbUploadPath = new StringBuffer();
			sbUploadPath.append(uploadedBase).append(applicationUploadPath);
			if (reservationManagementService.deleteFiles(paramMap, sbUploadPath.toString())) {
				model.addAttribute("flag", "success");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV007"));
			} else {
				model.addAttribute("flag", "fail");
				model.addAttribute("msg", MessageUtils.getMessage("MSG-SV011"));
			}
		} catch(Exception e) {
			log.debug(e.getMessage());
			model.addAttribute("flag", "fail");
			model.addAttribute("msg", MessageUtils.getMessage("MSG-SV011"));
		}
		return "jsonView";
	}
}
