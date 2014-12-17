<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
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
<body>
<%@ include file="ccMenu.jsp" %>
<br/>

<b>Capture Request Form</b>
<form name="frm" method=post action="ccCapture.jsp?execute=true">

  <input type="hidden" name="execute" value="true">
  <table>
	<tr>
		<td bgcolor="ffff40">Transaction Type</td><td>
		<select name=txn_type>
			  <option value="AC">AC - Checkout By Amazon</option>
		</select></td>
	</tr>
    <tr>
	<td bgcolor="ffff40">Order Id </td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td>
	<td><input type=text name="amount" value=""></td>
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
	<td>Description </td><td><input type=text name="description" value="Capture Description"></td>
</tr>
<tr>
	<td>MerchantData </td>
	<td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td><b>Line Item Details</b></td></tr>
<tr>
	<td>Item 1 SKU </td>
	<td><input type=text size="60" name="item_SKU_1" value=""></td>
</tr>
<tr>
	<td>Item 1 Amount </td>
	<td><input type=text size="60" name="item_amount_1" value=""></td>
</tr>
<tr>
	<td>Item 1 Quantity </td>
	<td><input type=text size="60" name="item_quantity_1" value=""></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td><b>Tracking Items</b></td></tr>
<tr>
	<td>Ship Method Name</td>
	<td><input type=text name="shipMethodName" value=""></td>
</tr>
<tr>
	<td>Carrier</td>
	<td><select name="carrier">
			<option value=""></option>
			<option value="UPS">UPS</option>
			<option value="FedEx">FedEx</option>
			<option value="USPS">USPS</option>
			<option value="DHL">DHL</option>
			<option value="Other">Other</option>
			<option value="Fastway">Fastway</option>
			<option value="GLS">GLS</option>
			<option value="GO!">GO!</option>
			<option value="Hermes Logistik Grupp">Hermes Logistik Grupp</option>
			<option value="Royal Mail">Royal Mail</option>
			<option value="City Link">City Link</option>
			<option value="TNT">TNT</option>
			<option value="Target">Target</option>
			<option value="SagawaExpress">SagawaExpress</option>
			<option value="NipponExpress">NipponExpress</option>
			<option value="YamatoTransport">YamatoTransport</option>
		</select></td>
</tr>
<tr>
	<td>Tracking Number</td>
	<td><input type="text" name="tracking" value=""></td>
</tr>
    <tr>
      <td></td>
      <td><input type=submit name="submit" value="Process Capture"></td>
    </tr>
    <tr>
      <td colspan="2"><br>
        <b><i>Required fields highlighted</i></b></td>
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
		centinelRequest.add("MsgType", "cmpi_capture");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));

		//--- Tracking information is optional ---
		centinelRequest.add("ShipMethodName", request.getParameter("shipMethodName"));
		centinelRequest.add("Carrier", request.getParameter("carrier"));
		centinelRequest.add("TrackingNumber", request.getParameter("tracking"));

		//--- Line item information is optional ---
		centinelRequest.add("Item_SKU_1", request.getParameter("item_SKU_1"));
		centinelRequest.add("Item_Amount_1", request.getParameter("item_amount_1"));
		centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));

		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();

		String strErrorNo = centinelResponse.getValue("ErrorNo");			 
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatus = centinelResponse.getValue("StatusCode");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		
		centinelResponse = null;
		centinelRequest = null;
%>


<b> Capture Transaction Request</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Capture Transaction Response</b>
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

