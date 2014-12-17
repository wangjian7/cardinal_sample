<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccRefund.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Refund Page</title>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Refund Request Form</b>
<form name="frm" method="POST" action="ccRefund.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		  <option value="HC">HC - Hosted Checkout</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40" width="150">OrderId </td><td><input type=text size="60" name="order_id"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td><td><input type=text name="amount"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Currency Code </td>
    <td><select name="currency_code">
          <option value="840">840 - USD</option>
		  <option value="036">036 - AUD</option>
          <option value="124">124 - CAD</option>
		  <option value="203">203 - CZK</option>
		  <option value="208">208 - DKK</option>
          <option value="978">978 - EUR</option>
		  <option value="344">344 - HKD</option>
		  <option value="348">348 - HUF</option>
		  <option value="376">376 - ILS</option>
          <option value="392">392 - JPY</option>
		  <option value="484">484 - MXN</option>
		  <option value="578">578 - NOK</option>
		  <option value="554">554 - NZD</option>
		  <option value="985">985 - PLN</option>
          <option value="826">826 - GBP</option>
		  <option value="702">702 - SGD</option>
		  <option value="752">752 - SEK</option>
		  <option value="756">756 - CHF</option>
        </select>
    </td>
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
	<td>Description </td><td><input type=text size="60" name="description" value="Refund Description"></td>
</tr>
<tr>
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Refund"></td>
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
		centinelRequest.add("MsgType", "cmpi_refund");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Reason", request.getParameter("reason"));
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


<b> Refund Transaction Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Refund Transaction Results </b>
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

