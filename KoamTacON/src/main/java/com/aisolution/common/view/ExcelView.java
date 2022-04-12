package com.aisolution.common.view;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ExcelView extends AbstractExcelView {
    private static final Logger log = LoggerFactory.getLogger(ExcelView.class);
    
    private static final String EXTENSION = ".xls";
    
    @SuppressWarnings("unchecked")
	@Override
    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception{
        List<Map<String, Object>> list = (List<Map<String, Object>>)model.get("list");
        List<String> keyList = (List<String>)model.get("keyList");
        List<String> colNameList = (List<String>)model.get("colNameList");
        Map<String, Object> paramMap = (Map<String, Object>)model.get("paramMap");
        
        //log.debug("buildExcelDocument paramMap={}",paramMap);
        //log.debug("buildExcelDocument list={}",list);
        
        StringBuffer sbFilename = new StringBuffer();
        sbFilename.append(paramMap.get("filename").toString()).append("-").append(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())).append(EXTENSION);
        
        String filename = sbFilename.toString();
        String disposition = getDisposition(filename, this.getBrowser(request));
        if (getBrowser(request).equals("Opera")) {
        	response.setContentType("application/octet-stream;charset=UTF-8");
        } else {
        	response.setContentType(getContentType());
        }
        response.setHeader("Content-Disposition", disposition);
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        workbook = makeListToExcel(list, keyList, colNameList, "sheet");
        //log.debug("workbook={}",workbook);
        
        OutputStream out = response.getOutputStream();
        workbook.write(out);
        out.flush();
    }
    
    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        } else if (header.indexOf("Firefox") > -1) {
            return "Firefox";
        }
        
        return "MSIE";
    }
    
    private String getDisposition(String filename, String browser)   throws Exception {
        String dispositionPrefix = "attachment;filename=";
        String encodedFilename = null;
        
        if (browser.equals("MSIE")) {
            encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.equals("Firefox")) {
            encodedFilename =  new String(filename.getBytes("UTF-8"), "8859_1");
        } else if (browser.equals("Opera")) {
            encodedFilename =  new String(filename.getBytes("UTF-8"), "8859_1");
        } else if (browser.equals("Chrome")) {
            StringBuffer sb = new StringBuffer();
            
            for (int i = 0; i < filename.length(); i++) {
                char c = filename.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }
            
            encodedFilename = sb.toString();
        } else {
            throw new RuntimeException("Not supported browser");
        }
        
        return dispositionPrefix + encodedFilename;
    }
    
    private HSSFWorkbook makeListToExcel(List<Map<String, Object>> list, List<String> keyList, List<String> colNameList, String sheetName) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, sheetName);
		
		HSSFRow row = null;
		
		int startRow = 0;
		if (colNameList != null) {
			row = sheet.createRow(startRow++);
			for(int i=0; i<colNameList.size(); i++) {
				HSSFCell cell = null;
				cell = row.createCell(i);
				cell.setCellValue(colNameList.get(i));
			}
		}
		
		for(int i=0; i<list.size(); i++) {
			row = sheet.createRow(startRow++);
			Map<String, Object> map = list.get(i);
			for(int j=0; j<keyList.size(); j++) {
				HSSFCell cell = null;
				cell = row.createCell(j);
				if (map.get(keyList.get(j)) != null) {
					cell.setCellValue(map.get(keyList.get(j)).toString());
				} else {
					cell.setCellValue("");
				}
			}
		}
		
		return workbook;
	}
}