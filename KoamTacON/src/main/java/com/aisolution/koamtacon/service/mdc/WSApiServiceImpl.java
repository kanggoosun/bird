package com.aisolution.koamtacon.service.mdc;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartRequest;

import com.aisolution.common.config.Config;
import com.aisolution.common.config.ConfigConstants;
import com.aisolution.common.model.ExcelInfo;
import com.aisolution.common.util.CommonUtils;
import com.aisolution.common.util.ExcelUtils;
import com.aisolution.common.util.FileUtils;
import com.aisolution.common.util.MessageUtils;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceApiUtil;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.Attachment;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.Base64Binary;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.CloseSession;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.CreateUserWithActivationCode;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.CreateUserWithActivationCodeResponse;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.Device;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.InsertOrUpdateTabgen;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.InsertOrUpdateTabgenList;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.InsertOrUpdateTabgenListResponse;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.InsertOrUpdateTabgenResponse;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.OpenSession;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.OpenSessionResponse;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.SelectDevicesByUsername;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.SelectDevicesByUsernameResponse;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.SelectTabgen;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.SelectTabgenResponse;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.SessionID;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.TabGen;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.UpdateDeviceReference;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.UploadImage;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.UploadImageResponse;

@Service
public class WSApiServiceImpl implements WSApiService {
	private static final Logger log = LoggerFactory.getLogger(WSApiServiceImpl.class);
	
	@Value("#{koamtacon_config['koamtacon.upload.base']}")
	private String uploadedBase;
	@Value("#{koamtacon_config['koamtacon.upload.kdc']}")
	private String kdcUploadPath;
	@Value("#{koamtacon_config['koamtacon.upload.temp']}")
	private String tempUploadPath;
	@Value("#{koamtacon_config['koamtacon.upload.applications.detail']}")
	private String detailUploadPath;
	@Value("#{koamtacon_config['koamtacon.upload.file.size.limit']}")
	private long fileSizeLimit;
	
	@Value("#{koamtacon_config['koamtacon.bak.base']}")
	private String bakBase;
	@Value("#{koamtacon_config['koamtacon.bak.kdc']}")
	private String kdcBakPath;
	@Value("#{koamtacon_config['koamtacon.bak.temp']}")
	private String tempBakPath;
	@Value("#{koamtacon_config['koamtacon.bak.applications.detail']}")
	private String detailBakPath;
	
	@Autowired
	private AppsService appsService;
	
	@Autowired
    private Config cfg;
	
	private static SessionID StartSession(MdcServiceManagerStub stub, String wsUserame, String wsPassword) {
		SessionID sessionId = null;
		
		OpenSession openSession = new OpenSession();
		openSession.setUseSharedDatabaseConnection(0);
		openSession.setUsername(wsUserame);
		openSession.setPassword(wsPassword);

		try {
			OpenSessionResponse openSessionResponse = stub.openSession(openSession);
			sessionId = openSessionResponse.get_return();
			log.info("StartSession");
		} catch(Exception ex) {
			log.error(ex.getMessage());
			ex.printStackTrace();
		} finally {
		}
		
		return sessionId;
	}
	
	private static void CloseSession(MdcServiceManagerStub stub, SessionID sessionId) {
		if (sessionId != null) {
			CloseSession closeSession = new CloseSession();
			closeSession.setSessionId(sessionId);
	
			try {
				stub.closeSession(closeSession);
				log.info("CloseSession");
			} catch(Exception ex) {
				log.error(ex.getMessage());
				ex.printStackTrace();
			}
		}
	}
	
	private List<String> makeColumnNames(int lastNumber) {
		List<String> rtnList = new ArrayList<String>();
		for(int i=0; i<lastNumber; i++) {
			rtnList.add(String.valueOf((char)(65+i)));
		}
		return rtnList;
	}
	
	public Map<String, Object> importTabgenWithExcel(Map<String, String> paramMap, MultipartRequest multipartRequest) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(tempUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(tempBakPath);
		
		String filename = "";
		String tabName = paramMap.get("TABNAME");
		int lastCellNumber = Integer.parseInt(paramMap.get("lastCellNumber"));
		String userId = paramMap.get("userId");
		StringBuffer sb = new StringBuffer();
		sb.append("|").append(paramMap.get("groupCode").toString()).append("|");
		String groupCode = sb.toString();
		
		try {
			
			List<Map<String, Object>> fileList = FileUtils.fileUpload(multipartRequest, paramMap, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit);
			
			if (fileList.size() == 1) {
				Map<String, Object> map = null;
				map = new HashMap<String, Object>();
				map = (Map<String, Object>)fileList.get(0);
				filename = map.get("serverFilename").toString();
				ExcelInfo excelInfo = new ExcelInfo();
				excelInfo.setTabName(tabName);
				excelInfo.setPath(sbUploadPath.toString());
				excelInfo.setFilename(filename);
				excelInfo.setColumnNames(makeColumnNames(lastCellNumber));
				excelInfo.setLastCellNumber(lastCellNumber);
				excelInfo.setStartRow(3);
				
				List<Map<String, String>> excelList = ExcelUtils.read(excelInfo);
				
				if (excelList != null && excelList.size() > 0) {
					if (excelList.get(0) != null) {
						if (excelList.get(0).get("error") != null) {
							rtnMap.put("result", "fail");
							rtnMap.put("msg", MessageUtils.getMessage("MSG-SV090"));
						} else {
							int excelRec = excelList.size();
							if (excelRec <= ConfigConstants.DATA_LIMIT) {
								String area = paramMap.get("area");
								Map<String, Object> configMap = cfg.getWsConfig(area);
								MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
								SessionID sessionId = null;
								if (stub != null) {
									sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
									int curRec = 0;
									curRec = appsService.getTabgenTableCount(paramMap);
									int addableRec = ConfigConstants.DATA_LIMIT - curRec;
									if (addableRec < 0) {
										addableRec = 0;
									}
									int savedRec = 0;
									int exceptRec = 0;
									int savedNewRec = 0;
									boolean checkFlag = false;
									if (curRec+excelRec > ConfigConstants.DATA_LIMIT) {
										checkFlag = true;
									}
									int recCnt = 0;
									
									String dateTime = CommonUtils.getToday();
									for(int i=0; i<excelRec; i++) {
										if (excelList.get(i).get("A") != null && !excelList.get(i).get("A").toString().equals("")) {
											TabGen newTg = new TabGen();
											newTg.setDeviceCode(groupCode);
											newTg.setTabname(tabName);
											
											newTg.setKey(CommonUtils.getValue(excelList.get(i).get("A")));
											newTg.setValue(CommonUtils.getValue(excelList.get(i).get("B")));
											newTg.setValue2(CommonUtils.getValue(excelList.get(i).get("C")));
											newTg.setValue3(CommonUtils.getValue(excelList.get(i).get("D")));
											newTg.setValue4(CommonUtils.getValue(excelList.get(i).get("E")));
											newTg.setValue5(CommonUtils.getValue(excelList.get(i).get("F")));
											newTg.setValue6(CommonUtils.getValue(excelList.get(i).get("G")));
											newTg.setValue7(CommonUtils.getValue(excelList.get(i).get("H")));
											newTg.setValue8(CommonUtils.getValue(excelList.get(i).get("I")));
											newTg.setValue9(CommonUtils.getValue(excelList.get(i).get("J")));
											newTg.setValue10(CommonUtils.getValue(excelList.get(i).get("K")));
											newTg.setValue11(CommonUtils.getValue(excelList.get(i).get("L")));
											newTg.setValue12(CommonUtils.getValue(excelList.get(i).get("M")));
											newTg.setValue13(CommonUtils.getValue(excelList.get(i).get("N")));
											newTg.setValue14(CommonUtils.getValue(excelList.get(i).get("O")));
											newTg.setValue15(CommonUtils.getValue(excelList.get(i).get("P")));
											newTg.setValue16(CommonUtils.getValue(excelList.get(i).get("Q")));
											newTg.setValue17(CommonUtils.getValue(excelList.get(i).get("R")));
											newTg.setValue18(CommonUtils.getValue(excelList.get(i).get("S")));
											newTg.setValue19(CommonUtils.getValue(excelList.get(i).get("T")));
											newTg.setValue20(CommonUtils.getValue(excelList.get(i).get("U")));
											
											if (checkFlag) {
												Map<String, String> paramMap2 = new HashMap<String, String>();
												paramMap2.put("TABNAME", tabName);
												paramMap2.put("groupCode", paramMap.get("groupCode"));
												paramMap2.put("key", newTg.getKey());
												recCnt = 0;
												recCnt = appsService.getTabgenRecordCount(paramMap2);
												if (recCnt == 0) {
													if (addableRec == 0) {
														exceptRec++;
														continue;
													}
												}
											}
											
											InsertOrUpdateTabgen saveTg = new InsertOrUpdateTabgen();
											saveTg.setSessionId(sessionId);
											saveTg.setTabgen(newTg);
											InsertOrUpdateTabgenResponse response = stub.insertOrUpdateTabgen(saveTg);
											
											if (response.get_return() == 1) {
												savedRec++;
												if (recCnt == 0) {
													savedNewRec++;
													addableRec--;
												}
												if (tabName.equals("MA_INVENTORY")) {
													TabGen hisTg = new TabGen();
													hisTg.setDeviceCode(groupCode);
													hisTg.setTabname("HIS_INVENTORY_JOB");
													
													String hisKey = dateTime+"_"+userId+"_"+newTg.getKey();
													hisTg.setKey(hisKey);
													hisTg.setValue(newTg.getValue());
													hisTg.setValue2(newTg.getValue2());
													hisTg.setValue3(newTg.getValue3());
													hisTg.setValue4(newTg.getValue4());
													hisTg.setValue5(newTg.getValue5());
													hisTg.setValue6(newTg.getValue6());
													hisTg.setValue7(newTg.getValue7());
													hisTg.setValue8(newTg.getValue8());
													hisTg.setValue9(newTg.getValue9());
													hisTg.setValue10(newTg.getValue10());
													hisTg.setValue11("0");
													hisTg.setValue12("REG");
													hisTg.setValue13(userId);
													hisTg.setValue14(dateTime);
													hisTg.setValue15(newTg.getKey());
													hisTg.setValue16("");
													hisTg.setValue17(newTg.getValue11());
													hisTg.setValue18(newTg.getValue12());
													hisTg.setValue19(newTg.getValue13());
													hisTg.setValue20(newTg.getValue14());
													
													InsertOrUpdateTabgen saveHisTg = new InsertOrUpdateTabgen();
													saveHisTg.setSessionId(sessionId);
													saveHisTg.setTabgen(hisTg);
													stub.insertOrUpdateTabgen(saveHisTg);
													
													TabGen inTg = new TabGen();
													inTg.setDeviceCode(groupCode);
													inTg.setTabname("MA_INVENTORY_IN");
													
													inTg.setKey(newTg.getValue2());
													inTg.setValue(newTg.getValue());
													inTg.setValue2(newTg.getKey());
													inTg.setValue3(dateTime);
													inTg.setValue4(hisKey);
													
													InsertOrUpdateTabgen saveInTg = new InsertOrUpdateTabgen();
													saveInTg.setSessionId(sessionId);
													saveInTg.setTabgen(inTg);
													stub.insertOrUpdateTabgen(saveInTg);
												}
											}
										}
									}
									
									CloseSession(stub, sessionId);
									
									if (savedRec > 0) {
										rtnMap.put("savedRec", savedRec);
										rtnMap.put("excelRec", excelRec);
										rtnMap.put("savedNewRec", savedNewRec);
										rtnMap.put("exceptRec", exceptRec);
										
										StringBuffer sbMsg = new StringBuffer();
										sbMsg.append(MessageUtils.getMessage("MSG-SV091")).append("<br/>");
										sbMsg.append(MessageUtils.getMessage("MSG-SV092")).append(String.valueOf(excelRec)).append("<br/>");
										if (savedRec > 0) {
											sbMsg.append(MessageUtils.getMessage("MSG-SV093")).append(String.valueOf(savedRec)).append("<br/>");
										}
										if (exceptRec > 0) {
											sbMsg.append(MessageUtils.getMessage("MSG-SV094")).append(String.valueOf(exceptRec)).append("<br/>");
										}
										rtnMap.put("result", "success");
										rtnMap.put("msg", sbMsg.toString());
									} else {
										rtnMap.put("result", "fail");
										rtnMap.put("msg", MessageUtils.getMessage("MSG-SV095"));
									}
								} else {
									rtnMap.put("result", "error");
									rtnMap.put("msg", MessageUtils.getMessage("MSG-SV096"));
								}
							} else {
								rtnMap.put("result", "fail");
								rtnMap.put("msg",  MessageUtils.getMessage("MSG-SV097"));
							}
						}
					} else {
						
					}
				} else {
					rtnMap.put("result", "fail");
					rtnMap.put("msg", MessageUtils.getMessage("MSG-SV098"));
				}
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			if (FileUtils.isExist(filename, sbUploadPath.toString())) {
				FileUtils.deleteFile(filename, sbUploadPath.toString());
			}
			rtnMap.put("result", "error");
			rtnMap.put("msg", MessageUtils.getMessage("MSG-SV096"));
		}
		return rtnMap;
	}
	
	public Map<String, Object> importTabgenListWithExcel(Map<String, String> paramMap, MultipartRequest multipartRequest) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(tempUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(tempBakPath);
		
		String filename = "";
		String tabName = paramMap.get("TABNAME");
		int lastCellNumber = Integer.parseInt(paramMap.get("lastCellNumber"));
		String userId = paramMap.get("userId");
		StringBuffer sb = new StringBuffer();
		sb.append("|").append(paramMap.get("groupCode").toString()).append("|");
		String groupCode = sb.toString();
		
		try {
			
			List<Map<String, Object>> fileList = FileUtils.fileUpload(multipartRequest, paramMap, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit);
			
			if (fileList.size() == 1) {
				Map<String, Object> map = null;
				map = new HashMap<String, Object>();
				map = (Map<String, Object>)fileList.get(0);
				filename = map.get("serverFilename").toString();
				ExcelInfo excelInfo = new ExcelInfo();
				excelInfo.setTabName(tabName);
				excelInfo.setPath(sbUploadPath.toString());
				excelInfo.setFilename(filename);
				excelInfo.setColumnNames(makeColumnNames(lastCellNumber));
				excelInfo.setLastCellNumber(lastCellNumber);
				excelInfo.setStartRow(3);
				
				List<Map<String, String>> excelList = ExcelUtils.read(excelInfo);
				
				if (excelList != null && excelList.size() > 0) {
					if (excelList.get(0) != null) {
						if (excelList.get(0).get("error") != null) {
							rtnMap.put("result", "fail");
							rtnMap.put("msg", MessageUtils.getMessage("MSG-SV090"));
						} else {
							int excelRec = excelList.size();
							if (excelRec <= ConfigConstants.DATA_LIMIT) {
								String area = paramMap.get("area");
								Map<String, Object> configMap = cfg.getWsConfig(area);
								MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
								SessionID sessionId = null;
								if (stub != null) {
									sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
									int curRec = 0;
									curRec = appsService.getTabgenTableCount(paramMap);
									int addableRec = ConfigConstants.DATA_LIMIT - curRec;
									if (addableRec < 0) {
										addableRec = 0;
									}
									int savedRec = 0;
									int exceptRec = 0;
									int savedNewRec = 0;
									boolean checkFlag = false;
									if (curRec+excelRec > ConfigConstants.DATA_LIMIT) {
										checkFlag = true;
									}
									int recCnt = 0;
									
									TabGen[] newTgList = new TabGen[excelRec];
									TabGen[] hisTgList = new TabGen[excelRec];
									TabGen[] inTgList = new TabGen[excelRec];
									String dateTime = CommonUtils.getToday();
									int rowCnt = 0;
									for(int i=0; i<excelRec; i++) {
										
										if (excelList.get(i).get("A") != null && !excelList.get(i).get("A").toString().equals("")) {
											TabGen newTg = new TabGen();
											newTg.setDeviceCode(groupCode);
											newTg.setTabname(tabName);
											
											newTg.setKey(CommonUtils.getValue(excelList.get(i).get("A")));
											newTg.setValue(CommonUtils.getValue(excelList.get(i).get("B")));
											newTg.setValue2(CommonUtils.getValue(excelList.get(i).get("C")));
											newTg.setValue3(CommonUtils.getValue(excelList.get(i).get("D")));
											newTg.setValue4(CommonUtils.getValue(excelList.get(i).get("E")));
											newTg.setValue5(CommonUtils.getValue(excelList.get(i).get("F")));
											newTg.setValue6(CommonUtils.getValue(excelList.get(i).get("G")));
											newTg.setValue7(CommonUtils.getValue(excelList.get(i).get("H")));
											newTg.setValue8(CommonUtils.getValue(excelList.get(i).get("I")));
											newTg.setValue9(CommonUtils.getValue(excelList.get(i).get("J")));
											newTg.setValue10(CommonUtils.getValue(excelList.get(i).get("K")));
											newTg.setValue11(CommonUtils.getValue(excelList.get(i).get("L")));
											newTg.setValue12(CommonUtils.getValue(excelList.get(i).get("M")));
											newTg.setValue13(CommonUtils.getValue(excelList.get(i).get("N")));
											newTg.setValue14(CommonUtils.getValue(excelList.get(i).get("O")));
											newTg.setValue15(CommonUtils.getValue(excelList.get(i).get("P")));
											newTg.setValue16(CommonUtils.getValue(excelList.get(i).get("Q")));
											newTg.setValue17(CommonUtils.getValue(excelList.get(i).get("R")));
											newTg.setValue18(CommonUtils.getValue(excelList.get(i).get("S")));
											newTg.setValue19(CommonUtils.getValue(excelList.get(i).get("T")));
											newTg.setValue20(CommonUtils.getValue(excelList.get(i).get("U")));
											
											if (checkFlag) {
												Map<String, String> paramMap2 = new HashMap<String, String>();
												paramMap2.put("TABNAME", tabName);
												paramMap2.put("groupCode", paramMap.get("groupCode"));
												paramMap2.put("key", newTg.getKey());
												recCnt = 0;
												recCnt = appsService.getTabgenRecordCount(paramMap2);
												if (recCnt == 0) {
													if (addableRec == 0) {
														exceptRec++;
														continue;
													}
												}
											}
											
											newTgList[rowCnt] = newTg;
											
											/*
											InsertOrUpdateTabgen saveTg = new InsertOrUpdateTabgen();
											saveTg.setSessionId(sessionId);
											saveTg.setTabgen(newTg);
											InsertOrUpdateTabgenResponse response = stub.insertOrUpdateTabgen(saveTg);
											*/
											//if (response.get_return() == 1) {
												savedRec++;
												if (recCnt == 0) {
													savedNewRec++;
													addableRec--;
												}
												if (tabName.equals("MA_INVENTORY")) {
													TabGen hisTg = new TabGen();
													hisTg.setDeviceCode(groupCode);
													hisTg.setTabname("HIS_INVENTORY_JOB");
													
													String hisKey = dateTime+"_"+userId+"_"+newTg.getKey();
													hisTg.setKey(hisKey);
													hisTg.setValue(newTg.getValue());
													hisTg.setValue2(newTg.getValue2());
													hisTg.setValue3(newTg.getValue3());
													hisTg.setValue4(newTg.getValue4());
													hisTg.setValue5(newTg.getValue5());
													hisTg.setValue6(newTg.getValue6());
													hisTg.setValue7(newTg.getValue7());
													hisTg.setValue8(newTg.getValue8());
													hisTg.setValue9(newTg.getValue9());
													hisTg.setValue10(newTg.getValue10());
													hisTg.setValue11("0");
													hisTg.setValue12("REG");
													hisTg.setValue13(userId);
													hisTg.setValue14(dateTime);
													hisTg.setValue15(newTg.getKey());
													hisTg.setValue16("");
													hisTg.setValue17(newTg.getValue11());
													hisTg.setValue18(newTg.getValue12());
													hisTg.setValue19(newTg.getValue13());
													hisTg.setValue20(newTg.getValue14());
													
													hisTgList[rowCnt] = hisTg;
													/*
													InsertOrUpdateTabgen saveHisTg = new InsertOrUpdateTabgen();
													saveHisTg.setSessionId(sessionId);
													saveHisTg.setTabgen(hisTg);
													stub.insertOrUpdateTabgen(saveHisTg);
													*/
													TabGen inTg = new TabGen();
													inTg.setDeviceCode(groupCode);
													inTg.setTabname("MA_INVENTORY_IN");
													
													inTg.setKey(newTg.getValue2());
													inTg.setValue(newTg.getValue());
													inTg.setValue2(newTg.getKey());
													inTg.setValue3(dateTime);
													inTg.setValue4(hisKey);
													
													inTgList[rowCnt] = inTg;
													rowCnt++;
													/*
													InsertOrUpdateTabgen saveInTg = new InsertOrUpdateTabgen();
													saveInTg.setSessionId(sessionId);
													saveInTg.setTabgen(inTg);
													stub.insertOrUpdateTabgen(saveInTg);
													*/
												}
											//}
										}
									}
									
									InsertOrUpdateTabgenList insertListRequest = new InsertOrUpdateTabgenList();
									insertListRequest.setSessionId( sessionId );
									insertListRequest.setTabgenList( newTgList );
									InsertOrUpdateTabgenListResponse response = stub.insertOrUpdateTabgenList( insertListRequest );
									
									if ( response.get_return() == 1) {
										insertListRequest = new InsertOrUpdateTabgenList();
										insertListRequest.setSessionId( sessionId );
										insertListRequest.setTabgenList( hisTgList );
										response = stub.insertOrUpdateTabgenList( insertListRequest );
										
										if ( response.get_return() == 1) {
											insertListRequest = new InsertOrUpdateTabgenList();
											insertListRequest.setSessionId( sessionId );
											insertListRequest.setTabgenList( inTgList );
											response = stub.insertOrUpdateTabgenList( insertListRequest );
											if ( response.get_return() == 1) {
												
											} else {
												log.error("[Import Error] To import into MA_INVENTORY_IN is failed.");
											}
										} else {
											log.error("[Import Error] To import into HIS_INVENTORY_JOB is failed.");
										}
									} else {
										log.error("[Import Error] To import into MA_INVENTORY is failed.");
									}
									CloseSession(stub, sessionId);
									
									if (savedRec > 0) {
										rtnMap.put("savedRec", savedRec);
										rtnMap.put("excelRec", excelRec);
										rtnMap.put("savedNewRec", savedNewRec);
										rtnMap.put("exceptRec", exceptRec);
										
										StringBuffer sbMsg = new StringBuffer();
										sbMsg.append(MessageUtils.getMessage("MSG-SV091")).append("<br/>");
										sbMsg.append(MessageUtils.getMessage("MSG-SV092")).append(String.valueOf(excelRec)).append("<br/>");
										if (savedRec > 0) {
											sbMsg.append(MessageUtils.getMessage("MSG-SV093")).append(String.valueOf(savedRec)).append("<br/>");
										}
										if (exceptRec > 0) {
											sbMsg.append(MessageUtils.getMessage("MSG-SV094")).append(String.valueOf(exceptRec)).append("<br/>");
										}
										rtnMap.put("result", "success");
										rtnMap.put("msg", sbMsg.toString());
									} else {
										rtnMap.put("result", "fail");
										rtnMap.put("msg", MessageUtils.getMessage("MSG-SV095"));
									}
								} else {
									rtnMap.put("result", "error");
									rtnMap.put("msg", MessageUtils.getMessage("MSG-SV096"));
								}
							} else {
								rtnMap.put("result", "fail");
								rtnMap.put("msg",  MessageUtils.getMessage("MSG-SV097"));
							}
						}
					} else {
						
					}
				} else {
					rtnMap.put("result", "fail");
					rtnMap.put("msg", MessageUtils.getMessage("MSG-SV098"));
				}
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			if (FileUtils.isExist(filename, sbUploadPath.toString())) {
				FileUtils.deleteFile(filename, sbUploadPath.toString());
			}
			rtnMap.put("result", "error");
			rtnMap.put("msg", MessageUtils.getMessage("MSG-SV096"));
		}
		return rtnMap;
	}
	
	public Map<String, Object> importTabgenWithExcelNoLimit(Map<String, String> paramMap, MultipartRequest multipartRequest) {
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		StringBuffer sbUploadPath = new StringBuffer();
		sbUploadPath.append(uploadedBase).append(tempUploadPath);
		StringBuffer sbBakPath = new StringBuffer();
		sbBakPath.append(bakBase).append(tempBakPath);
		
		String filename = "";
		String tabName = paramMap.get("TABNAME");
		int lastCellNumber = Integer.parseInt(paramMap.get("lastCellNumber"));
		String userId = paramMap.get("userId");
		StringBuffer sb = new StringBuffer();
		sb.append("|").append(paramMap.get("groupCode").toString()).append("|");
		String groupCode = sb.toString();
		
		try {
			
			List<Map<String, Object>> fileList = FileUtils.fileUpload(multipartRequest, paramMap, sbUploadPath.toString(), sbBakPath.toString(), fileSizeLimit);
			
			if (fileList.size() == 1) {
				Map<String, Object> map = null;
				map = new HashMap<String, Object>();
				map = (Map<String, Object>)fileList.get(0);
				filename = map.get("serverFilename").toString();
				ExcelInfo excelInfo = new ExcelInfo();
				excelInfo.setTabName(tabName);
				excelInfo.setPath(sbUploadPath.toString());
				excelInfo.setFilename(filename);
				excelInfo.setColumnNames(makeColumnNames(lastCellNumber));
				excelInfo.setLastCellNumber(lastCellNumber);
				excelInfo.setStartRow(3);
				
				List<Map<String, String>> excelList = ExcelUtils.read(excelInfo);
				
				if (excelList != null && excelList.size() > 0) {
					if (excelList.get(0) != null) {
						if (excelList.get(0).get("error") != null) {
							rtnMap.put("result", "fail");
							rtnMap.put("msg", MessageUtils.getMessage("MSG-SV090"));
						} else {
							String area = paramMap.get("area");
							Map<String, Object> configMap = cfg.getWsConfig(area);
							MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
							SessionID sessionId = null;
							if (stub != null) {
								sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
								int savedRec = 0;
								String dateTime = CommonUtils.getToday();
								for(int i=0; i<excelList.size(); i++) {
									if (excelList.get(i).get("A") != null && !excelList.get(i).get("A").toString().equals("")) {
										TabGen newTg = new TabGen();
										newTg.setDeviceCode(groupCode);
										newTg.setTabname(tabName);
										
										newTg.setKey(CommonUtils.getValue(excelList.get(i).get("A")));
										newTg.setValue(CommonUtils.getValue(excelList.get(i).get("B")));
										newTg.setValue2(CommonUtils.getValue(excelList.get(i).get("C")));
										newTg.setValue3(CommonUtils.getValue(excelList.get(i).get("D")));
										newTg.setValue4(CommonUtils.getValue(excelList.get(i).get("E")));
										newTg.setValue5(CommonUtils.getValue(excelList.get(i).get("F")));
										newTg.setValue6(CommonUtils.getValue(excelList.get(i).get("G")));
										newTg.setValue7(CommonUtils.getValue(excelList.get(i).get("H")));
										newTg.setValue8(CommonUtils.getValue(excelList.get(i).get("I")));
										newTg.setValue9(CommonUtils.getValue(excelList.get(i).get("J")));
										newTg.setValue10(CommonUtils.getValue(excelList.get(i).get("K")));
										newTg.setValue11(CommonUtils.getValue(excelList.get(i).get("L")));
										newTg.setValue12(CommonUtils.getValue(excelList.get(i).get("M")));
										newTg.setValue13(CommonUtils.getValue(excelList.get(i).get("N")));
										newTg.setValue14(CommonUtils.getValue(excelList.get(i).get("O")));
										newTg.setValue15(CommonUtils.getValue(excelList.get(i).get("P")));
										newTg.setValue16(CommonUtils.getValue(excelList.get(i).get("Q")));
										newTg.setValue17(CommonUtils.getValue(excelList.get(i).get("R")));
										newTg.setValue18(CommonUtils.getValue(excelList.get(i).get("S")));
										newTg.setValue19(CommonUtils.getValue(excelList.get(i).get("T")));
										newTg.setValue20(CommonUtils.getValue(excelList.get(i).get("U")));
										
										InsertOrUpdateTabgen saveTg = new InsertOrUpdateTabgen();
										saveTg.setSessionId(sessionId);
										saveTg.setTabgen(newTg);
										InsertOrUpdateTabgenResponse response = stub.insertOrUpdateTabgen(saveTg);
										
										if (response.get_return() == 1) {
											savedRec++;
											
											if (tabName.equals("MA_INVENTORY")) {
												TabGen hisTg = new TabGen();
												hisTg.setDeviceCode(groupCode);
												hisTg.setTabname("HIS_INVENTORY_JOB");
												
												String hisKey = dateTime+"_"+userId+"_"+newTg.getKey();
												hisTg.setKey(hisKey);
												hisTg.setValue(newTg.getValue());
												hisTg.setValue2(newTg.getValue2());
												hisTg.setValue3(newTg.getValue3());
												hisTg.setValue4(newTg.getValue4());
												hisTg.setValue5(newTg.getValue5());
												hisTg.setValue6(newTg.getValue6());
												hisTg.setValue7(newTg.getValue7());
												hisTg.setValue8(newTg.getValue8());
												hisTg.setValue9(newTg.getValue9());
												hisTg.setValue10(newTg.getValue10());
												hisTg.setValue11("0");
												hisTg.setValue12("REG");
												hisTg.setValue13(userId);
												hisTg.setValue14(dateTime);
												hisTg.setValue15(newTg.getKey());
												hisTg.setValue16("");
												hisTg.setValue17(newTg.getValue11());
												hisTg.setValue18(newTg.getValue12());
												hisTg.setValue19(newTg.getValue13());
												hisTg.setValue20(newTg.getValue14());
												
												InsertOrUpdateTabgen saveHisTg = new InsertOrUpdateTabgen();
												saveHisTg.setSessionId(sessionId);
												saveHisTg.setTabgen(hisTg);
												stub.insertOrUpdateTabgen(saveHisTg);
												
												TabGen inTg = new TabGen();
												inTg.setDeviceCode(groupCode);
												inTg.setTabname("MA_INVENTORY_IN");
												
												inTg.setKey(newTg.getValue2());
												inTg.setValue(newTg.getValue());
												inTg.setValue2(newTg.getKey());
												inTg.setValue3(dateTime);
												inTg.setValue4(hisKey);
												
												InsertOrUpdateTabgen saveInTg = new InsertOrUpdateTabgen();
												saveInTg.setSessionId(sessionId);
												saveInTg.setTabgen(inTg);
												stub.insertOrUpdateTabgen(saveInTg);
											}
										}
									}
								}
								
								CloseSession(stub, sessionId);
								
								if (savedRec > 0) {
									rtnMap.put("savedRec", savedRec);
									
									StringBuffer sbMsg = new StringBuffer();
									sbMsg.append(MessageUtils.getMessage("MSG-SV091"));
									if (savedRec > 0) {
										sbMsg.append(MessageUtils.getMessage("MSG-SV093")).append(String.valueOf(savedRec)).append("<br/>");
									}
									rtnMap.put("result", "success");
									rtnMap.put("msg", sbMsg.toString());
								} else {
									rtnMap.put("result", "fail");
									rtnMap.put("msg", MessageUtils.getMessage("MSG-SV095"));
								}
							} else {
								rtnMap.put("result", "error");
								rtnMap.put("msg", MessageUtils.getMessage("MSG-SV096"));
							}
						}
					} else {
						
					}
				} else {
					rtnMap.put("result", "fail");
					rtnMap.put("msg", MessageUtils.getMessage("MSG-SV098"));
				}
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			if (FileUtils.isExist(filename, sbUploadPath.toString())) {
				FileUtils.deleteFile(filename, sbUploadPath.toString());
			}
			rtnMap.put("result", "error");
			rtnMap.put("msg", MessageUtils.getMessage("MSG-SV096"));
		}
		return rtnMap;
	}
	
	public boolean uploadDetail(Map<String, String> paramMap, MultipartRequest multipartRequest) {
		log.debug("uploadDetail paramMap={}", paramMap);
		boolean pFlag = false;
		
		try {
			StringBuffer sbPath = new StringBuffer();
			sbPath.append(uploadedBase).append(detailUploadPath);
			StringBuffer sbBakPath = new StringBuffer();
			sbBakPath.append(bakBase).append(detailBakPath);
			
			List<Map<String, Object>> rtnList = FileUtils.fileUpload(multipartRequest, paramMap, sbPath.toString(), sbBakPath.toString(), fileSizeLimit);
			if (rtnList.size() > 0) {
				String area = paramMap.get("area");
				Map<String, Object> configMap = cfg.getWsConfig(area);
				MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
				SessionID sessionId = null;
				if (stub != null) {
					sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
					Map<String, Object> resultMap = (Map<String, Object>)rtnList.get(0);
					
					String key = paramMap.get("projectSeq");
					String groupCode = paramMap.get("groupCode");
					StringBuffer sbGroupCode = new StringBuffer();
					sbGroupCode.append("|").append(groupCode).append("|");
					
					//String originFilename = resultMap.get("originalFilename").toString();
					String serverFilename = resultMap.get("serverFilename").toString();
					StringBuffer sbFullPath = new StringBuffer();
					sbFullPath.append(sbPath.toString()).append(File.separator).append(serverFilename);
					//log.debug("originFilename={}, serverFilename={}, sbFullPath={}",originFilename,serverFilename, sbFullPath.toString());
					Attachment file = new Attachment();
                    Base64Binary base64Binary = new Base64Binary();
                    FileDataSource fileDataSource = new FileDataSource( sbFullPath.toString() );
                    DataHandler dataHandler = new DataHandler( fileDataSource );
                    base64Binary.setBase64Binary( dataHandler );
                    file.setAttachmentName(serverFilename);
                    file.setAttachmentFile(base64Binary);
                    //log.debug("file={}",file.getAttachmentName());
                    UploadImage uploadImageRequest = new UploadImage();
                    uploadImageRequest.setSessionId( sessionId );
                    uploadImageRequest.setTabname( "MA_TV_PROJECTS" );
                    uploadImageRequest.setKey( key );
                    uploadImageRequest.setDeviceCode( sbGroupCode.toString() );
                    uploadImageRequest.setImage( file );
                    uploadImageRequest.setImageType( 0 );
                    uploadImageRequest.setIndex(1);
                    
                    UploadImageResponse response = stub.uploadImage( uploadImageRequest );
                    
                    if (response.get_return() == 1) {
                    	pFlag = true;
                    } else {
                    	pFlag = false;
                    }
                    CloseSession(stub, sessionId);
				} else {
					pFlag = false;
				}
			} else {
				pFlag = false;
			}
		} catch(Exception e) {
			log.error(e.getMessage());
			pFlag = false;
		}
		return pFlag;
	}
	
	@SuppressWarnings("unchecked")
	public boolean makeEventTables(Map<String, String> paramMap, Map<String, Object> dataMap) {
		log.debug("makeEventTables paramMap={}", paramMap);
		boolean flag = false;
		
		String area = paramMap.get("area");
		Map<String, Object> configMap = cfg.getWsConfig(area);
		MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
		SessionID sessionId = null;
		if (stub != null) {
			sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
			
			SelectDevicesByUsername dev = new SelectDevicesByUsername();
			dev.setSessionId(sessionId);
			StringBuffer sbGroupCode = new StringBuffer();
			sbGroupCode.append("|").append(paramMap.get("groupCode").toString()).append("|");
			
			List<Map<String,Object>> eDateList = (List<Map<String,Object>>)dataMap.get("eDateList");
			List<Map<String,Object>> eProjecSeqList = (List<Map<String,Object>>)dataMap.get("eProjecSeqList");
			List<Map<String,Object>> eLocationSeqList = (List<Map<String,Object>>)dataMap.get("eLocationSeqList");
			List<Map<String,Object>> eTimeSeqList = (List<Map<String,Object>>)dataMap.get("eTimeSeqList");
			
			try {
				if (eDateList != null) {
					for(int i=0; i<eDateList.size(); i++) {
						Map<String,Object> map = eDateList.get(i);
						
						TabGen newEDateTg = new TabGen();
						newEDateTg.setDeviceCode(sbGroupCode.toString());
						newEDateTg.setTabname("TV_EVENTS_RUN");
						newEDateTg.setKey(map.get("event_seq").toString());
						newEDateTg.setValue(map.get("event_date").toString());
						
						InsertOrUpdateTabgen insertTg = new InsertOrUpdateTabgen();
						insertTg.setSessionId(sessionId);
						insertTg.setTabgen(newEDateTg);
						stub.insertOrUpdateTabgen(insertTg);
						log.debug("TV_EVENTS_RUN key:::{}",newEDateTg.getKey());
					}
					
					if (eProjecSeqList != null) {
						for(int i=0; i<eProjecSeqList.size(); i++) {
							Map<String,Object> map = eProjecSeqList.get(i);
							
							TabGen newEPrjTg = new TabGen();
							
							newEPrjTg.setDeviceCode(sbGroupCode.toString());
							newEPrjTg.setTabname("TV_PROJECTS_RUN");
							newEPrjTg.setKey(map.get("code_key").toString());
							newEPrjTg.setValue(map.get("project_name").toString());
							newEPrjTg.setValue16(map.get("event_seq").toString());
							newEPrjTg.setValue17(map.get("project_seq").toString());
							
							InsertOrUpdateTabgen insertTg = new InsertOrUpdateTabgen();
							insertTg.setSessionId(sessionId);
							insertTg.setTabgen(newEPrjTg);
							stub.insertOrUpdateTabgen(insertTg);
							log.debug("TV_PROJECTS_RUN key:::{}",newEPrjTg.getKey());
						}
						
						if (eLocationSeqList != null) {
							for(int i=0; i<eLocationSeqList.size(); i++) {
								Map<String,Object> map = eLocationSeqList.get(i);
								
								TabGen newELocTg = new TabGen();
								
								newELocTg.setDeviceCode(sbGroupCode.toString());
								newELocTg.setTabname("TV_LOCATIONS_RUN");
								newELocTg.setKey(map.get("code_key").toString());
								newELocTg.setValue(map.get("location_name").toString());
								newELocTg.setValue16(map.get("event_seq").toString());
								newELocTg.setValue17(map.get("project_seq").toString());
								newELocTg.setValue18(map.get("location_seq").toString());
								
								InsertOrUpdateTabgen insertTg = new InsertOrUpdateTabgen();
								insertTg.setSessionId(sessionId);
								insertTg.setTabgen(newELocTg);
								stub.insertOrUpdateTabgen(insertTg);
								log.debug("TV_LOCATIONS_RUN key:::{}",newELocTg.getKey());
							}
							
							if (eTimeSeqList != null) {
								for(int i=0; i<eTimeSeqList.size(); i++) {
									Map<String,Object> map = eTimeSeqList.get(i);
									
									TabGen newETimTg = new TabGen();
									
									newETimTg.setDeviceCode(sbGroupCode.toString());
									newETimTg.setTabname("TV_TIME_RUN");
									newETimTg.setKey(map.get("code_key").toString());
									newETimTg.setValue(map.get("start_time").toString());
									newETimTg.setValue16(map.get("event_seq").toString());
									newETimTg.setValue17(map.get("project_seq").toString());
									newETimTg.setValue18(map.get("location_seq").toString());
									newETimTg.setValue19(map.get("time_seq").toString());
									
									InsertOrUpdateTabgen insertTg = new InsertOrUpdateTabgen();
									insertTg.setSessionId(sessionId);
									insertTg.setTabgen(newETimTg);
									stub.insertOrUpdateTabgen(insertTg);
									log.debug("TV_TIME_RUN key:::{}",newETimTg.getKey());
								}
								flag = true;
							}
						}
					}
				}
			} catch(Exception e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}
			CloseSession(stub, sessionId);
		}
		return flag;
	}
	
	public Map<String, String> createMobileUserAndActivationCode(Map<String, String> paramMap) {
		Map<String, String> rtnMap = new HashMap<String, String>();
		
		// MDC API ���� ����
		String area = paramMap.get("area");
		Map<String, Object> configMap = cfg.getWsConfig(area);
		MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
		SessionID sessionId = null;
		
		if (stub != null) {
			String groupCode = paramMap.get("groupCode");
			String userId = paramMap.get("userId");
			
			// API session start
			sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
			try {
				Device device = new Device();
				//device.setCode("A00");
				device.setGroupcode(groupCode);
				device.setUsername(userId);
				device.setPassword(userId);
				device.setDescription(userId);
				
				// create mobile user and activation code
				CreateUserWithActivationCode createUserObj = new CreateUserWithActivationCode();	
				createUserObj.setActivationDescription("Activation description");
				createUserObj.setDevice(device);
				createUserObj.setSessionId(sessionId);
				createUserObj.setCanReactivate(false);
				
				CreateUserWithActivationCodeResponse cuwacRes = stub.createUserWithActivationCode(createUserObj);
				
				String activationCode = cuwacRes.get_return();
				if (activationCode != null && !activationCode.equals("")) { // mobile user, activation code ���� ����
					SelectDevicesByUsername deviceObj = new SelectDevicesByUsername();
					deviceObj.setSessionId(sessionId);
					deviceObj.setUsername(device.getUsername());
					
					SelectDevicesByUsernameResponse sdbuRes = stub.selectDevicesByUsername(deviceObj);
					Device[] deviceList = sdbuRes.get_return();
					
					if (deviceList != null && deviceList.length > 0) {
						rtnMap.put("userId", userId);
						rtnMap.put("syncUser", deviceList[0].getUsername());
						rtnMap.put("groupCode", deviceList[0].getGroupcode());
						rtnMap.put("deviceCode", deviceList[0].getCode());
						rtnMap.put("activationCode", activationCode);
						rtnMap.put("activationYn", "Y");
					} else {
						log.error("There is no user with {}",paramMap.get("userId"));
					}
				}
			} catch(Exception e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}
			// API session end
			CloseSession(stub, sessionId);
		}
		return rtnMap;
	}
	
	public int changeGroupCode(Map<String, String> paramMap) {
		int flag = -1;
		
		// MDC API ���� ����
		String area = paramMap.get("area");
		Map<String, Object> configMap = cfg.getWsConfig(area);
		MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
		SessionID sessionId = null;
		
		if (stub != null) {
			String groupCode = paramMap.get("groupCode");
			String username = paramMap.get("syncUser");
			//String deviceCode = paramMap.get("deviceCode");
			
			// API session start
			sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
			try {
				SelectDevicesByUsername deviceObj = new SelectDevicesByUsername();
				deviceObj.setSessionId(sessionId);
				deviceObj.setUsername(username);
				
				SelectDevicesByUsernameResponse res = stub.selectDevicesByUsername(deviceObj);
				Device[] deviceList = res.get_return();
				
				if (deviceList != null && deviceList.length > 0) {
					deviceList[0].setGroupcode(groupCode);
					
					UpdateDeviceReference ref = new UpdateDeviceReference();
					ref.setDevice(deviceList[0]);
					ref.setSessionId(sessionId);
					flag = stub.updateDeviceReference(ref).get_return();
				} else {
					flag = 0;
				}
			} catch(Exception e) {
				log.error(e.getMessage());
				e.printStackTrace();
				flag = -1;
			}
			// API session end
			CloseSession(stub, sessionId);
		}
		
		return flag;
	}
	
	//--------------------------------------------------------------------------------------------------------------------------------------------
	public void wsTest(Map<String, String> paramMap) {
		//System.out.println("WSApiServiceImpl wsTest init ==================");
		String area = paramMap.get("area");
		Map<String, Object> configMap = cfg.getWsConfig(area);
		MdcServiceManagerStub stub = MdcServiceApiUtil.initApiConnection(configMap.get(ConfigConstants.WS_ENDPOINT_KEY).toString());
		SessionID sessionId = null;
		if (stub != null) {
			sessionId = StartSession(stub, configMap.get(ConfigConstants.WS_USERNAME_KEY).toString(), configMap.get(ConfigConstants.WS_PASSWORD_KEY).toString());
			
			//System.out.println("WSApiServiceImpl wsTest start ==================");
			SelectDevicesByUsername dev = new SelectDevicesByUsername();
			dev.setSessionId(sessionId);
			
			try {
				SelectTabgen stg = new SelectTabgen();
				stg.setSessionId(sessionId);
				
				if (area.equals("marketingtest")) {
					stg.setTabname("MA_INVENTORY");
					stg.setDeviceCode("|000|");
					stg.setKey("T00001");
				} else {
					stg.setTabname("AIRPLANETABLE");
					stg.setDeviceCode("__ALL__");
					stg.setKey("Jerry Jones||DET");
				}
				System.out.println("stg.getKey="+stg.getKey());
				SelectTabgenResponse str = stub.selectTabgen(stg);
				TabGen tg = str.get_return();
				if (tg != null) {
					System.out.println("Item key:"+tg.getKey()+", Item name:"+tg.getValue()+", Barcode="+tg.getValue2());
				}
			} catch(Exception ex) {
				log.error(ex.getMessage());
				ex.printStackTrace();
			}
			System.out.println("wsTest End =========================");
			
			CloseSession(stub, sessionId);
		}
	}
}