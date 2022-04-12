package com.aisolution.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.aisolution.common.model.ExcelInfo;

public class ExcelUtils {
	private static final Logger log = LoggerFactory.getLogger(ExcelUtils.class);
	
	public static Workbook getWorkbook(String path, String filename) {
		log.debug("path:{}, filename:{}", path, filename);
		StringBuffer sbFullname = new StringBuffer();
		sbFullname.append(path).append(File.separator).append(filename);
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(sbFullname.toString());
		} catch(FileNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
		Workbook wb = null;
		
		if (filename.toUpperCase().endsWith(".XLS")) {
			try {
				wb = new HSSFWorkbook(fis);
			} catch(IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		} else if (filename.toUpperCase().endsWith(".XLSX")) {
			try {
				wb = new XSSFWorkbook(fis);
			} catch(IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		
		return wb;
	}
	
	public static List<Map<String, String>> read(ExcelInfo excelInfo) {
		List<Map<String, String>> rtnList = new ArrayList<Map<String, String>>();
		
		Workbook wb = getWorkbook(excelInfo.getPath(), excelInfo.getFilename());
		
		Sheet sheet = wb.getSheetAt(0);
		int lastCellNumber = excelInfo.getLastCellNumber();
		
		String tableName =  sheet.getRow(0).getCell(0).toString();
		log.debug("tabName={}, tableName={}",excelInfo.getTabName(),tableName);
		
		if (excelInfo.getTabName() != null && !excelInfo.getTabName().equals("") && excelInfo.getTabName().equals(tableName)) {
			Row row = null;
			Cell cell = null;
			
			String cellName = "";
			
			Map<String, String> map = null;
			int i = excelInfo.getStartRow()-1;
			boolean bFlag = false;
			while(true) {
				row = sheet.getRow(i++);
				if (row != null) {
					if (row.getCell(0) == null) {
						bFlag = true;
					} else {
						map = new HashMap<String, String>();
						map.put("rowNum", String.valueOf(row.getRowNum()+1));
						for(int cellInx=0; cellInx<lastCellNumber; cellInx++) {
							cell = row.getCell(cellInx);
							cellName = CellReference.convertNumToColString(cellInx);
							if (!excelInfo.getColumnNames().contains(cellName)) {
								continue;
							}
							if (cell != null) {
								map.put(cellName, cell.toString());
							} else {
								map.put(cellName, "");
							}
						}
						rtnList.add(map);
					}
				} else {
					bFlag = true;
				}
				
				if (bFlag) {
					break;
				}
			}
		} else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("error", "InvalidTabname");
			rtnList.add(map);
		}
		return rtnList;
	}
	
	public static HSSFWorkbook makeListToExcel(List<Map<String, Object>> list, List<String> keyList, List<String> colNameList, String sheetName) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, sheetName);
		
		HSSFRow row = null;
		
		int startRow = 0;
		if (colNameList != null) {
			row = sheet.createRow(startRow++);
			for(int i=0; i<colNameList.size(); i++) {
				row.createCell(i).setCellValue(colNameList.get(i));
			}
		}
		
		for(int i=startRow; i<list.size(); i++) {
			row = sheet.createRow(startRow++);
			Map<String, Object> map = list.get(i);
			for(int j=0; j<keyList.size(); j++) {
				if (map.get(keyList.get(j)) != null) {
					row.createCell(j).setCellValue(map.get(keyList.get(j)).toString());
				} else {
					row.createCell(j).setCellValue("");
				}
			}
		}
		
		return workbook;
	}
	
	public static void main(String[] args) {
		ExcelInfo excelInfo = new ExcelInfo();
		
		excelInfo.setPath("C:\\Temp");
		excelInfo.setFilename("TemplateForGroupMemberRegistration.xlsx");
		excelInfo.setColumnNames("A","C");
		excelInfo.setStartRow(2);
		excelInfo.setLastCellNumber(3);
		
		List<Map<String, String>> list = read(excelInfo);
		for(Map<String,String> map : list) {
			log.info("A={},B={},C={}",map.get("A"),map.get("B"),map.get("C"));
		}
	}
}
