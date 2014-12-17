<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccAuthorize.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Authorize Page</title>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
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
<b>Authorize Request Form</b>
<form name="frm" method="POST" action="ccAuthorize.jsp?execute=true">
    <table>
	<tr>
		<td bgcolor="#FFFF40">Transaction Type</td><td>
			<select name="txn_type">
				<option value="BTP">BTP - Bill2Phone</option>
			</select>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFF40">Order Id</td><td><input type="text" name="order_id" value=""/></td>
	</tr>
	<tr>
		<td bgcolor="#FFFF40">Amount </td><td><input type="text" name="amount" value=""/></td>
	</tr>
	<tr>
		<td bgcolor="#FFFF40">Currency </td><td><select name="currency_code">
				<option value="840">840 - USD</option>
			</select></td>
	</tr>
	
	 <tr>
		<td>Order Description</td><td><input type="text" name="order_description" value="Authorization"/></td>
	</tr>
	<tr>
		<td>MerchantData </td><td><input type="text" name="merchant_data" value=""/></td>
	</tr>
	<tr>
                <td>&nbsp;</td><td></td>
                <td>&nbsp;</td><td></td>
        </tr>
        <tr>
                <td>Item 1 Name</td><td><input type="text" name="item_name_1" value=""/></td>
                <td>Item 2 Name</td><td><input type="text" name="item_name_2" value=""/></td>
        </tr>
        <tr>
                <td>Item 1 Description</td><td><input type="text" name="item_desc_1" value=""/></td>
                <td>Item 2 Description</td><td><input type="text" name="item_desc_2" value=""/></td>
        </tr>
        <tr>
                <td>Item 1 SKU</td><td><input type="text" name="item_sku_1" value=""/></td>
                <td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value=""/></td>
        </tr>
        <tr>
                <td>Item 1 Price</td><td><input type="text" name="item_price_1" value=""/></td>
                <td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""/></td>
        </tr>
        <tr>
                <td>Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value=""/></td>
                <td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value=""/></td>
        </tr>
	<tr>
		<td></td>
		<td><input type="submit" name="submit" value="Process"/></td>
	</tr>
	<tr>
		<td colspan="2"><br/><b><i>Required fields highlighted</i></b></td>
	</tr>
</table>
</form>
<br>
<hr>
<br><br>
<%

String executeTransaction = request.getParameter("execute");

if ("true".equals(executeTransaction)){

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_authorize");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("IPAddress",		request.getRemoteAddr());

	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));

	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));

	centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
	centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
	centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
	centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
	centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
	centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
	centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
	centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
	centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
	centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));


	// Send Message to the MAPS Server

	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
	
	String strErrorNo = centinelResponse.getValue("ErrorNo");
	String strErrorDesc = centinelResponse.getValue("ErrorDesc");
	String strStatus = centinelResponse.getValue("StatusCode");
	String strOrderId = centinelResponse.getValue("OrderId");
	String strTransactionId = centinelResponse.getValue("TransactionId");
	String strReasonCode = centinelResponse.getValue("ReasonCode");
	String strReasonDesc = centinelResponse.getValue("ReasonDesc");

	centinelRequest = null;
	centinelResponse = null;

	%>


	<b> Authorize Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Authorize Transaction Response </b>
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

