package com.aisolution.koamtacon.controller.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aisolution.common.config.Config;

@Controller
@RequestMapping(value="/test")
public class TestController {
	private static final Logger log = LoggerFactory.getLogger(SignController.class);
	
	@Autowired
    private Config cfg;
	
	@RequestMapping(value="/amazon", method={RequestMethod.GET, RequestMethod.POST})
	public String amazon(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("amazon paramMap={}", paramMap);
		
		return "/test/amazon";
	}
	
	@RequestMapping(value="/longResponseTest", method={RequestMethod.GET, RequestMethod.POST})
	public String longResponseTest(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("longResponseTest paramMap={}", paramMap);
		log.debug("Start of test");
		
		int time = Integer.parseInt(paramMap.get("testTime"));
		try {
			Thread.sleep(time);
		} catch(InterruptedException e) {
			log.error("{}", e.getMessage());
		}
		
		log.debug("End of test");
		model.addAttribute("msg", "End of time test.");
		return "jsonView";
	}
	
	private static String devUser=null;
	
	@RequestMapping(value="/confTest", method={RequestMethod.GET, RequestMethod.POST})
	public String confTest(@RequestParam Map<String, String> paramMap, Model model) {
		log.debug("confTest paramMap={}", paramMap);
		devUser = cfg.getWsUsernameDev();
		String devUser1 = cfg.getWsUsernameDev();
		log.debug("devUser={}, devUser1={}", devUser, devUser1);
		return "jsonView";
	}

	public static void main(String[] args) {
		List<String> aList = new ArrayList<String>();
		List<String> bList = new ArrayList<String>();
		List<String> tList = new ArrayList<String>();
		
		aList.add("AAA");
		aList.add("AAB");
		aList.add("AAC");
		aList.add("AAD");
		
		bList.add("000");
		bList.add("002");
		bList.add("003");
		bList.add("00A");
		bList.add("00C");
		
		tList.add("000");
		tList.add("001");
		tList.add("002");
		tList.add("003");
		tList.add("004");
		tList.add("005");
		tList.add("006");
		tList.add("007");
		tList.add("008");
		tList.add("009");
		tList.add("00A");
		tList.add("00B");
		
		tList.removeAll(aList);
		tList.removeAll(bList);
		
		for(int i=0; i<tList.size(); i++) {
			System.out.println("tList["+i+"]="+tList.get(i));
		}
	}
}

