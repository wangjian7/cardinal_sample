<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
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
<br/>
<b>Authorize Request Form</b>
<form name="frm" method="POST" action="ccAuthorize.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		  <option value="AF">AF - Affirm</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId</td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td><td><input type=text name="amount" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Currency Code </td>
	<td>
		<select name="currency_code" id="currency_code">
			<option value="840">840 - USD</option>
			<option value="978">978 - EUR</option>
			<option value="826">826 - GBP</option>
			<option value="036">036 - AUD</option>
			<option value="344">344 - HKD</option>
			<option value="702">702 - SGD</option>
			<option value="392">392 - JPY</option>
			<option value="124">124 - CAD</option>
			<option value="756">756 - CHF</option>
			<option value="208">208 - DKK</option>
			<option value="752">752 - SEK</option>
			<option value="578">578 - NOK</option>
			<option value="554">554 - NZD</option>
			<option value="643">643 - RUB</option>
			<option value="446">446 - MOP</option>
		</select>	
	</td>
</tr>
<tr>
	<td>Description </td><td><input type=text name="description" value="Sample Authorize..."></td>
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

		/////////////////////////////////////////////////////////////////////////////////////////
		// Handle transaciton execution   
		/////////////////////////////////////////////////////////////////////////////////////////
		
		if (executeTransaction) {

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_authorize");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
	
		String strCardEnrolled = centinelResponse.getValue("Enrolled");
		String strTransactionId = centinelResponse.getValue("TransactionId");		
		String strOrderId = centinelResponse.getValue("OrderId");
		String strACSUrl = centinelResponse.getValue("ACSUrl");
		String strPayload = centinelResponse.getValue("Payload");
		String strErrorNo = centinelResponse.getValue("ErrorNo");
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		
		centinelResponse = null;
		centinelRequest = null;
		
	
%>

	<b> Authorize Transaction Request </b>
	<table>
		<tr>
			<td><b>ProcessorId:</b></td><td><%=PROCESSOR_ID%></td>
		</tr>
		<tr>
			<td><b>MerchantId:</b></td><td><%=MERCHANT_ID%></td>
		</tr>
		<tr>
			<td><b>OrderId:</b></td><td><%=request.getParameter("order_id")%></td>
		</tr>
		<tr>
			<td><b>Currency Code:</b></td><td><%=request.getParameter("currency_code")%></td>
		</tr>
		<tr>
			<td><b>Description:</b></td><td><%=request.getParameter("description")%></td>
		</tr>
		<tr>
	</table>
	<table>
			<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
		</tr>
	</table>
	<br/><br/>
	
	<b> Authorize Transaction Response </b>
	<table>
		<tr>
			<td><b>ErrorNo:</b></td><td><%=strErrorNo%></td>
		</tr>
		<tr>
			<td><b>Description:</b></td><td><%=strErrorDesc%></td>
		</tr>
		<tr>
			<td><b>Status Code:</b></td><td><%=strStatusCode%></td>
		</tr>
		<tr>
			<td><b>Reason Code:</b></td><td><%=strReasonCode%></td>
		</tr>
		<tr>
			<td><b>Reason Desc:</b></td><td><%=strReasonDesc%></td>
		</tr>
		<tr>
			<td><b>Transaction Id:</b></td><td><%=strTransactionId%></td>
		</tr>
		<tr>
			<td><b>Order Id:</b></td><td><%=strOrderId%></td>
		</tr>
		<tr>
	</table>
		<tr>
			<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedResponse%></textarea></td>
		</tr>
	</table>

<%
}
%>

</body>
</html>