package com.aisolution.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.aisolution.common.config.ConfigConstants;

public final class CommonUtils {
	private static final Logger log = LoggerFactory.getLogger(CommonUtils.class);
	
	@Autowired
	MessageSource messageSource;
	@Autowired
    SessionLocaleResolver localeResolver;
	
	/**
	 * return empty string for null value
	 * @param value
	 * @return
	 */
	public static String getValue(String value) {
		String defValue = "";
		if (value != null) {
			defValue = value;
		}
		
		return defValue;
	}
	public static String getValue(Object value) {
		String defValue = "";
		if (value != null) {
			defValue = value.toString();
		}
		
		return defValue;
	}
	
	/**
	 * return default empty string for null value
	 * @param value
	 * @param defValue
	 * @return
	 */
	public static String getValue(String value, String defValue) {
		if (value == null) {
			if (defValue == null) {
				defValue = "";
			}
		} else {
			defValue = value;
		}
		
		return defValue;
	}
	
	public static String getValue(Object value, String defValue) {
		if (value == null) {
			if (defValue == null) {
				defValue = "";
			}
		} else {
			defValue = value.toString();
		}
		
		return defValue;
	}
	
	public static List<String> makeAvailableGroupCodeList() {
		List<String> rtnList = new ArrayList<String>();
		
		String curGroupCode = "000";
		String newGroupCode = "";
		rtnList.add(curGroupCode);
		while(true) {
			newGroupCode = makeNextGroupCode(curGroupCode);
			rtnList.add(newGroupCode);
			if (newGroupCode.equals("9ZZ")) {
				break;
			}
			curGroupCode = newGroupCode;
		}
		
		return rtnList;
	}
	
	public static String makeNextGroupCode(String currentCode) {
		if (currentCode == null) {
			return "0";
		}
		
		if (currentCode.equals("9ZZ")) {
			return null;
		}
		
		char[] newCode = {'0','0','0'};
		char[] chars = currentCode.toCharArray();
		
		newCode[2] = getNextChar(chars[2]);
		
		if (newCode[2] == '0') {
			newCode[1] = getNextChar(chars[1]);
			if (newCode[1] == '0') {
				newCode[0] = getNextChar(chars[0]);
			} else {
				newCode[0] = chars[0];
			}
		} else {
			newCode[1] = chars[1];
			newCode[0] = chars[0];
		}
		
		return String.valueOf(newCode);
	}
	
	private static char getNextChar(char ch) {
		char rtnCh = '0';
		
		if ((int)ch >= 48 && (int)ch < 57) {
			rtnCh = (char)((int)ch + 1);
		} else if ((int)ch == 57) { // 0 to 9 : numeric
			rtnCh = 'A';
		} else if ((int)ch >= 65 && (int)ch < 90) { // A to Z upper case letter
			rtnCh = (char)((int)ch + 1);
		} else if ((int)ch == 90) {
			rtnCh = '0';
		}
		
		return rtnCh;
	}
	
	/*
	private static char getNextChar(char ch) {
		char rtnCh = '0';
		
		if ((int)ch >= 48 && (int)ch < 57) {
			rtnCh = (char)((int)ch + 1);
		} else if ((int)ch == 57) { // 0 to 9 : numeric
			rtnCh = 'a';
		} else if ((int)ch >= 97 && (int)ch <= 122) { // a to z lower case letter
			rtnCh = (char)((int)ch - 32);
		} else if ((int)ch >= 65 && (int)ch < 90) { // A to Z upper case letter
			rtnCh = (char)((int)ch + 32 + 1);
		} else if ((int)ch == 90) {
			rtnCh = '0';
		}
		
		return rtnCh;
	}
	*/
	
	public static String makeRandomString(int strLength) {
		
		String[] seedsAlp = {
				"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
	          , "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
		};
		
		String[] seedsNum = {
				"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
		};
		
		String[] seedsSp = {"!", "@", "#", "$", "%", "^", "&", "*", "?", "_", "~"};
		
		Random gen = new Random();
		StringBuffer sbRandom = new StringBuffer();
		for(int i=0; i<strLength-2; i++) {
			sbRandom.append(seedsAlp[gen.nextInt(51)]);
		}
		
		sbRandom.append(seedsNum[gen.nextInt(9)]);
		sbRandom.append(seedsSp[gen.nextInt(10)]);
		
		return sbRandom.toString();
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static String setRedirectMsg(Map<String, String> paramMap) {
		if (paramMap.get("redirectMsg") != null && !paramMap.get("redirectMsg").equals("") && !paramMap.get("redirectMsg").equals("undefined"))
			return paramMap.get("redirectMsg").toString();
		return "";
	}
	
	public static String getMenuHtml(List<Map<String, Object>> menuList, String userType, String groupCode) {
		StringBuffer rtnSb = new StringBuffer();
		
		String uri = "";
		String menuType = "";
		String openerClass = "";
		String menuName = "";
		int menuLevel = -1;
		int prevMenuLevel = 0;
		String useYn = "";
		StringBuffer sbNoEndTag = new StringBuffer();
		Map<String, Object> menuMap = null;
		int inx = 0;
		
		rtnSb.append("<div id=\"myTopnav\" class=\"nav container\">");
		for(int i=0; i<menuList.size(); i++) {
			menuMap = menuList.get(i);
			menuType = menuMap.get("menuType").toString();
			if (menuType.equals("1") && (userType.equals("1") || userType.equals("3"))) {
				continue;
			}
			if (menuType.equals("3") && userType.equals("3")) {
				continue;
			}
			
			if ((groupCode == null || groupCode.equals("")) && menuType.equals("2")) {
				continue;
			}
			
			menuLevel = Integer.parseInt(menuMap.get("menuLevel").toString());
			useYn = menuMap.get("useYn").toString();
			if (menuLevel > 0 && useYn.equals("Y")) {
				uri = menuMap.get("uri").toString();
				openerClass = menuMap.get("openerClass").toString();
				String tmpString = menuMap.get("menuName").toString();
				tmpString = tmpString.replaceAll(" ", "").toUpperCase();
				log.debug("tmpString="+tmpString);
				menuName = MessageUtils.getMessage("MENU-"+tmpString);
				log.debug("menuName="+menuName);
				
				if (openerClass != null && !openerClass.equals("")) {
					if (sbNoEndTag.length() > 0 && inx < i) {
						rtnSb.append("</div></div>");
						sbNoEndTag.setLength(sbNoEndTag.length()-1);
					}
					rtnSb.append("<div class=\"dropdown\">");
					rtnSb.append("<a class=\"dropbtn\">").append(menuName).append("</a>");
					rtnSb.append("<div class=\"dropdown-content\">");
					sbNoEndTag.append("e");
					inx = i;
				} else {
					if (menuLevel == 1) {
						if (sbNoEndTag.length() > 0 && inx < i) {
							rtnSb.append("</div></div>");
							sbNoEndTag.setLength(sbNoEndTag.length()-1);
						}
						rtnSb.append("<a href=\"").append(uri).append("\">").append(menuName).append("</a>");
					} else {
						if (menuLevel == prevMenuLevel) {
							rtnSb.append("<a href=\"").append(uri).append("\">").append(menuName).append("</a>");
						} else {
							if (sbNoEndTag.length() > 0 && inx < i && prevMenuLevel > menuLevel) {
								rtnSb.append("</div></div>");
								sbNoEndTag.setLength(sbNoEndTag.length()-1);
							}
							rtnSb.append("<a href=\"").append(uri).append("\">").append(menuName).append("</a>");
						}
					}
				}
			}
			prevMenuLevel = menuLevel;
		}
		if (sbNoEndTag.length() > 0) {
			rtnSb.append("</div></div>");
		}
		rtnSb.append("<a href=\"javascript:void(0);\" class=\"icon\" onclick=\"myFunction();\">&#9776;</a></div>");
		
		return rtnSb.toString();
	}
	
	/*
	public static String getMenuHtml(List<Map<String, Object>> menuList, String userType) {
		StringBuffer rtnSb = new StringBuffer();
		
		String uri = "";
		String menuType = "";
		String openerClass = "";
		String menuName = "";
		int menuLevel = -1;
		int prevMenuLevel = 0;
		String useYn = "";
		StringBuffer sbNoEndTag = new StringBuffer();
		Map<String, Object> menuMap = null;
		int inx = 0;
		//rtnSb.append("<nav id=\"menu\"><header class=\"major\"><h2>Menu</h2></header><ul>");
		rtnSb.append("<nav id=\"menu\"><ul>");
		for(int i=0; i<menuList.size(); i++) {
			menuMap = menuList.get(i);
			menuType = menuMap.get("menuType").toString();
			if (menuType.equals("1") && userType.equals("1")) {
				continue;
			}
			
			menuLevel = Integer.parseInt(menuMap.get("menuLevel").toString());
			useYn = menuMap.get("useYn").toString();
			if (menuLevel > 0 && useYn.equals("Y")) {
				uri = menuMap.get("uri").toString();
				openerClass = menuMap.get("openerClass").toString();
				menuName = menuMap.get("menuName").toString();
				
				if (openerClass != null && !openerClass.equals("")) {
					if (sbNoEndTag.length() > 0 && inx < i) {
						rtnSb.append("</ul></li>");
						sbNoEndTag.setLength(sbNoEndTag.length()-1);
					}
					rtnSb.append("<li><span class=\"").append(openerClass).append(" opener\">").append(menuName).append("</span><ul>");
					sbNoEndTag.append("e");
					inx = i;
				} else {
					if (menuLevel == 1) {
						if (sbNoEndTag.length() > 0 && inx < i) {
							rtnSb.append("</ul></li>");
							sbNoEndTag.setLength(sbNoEndTag.length()-1);
						}
						rtnSb.append("<li><a href=\"").append(uri).append("\"><span>").append(menuName).append("</span></a></li>");
					} else {
						if (menuLevel == prevMenuLevel) {
							rtnSb.append("<li><a href=\"").append(uri).append("\">").append(menuName).append("</a></li>");
						} else {
							if (sbNoEndTag.length() > 0 && inx < i && prevMenuLevel > menuLevel) {
								rtnSb.append("</ul></li>");
								sbNoEndTag.setLength(sbNoEndTag.length()-1);
							}
							rtnSb.append("<li><a href=\"").append(uri).append("\">").append(menuName).append("</a></li>");
						}
					}
				}
			}
			prevMenuLevel = menuLevel;
		}
		if (sbNoEndTag.length() > 0) {
			rtnSb.append("</ul></li>");
		}
		rtnSb.append("</ul></nav>");
		
		return rtnSb.toString();
	}
	*/
	
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		//log.debug("X-Forwarded-For : {}",ip);
		
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Proxy-client-IP");
			//log.debug("Proxy-client-IP : {}",ip);
		}
		if (ip == null || ip.length() == 0) { // weblogic
			ip = request.getHeader("WL-Proxy-Client-IP");
			//log.debug("WL-Proxy-Client-IP : {}",ip);
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("HTTP_CLIENT_IP");
			//log.debug("HTTP_CLIENT_IP : {}",ip);
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			//log.debug("HTTP_X_FORWARDED_FOR : {}",ip);
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
			//log.debug("getRemoteAddr : {}",ip);
		}
		
		return ip;
	}
	
	public static byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() %2 != 0) {
			return new byte[]{};
		}
		
		byte[] bytes = new byte[hex.length()/2];
		for (int i=0; i<hex.length(); i += 2) {
			byte value = (byte)Integer.parseInt(hex.substring(i,  i+2), 16);
			bytes[(int)Math.floor(i/2)] = value;
		}
		return bytes;
	}
	
	public static String encryptSha512(String srcString) throws NoSuchAlgorithmException {
		StringBuffer sb = new StringBuffer();
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		
		md.update(srcString.getBytes());
		byte[] byteMsg = md.digest();
		
		for(int i=0; i<byteMsg.length; i++) {
			byte tmp = byteMsg[i];
			String str = Integer.toHexString(new Byte(tmp));
			while(str.length()<2) {
				str = "0" + str;
			}
			str = str.substring(str.length()-2);
			sb.append(str);
		}
		//String tmp = DigestUtils.sha512Hex(srcString);
		return sb.toString();
	}
	
	public static Map<String, String> getPageInfo(Map<String, String> paramMap, int listCount) {
		Map<String, String> map = new HashMap<String, String>();
		
		int curPage = paramMap.get("curPage") == null ? 1 : Integer.parseInt(paramMap.get("curPage"));
		int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
		int totalPages = (int)Math.ceil((double) listCount / itemNoPerPage);
		String callFunction = paramMap.get("callFunction");
		log.debug("listCount={},curPage={},totalPages={},listCount / itemNoPerPage={}",listCount,curPage,totalPages,listCount / itemNoPerPage);
		map.put("totalCount", String.valueOf(listCount));
		map.put("curPage", String.valueOf(curPage));
		map.put("itemNoPerPage", String.valueOf(itemNoPerPage));
		map.put("totalPages", String.valueOf(totalPages));
		map.put("paginationHtml", getPaginationHtml(curPage, itemNoPerPage, totalPages, listCount, callFunction));
		
		return map;
	}
	
	public static String getPaginationHtml(int curPage, int itemNoPerPage, int totalPages, int totalCount, String callFunction) {
		StringBuffer sbPageHtml = new StringBuffer();
		
		int startNo = 0;
		int endNo = 0;
		int blockCount = ConfigConstants.PAGE_NO_PER_BLOCK;
		
		int tempBlock = totalPages % blockCount;
		int totalBlockCount = tempBlock == 0 ? (int)(totalPages/blockCount):(int)(Math.ceil(totalPages/blockCount));
		//int totalBlockCount = tempBlock == 0 ? (int)(totalPages/blockCount):tempBlock;
		
		startNo = (int)Math.floor((curPage-1)/blockCount)*blockCount+1;
		if (startNo+blockCount > totalPages) {
			//endNo = totalPages-1;
			endNo = totalPages;
		} else {
			endNo = startNo+blockCount-1;
		}
		log.debug("tempBlock={},startNo={},endNo={},blockCount={}",tempBlock,startNo,endNo,blockCount);
		//int prevBlockPage = (int)Math.floor((startNo-1)/blockCount)*blockCount;
		int prevBlockPage = startNo-1;
		/*
		log.debug("prevBlockPage={}",prevBlockPage);
		if (prevBlockPage == curPage) {
			prevBlockPage = prevBlockPage - blockCount;
		}
		*/
		//int nextBlockPage = ((int)(Math.ceil(endNo/blockCount)))*blockCount+1;
		int nextBlockPage = endNo+1;
		/*
		log.debug("nextBlockPage={}",nextBlockPage);
		if (nextBlockPage == curPage) {
			nextBlockPage = nextBlockPage + blockCount;
		}
		*/
		double tmp = curPage/blockCount;
		int endOfBlock = (int)(Math.ceil(curPage/(double)blockCount));
		log.debug("totalBlockCount={}, prevBlockPage={},nextBlockPage={},endOfBlock={},Math.ceil(curPage/blockCount)={}",totalBlockCount,prevBlockPage,nextBlockPage,endOfBlock,tmp);
		
		if (totalCount > itemNoPerPage) {
			sbPageHtml.append("        <ul class=\"pagination\">");
			
			sbPageHtml.append("            <li>");
			if (curPage > blockCount) {
				sbPageHtml.append("            <a href=\"javascript:gfn_movePage(").append(String.valueOf(prevBlockPage)).append(",").append(callFunction).append(");\" class=\"button\">&lt;&lt;</a>");
			} else {
				sbPageHtml.append("            <span class=\"button disabled\">&lt;&lt;</span>");
			}
			sbPageHtml.append("            </li>");
			
			sbPageHtml.append("            <li>");
			if (curPage > 1) {
				sbPageHtml.append("            <a href=\"javascript:gfn_movePage(").append(String.valueOf(curPage-1)).append(",").append(callFunction).append(");\" class=\"button\">&lt;</a>");
			} else {
				sbPageHtml.append("            <span class=\"button disabled\">&lt;</span>");
			}
			sbPageHtml.append("            </li>");
			
			for(int i=startNo; i<=endNo; i++) {
				sbPageHtml.append("        <li>");
				if (i==curPage) {
					sbPageHtml.append("        <a href=\"#\" class=\"page active\">").append(String.valueOf(i)).append("</a>");
				} else {
					sbPageHtml.append("        <a href=\"javascript:gfn_movePage(").append(String.valueOf(i)).append(",").append(callFunction).append(");\" class=\"page\">").append(String.valueOf(i)).append("</a>");
				}
				sbPageHtml.append("        </li>");
			}
			
			sbPageHtml.append("            <li>");
			if (curPage < totalPages) {
				sbPageHtml.append("            <a href=\"javascript:gfn_movePage(").append(String.valueOf(curPage+1)).append(",").append(callFunction).append(");\" class=\"button\">&gt;</a>");
			} else {
				sbPageHtml.append("            <span class=\"button disabled\">&gt;</span>");
			}
			sbPageHtml.append("            </li>");
			
			sbPageHtml.append("            <li>");
			if (endOfBlock <= totalBlockCount) {
				sbPageHtml.append("            <a href=\"javascript:gfn_movePage(").append(String.valueOf(nextBlockPage)).append(",").append(callFunction).append(");\" class=\"button\">&gt;&gt;</a>");
			} else {
				sbPageHtml.append("            <span class=\"button disabled\">&gt;&gt;</span>");
			}
			sbPageHtml.append("            </li>");
			
			sbPageHtml.append("        </ul>");
		}
		return sbPageHtml.toString();
	}
	
	public static boolean isValidEmail(String email) {
		boolean err = false;
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);
		if(m.matches()) {
			err = true;
		}
		return err;
	}
	
	public static String getToday() {
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
		String dt = sdf.format(date);
		
		return dt;
	}
	
	public static Map<String, Object> setParams(Map<String, String> paramMap) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		if (paramMap != null && !paramMap.isEmpty()) {
			Iterator<String> iter = paramMap.keySet().iterator();
			while(iter.hasNext()) {
				String key = (String)iter.next();
				rtnMap.put(key, paramMap.get(key));
			}
		}
		
		return rtnMap;
	}
	
	public static Map<String, Object> setParamsWithPaging(Map<String, String> paramMap) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		if (paramMap != null && !paramMap.isEmpty()) {
			int itemNoPerPage = paramMap.get("itemNoPerPage") == null ? ConfigConstants.TEN_ITEMS_NO_PER_PAGE : Integer.parseInt(paramMap.get("itemNoPerPage"));
			int curPage = Integer.parseInt(paramMap.get("curPage"));
			int offset = itemNoPerPage * (curPage - 1);
			rtnMap.put("itemNoPerPage", itemNoPerPage);
			rtnMap.put("offset", offset);
			
			Iterator<String> iter = paramMap.keySet().iterator();
			while(iter.hasNext()) {
				String key = (String)iter.next();
				rtnMap.put(key, paramMap.get(key));
			}
		}
		
		return rtnMap;
	}
	
	public static void main(String[] args) {
		try {
			String str = getToday();
			System.out.println(str);
		}catch(Exception e){
			e.getMessage();
		}
		
		
	}
}
