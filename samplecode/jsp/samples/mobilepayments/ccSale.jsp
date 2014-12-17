<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccSale.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<title>Sale Page</title>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">

		window.onload = function() {
				document.frm.order_number.value = randomOrderNumber();
				document.frm.amount.value = randomAmount();
				document.frm.onsubmit = singleSubmit("frm");
				
				// Dynamic country / state functionality
				document.forms["frm"].b_country_code.onchange = function() { countryCodeMonitor(); }
				document.forms["frm"].s_country_code.onchange = function() { countryCodeMonitor(); }
				document.getElementById("s_state_field").innerHTML = getStateSelectionHTML("s_state");
				document.getElementById("b_state_field").innerHTML = getStateSelectionHTML("b_state");
        } // end onLoad

</script>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Sale Request Form</b>
<form name="frm" method="POST" action="ccSale.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		<option value="MPS">MPS - MPS</option>
	</select></td>
</tr>
<tr>
	<td>&nbsp;</td><td>&nbsp;</td>
</tr>
<tr>
	<td bgcolor="ffff40">Order Id </td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Authorization Code </td><td><input type=text name="authorization_code" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td><td><input type="text" name="amount" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40" >Currency Code </td>
	<td>
		<select name="currency_code">
	          <option value="840">840 - USD</option>
	          <option value="978">978 - EUR</option>
	          <option value="392">392 - JPY</option>
	          <option value="124">124 - CAD</option>
	          <option value="826">826 - GBP</option>
		  <option value="036">036 - AUD</option>
        	</select>	
	</td>
</tr>
<tr>
	<td>Description </td><td><input type=text size="60" name="description" value="Description"></td>
</tr>
<tr>
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
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

	String 	strErrorNo, strErrorDesc, strReferenceId, strStatus, strOrderId, strTransactionId, strReasonCode, strReasonDesc;

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_sale");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("IPAddress", request.getRemoteAddr());
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("AuthorizationCode", request.getParameter("authorization_code"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("Description", request.getParameter("description"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));	


	// Send Message to the MAPS Server

    centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	strErrorNo = centinelResponse.getValue("ErrorNo");
	strErrorDesc = centinelResponse.getValue("ErrorDesc");
	strStatus = centinelResponse.getValue("StatusCode");
	strOrderId = centinelResponse.getValue("OrderId");
	strTransactionId = centinelResponse.getValue("TransactionId");
	strReasonCode = centinelResponse.getValue("ReasonCode");
	strReasonDesc = centinelResponse.getValue("ReasonDesc");

    centinelRequest = null;
    centinelResponse = null;

	%>


	<b> Sale Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Sale Transaction Response </b>
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

