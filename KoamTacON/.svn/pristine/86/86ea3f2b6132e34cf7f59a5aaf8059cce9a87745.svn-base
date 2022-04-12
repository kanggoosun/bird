package com.aisolution.koamtacon.controller.mdc;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aisolution.koamtacon.service.mdc.MdcKoamtacService;
import com.aisolution.koamtacon.service.mdc.MdcKoamtacServiceImpl;

@Controller
@RequestMapping("/mdc/mdcKoamtac")
public class MdcKoamtacController {
	private static final Logger log = LoggerFactory.getLogger(MdcKoamtacServiceImpl.class);
	
	@Autowired
	private MdcKoamtacService mdcKoamtacService;
	
	@RequestMapping(value="/getSyncUser", method={RequestMethod.GET, RequestMethod.POST})
	public String getSyncUser(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("getSyncUser paramMap={}", paramMap);
		model.addAttribute("syncUserMap", mdcKoamtacService.getSyncUser(paramMap));
		return "jsonView";
	}
}
