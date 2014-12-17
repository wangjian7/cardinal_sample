<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccCapture.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Capture Page</title>
</head>
<body>
<br/>
<b>Capture Request Form</b>
<form name="frm" method="POST" action="ccCapture.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
		  <option value="AF">AF - Affirm</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId </td><td><input type=text size="60" name="order_id"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td><td><input type=text name="amount"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Currency Code </td>
    <td><select name="currency_code">
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
	<td>Description </td><td><input type=text size="60" name="description" value="Capture Description"></td>
</tr>
<tr>
	<td>MerchantData </td>
	<td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Capture"></td>
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
		// Handle transaciton execution
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_capture");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("OrderNumber", request.getParameter("order_number"));
		centinelRequest.add("AuthorizationCode", request.getParameter("authorization_code"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
		
		/////////////////////////////////////////////////////////////////////////////////////////
		// Send Message to the MAPS Server
		/////////////////////////////////////////////////////////////////////////////////////////
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
		String strErrorNo = centinelResponse.getValue("ErrorNo");			 
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strStatus = centinelResponse.getValue("StatusCode");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");
		
		centinelResponse = null;
		centinelRequest = null;
%>

<b> Capture Transaction Request</b>
			<table>
				<tr>
					<td><b>ProcessorId:</b></td><td><%=PROCESSOR_ID%></td>
				</tr>
				<tr>
					<td><b>MerchantId:</b></td><td><%=MERCHANT_ID%></td>
				</tr>
				<tr>
					<td><b>TransactionPwd:</b></td><td><%=TRANSACTION_PWD%></td>
				</tr>
				<tr>
					<td><b>OrderId:</b></td><td><%=request.getParameter("order_id")%></td>
				</tr>
				<tr>
					<td><b>Transaction Type:</b></td><td><%=request.getParameter("txn_type")%></td>
				</tr>
				<tr>
					<td><b>Amount:</b></td><td><%=request.getParameter("amount")%></td>
				</tr>
				<tr>
					<td><b>Currency Code:</b></td><td><%=request.getParameter("currency_code")%></td>
				</tr>
				<tr>
					<td><b>Description:</b></td><td><%=request.getParameter("description")%></td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
				</tr>
			</table>
<br/><br/>

<b> Capture Transaction Response</b>
			<table>
				<tr>
					<td><b>ErrorNo:</b></td><td><%=strErrorNo%></td>
				</tr>
				<tr>
					<td><b>ErrorDesc:</b></td><td><%=strErrorDesc%></td>
				</tr>
				<tr>
					<td><b>ReasonCode:</b></td><td><%=strReasonCode%></td>
				</tr>
				<tr>
					<td><b>ReasonDesc:</b></td><td><%=strReasonDesc%></td>
				</tr>
				<tr>
					<td><b>StatusCode:</b></td><td><%=strStatus%></td>
				</tr>
				<tr>
					<td><b>TransactionId:</b></td><td><%=strTransactionId%></td>
				</tr>
				<tr>
					<td><b>OrderId:</b></td><td><%=strOrderId%></td>
				</tr>
			</table>
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

