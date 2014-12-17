<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.net.URLDecoder.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.Field" %>

<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />

<%@ include file="CentinelConfig.jsp" %>

<%

	Enumeration keys = request.getParameterNames();
	
	while(keys.hasMoreElements()){
		String el = (String) keys.nextElement();
		String val = request.getParameter(el);;
		
		centinelRequest.add(el, val);
	}

	centinelRequest.add("Version",          MESSAGE_VERSION);
	centinelRequest.add("ProcessorId",      PROCESSOR_ID);
	centinelRequest.add("MerchantId",       MERCHANT_ID);
	centinelRequest.add("TransactionPwd",	TRANSACTION_PWD);
	centinelRequest.add("UserAgent",        request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader",    request.getHeader("Accept"));
	centinelRequest.add("IPAddress",		request.getRemoteAddr());
	
	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	// Use reflection to get response hashtable so we can loop over whole response
	Class c = centinelResponse.getClass();
	Field field = c.getDeclaredField("htResponseData");
	field.setAccessible(true);
	Hashtable<String, String> ht = (Hashtable<String, String>) field.get(centinelResponse);
	
	Enumeration rspKeys = (Enumeration) ht.keys();
	
	// Output response elements as json
	response.setContentType("application/x-javascript; charset=utf-8");
	out.write("{");
	while (rspKeys.hasMoreElements()) {
		String key = (String) rspKeys.nextElement();
		String val = (String) ht.get(key);
		out.write("\"" + key + "\"" + ":" + "\"" + val + "\"" );
		if(rspKeys.hasMoreElements()){
			out.write(",");
		}
	}
	out.write("}");
	
	
	centinelResponse = null;
	centinelRequest = null;
	%>
