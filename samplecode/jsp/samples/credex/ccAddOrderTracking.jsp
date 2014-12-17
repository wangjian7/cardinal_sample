<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccAddOrderTracking.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%

session.setAttribute("Centinel_OrderId", request.getParameter("order_id"));

String order_id = request.getParameter("order_id");

if (order_id == null) {
	order_id = "";
}


%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Add Order Tracking Request Form</b>
<form name="frm" method="POST" action="ccAddOrderTracking.jsp?execute=true">
<table>
<tr>
	<td bgcolor="#FFFF40">Transaction Type</td><td>
	<select name=txn_type>
		  <option value="CX">CX - CredEx</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId </td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="#FFFF40">Carrier</td><td>
	<select name=carrier>
		  <option value="Other">Other</option>
		  <option value="UPS">UPS</option>
		  <option value="FedEx">FedEx</option>
		  <option value="USPS">USPS</option>
		  <option value="DHL">DHL</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">TrackingNumber </td><td><input type=text name="tracking_number" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">TrackingUrl </td><td><input type=text name="tracking_url" value=""></td>
</tr>
<tr>
	<td>Item_Sku_1 </td><td><input type=text name="item_sku_1" value=""></td>
</tr>
<tr>
	<td>Ship Date</td><td><input type=text name="shipping_date" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type="submit" name="submit" value="Process"></td>
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
	centinelRequest.add("MsgType", "cmpi_add_order_tracking");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("Carrier", request.getParameter("carrier"));
	centinelRequest.add("TrackingNumber", request.getParameter("tracking_number"));
	centinelRequest.add("TrackingUrl", request.getParameter("tracking_url"));
	centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
	centinelRequest.add("ShipDate", request.getParameter("shipping_date"));


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


	<b> Add Order Tracking Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Add Order Tracking Transaction Response </b>
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

