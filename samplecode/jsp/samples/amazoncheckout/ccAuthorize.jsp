<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccAuthorize.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Refund Request Form</b>
<form name="frm" method="POST" action="ccAuthorize.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		  <option value="AC">AC - Checkout By Amazon</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">Order Id</td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td>
	<td><input type="text" name="amount" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Currency Code </td>
	<td>
		<select name="currency_code">
			<option value="840">840 - USD</option>
		</select>
	</td>
</tr>
<tr>
	<td>Description </td><td><input type=text name="description" value="Authorize Description"></td>
</tr>
<tr>
	<td>MerchantData </td>
	<td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Authorize"></td>
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

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_authorize");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));


		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();

		String strErrorNo = centinelResponse.getValue("ErrorNo");
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");

		centinelResponse = null;
		centinelRequest = null;
		
	
%>


<b> Authorize Transaction Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Authorize Transaction Results </b>
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

