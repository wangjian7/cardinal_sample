<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
//===========================================================================
//  CardinalCommerce (http://www.cardinalcommerce.com)
//  ccNotification.jsp
//
//	This page receives Amazon payment update notifications from Centinel via
//	HTTP posts and queries Centinel for the Amazon payment status update.
//
//	Merchants should add functionality to handle Amazon payment status
//	changes in the locations marked "'// ADD LOGIC" below.
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

	if (notificationId == null){
		notificationId = "";
	}

	if (notificationId.length() > 1) {

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_payment_status");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("NotificationId", request.getParameter("NotificationId"));
		centinelRequest.add("TransactionType", "EL");



		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

		formattedRequest = centinelRequest.getFormattedRequest();
		formattedResponse = centinelResponse.getFormattedResponse();
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");
		String processorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");
		String orderNumber = centinelResponse.getValue("OrderNumber");
		String notificationType = centinelResponse.getValue("NotificationType");
		String merchantData = centinelResponse.getValue("MerchantData");
		String paymentType = centinelResponse.getValue("PaymentType");
		String currencyCode = centinelResponse.getValue("CurrencyCode");

		centinelResponse = null;
		centinelRequest = null;
		
	
		// With the information provided, update the status of the order in your system.

		if ("PaymentNotification".equalsIgnoreCase(notificationType)) { 
            // Payment Notification
			// ADD LOGIC
		
		} else if ("PaymentCompleteNotification".equalsIgnoreCase(notificationType)) { 
            // Payment Complete Notification
			// ADD LOGIC

		} else if ("CancelNotification".equalsIgnoreCase(notificationType)) { 
            // Cancel Notification
			// ADD LOGIC

		} else { 
			// ADD LOGIC
            // - log an error, unrecognized notification type		

		}
	}

	String executeTransaction = request.getParameter("execute");

	if ("true".equals(executeTransaction)){

%>

<b> Payment Status Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Payment Status Response Results </b>
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

