package com.aisolution.common.config;

public class ConfigConstants {
	/**
     * session Key
     */
    public static final String KOAMTACON_SESSION_KEY = "KOAMTACON_SESSION";
    
    public static final String AREA = "marketingtest";
    
    /**
     * property file - local
     */
    //public static final String PROPERTY_FILE = "C:\\Ender\\DEV\\ws_sts_koamtacon\\KoamTacON\\src\\main\\webapp\\resources\\conf\\local.koamtacon.properties";
    
    /**
     * property file - Server
     */
    public static final String PROPERTY_FILE = "/var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/conf/prod.koamtacon.properties";
    
    public static final int DATA_LIMIT = 1000;
    
    public static final int MEMBER_LIMIT = 20;
    
    public static final String fromAddress = "koamtacon@koamtac.com";
    
    public static final int TEN_ITEMS_NO_PER_PAGE = 10;
    
    public static final int FIVE_ITEMS_NO_PER_PAGE = 5;
    
    public static final int PAGE_NO_PER_BLOCK = 10;
    
    public static final String WS_ENDPOINT_KEY = "wsEndPoint";
    public static final String WS_USERNAME_KEY = "wsUsername";
    public static final String WS_PASSWORD_KEY = "wsPassword";
}
