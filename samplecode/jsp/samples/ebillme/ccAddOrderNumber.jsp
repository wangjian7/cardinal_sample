<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccAddOrderNumber.jsp
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
<b>Add Order Number Request Form</b>
<form name="frm" method="POST" action="ccAddOrderNumber.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
		  <option value="EM">EM - eBillme</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="#FFFF40">OrderId </td>
	<td><input type=text" name="order_id" value=""></td>
</tr>
<tr>
	<td>Amount </td><td><input type=text name="amount" value=""></td>
	<td>Currency Code </td><td><input type=text name="currency_code" value=""></td>
</tr>
<tr>
	<td>Order Number</td><td><input type=text name="order_number" value=""></td>
	<td>Order Description </td><td><input type=text name="order_description" value=""></td>
</tr>
<tr>
	<td>Billing First Name</td><td><input type="text" name="b_first_name" value=""></td>
	<td>Shipping First Name</td><td><input type="text" name="s_first_name" value=""></td>
</tr>
<tr>
	<td>Billing Last Name</td><td><input type="text" name="b_last_name" value=""></td>
	<td>Shipping Last Name</td><td><input type="text" name="s_last_name" value=""></td>
</tr>
<tr>
	<td>Billing Address1</td><td><input type="text" name="b_address1" value=""></td>
	<td>Shipping Address1</td><td><input type="text" name="s_address1" value=""></td>
</tr>
<tr>
	<td>Billing Address2</td><td><input type="text" name="b_address2" value=""></td>
	<td>Shipping Address2</td><td><input type="text" name="s_address2" value=""></td>
</tr>
<tr>
	<td>Billing City</td><td><input type="text" name="b_city" value=""></td>
	<td>Shipping City</td><td><input type="text" name="s_city" value=""></td>
</tr>
<tr>
	<td>Billing State</td><td><input type="text" name="b_state" value=""></td>
	<td>Shipping State</td><td><input type="text" name="s_state" value=""></td>

</tr>
<tr>
	<td>Billing Postal Code</td><td><input type="text" name="b_postal_code" value=""></td>
	<td>Shipping Postal Code</td>	<td><input type="text" name="s_postal_code" value=""></td>
</tr>
<tr>
	<td>Billing Country Code</td><td><input type="text" name="b_country_code" value=""></td>
	<td>Shipping Country Code</td><td><input type="text" name="s_country_code" value=""></td>
</tr>
<tr>
	<td>Billing Phone</td><td><input type=text name="b_phone" value=""></td>
	<td>Billing Phone alt</td><td><input type=text name="b_phone_alt" value=""></td>
</tr>
<tr>
	<td>Expiry Date</td><td><input type=text name="expiry_date" value=""></td>
	<td>Shipping Email</td><td><input type="text" name="email_address_alt" value=""></td>
</tr>
<tr>
	<td>PromoCode</td><td><input type=text name="promo_code" value=""></td>
	<td>Shipping Method</td>
	<td>
		<select name="shipping_method" id="shipping_method" style="width:125px">
			<option value="">No Change</option>
			<option value="EXPRESS">EXPRESS</option>
			<option value="STANDARD">STANDARD</option>
			<option value="ELECTRONIC">ELECTRONIC`</option>
		</select>
	</td>
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

	String 	strErrorNo, strErrorDesc, strReferenceId, strStatus, strOrderId, strTransactionId, strReasonCode;

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_add_order_number");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));

	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("PromoCode", request.getParameter("promo_code"));
	centinelRequest.add("OrderExpirationDate", request.getParameter("expiry_date"));
	centinelRequest.add("AltEmail", request.getParameter("email_address_alt"));
	centinelRequest.add("BillingFirstName", request.getParameter("b_first_name"));
	centinelRequest.add("BillingLastName", request.getParameter("b_last_name"));
	centinelRequest.add("BillingAddress1", request.getParameter("b_address1"));
	centinelRequest.add("BillingAddress2", request.getParameter("b_address2"));
	centinelRequest.add("BillingCity", request.getParameter("b_city"));
	centinelRequest.add("BillingState", request.getParameter("b_state"));
	centinelRequest.add("BillingPostalCode", request.getParameter("b_postal_code"));
	centinelRequest.add("BillingCountryCode", request.getParameter("b_country_code"));
	centinelRequest.add("BillingPhone", request.getParameter("b_phone"));
	centinelRequest.add("BillingAltPhone", request.getParameter("b_phone_alt"));
	centinelRequest.add("ShippingFirstName", request.getParameter("s_first_name"));
	centinelRequest.add("ShippingMiddleName", request.getParameter("s_middle_name"));
	centinelRequest.add("ShippingLastName", request.getParameter("s_last_name"));
	centinelRequest.add("ShippingAddress1", request.getParameter("s_address1"));
	centinelRequest.add("ShippingAddress2", request.getParameter("s_address2"));
	centinelRequest.add("ShippingCity", request.getParameter("s_city"));
	centinelRequest.add("ShippingState", request.getParameter("s_state"));
	centinelRequest.add("ShippingPostalCode", request.getParameter("s_postal_code"));
	centinelRequest.add("ShippingCountryCode", request.getParameter("s_country_code"));
	centinelRequest.add("ShippingMethod", request.getParameter("shipping_method"));

	// Send Message to the MAPS Server

    centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	strErrorNo = centinelResponse.getValue("ErrorNo");
	strErrorDesc = centinelResponse.getValue("ErrorDesc");
	strReferenceId = centinelResponse.getValue("ReferenceId");
	strStatus = centinelResponse.getValue("StatusCode");
	strOrderId = centinelResponse.getValue("OrderId");
	strTransactionId = centinelResponse.getValue("TransactionId");
	strReasonCode = centinelResponse.getValue("ReasonCode");

    centinelRequest = null;
    centinelResponse = null;

	%>


	<b> Add Order Number Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Add Order Number Transaction Response </b>
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

