package com.gullivernet.mdc.dataexchange.ws;

import org.apache.axis2.Constants;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MdcServiceApiUtil {

	private static final Log log = LogFactory.getLog(MdcServiceApiUtil.class);
	
	private MdcServiceApiUtil() {
		
	} 
	
	public static MdcServiceManagerStub initApiConnection(String wsEndpoint)  {
		MdcServiceManagerStub stub = null;
		
		try {
			
			stub = new MdcServiceManagerStub();
			//Config conf = Config.getInstance();
			ServiceClient serviceClient = stub._getServiceClient();		
			EndpointReference endpoint = new EndpointReference(wsEndpoint);
			log.info("WS ENDPOINT: " + wsEndpoint);
	
			// Enabling MTOM on the channel
			Options options = new Options();
			options.setTo(endpoint);
			options.setProperty(Constants.Configuration.ENABLE_MTOM, Constants.VALUE_TRUE);
			serviceClient.setOptions(options);
		} catch (Exception E) {
			log.error(E);
		}
		
		return stub;
	} 
	
	
}
