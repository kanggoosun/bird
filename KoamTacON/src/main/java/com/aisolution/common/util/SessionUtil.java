package com.aisolution.common.util;

import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.model.SessionInfo;

public class SessionUtil {
	private static Logger log = LoggerFactory.getLogger(SessionUtil.class);
    
    private static final String KOAMTACON_SESSION_KEY = ConfigConstants.KOAMTACON_SESSION_KEY;
    
    /**
     * RequestContextHolder 를 통하여 HttpServletRequest 를 return 한다.
     * @param N/A
     * @return HttpServletRequest
     */
    public static HttpServletRequest getHttpServletRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
    
    /**
     * Session Locale 변경
     * @param locale
     * @param request
     * @param response
     * @param map
     */
    public static void changeLocale(String locale, HttpServletRequest request, HttpServletResponse response, ModelMap map) {
        HttpSession session = request.getSession();
        
        Locale locales = null;
        
        if (locale.matches("ko")) {
            locales = Locale.KOREAN;
        } else if (locale.matches("en")) {
            locales = Locale.ENGLISH;
        } else {
            locales = Locale.KOREAN;
        }
          
     // 세션에 존재하는 Locale을 새로운 언어로 변경해준다.
        session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locales);
    }
    
    /**
     * Set Parameter Session Information
     * @param paramMap
     * @return paramMap
     */
    public static Map<String, String> setSessionInfo(Map<String, String> paramMap) {
        SessionInfo sessionInfo = getSessionInfo();
        
        paramMap.put("__userId", sessionInfo.getUserId());
        paramMap.put("__email", sessionInfo.getEmail());
        paramMap.put("__name", sessionInfo.getName());
        paramMap.put("__phone", sessionInfo.getPhone());
        paramMap.put("__country", sessionInfo.getCountry());
        paramMap.put("__company", sessionInfo.getCompany());
        paramMap.put("__userType", sessionInfo.getUserType());
        paramMap.put("__userActivationYn", sessionInfo.getUserActivationYn());
        paramMap.put("__initialPwdYn", sessionInfo.getInitialPwdYn());
        
        paramMap.put("__groupCode", sessionInfo.getGroupCode());
        paramMap.put("__area", sessionInfo.getArea());
        
        RSA rsa = RSA.getEncKey();
        paramMap.put("publicKeyModulus", rsa.getPublicKeyModulus());
        paramMap.put("publicKeyExponent", rsa.getPublicKeyExponent());
        paramMap.put("__rsaPrivateKey__", rsa.getPrivateKey().toString());
        
        return paramMap;
    }
    
    /**
     * Login Check
     * @return
     */
    public static boolean isLogin() {
        HttpServletRequest request = getHttpServletRequest();
        
        return isLogin(request);
    }
    
    public static boolean isLogin(HttpServletRequest request) {
        if (getSessionInfo(request) == null ) {
            return false;
        } else {
            return true;
        }
    }
    
    /**
     * Get Session
     * @return
     */
    public static Object getSession() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getSession(request);
    }
    
    public static Object getSession(HttpServletRequest request) {
        Object obj =  null;
        HttpSession session = null;
        
        session = request.getSession(false);
        
        if (session != null) {
            obj = session.getAttribute(KOAMTACON_SESSION_KEY);
        }
        
        return obj;
    }
    
    /**
     * Set Session
     * @param sessionInfo
     */
    public static void setSession(SessionInfo sessionInfo) {
        HttpSession session = getHttpServletRequest().getSession();
        
        setSession(sessionInfo, session);
    }
    
    public static void setSession(SessionInfo sessionInfo, HttpSession session) {
    	sessionInfo.setLoginDate(new Date());
        
        session.setAttribute(KOAMTACON_SESSION_KEY, sessionInfo);
        
        log.debug("@@Front create user session!!");
    }
    
    /**
     * Get UserSessionInfo
     * @return
     */
    public static SessionInfo getSessionInfo() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getSessionInfo(request);
    }
    
    public static SessionInfo getSessionInfo(HttpServletRequest request) {
        if (getSession(request) == null)
            return null;
        
        return (SessionInfo) getSession(request);
    }
    
    /**
     * Get User Id
     * @return
     */
    public static String getUserId() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getUserId(request);
    }
    
    public static String getUserId(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getUserId() == null) ? "" : getSessionInfo(request).getUserId();
    }
    
    /**
     * Get User Email
     * @return
     */
    public static String getEmail() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getEmail(request);
    }
    
    public static String getEmail(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getEmail() == null) ? "" : getSessionInfo(request).getEmail();
    }
    
    /**
     * Get user name
     * @return
     */
    public static String getName() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getName(request);
    }
    
    public static String getName(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getName() == null) ? "" : getSessionInfo(request).getName();
    }
    
    /**
     * Get User Phone number
     * @return
     */
    public static String getPhone() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getPhone(request);
    }
    
    public static String getPhone(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getPhone() == null) ? "" : getSessionInfo(request).getPhone();
    }
    
    /**
     * Get User Country code
     * @return
     */
    public static String getCountry() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getCountry(request);
    }
    
    public static String getCountry(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getCountry() == null) ? "" : getSessionInfo(request).getCountry();
    }
    
    /**
     * Get User Type
     * @return
     */
    public static String getUserType() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getUserType(request);
    }
    
    public static String getUserType(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getUserType() == null) ? "" : getSessionInfo(request).getUserType();
    }
    
    /**
     * Get user activation_yn
     * @return
     */
    public static String getUserActivationYn() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getUserActivationYn(request);
    }
    
    public static String getUserActivationYn(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getUserActivationYn() == null) ? "" : getSessionInfo(request).getUserActivationYn();
    }
    
    /**
     * Get Initial_pwd_yn
     * @return
     */
    public static String getInitialPwdYn() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getInitialPwdYn(request);
    }
    
    public static String getInitialPwdYn(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getInitialPwdYn() == null) ? "" : getSessionInfo(request).getInitialPwdYn();
    }
    
    /**
     * Get Group Code
     * @return
     */
    public static String getGroupCode() {
        HttpServletRequest request = getHttpServletRequest();
        
        return getGroupCode(request);
    }
    
    public static String getGroupCode(HttpServletRequest request) {
        if (getSessionInfo(request) == null)
            return "";
        
        return (getSessionInfo(request).getGroupCode() == null) ? "" : getSessionInfo(request).getGroupCode();
    }
    
    /**
     * Remove Session
     */
    public static void removeSession() {
        HttpSession session = getHttpServletRequest().getSession(false);
        
        removeSession(session);
    }
    
    public static void removeSession(HttpSession session) {
        session.removeAttribute(KOAMTACON_SESSION_KEY);
        
        session.invalidate();
    }
}
