<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
//===========================================================================
// CardinalCommerce (http://www.cardinalcommerce.com)
//
// This page receives notifications from Centinel via HTTP posts and
// processes the status message with Centinel to retrieve the status response.
//
// Merchants should add functionality to handle status
// changes in the locations marked ADD LOGIC
//===========================================================================
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Notification Page</title>
</head>
<body>

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
	String strNotificationType = "";
	String strErrorNo = "";
	String strErrorDesc = "";
	String strTransactionId = "";
	String strOrderId = "";
	String strProcessorTransactionId = "";
	String strProcessorOrderNumber = "";
	String strOrderNumber = "";
	String strPaymentType = "";
	String strStatusCode = "";
	String strStatusDescription = "";
	String strReasonCode = "";
	String strReasonDesc = "";
	String strTxnType = "KL";
	String strNotificationId = request.getParameter("NotificationId");
    String reqProcessorId = request.getParameter("ProcessorId");
    String reqMerchantId = request.getParameter("MerchantId");

	if (strNotificationId == null){
		strNotificationId = "";
	}

	if (strNotificationId.length() > 0) {

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("MsgType", "cmpi_payment_status");
		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", "KL");
		centinelRequest.add("NotificationId", strNotificationId);

		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		strNotificationType = centinelResponse.getValue("NotificationType");
		strErrorNo = centinelResponse.getValue("ErrorNo"); 
		strErrorDesc = centinelResponse.getValue("ErrorDesc");
		strTransactionId = centinelResponse.getValue("TransactionId");
		strOrderId = centinelResponse.getValue("OrderId");
		strProcessorTransactionId = centinelResponse.getValue("ProcessorTransactionId");
		strProcessorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");
		strOrderNumber = centinelResponse.getValue("OrderNumber");
		strPaymentType = centinelResponse.getValue("PaymentType");
		strStatusCode = centinelResponse.getValue("StatusCode");
		strStatusDescription = centinelResponse.getValue("StatusDescription");
		strReasonCode = centinelResponse.getValue("ReasonCode");
		strReasonDesc = centinelResponse.getValue("ReasonDesc");


		formattedRequest = centinelRequest.getFormattedRequest();
		formattedResponse = centinelResponse.getFormattedResponse();
		
		if ("OrderStateChangeNotification".equalsIgnoreCase(centinelResponse.getValue("NotificationType"))) {
				//OrderStateChangeNotification
				//ADD LOGIC IF NEEDED
		
		}

		centinelResponse = null;
		centinelRequest = null;
		
		} else {
		
		/////////////////////////////////////////////////////////////////////////////////////
		// Log Error - "Centinel Notification POST Error MISSING PARAMETER notification_id"
		/////////////////////////////////////////////////////////////////////////////////////
		

	}
	
	String executeTransaction = request.getParameter("execute");

	if ("true".equals(executeTransaction)){
	

%> 
<b>Status Request Results</b>
<table>
	<tr>
		<td>ProcessorId</td><td><%=PROCESSOR_ID%></td>
	</tr>
	<tr>
		<td>MerchantId</td><td><%=MERCHANT_ID%></td>
	</tr>
	<tr>
		<td>Transaction Type:</td><td><%=strTxnType%></td>
	</tr>
	<tr>
		<td>Notification Id:</td> <td><%=strNotificationId%></td>
	</tr>
</table>
<br>
<br>
<b>Status Response Results</b>
<table>
	<tr>
		<td>Order Id:</td><td><%=strOrderId%></td>
	</tr>
	<tr>
		<td>Order Number:</td><td><%=strOrderNumber%></td>
	</tr>
	<tr>
		<td>Transaction Id:</td><td><%=strTransactionId%></td>
	</tr>
	<tr>
		<td>Status Code:</td><td><%=strStatusCode%></td>
	</tr>
	<tr>
		<td>Processor Order Number:</td><td><%=strProcessorOrderNumber%></td>
	</tr>
	<tr>
		<td>Processor Transaction Id:</td><td><%=strProcessorTransactionId%></td>
	</tr>
	<tr>
		<td>Notification Type:</td><td><%=strNotificationType%></td>
	</tr>
	<tr>
		<td>Payment Type:</td><td><%=strPaymentType%></td>
	</tr>
	<tr>
		<td>Status Description:</td><td><%=strStatusDescription%></td>
	</tr>
	<tr>
		<td>Error No:</td><td><%=strErrorNo%></td>
	</tr>
	<tr>
		<td>Error Desc:</td><td><%=strErrorDesc%></td>
	</tr>
	<tr>
		<td>Reason Code:</td><td><%=strReasonCode%></td>
	</tr>
	<tr>
		<td>Reason Desc:</td><td><%=strReasonDesc%></td>
	</tr>
	<br/>
	<br/>
	<tr>
		<td>Status Response:</td>
		<td>
		<textarea cols="75" rows="20" readonly="readonly"><%=formattedResponse%></textarea>
		</td>
	</tr>
</table>
<%
	}
%>
</body>
</html>