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

	///////////////////////////////////////////////////////////////////////////////////////// 
	//Using the local variables and constants, build the Centinel message using the
    //Centinel Thin Client.
	/////////////////////////////////////////////////////////////////////////////////////////
	
	centinelRequest.add("MsgType", "cmpi_lookup");
	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("UserAgent", request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
	centinelRequest.add("IPAddress", request.getRemoteAddr());
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	
	/////////////////////////////////////////////////////////////////////////////////////////
	// Standard cmpi_lookup fields
	/////////////////////////////////////////////////////////////////////////////////////////
	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
	centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
	centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
	
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
	centinelRequest.add("EMail", request.getParameter("email_address"));
	
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

	centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
	centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
	centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
	centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
	centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
	centinelRequest.add("Item_Type_1", request.getParameter("item_type_1"));
	
	centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
	centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
	centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
	centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
	centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
	centinelRequest.add("Item_Type_2", request.getParameter("item_type_2"));
	
/////////////////////////////////////////////////////////////////////////////////////////
// Affirm Specific Centinel Fields
/////////////////////////////////////////////////////////////////////////////////////////
	
	centinelRequest.add("RequiredShippingFields", request.getParameter("required_shipping_fields"));
	centinelRequest.add("RequiredBillingFields", request.getParameter("required_billing_fields"));
	
	centinelRequest.add("Shipping_Exclusions_1", request.getParameter("shipping_exclusions_1"));
	centinelRequest.add("Shipping_Exclusions_2", request.getParameter("shipping_exclusions_2"));
	
	centinelRequest.add("ShippingType", request.getParameter("shipping_type"));
	centinelRequest.add("AddressType", request.getParameter("address_type"));
	
	centinelRequest.add("Item_Shipping_Date_1", request.getParameter("item_shipping_date_1"));
	centinelRequest.add("Item_Delivery_Date_1", request.getParameter("item_delivery_date_1"));
	centinelRequest.add("Item_Image_Url_1", request.getParameter("item_image_url_1"));
	
	centinelRequest.add("Item_Shipping_Date_2", request.getParameter("item_shipping_date_2"));
	centinelRequest.add("Item_Delivery_Date_2", request.getParameter("item_delivery_date_2"));
	centinelRequest.add("Item_Image_Url_2", request.getParameter("item_image_url_2"));

	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
	
	//Save response in session
    session.setAttribute("Centinel_Lookup_Request", centinelRequest.getFormattedRequest());
    session.setAttribute("Centinel_Lookup_Response", centinelResponse.getFormattedResponse());

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	String strCardEnrolled = centinelResponse.getValue("Enrolled");
	String strTransactionId = centinelResponse.getValue("TransactionId");		
	String strOrderId = centinelResponse.getValue("OrderId");
	String strACSUrl = centinelResponse.getValue("ACSUrl");
	String strPayload = centinelResponse.getValue("Payload");
	String strErrorNo = centinelResponse.getValue("ErrorNo");
	String strErrorDesc = centinelResponse.getValue("ErrorDesc");
	
	session.setAttribute("ErrorNo", strErrorNo);
	session.setAttribute("ErrorDesc", strErrorDesc);
	session.setAttribute("TransactionId", strTransactionId);
	session.setAttribute("OrderId", strOrderId);
	session.setAttribute("Enrolled", strCardEnrolled); 
	session.setAttribute("ACSUrl", strACSUrl);
	session.setAttribute("Payload", strPayload);

	// Needed for the cmpi_authenticate message
	String transaction_type = request.getParameter("txn_type");
	session.setAttribute("TransactionType", transaction_type);
	
	// Add TermUrl to session
	session.setAttribute("TermURL", CENTINEL_TERM_URL);
	
	/////////////////////////////////////////////////////////////////////////////////////////
	// Result Processing Logic
	//////////////////////////////////////////////////////////////////////////////////////////

	if ("0".equals(strErrorNo) && "Y".equalsIgnoreCase(strCardEnrolled)) { 
		// Proceed with redirect
		response.sendRedirect("ccTransfer.jsp");

	} else if ("U".equalsIgnoreCase(strCardEnrolled)) {
		// payment type is not Available Prompt for another form of payment
		session.setAttribute("Message", "Payment is unavailable. Please provide another form of payment to complete your transaction.");
		response.sendRedirect("ccStart.jsp");

	} else {	
		// payment was unable to complete. Please provide another form of payment to complete your transaction.
		session.setAttribute("Message", "Payment was unable to complete. Please provide another form of payment to complete your transaction.");
		response.sendRedirect("ccStart.jsp");
	}
	
	centinelResponse = null;
    centinelRequest = null;
%>
