<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
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
<br/>
<b>Notification Request Form</b>
<form name="frm" method="POST" action="ccNotification.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">NotificationId </td>
	<td><input type="text" size="60" name="notification_id" value=""></td>
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

	boolean executeTransaction = Boolean.valueOf(request.getParameter("execute")).booleanValue();

	if (executeTransaction) {

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("MsgType", "cmpi_payment_status");
		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("TransactionType", "AF");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("NotificationId", request.getParameter("notification_id"));

		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);

		formattedRequest = centinelRequest.getFormattedRequest();
		formattedResponse = centinelResponse.getFormattedResponse();

		centinelResponse = null;
		centinelRequest = null;

%>

<b> Notification Request</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Notification Response</b>
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
