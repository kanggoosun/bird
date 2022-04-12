package com.aisolution.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.aisolution.common.model.SessionInfo;
import com.aisolution.common.service.CommonService;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.SessionUtil;

public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger log = LoggerFactory.getLogger(Interceptor.class);
	
	@Value("#{koamtacon_config['nocheck.session.url']}")
    public String noCheckSessionUrl;
	
	@Value("#{koamtacon_config['button.session.role']}")
    public String buttonSessionRole;
	
	@Autowired
	private CommonService commonService;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	//log.debug("preHandle");
    	
    	String ip = CommonUtils.getClientIP(request);
    	log.info("Client IP = [{}]", ip);
    	
        // No Session Check !!
        String requestUrl = request.getRequestURL().toString();
        String[] arrNoCheckSessionUrl = noCheckSessionUrl.split(",");
        
        String tmpUrl = "";
        if(requestUrl.indexOf(";") >= 0){
            String[] arrRequestUrl = requestUrl.split(";");
            tmpUrl = arrRequestUrl[0].substring(arrRequestUrl[0].lastIndexOf("/"));
        } else {
            tmpUrl = requestUrl.substring(requestUrl.lastIndexOf("/"));	
        }
        
        for( String target : arrNoCheckSessionUrl ){
            if(tmpUrl.equals(target)){ 
                return true;
            }
        }
        
        if (tmpUrl.indexOf(".css") >= 0
        	|| tmpUrl.indexOf(".js") >= 0
        	|| tmpUrl.indexOf(".png") >= 0
        	|| tmpUrl.indexOf(".jpg") >= 0
        	|| tmpUrl.indexOf(".gif") >= 0
        	|| tmpUrl.indexOf(".woff2") >= 0
        	|| tmpUrl.indexOf(".woff") >= 0
        	|| tmpUrl.indexOf(".ttf") >= 0
        	) {
        	return true;
        }
        
        SessionInfo userInfo = SessionUtil.getSessionInfo();
        if(userInfo == null || userInfo.getUserId() == null || "".equals(userInfo.getUserId())){
        	//log.debug("Signin Fail !!!");
        	String ajaxCall = (String)request.getHeader("AJAX");
        	if (ajaxCall != null && ajaxCall.equals("true")) {
        		response.setStatus(900);
        		request.setAttribute("lastRequestURI", request.getRequestURI());
        	} else {
        		request.setAttribute("lastRequestURI", request.getRequestURI());
            	StringBuffer sb = new StringBuffer();
            	sb.append(request.getContextPath()).append("/sign/signin");
            	RequestDispatcher dispatcher = request.getRequestDispatcher(sb.toString());
            	dispatcher.forward(request, response);
        	}
        	
        	return false;
        } else {
        	userInfo.setClientIP(ip);
        }
        
        return true;
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView model) throws Exception {
    	//log.debug("postHandle");
    	
    	if (model != null) {
	    	SessionInfo userInfo = SessionUtil.getSessionInfo();
	    	String allUrl = request.getRequestURI();
	    	String lastUrl = allUrl.substring(allUrl.lastIndexOf("/"));
	        if(userInfo != null){
	        	// jsp 화면에서 Session 값을 사용하기 위해 Setting !!
	        	model.addObject("__userId", CommonUtils.getValue(userInfo.getEmail()));
	            model.addObject("__email", CommonUtils.getValue(userInfo.getEmail()));
	            model.addObject("__name", CommonUtils.getValue(userInfo.getName()));
	            model.addObject("__phone", CommonUtils.getValue(userInfo.getPhone()));
	            model.addObject("__site", CommonUtils.getValue(userInfo.getSite()));
	            model.addObject("__country", CommonUtils.getValue(userInfo.getCountry()));
	            model.addObject("__userType", CommonUtils.getValue(userInfo.getUserType()));
	            model.addObject("__groupCode", CommonUtils.getValue(userInfo.getGroupCode()));
	            model.addObject("__signin", "Y");
	            //log.debug("__userType={}",model.getModel().get("__userType").toString());
	            //log.debug("__site={}",model.getModel().get("__site").toString());
	            //log.debug("__groupCode={}",model.getModel().get("__groupCode").toString());
	            userInfo.setGpAllUrl(allUrl);
	            userInfo.setGpLastUrl(lastUrl);
	        } else {
	        	model.addObject("__signin", "N");
	        }
	        
	        model.addObject("__requestURI", allUrl);
	        model.addObject("__lastRequestURI", lastUrl);
	        model.addObject("__versionQ", commonService.getVersionString());
	        model.addObject("__locale", LocaleContextHolder.getLocale().toString());
	        //log.debug("__requestURI={}",allUrl);
	        log.debug("__locale={}",LocaleContextHolder.getLocale().toString());
    	}
    }
    
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    	//log.debug("afterCompletion");
    }
}