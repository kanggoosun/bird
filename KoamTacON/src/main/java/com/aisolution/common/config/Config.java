package com.aisolution.common.config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Config {
	@Value("#{koamtacon_config['ws.endpoint.koamtac']}")
	private String wsEndpointKoamtac;
	@Value("#{koamtacon_config['ws.username.koamtac']}")
	private String wsUsernameKoamtac;
	@Value("#{koamtacon_config['ws.password.koamtac']}")
	private String wsPasswordKoamtac;
	
	@Value("#{koamtacon_config['ws.endpoint.marketingtest']}")
	private String wsEndpointMarketingtest;
	@Value("#{koamtacon_config['ws.username.marketingtest']}")
	private String wsUsernameMarketingtest;
	@Value("#{koamtacon_config['ws.password.marketingtest']}")
	private String wsPasswordMarketingtest;
	
	@Value("#{koamtacon_config['ws.endpoint.dev']}")
	private String wsEndpointDev;
	@Value("#{koamtacon_config['ws.username.dev']}")
	private String wsUsernameDev;
	@Value("#{koamtacon_config['ws.password.dev']}")
	private String wsPasswordDev;
	
	public String getWsEndpointKoamtac() {
		return wsEndpointKoamtac;
	}
	public String getWsUsernameKoamtac() {
		return wsUsernameKoamtac;
	}
	public String getWsPasswordKoamtac() {
		return wsPasswordKoamtac;
	}
	
	public String getWsEndpointMarketingtest() {
		return wsEndpointMarketingtest;
	}
	public String getWsUsernameMarketingtest() {
		return wsUsernameMarketingtest;
	}
	public String getWsPasswordMarketingtest() {
		return wsPasswordMarketingtest;
	}
	
	public String getWsEndpointDev() {
		return wsEndpointDev;
	}
	public String getWsUsernameDev() {
		return wsUsernameDev;
	}
	public String getWsPasswordDev() {
		return wsPasswordDev;
	}
	
	public Map<String, Object> getWsConfig(String area) {
		Map<String, Object> wsConfig = new HashMap<String, Object>();
		
		String wsEndPoint = "";
		String wsUsername = "";
		String wsPassword = "";
		
		if (area == null) { // default
			wsEndPoint = wsEndpointMarketingtest;
			wsUsername = wsUsernameMarketingtest;
			wsPassword = wsPasswordMarketingtest;
		} else if (area.equals("marketingtest")) { // marketingtest area
			wsEndPoint = wsEndpointMarketingtest;
			wsUsername = wsUsernameMarketingtest;
			wsPassword = wsPasswordMarketingtest;
		} else if (area.equals("koamtac")) { // koamtac area
			wsEndPoint = wsEndpointKoamtac;
			wsUsername = wsUsernameKoamtac;
			wsPassword = wsPasswordKoamtac;
		} else if (area.equals("dev")) { // dev area
			wsEndPoint = wsEndpointDev;
			wsUsername = wsUsernameDev;
			wsPassword = wsPasswordDev;
		} else { // default
			wsEndPoint = wsEndpointMarketingtest;
			wsUsername = wsUsernameMarketingtest;
			wsPassword = wsPasswordMarketingtest;
		}
		
		wsConfig.put(ConfigConstants.WS_ENDPOINT_KEY, wsEndPoint);
		wsConfig.put(ConfigConstants.WS_USERNAME_KEY, wsUsername);
		wsConfig.put(ConfigConstants.WS_PASSWORD_KEY, wsPassword);
		
		return wsConfig;
	}
}
