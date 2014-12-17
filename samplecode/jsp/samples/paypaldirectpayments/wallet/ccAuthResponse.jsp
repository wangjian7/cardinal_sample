<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccAuthResponse.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Auth Response Page</title>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Auth Response Request Form</b>
<form name="frm" method="POST" action="ccAuthResponse.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
		  <option value="WT">WT - Wallet</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId </td><td><input type=text size="60" name="order_id"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Authorization Status </td>
	<td>
		<select name="authorization_status">
		<option value="Y">Y - Successful</option>
		<option value="N">N - Decline</option>
		<option value="X">X - Cancel</option>
		<option value="E">E - Error</option>
		<option value="P">P - Pending</option>
		</select>
	</td>
</tr>
<tr>
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process"></td>
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

String executeTransaction = request.getParameter("execute");

if ("true".equals(executeTransaction)){

	String 	strErrorNo, strErrorDesc, strReferenceId, strStatus, strTransactionId, strReasonCode;

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_baseserver_api");
	centinelRequest.add("SubMsgType", "cmpi_authresponse");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("AuthorizationStatus", request.getParameter("authorization_status"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));


	// Send Message to the MAPS Server

	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	strErrorNo = centinelResponse.getValue("ErrorNo");
	strErrorDesc = centinelResponse.getValue("ErrorDesc");
	strStatus = centinelResponse.getValue("StatusCode");
	strTransactionId = centinelResponse.getValue("TransactionId");

	centinelRequest = null;
	centinelResponse = null;

	%>


	<b> Auth Response Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Auth Response Transaction Response </b>
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

