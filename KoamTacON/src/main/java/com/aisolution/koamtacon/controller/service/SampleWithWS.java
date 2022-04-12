package com.aisolution.koamtacon.controller.service;

import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub;
import com.gullivernet.mdc.dataexchange.ws.MdcServiceManagerStub.SessionID;

public class SampleWithWS {
	private MdcServiceManagerStub stub;
	private SessionID sessionId;
	
	public SampleWithWS(MdcServiceManagerStub stub, SessionID sessionId) {
		super();
		this.stub = stub;
		this.sessionId = sessionId;
	}
}
