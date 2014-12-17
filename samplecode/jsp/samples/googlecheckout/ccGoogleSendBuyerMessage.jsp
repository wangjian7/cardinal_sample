<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccGoogleSendBuyerMessage.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Process Send Buyer Message</b>
<form name="frm" method="POST" action="ccGoogleSendBuyerMessage.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">OrderId </td><td><input type=text size="60" name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Buyer Message</td><td><input type=text size="60" name="buyer_message"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Send Email</td>
	<td>
		<select name="send_email">
			  <option value="true">Yes
			  <option value="false">No
		</select>
	</td>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Send Buyer Message"></td>
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
		centinelRequest.add("MsgType", "cmpi_google_send_buyer_message");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("BuyerMessage", request.getParameter("buyer_message"));
		centinelRequest.add("SendEmail", request.getParameter("send_email"));

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


<b> Send Buyer Message Request Results </b>
<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
</table>
<br/><br/>
<b>Send Buyer Message Results </b>
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

