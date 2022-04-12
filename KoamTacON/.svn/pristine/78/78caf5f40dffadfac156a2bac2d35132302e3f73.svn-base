package com.aisolution.common.datasource;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.jdbc.datasource.AbstractDataSource;
import org.springframework.jdbc.datasource.lookup.DataSourceLookup;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.util.Assert;

public abstract class AbstractRoutingDataSource extends AbstractDataSource implements InitializingBean {

	private Map targetDataSources;
	private Object defaultTargetDataSource;
	private DataSourceLookup dataSourceLookup = new JndiDataSourceLookup();
	private Map resolvedDataSources;
	private DataSource resolvedDefaultDataSource;
	
	@Override
	public Connection getConnection() throws SQLException {
		// TODO Auto-generated method stub
		return determineTargetDataSource().getConnection();
	}

	@Override
	public Connection getConnection(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		return determineTargetDataSource().getConnection(username, password);
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		if (this.targetDataSources == null) {
			throw new IllegalArgumentException("targetDataSources is required");
		}
		this.resolvedDataSources = new HashMap(this.targetDataSources.size());
		for (Iterator it = this.targetDataSources.entrySet().iterator(); it.hasNext();) {
			Map.Entry entry = (Map.Entry) it.next();
			Object lookupKey = resolveSpecifiedLookupKey(entry.getKey());
			DataSource dataSource = resolveSpecifiedDataSource(entry.getValue());
			this.resolvedDataSources.put(lookupKey, dataSource);
		}
		if (this.defaultTargetDataSource != null) {
			this.resolvedDefaultDataSource = resolveSpecifiedDataSource(this.defaultTargetDataSource);
		}
	}
	
	public void setTargetDataSources(Map targetDataSources) {
		this.targetDataSources = targetDataSources;
	}
	
	public void setDataSourceLookup(DataSourceLookup dataSourceLookup) {
		this.dataSourceLookup = (dataSourceLookup != null ? dataSourceLookup : new JndiDataSourceLookup());
	}
	
	protected DataSource resolveSpecifiedDataSource(Object dataSource) throws IllegalArgumentException {
		if (dataSource instanceof DataSource) {
			return (DataSource) dataSource;
		}
		else if (dataSource instanceof String) {
			return this.dataSourceLookup.getDataSource((String) dataSource);
		}
		else {
			throw new IllegalArgumentException(
					"Illegal data source value - only [javax.sql.DataSource] and String supported: " + dataSource);
		}
	}
	
	protected DataSource determineTargetDataSource() {
		Assert.notNull(this.resolvedDataSources, "DataSource router not initialized");
		Object lookupKey = determineCurrentLookupKey();
		DataSource dataSource = (DataSource) this.resolvedDataSources.get(lookupKey);
		if (dataSource == null) {
			dataSource = this.resolvedDefaultDataSource;
		}
		if (dataSource == null) {
			throw new IllegalStateException("Cannot determine target DataSource for lookup key [" + lookupKey + "]");
		}
		return dataSource;
	}
	
	protected Object resolveSpecifiedLookupKey(Object lookupKey) {
		return lookupKey;
	}
	
	protected abstract Object determineCurrentLookupKey();
}
