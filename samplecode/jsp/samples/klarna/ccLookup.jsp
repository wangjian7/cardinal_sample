<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.net.URLDecoder.*" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />

<%@ include file="CentinelConfig.jsp" %>

<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccLookup.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<html>
	<head>
	<title>Lookup Message Page</title>
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
		<script type="text/javascript" src="../common/util.js"></script>
	</head>

	<body>

<%
	session.setAttribute("Centinel_TermURL", CENTINEL_TERM_URL);

	String transaction_type = request.getParameter("txn_type");
	
	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_lookup");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
	
	centinelRequest.add("EMail", request.getParameter("email_address"));
	centinelRequest.add("BillingFirstName", request.getParameter("b_first_name"));
	centinelRequest.add("BillingMiddleName", request.getParameter("b_middle_name"));
	centinelRequest.add("BillingLastName", request.getParameter("b_last_name"));
	centinelRequest.add("BillingAddress1", request.getParameter("b_address1"));
	centinelRequest.add("BillingAddress2", request.getParameter("b_address2"));
	centinelRequest.add("BillingCity", request.getParameter("b_city"));
	centinelRequest.add("BillingState", request.getParameter("b_state"));
	centinelRequest.add("BillingPostalCode", request.getParameter("b_postal_code"));
	centinelRequest.add("BillingCountryCode", request.getParameter("b_country_code"));
	centinelRequest.add("BillingPhone", request.getParameter("b_phone"));
	centinelRequest.add("ShippingFirstName", request.getParameter("s_first_name"));
	centinelRequest.add("ShippingMiddleName", request.getParameter("s_middle_name"));
	centinelRequest.add("ShippingLastName", request.getParameter("s_last_name"));
	centinelRequest.add("ShippingAddress1", request.getParameter("s_address1"));
	centinelRequest.add("ShippingAddress2", request.getParameter("s_address2"));
	centinelRequest.add("ShippingCity", request.getParameter("s_city"));
	centinelRequest.add("ShippingState", request.getParameter("s_state"));
	centinelRequest.add("ShippingPostalCode", request.getParameter("s_postal_code"));
	centinelRequest.add("ShippingCountryCode", request.getParameter("s_country_code"));
	centinelRequest.add("ShippingPhone", request.getParameter("s_phone"));
	centinelRequest.add("UserAgent", request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
	centinelRequest.add("IPAddress", request.getRemoteAddr());
	
	centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
	centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
	centinelRequest.add("GiftCardAmount", request.getParameter("gift_card_amount"));
	centinelRequest.add("Recurring", request.getParameter("recurring"));
	centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
	centinelRequest.add("ProductCode", request.getParameter("product_code"));
	centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
	centinelRequest.add("CategoryCode", request.getParameter("category_code"));
	
/////////////////////////////////////////////////////////////////////////////////////////
// You need to loop over items in shopping cart and set each variable
//////////////////////////////////////////////////////////////////////////////////////////
	centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
	centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
	centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
	centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
	centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
	centinelRequest.add("Item_Discount_1", request.getParameter("item_discount_1"));
	
	centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
	centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
	centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
	centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
	centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
	centinelRequest.add("Item_Discount_2", request.getParameter("item_discount_2"));

/////////////////////////////////////////////////////////////////////////////////////////
// Klarna Specific Fields
//////////////////////////////////////////////////////////////////////////////////////////

	centinelRequest.add("PaymentCountryCode", request.getParameter("country_code"));
	centinelRequest.add("PaymentClassId", request.getParameter("payment_class_id"));
	centinelRequest.add("Gender", request.getParameter("gender"));
	centinelRequest.add("PersonalNumber", request.getParameter("personal_number"));
	centinelRequest.add("BillingHouseNumber", request.getParameter("b_house_number"));
	centinelRequest.add("ShippingHouseNumber", request.getParameter("s_house_number"));
	centinelRequest.add("BillingHouseExt", request.getParameter("b_house_ext"));
	centinelRequest.add("ShippingHouseExt", request.getParameter("s_house_ext"));

/////////////////////////////////////////////////////////////////////////////////////////
// Send the XML Msg to the MAPS Server, the Response is the CentinelResponse Object
// SendHTTP will send the cmpi_lookup message to the MAPS Server (requires fully qualified URL)
// The Response is the CentinelResponse Object
//////////////////////////////////////////////////////////////////////////////////////////

	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);

    session.setAttribute("Centinel_Lookup_Request", centinelRequest.getFormattedRequest());
    session.setAttribute("Centinel_Lookup_Response", centinelResponse.getFormattedResponse());

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	String strCardEnrolled = centinelResponse.getValue("Enrolled");		
	String strErrorNo = centinelResponse.getValue("ErrorNo");			 
	String strErrorDesc = centinelResponse.getValue("ErrorDesc");
	String strReasonCode = centinelResponse.getValue("ReasonCode");			 
	String strReasonDesc = centinelResponse.getValue("ReasonDesc");
	String strStatusCode = centinelResponse.getValue("StatusCode");	
	String strTransactionId = centinelResponse.getValue("TransactionId");	
	String strOrderId = centinelResponse.getValue("OrderId");
	String strOrderNumber = centinelResponse.getValue("OrderNumber");
	String strExistingAccount = centinelResponse.getValue("ExistingAccount");

	centinelResponse = null;
    centinelRequest = null;
%>

	<b> Lookup Message Request</b>
		<table>
			<tr>
				<td>ProcessorId:</td><td><%=PROCESSOR_ID%></td>
			</tr>
			<tr>
				<td>MerchantId:</td><td><%=MERCHANT_ID%></td>
			</tr>
			<tr>
				<td>Transaction Type:</td><td><%=request.getParameter("txn_type")%></td>
			</tr>
			<tr>
				<td>Amount:</td><td><%=request.getParameter("amount")%></td>
			</tr>
			<tr>
				<td>Currency Code:</td><td><%=request.getParameter("currency_code")%></td>
			</tr>
		</table>
	<br/><br/>
	<b> Lookup Message Response</b>
		<table>
			<tr>
				<td>Order Id:</td><td><%=strOrderId%></td>
			</tr>
			<tr>
				<td>Order Number:</td><td><%=strOrderNumber%></td>
			</tr>
			<tr>
				<td>Transaction Id:</td><td><%=strTransactionId%></td>
			</tr>
			<tr>
				<td>Enrolled:</td><td><%=strCardEnrolled%></td>
			</tr>
			<tr>
				<td>Existing Account:</td><td><%=strExistingAccount%></td>
			</tr>
			<tr>
				<td>ErrorNo:</td><td><%=strErrorNo%></td>
			</tr>
			<tr>
				<td>ErrorDesc:</td><td><%=strErrorDesc%></td>
			</tr>
			<tr>
				<td>ReasonCode:</td><td><%=strReasonCode%></td>
			</tr>
			<tr>
				<td>ReasonDesc:</td><td><%=strReasonDesc%></td>
			</tr>
			<tr>
				<td>Lookup Request: </td><td><textarea cols="100" rows="5" readonly="readonly"><%=formattedRequest%></textarea></td>
			</tr>	
			<tr>
				<td>Lookup Response: </td><td><textarea cols="100" rows="5" readonly="readonly"><%=formattedResponse%></textarea></td>
			</tr>
		</table>