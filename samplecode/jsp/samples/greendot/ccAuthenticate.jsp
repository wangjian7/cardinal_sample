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
	
		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_authenticate");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionId", (String) session.getAttribute("Centinel_TransactionId"));
		centinelRequest.add("TransactionType", (String) session.getAttribute("Centinel_TransactionType"));
		centinelRequest.add("PAResPayload", pares);



		///////////////////////////////////////////////////////////////////////////////////////////===
		// Send the XML Msg to the MAPS Server
		// SendHTTP will send the cmpi_authenticate message to the MAPS Server (requires fully qualified Url)
		// The Response is the CentinelResponse Object
		///////////////////////////////////////////////////////////////////////////////////////////===

        centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

		session.setAttribute("Centinel_Authenticate_Request", centinelRequest.getFormattedRequest());
		session.setAttribute("Centinel_Authenticate_Response", centinelResponse.getFormattedResponse());

		// Using the centinelResponse object, we need to retrieve the results as follows

		String transactionType = (String) session.getAttribute("Centinel_TransactionType");

		session.setAttribute("Centinel_PAResStatus", centinelResponse.getValue("PAResStatus"));
		session.setAttribute("Centinel_ErrorNo", centinelResponse.getValue("ErrorNo"));
		session.setAttribute("Centinel_ErrorDesc", centinelResponse.getValue("ErrorDesc"));
		session.setAttribute("Centinel_OrderId", centinelResponse.getValue("OrderId"));

        centinelRequest = null;
        centinelResponse = null;
    } else {

        session.setAttribute("Centinel_ErrorDesc", "NO PARES RETURNED");
    }

	// Initialize the redirect page to the Results Page.

    String redirectPage = "ccResults.jsp";

	String paresStatus = (String) session.getAttribute("Centinel_PAResStatus");
	String sigVerStatus = (String) session.getAttribute("Centinel_SignatureVerification");
	String errorNo = (String) session.getAttribute("Centinel_ErrorNo");


	// Verify possible PAResStatus values for specific payment types with the documentation 
	
	if ("0".equals(errorNo) && "Y".equalsIgnoreCase(paresStatus)) {

		session.setAttribute("Message", "Your transaction completed successfully. Your order will be shipped immediately.");
		redirectPage = "ccResults.jsp";

	} else if ("0".equals(errorNo) && "P".equalsIgnoreCase(paresStatus)) {

		session.setAttribute("Message", "Your transaction is pending. Continue with order once verified.");
		redirectPage = "ccResults.jsp";

	} else if ("N".equalsIgnoreCase(paresStatus)) {

		session.setAttribute("Message", "Declined. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else if ("X".equalsIgnoreCase(paresStatus)) {

		session.setAttribute("Message", "Your transaction was canceled prior to completion. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else if ("D".equalsIgnoreCase(paresStatus)) {

		session.setAttribute("Message", "Buyer requested to update data.");
		redirectPage = "ccStart.jsp";

	} else if ("U".equalsIgnoreCase(paresStatus)) {

		session.setAttribute("Message", "Payment Brand is unavailable. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else if ("E".equalsIgnoreCase(paresStatus)) {

		session.setAttribute("Message", "Payment Brand was unable to complete. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	} else {

		// Unexpected State
		session.setAttribute("Message", "Payment Brand was unable to complete. Please provide another form of payment.");
		redirectPage = "ccStart.jsp";

	}



%>
<html>
<head>
<script Language="Javascript">
<!--
	function onLoadHandler(){
		document.frmResultsPage.submit();
	}
//-->
</script>
</head>
<body onLoad="onLoadHandler();">
<form name="frmResultsPage" method="Post" action="<%=redirectPage%>" target="_parent">
<noscript>
	<br><br>
	<center>
	<font color="red">
	<h1>Processing Your Transaction</h1>
	<h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
	<h3>Please click Submit to continue	the processing of your transaction.</h3>
	</font>
	<input type="submit" value="Submit">
	</center>
</noscript>
</form>
</body>
</html>
