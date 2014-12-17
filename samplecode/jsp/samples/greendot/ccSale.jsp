<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccSale.jsp
/////////////////////////////////////////////////////////////////////////////////////////

%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<body>
<%@ include file="ccMenu.jsp" %>

<br/>
<b>Sale Request Form</b>
<form name="frm" method="POST" action="ccSale.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
  		  <option value="GD">GD - Green Dot MoneyPak</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId</td><td><input type=text size="60" name="order_id"></td>
</tr>

<tr>
	<td bgcolor="ffff40">Amount </td><td><input type=text name="amount"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Currency Code </td>
    	<td><select name="currency_code">
          <option value="840">840 - USD</option>
        </select>
    </td>
</tr>
<tr>
	<td>Description </td><td><input type=text size="60" name="description" value="Sale Description"></td>
</tr>
<tr>
	<td>MerchantData </td>
	<td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Submit Order"></td>
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


boolean executeTransaction = Boolean.valueOf(request.getParameter("execute")).booleanValue();

if (executeTransaction) {


	String 	strErrorNo, strErrorDesc, strAVSCode, strCvv2Code, strStatus, strReasonCode, strTransactionId, strOrderId;

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////
	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_sale");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("OrderDescription", request.getParameter("description"));
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


<b> Sale Transaction Request</b>
<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
</table>
<br/><br/>
<b> Sale Transaction Response</b>
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

