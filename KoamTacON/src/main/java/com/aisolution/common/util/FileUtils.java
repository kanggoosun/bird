package com.aisolution.common.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

public class FileUtils {
	private static final Logger log = LoggerFactory.getLogger(FileUtils.class);
	
	public List<Map<String, Object>> fileUpload(MultipartRequest multipartRequest, @RequestParam Map<String, String> paramMap, String uploadPath, String bakPath) throws Exception  {
		return fileUpload(multipartRequest, paramMap, uploadPath, bakPath, -1);
	}
	
	public static List<Map<String, Object>> fileUpload(MultipartRequest multipartRequest, @RequestParam Map<String, String> paramMap, String uploadPath, String bakPath, long fileSizeLimit) throws Exception {
		List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();
		Map<String, Object> infoMap = null;
		
		String uploadedFilename = "";
		
		Iterator<String> iter = multipartRequest.getFileNames();
		
		while(iter.hasNext()) {
			uploadedFilename = (String) iter.next();
			
			MultipartFile multipartFile = multipartRequest.getFile(uploadedFilename);
			if (!multipartFile.isEmpty()) {
				Calendar calendar = Calendar.getInstance();
				
				String originalFilename = multipartFile.getOriginalFilename();
				long fileSize = multipartFile.getSize();
				String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
				StringBuffer sbServerFilename = new StringBuffer();
				sbServerFilename.append(originalFilename.substring(0,originalFilename.lastIndexOf("."))).append("-").append(calendar.getTimeInMillis()).append(fileExtension);
				
				if (fileSize <= 0) {
					log.info("The size of uploaded file({}) is zero.", originalFilename);
					new IOException("The size of uploaded file is zero.");
					break;
				} else {
					if (fileSizeLimit == -1 || (fileSizeLimit != -1 && fileSize < fileSizeLimit)) {
						try {
							uploadFileOnServer(multipartFile, uploadPath, sbServerFilename.toString());
							uploadFileOnServerBackup(multipartFile, bakPath, sbServerFilename.toString());
							
							infoMap = new HashMap<String, Object>();
							infoMap.put("uploadedPath", uploadPath);
							infoMap.put("originalFilename", originalFilename);
							infoMap.put("serverFilename", sbServerFilename.toString());
							infoMap.put("fileSize", (int)fileSize);
							log.debug("infoMap={}",infoMap);
							rtnList.add(infoMap);
						} catch(IOException e) {
							log.error(e.getMessage());
							break;
						}
					} else {
						log.info("The size of uploaded file({}) is over limit({}).",originalFilename, String.valueOf(fileSizeLimit));
						new IOException("The size of uploaded file is over limit.");
						break;
					}
				}
			}
		}
		
		return rtnList;
	}
	
	public static void uploadFileOnServer(MultipartFile multipartFile, String path, String filename) throws IOException {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = multipartFile.getInputStream();
			File serverPath = new File(path);
			if (!serverPath.exists()) {
				serverPath.mkdirs();
			}
			StringBuffer sb = new StringBuffer();
			sb.append(path).append(File.separator).append(filename);
			log.debug("uploadFileOnServer sb={}",sb.toString());
			outputStream = new FileOutputStream(sb.toString());
			
			FileCopyUtils.copy(inputStream, outputStream);
		} catch(IOException ioe) {
			log.error(ioe.getMessage());
		} finally {
			if (outputStream != null) {
				outputStream.close();
			}
			
			if (inputStream != null) {
				inputStream.close();
			}
		}
	}
	
	public static void uploadFileOnServerBackup(MultipartFile multipartFile, String bakPath, String filename) throws IOException {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = multipartFile.getInputStream();
			File serverPath = new File(bakPath);
			if (!serverPath.exists()) {
				serverPath.mkdirs();
			}
			StringBuffer sb = new StringBuffer();
			sb.append(bakPath).append(File.separator).append(filename);
			log.debug("uploadFileOnServerBackup sb={}",sb.toString());
			outputStream = new FileOutputStream(sb.toString());
			
			FileCopyUtils.copy(inputStream, outputStream);
		} catch(IOException ioe) {
			log.error(ioe.getMessage());
		} finally {
			if (outputStream != null) {
				outputStream.close();
			}
			
			if (inputStream != null) {
				inputStream.close();
			}
		}
	}
	
	public static boolean deleteFile(String filename, String path) {
		log.debug("deleteFile");
		boolean delFlag = false;
		
		StringBuffer sb = new StringBuffer();
		sb.append(path).append(File.separator).append(filename);
		File file = new File(sb.toString());
		
		try {
			if (file.delete()) {
				log.debug("after delete");
				delFlag = true;
			} else {
				log.debug("after delete but cannot delete");
				String osName = System.getProperty("os.name");
				if (osName != null && osName.equals("Linux")) {
					log.debug("try to delete by command");
					Process p = Runtime.getRuntime().exec("sudo rm -rf " + sb.toString());
					BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
					String line = null;
					while((line = br.readLine()) != null) {
						log.info(line);
					}
					log.debug("after command");
				} else {
					delFlag = false;
				}
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			delFlag = false;
		}
		
		return delFlag;
	}
	
	public static boolean isExist(String filename, String path) {
		boolean isExist = false;
		
		if (filename != null && path != null) {
			StringBuffer sb = new StringBuffer();
			sb.append(path).append(File.separator).append(filename);
			log.debug("isExist filename={}, path={}, full={}", filename, path, sb.toString());
			File file = new File(sb.toString());
			if(file.exists()) {
				isExist = true;
		    }
		}
		
		return isExist;
	}
	
	public static String recoverAbbreviatedIPV6(String srcLine, String seq) {
		String strSep = ",";
		
		StringBuffer rtnSb = new StringBuffer();
		rtnSb.append("");
		if (srcLine != null && !srcLine.equals("")) {
			if (srcLine.contains(",")) {
				String[] arrSource = srcLine.split(",");
				if (arrSource.length == 3) {
					rtnSb.append(seq);
					rtnSb.append(strSep).append(arrSource[2]);
					rtnSb.append(strSep).append(arrSource[0]);
					
					if (arrSource[0].equals("::")) {
						for(int i=0; i<8; i++) {
							rtnSb.append(strSep).append("0000");
						}
					} else {
						if (arrSource[0].contains("::")) {
							String[] arrSplitFirst = arrSource[0].split("::");
							if (arrSplitFirst.length == 1) {
								String[] arrSplitSecond = arrSplitFirst[0].split(":");
								for(int i=0; i<arrSplitSecond.length; i++) {
									rtnSb.append(strSep).append(arrSplitSecond[i]);
								}
								for(int i=arrSplitSecond.length; i<8; i++) {
									rtnSb.append(strSep).append("0000");
								}
							} else {
								String[] arrSplitSecond = arrSplitFirst[0].split(":");
								String[] arrSplitThird = arrSplitFirst[1].split(":");
								for(int i=0; i<arrSplitSecond.length; i++) {
									rtnSb.append(strSep).append(arrSplitSecond[i]);
								}
								for(int i=arrSplitSecond.length+arrSplitThird.length; i<8; i++) {
									rtnSb.append(strSep).append("0000");
								}
								for(int i=0; i<arrSplitThird.length; i++) {
									rtnSb.append(strSep).append(arrSplitThird[i]);
								}
							}
						} else {
							String[] arrSplit = arrSource[0].split(":");
							for(int i=0; i<arrSplit.length; i++) {
								rtnSb.append(strSep).append(arrSplit[i]);
							}
							for(int i=arrSplit.length; i<8; i++) {
								rtnSb.append(strSep).append("0000");
							}
						}
					}
					
					rtnSb.append(strSep).append(arrSource[1]);
					if (arrSource[1].equals("::")) {
						for(int i=0; i<8; i++) {
							rtnSb.append(strSep).append("0000");
						}
					} else {
						if (arrSource[1].contains("::")) {
							String[] arrSplitFirst = arrSource[1].split("::");
							if (arrSplitFirst.length == 1) {
								String[] arrSplitSecond = arrSplitFirst[0].split(":");
								for(int i=0; i<arrSplitSecond.length; i++) {
									rtnSb.append(strSep).append(arrSplitSecond[i]);
								}
								for(int i=arrSplitSecond.length; i<8; i++) {
									rtnSb.append(strSep).append("0000");
								}
							} else {
								String[] arrSplitSecond = arrSplitFirst[0].split(":");
								String[] arrSplitThird = arrSplitFirst[1].split(":");
								for(int i=0; i<arrSplitSecond.length; i++) {
									rtnSb.append(strSep).append(arrSplitSecond[i]);
								}
								for(int i=arrSplitSecond.length+arrSplitThird.length; i<8; i++) {
									rtnSb.append(strSep).append("0000");
								}
								for(int i=0; i<arrSplitThird.length; i++) {
									rtnSb.append(strSep).append(arrSplitThird[i]);
								}
							}
						} else {
							String[] arrSplit = arrSource[1].split(":");
							for(int i=0; i<arrSplit.length; i++) {
								rtnSb.append(strSep).append(arrSplit[i]);
							}
							for(int i=arrSplit.length; i<8; i++) {
								rtnSb.append(strSep).append("0000");
							}
						}
					}
				}
			}
		}
		return rtnSb.toString();
	}
	
	public static List<String> readTextFile(String filename, String path) {
		List<String> rtnList = null;
		
		if (isExist(filename, path)) {
			rtnList = new ArrayList<String>();
			StringBuffer sbFilename = new StringBuffer();
			sbFilename.append(path).append(File.separator).append(filename);
			
			BufferedReader br = null;
			try {
				br = new BufferedReader(new FileReader(sbFilename.toString()));
				
				String line = "";
				while((line = br.readLine()) != null) {
					rtnList.add(line);
				}
				br.close();
			} catch(IOException e) {
				log.error(e.getMessage());
			} finally {
				try {
					br.close();
				} catch(Exception e) {
					log.error(e.getMessage());
				}
			}
		}
		return rtnList;
	}
	
	public static String readStringTextFile(String filename, String path) {
		String rtnString = null;
		
		if (isExist(filename, path)) {
			StringBuffer sbFilename = new StringBuffer();
			sbFilename.append(path).append(File.separator).append(filename);
			
			BufferedReader br = null;
			StringBuffer sb = new StringBuffer();
			try {
				br = new BufferedReader(new FileReader(sbFilename.toString()));
				
				String line = "";
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				br.close();
			} catch(IOException e) {
				log.error(e.getMessage());
			} finally {
				rtnString = sb.toString();
				try {
					br.close();
				} catch(Exception e) {
					log.error(e.getMessage());
				}
			}
		}
		return rtnString;
	}
	
	public static void makeFileWithStringList(List<String> list, String filename, String path) {
		if (list != null && list.size() > 0) {
			StringBuffer sbFilename = new StringBuffer();
			sbFilename.append(path).append(File.separator).append(filename);
			
			if (isExist(filename, path)) {
				deleteFile(filename, path);
			}
			
			String lineSep = System.getProperty("line.separator");
			BufferedWriter bw = null;
			try {
				String line = "";
				bw = new BufferedWriter(new FileWriter(new File(sbFilename.toString())));
				bw.write("seq,country_code,start_ip,start_ip_1,start_ip_2,start_ip_3,start_ip_4,start_ip_5,start_ip_6,start_ip_7,start_ip_8,end_ip,end_ip_1,end_ip_2,end_ip_3,end_ip_4,end_ip_5,end_ip_6,end_ip_7,end_ip_8");
				bw.write(lineSep);
				for(int i=0; i<list.size(); i++) {
					line = list.get(i);
					bw.write(recoverAbbreviatedIPV6(line, String.valueOf(i)));
					bw.write(lineSep);
				}
				bw.flush();
			} catch(IOException e) {
				log.error(e.getMessage());
			} finally {
				try {
					bw.close();
				} catch(Exception e) {
					log.error(e.getMessage());
				}
			}
		}
	}
	
	public static void main(String[] args) {
		//String[] arrTmp = "2001:5:1::".split("::");
		//log.debug("length={}, arrTmp={}",arrTmp.length,arrTmp);
		
		String path = "C:\\Ender\\JOB\\KoamtacOn\\01.Received\\Resource\\dbip-country-2017-08.csv";
		String filename = "dbip-country-2017-08_ipv6.csv";
		
		List<String> list = readTextFile(filename, path);
		if (list != null && list.size()>0) {
			makeFileWithStringList(list, "dbip-country-2017-08_ipv6-ed.csv", path);
		}
		
	}
}
