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
		centinelRequest.add("OrderId", (String) session.getAttribute("Centinel_OrderId"));
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
		session.setAttribute("Centinel_SignatureVerification", centinelResponse.getValue("SignatureVerification"));
		session.setAttribute("Centinel_ECI", centinelResponse.getValue("EciFlag"));
		session.setAttribute("Centinel_XID", centinelResponse.getValue("Xid"));
		session.setAttribute("Centinel_CAVV", centinelResponse.getValue("Cavv"));
		session.setAttribute("Centinel_ErrorNo", centinelResponse.getValue("ErrorNo"));
		session.setAttribute("Centinel_ErrorDesc", centinelResponse.getValue("ErrorDesc"));

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


	// Handle 3DS Payment Specific Logic
	if (("0".equals(errorNo) || "1140".equals(errorNo)) && "Y".equals(sigVerStatus) && ("Y".equals(paresStatus) || "A".equals(paresStatus))) {

		
		//=====================================================================================
        //                                                                           
        //     If no errors were returned, the signature verification passed, and     
        //     the transaction status was either "Y" (authenticated) or "A"           
        //     (attempted), Payer Authentication was successful.                      
        //                                                                           
		//=====================================================================================

		session.setAttribute("Message", "Your transaction completed successfully.");
		redirectPage = "ccResults.jsp";

	} else if ("N".equalsIgnoreCase(paresStatus) && "Y".equalsIgnoreCase(sigVerStatus) && ("0".equalsIgnoreCase(errorNo) || "1140".equalsIgnoreCase(errorNo))) {

		//=====================================================================================
        //                                                                            
        //       Customer was presented with the authentication screen however        
        //       either clicked the "exit" option or was unable to provide the        
        //       correct password.                                                    
        //                                                                           
		//=====================================================================================

		session.setAttribute("Message", "Your transaction was unable to authenticate. Please provide another form of payment. (PAResStatus = N)");
		redirectPage = "ccStart.jsp";

	} else {

		//=====================================================================================
        //                                                                            
        //      Continue to authorization, either an error occurred or an unexpected status 
        //      was returned ("U" for example).                                             
        //                                                                            
		//=====================================================================================

		session.setAttribute("Message", "Your transaction completed however is pending review. Your order will be shipped once payment is verified.");
		redirectPage = "ccResults.jsp";

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
