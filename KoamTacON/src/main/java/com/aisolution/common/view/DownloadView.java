package com.aisolution.common.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

private static final Logger log = LoggerFactory.getLogger(DownloadView.class);
    
	public void Download() {
		setContentType("application/download; utf-8");
	}
	
    /**
     * File Download
     * @param model
     * @param request
     * @param response
     * @return N/A
     */
    @SuppressWarnings("unchecked")
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	log.debug("renderMergedOutputModel");
        Map<String, Object> downloadMap = (Map<String, Object>) model.get("downloadInfoMap");
        
        String filePath   = (String) downloadMap.get("filePath");       // File Path
        String phycFileNm = (String) downloadMap.get("phycFileNm");     // Physical File Name
        String logcFileNm = (String) downloadMap.get("logcFileNm");     // Logical File Name
        
        logcFileNm = logcFileNm == null ? phycFileNm : logcFileNm;
        
        StringBuffer sbFileFullPath = new StringBuffer();
        sbFileFullPath.append(filePath).append(File.separator).append(phycFileNm);
        
        log.debug("File Full Path : {} ", sbFileFullPath.toString());
        
        File file = new File(sbFileFullPath.toString());
        
        if(!(file != null && file.isFile() && file.exists())){
        	log.debug("############# download file not exist #############");
            return;
        }
        
        if ("Opera".equals(getBrowser(request))){
            response.setContentType("application/octet-stream;charset=UTF-8");
        } else {
            response.setContentType(getContentType());
        }
        
        String disposition = getDisposition(logcFileNm, getBrowser(request));
        
        response.setHeader("Content-Disposition", disposition);
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        
        try {
            fis = new FileInputStream(file);
            
            int byteCount = FileCopyUtils.copy(fis, out);
            
            response.setContentLength(byteCount);
        } catch (Exception e) {
        	log.error(e.getMessage());
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (Exception e) {
                    
                }
            }
        }
        
        out.flush();
    }
    
    /**
     * Getting Browser
     * @param request
     * @return String
     * @throws Exception
     */
    private String getBrowser(HttpServletRequest request) throws Exception {
        String header = request.getHeader("User-Agent");
        
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        
        return "Firefox";
    }    
    
    
    /**
     * Getting Disposition
     * @param filename
     * @param browser
     * @return String
     * @throws Exception
     */
    private String getDisposition(String filename, String browser) throws Exception {
        String dispositionPrefix = "attachment;filename=";
        String encodedFilename = null;
        
        if (browser.equals("MSIE")) {
            encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.equals("Firefox")) {
            encodedFilename =  URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
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

}
