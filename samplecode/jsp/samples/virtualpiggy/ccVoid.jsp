<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccVoid.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Void Page</title>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Void Request Form</b>
<form name="frm" method="POST" action="ccVoid.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
		  <option value="VP">VP - VirtualPiggy</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId </td><td><input type=text size="60" name="order_id"></td>
</tr>
<tr>
	<td>AuthorizationCode </td><td><input type=text size="60" name="authorization_code"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Reason </td>
	<td>
		<select name="reason">
		<option value="Other">Other</option>
		<option value="NoInventory">NoInventory</option>
		<option value="CustomerReturn">CustomerReturn</option>
		<option value="GeneralAdjustment">GeneralAdjustment</option>
		<option value="CouldNotShip">CouldNotShip</option>
		<option value="DifferentItem">DifferentItem</option>
		<option value="Abandoned">Abandoned</option>
		<option value="CustomerCancel">CustomerCancel</option>
		<option value="PriceError">PriceError</option>
		<option value="ProductOutofStock">ProductOutofStock</option>
		<option value="CustomerAddressIncorrect">CustomerAddressIncorrect</option>
		<option value="Exchange">Exchange</option>
		<option value="RiskAssessmentInformationNotValid">RiskAssessmentInformationNotValid</option>
		<option value="CarrierCoverageFailure">CarrierCoverageFailure</option>
		<option value="TransactionRecord">TransactionRecord</option>
		</select>
	</td>
</tr>
<tr>
	<td>Description </td><td><input type=text size="60" name="description" value="Void Description"></td>
</tr>
<tr>
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Void"></td>
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
	centinelRequest.add("MsgType", "cmpi_void");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("AuthorizationCode", request.getParameter("authorization_code"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("Reason", request.getParameter("reason"));
	centinelRequest.add("Description", request.getParameter("description"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));


	// Send Message to the MAPS Server

    centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	strErrorNo = centinelResponse.getValue("ErrorNo");
	strErrorDesc = centinelResponse.getValue("ErrorDesc");
	strReferenceId = centinelResponse.getValue("ReferenceId");
	strStatus = centinelResponse.getValue("StatusCode");
	strTransactionId = centinelResponse.getValue("TransactionId");
	strReasonCode = centinelResponse.getValue("ReasonCode");

    centinelRequest = null;
    centinelResponse = null;

	%>


	<b> Void Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Void Transaction Response </b>
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

