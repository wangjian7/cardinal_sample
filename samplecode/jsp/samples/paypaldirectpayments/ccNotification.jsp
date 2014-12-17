<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
//===========================================================================
//  CardinalCommerce (http://www.cardinalcommerce.com)
//  ccNotification.jsp
//===========================================================================
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Notification Page</title>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Notification Request Form</b>
<form name="frm" method="POST" action="ccNotification.jsp?execute=true">
<table>
<tr>
				<td bgcolor="ffff40">NotificationId </td>
				<td><input type="text" size="60" name="NotificationId" value=""></td>
			</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Status"></td>
</tr>
<tr>
  <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
</tr>
</table>
</form>
<br>
<hr>
<br><br>
<%

	String formattedRequest = "";
	String formattedResponse = "";

	String notificationId = request.getParameter("NotificationId");
    String reqProcessorId = request.getParameter("ProcessorId");
    String reqMerchantId = request.getParameter("MerchantId");


	if (notificationId == null){
		notificationId = "";
	}

	if (notificationId.length() > 1) {

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////


		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_paypal_status");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("NotificationId", request.getParameter("NotificationId"));

		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

		formattedRequest = centinelRequest.getFormattedRequest();
		formattedResponse = centinelResponse.getFormattedResponse();

		String errorNo = centinelResponse.getValue("ErrorNo");
		String errorDesc = centinelResponse.getValue("ErrorDesc");
		String transactionId = centinelResponse.getValue("TransactionId");
		String orderId = centinelResponse.getValue("OrderId");
		String paypalTransactionType = centinelResponse.getValue("PayPalTransactionType");
		String processorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");
		String paypalStatus = centinelResponse.getValue("PayPalStatus");
		String signatureStatus = centinelResponse.getValue("SignatureVerification");
		String amount = centinelResponse.getValue("Amount");
		String currencyCode = centinelResponse.getValue("CurrencyCode");
		String orderNumber = centinelResponse.getValue("OrderNumber");
		String orderDescription = centinelResponse.getValue("OrderDescription");
		String merchantData = centinelResponse.getValue("MerchantData");
		String merchantReferenceNumber = centinelResponse.getValue("MerchantReferenceNumber");

		centinelResponse = null;
		centinelRequest = null;
		
		// With the information provided, update the status of the order in your system.

	}

	String executeTransaction = request.getParameter("execute");

	if ("true".equals(executeTransaction)){

%>

<b> PayPal Status Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> PayPal Status Response Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedResponse%></textarea></td>
</tr>
</table>

<%

	}
	
%>

</body>
</html>
