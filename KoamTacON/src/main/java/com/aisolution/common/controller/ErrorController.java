package com.aisolution.common.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aisolution.common.util.MessageUtils;

@Controller
@RequestMapping("/error")
public class ErrorController {
	private static final Logger log = LoggerFactory.getLogger(ErrorController.class);
	
	@RequestMapping(value="/error400", method={RequestMethod.GET, RequestMethod.POST})
	public String error400(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error400");
		errorLog(req);
		model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV058"));
		return "/error/error";
	}
	
	@RequestMapping(value="/error401", method={RequestMethod.GET, RequestMethod.POST})
	public String error401(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error401");
		errorLog(req);
		model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV058"));
		return "/error/error";
	}
	
	@RequestMapping(value="/error403", method={RequestMethod.GET, RequestMethod.POST})
	public String error403(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error403");
		errorLog(req);
		model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV058"));
		return "/error/error";
	}
	
	@RequestMapping(value="/error404", method={RequestMethod.GET, RequestMethod.POST})
	public String error404(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error404");
		errorLog(req);
		model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV058"));
		return "/error/error";
	}
	
	@RequestMapping(value="/error405", method={RequestMethod.GET, RequestMethod.POST})
	public String error405(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error405");
		String httpStatus = req.getAttribute("javax.servlet.error.status_code").toString();
		model.addAttribute("status", httpStatus);
		model.addAttribute("msg",  MessageUtils.getMessage("MSG-SV058"));
		return "/error/error";
	}
	
	@RequestMapping(value="/error500", method={RequestMethod.GET, RequestMethod.POST})
	public String error500(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error500");
		String httpStatus = req.getAttribute("javax.servlet.error.status_code").toString();
		model.addAttribute("status", httpStatus);
		model.addAttribute("msg", MessageUtils.getMessage("MSG-SV045") + " " + MessageUtils.getMessage("MSG-SV033"));
		return "/error/error";
	}
	
	@RequestMapping(value="/error502", method={RequestMethod.GET, RequestMethod.POST})
	public String error502(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error502");
		errorLog(req);
		model.addAttribute("msg", MessageUtils.getMessage("MSG-SV045") + " " + MessageUtils.getMessage("MSG-SV033"));
		return "/error/error";
	}
	
	@RequestMapping(value="/error503", method={RequestMethod.GET, RequestMethod.POST})
	public String error503(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("error503");
		errorLog(req);
		model.addAttribute("msg", MessageUtils.getMessage("MSG-SV045") + " " + MessageUtils.getMessage("MSG-SV033"));
		return "/error/error";
	}
	
	@RequestMapping(value="/throwable", method={RequestMethod.GET, RequestMethod.POST})
	public String throwable(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("throwable");
		errorLog(req);
		model.addAttribute("msg", MessageUtils.getMessage("MSG-SV002"));
		return "/error/error";
	}
	
	@RequestMapping(value="/exception", method={RequestMethod.GET, RequestMethod.POST})
	public String fexception(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest req) {
		log.debug("fexception");
		errorLog(req);
		model.addAttribute("msg", MessageUtils.getMessage("MSG-SV002"));
		return "/error/error";
	}
	
	private void errorLog(HttpServletRequest req) {
		log.debug("errorLog");
		
		log.info("Status code: {}", req.getAttribute("javax.servlet.error.status_code"));
		log.info("Message: {}", req.getAttribute("javax.servlet.error.message"));
		log.info("Exception type: {}", req.getAttribute("javax.servlet.error.exception_type"));
		log.info("Request URL: {}", req.getAttribute("javax.servlet.error.request_url"));
		log.info("Exception: {}", req.getAttribute("javax.servlet.error.exception"));
		log.info("Servlet name: {}", req.getAttribute("javax.servlet.error.servlet_name"));
	}
}
