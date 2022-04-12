package com.aisolution.common.model;

import java.util.ArrayList;
import java.util.List;

public class ExcelInfo {

	private String tabName;
	private String path;
	private String filename;
	private List<String> columnNames;
	private int startRow;
	private int lastCellNumber;
	private String result;
	
	public String getTabName() {
		return tabName;
	}
	public void setTabName(String tabName) {
		this.tabName = tabName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public List<String> getColumnNames() {
		List<String> temp = new ArrayList<String>();
		temp.addAll(columnNames);
		return temp;
	}
	public void setColumnNames(List<String> columnNames) {
		List<String> temp = new ArrayList<String>();
		temp.addAll(columnNames);
		this.columnNames = temp;
	}
	public void setColumnNames(String ... columnNames) {
		if (this.columnNames == null) {
			this.columnNames = new ArrayList<String>();
		}
		for(String columnName : columnNames) {
			this.columnNames.add(columnName);
		}
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getLastCellNumber() {
		return lastCellNumber;
	}
	public void setLastCellNumber(int lastCellNumber) {
		this.lastCellNumber = lastCellNumber;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
