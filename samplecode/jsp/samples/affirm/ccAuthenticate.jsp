<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccAuthenticate.jsp
/////////////////////////////////////////////////////////////////////////////////////////

	/////////////////////////////////////////////////////////////////////////////////////////
	// Retrieve the PaRes and MD values from the Form POST to this Term URL page.
	// If you like, the MD data could contain the id
	// that would enable you to reestablish the transaction session. This would be the 
	// alternative to using the Client Session Cookies
	/////////////////////////////////////////////////////////////////////////////////////////

	String pares = request.getParameter("PaRes");
	String merchant_data = request.getParameter("MD");
		
	/////////////////////////////////////////////////////////////////////////////////////////
	// If the PaRes is Not Empty then process the cmpi_authenticate message
	/////////////////////////////////////////////////////////////////////////////////////////

	if (pares != null && pares.length() > 0) {
	
		centinelRequest.add("MsgType", "cmpi_authenticate");
		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", (String)session.getAttribute("TransactionType"));
		centinelRequest.add("OrderId", (String)session.getAttribute("OrderId"));
		centinelRequest.add("TransactionId", (String)session.getAttribute("TransactionId"));
		centinelRequest.add("PAResPayload", pares);

        centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		session.setAttribute("Centinel_Authenticate_Request", centinelRequest.getFormattedRequest());
		session.setAttribute("Centinel_Authenticate_Response", centinelResponse.getFormattedResponse());
		session.setAttribute("Centinel_PAResStatus", centinelResponse.getValue("PAResStatus"));
		session.setAttribute("SignatureVerification", centinelResponse.getValue("SignatureVerification"));
		session.setAttribute("ErrorNo", centinelResponse.getValue("ErrorNo"));
		session.setAttribute("ErrorDesc", centinelResponse.getValue("ErrorDesc"));
		
		centinelRequest = null;
        centinelResponse = null;
			
    } else {
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
        String strErrorNo = (String)centinelResponse.getValue("ErrorNo");
    }

	// Determine if the transaction resulted in an error

	String redirectPage = "ccResults.jsp";

	String strParesStatus = (String)session.getAttribute("Centinel_PAResStatus");
	String strErrorNo = (String)session.getAttribute("ErrorNo");

	if ("0".equals(strErrorNo) && "Y".equalsIgnoreCase(strParesStatus)) {

		session.setAttribute("Message", "Your transaction completed successfully. Your order will be shipped immediately.");
		redirectPage = "ccResults.jsp";

	} else if ("0".equals(strErrorNo) && "P".equalsIgnoreCase(strParesStatus)) {

		session.setAttribute("Message", "Your transaction is pending. Continue with order once verified.");
		redirectPage = "ccResults.jsp";

	} else if ("N".equalsIgnoreCase(strParesStatus)) {

		session.setAttribute("Message", "Declined. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else if ("X".equalsIgnoreCase(strParesStatus)) {

		session.setAttribute("Message", "Your transaction was canceled prior to completion. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else if ("D".equalsIgnoreCase(strParesStatus)) {

		session.setAttribute("Message", "Buyer requested to update data.");
		redirectPage = "ccStart.jsp";

	} else if ("U".equalsIgnoreCase(strParesStatus)) {

		session.setAttribute("Message", "Payment Brand is unavailable. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else if ("E".equalsIgnoreCase(strParesStatus)) {

		session.setAttribute("Message", "Payment Brand was unable to complete. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else {
		session.setAttribute("Message", "Payment Brand was unable to complete. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	}
%>
<html>
<head>
<title>Centinel - ccAuthenticate Page</title>
</head>
<body onload="document.frmResultPage.submit();"></body>
<form name="frmResultPage" method="POST" action="<%=redirectPage%>" target="_parent">
<noscript>
    <br><br>
    <center>
    <font color="red">
    <h1>Processing Your Transaction</h1>
    <h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
    <h3>Please click Submit to continue the processing of your transaction.</h3>
    </font>
    <input type="submit" value="Submit">
    </center>
</noscript>
</form>
</html>
