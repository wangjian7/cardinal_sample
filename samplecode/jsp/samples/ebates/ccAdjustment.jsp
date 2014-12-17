<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccAdjustment.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Adjustment Page</title>
	<script type="text/javascript" src="../common/util.js"></script>
	<script type="text/javascript">
        window.onload = function() {
			document.frm.onsubmit = singleSubmit("frm");
        } // end onLoad
    </script>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Adjustment Request Form</b>
<form name="frm" method="POST" action="ccAdjustment.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name="txn_type">
		  <option value="EB">EB - EBates
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId </td><td><input type=text size="60" name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Order Amount </td><td><input type=text name="amount" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Commission Amount </td><td><input type=text name="commission_amount" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Currency Code </td>
	<td><select name="currency_code">
		  <option value="840">840 - USD</option>
		</select>
	</td>
</tr>
<tr>
	<td>Description </td><td><input type=text size="60" name="description" value="Adjustment Description"></td>
</tr>
<tr>
	<td>Reason </td><td><input type=text size="60" name="reason" value="Adjustment Reason"></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Adjustment"></td>
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
		centinelRequest.add("MsgType", "cmpi_adjustment");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType",request.getParameter("txn_type"));
		centinelRequest.add("Amount",request.getParameter("amount"));
		centinelRequest.add("CommissionAmount", request.getParameter("commission_amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("Reason", request.getParameter("reason"));

		// Send Message to the MAPS Server
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");			 
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatus = centinelResponse.getValue("StatusCode");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");

		centinelResponse = null;
		centinelRequest = null;
%>


<b> Adjustment Transaction Request</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Adjustment Transaction Response</b>
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

