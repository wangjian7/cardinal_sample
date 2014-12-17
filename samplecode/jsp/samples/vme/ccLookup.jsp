<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.net.URLDecoder.*" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />

<%@ include file="CentinelConfig.jsp" %>

<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccLookup.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%

	session.setAttribute("Centinel_TermURL", CENTINEL_TERM_URL);

/////////////////////////////////////////////////////////////////////////////////////////////
// Complete Mapping of Merchant Form Field Names to the Centinel Identifiers
/////////////////////////////////////////////////////////////////////////////////////////////

	String transaction_type = request.getParameter("txn_type");				// Type of Transaction 
	
/////////////////////////////////////////////////////////////////////////////////////////
// Add the required data elements to the CentinelRequest object, find additional information
// regarding the required and optional elements of the 'cmpi_lookup' message in the 
// API guide.
/////////////////////////////////////////////////////////////////////////////////////////

	centinelRequest.add("Version",          MESSAGE_VERSION);
	centinelRequest.add("MsgType",          "cmpi_lookup");
	centinelRequest.add("ProcessorId",      PROCESSOR_ID);
	centinelRequest.add("MerchantId",       MERCHANT_ID);
	centinelRequest.add("TransactionPwd",	TRANSACTION_PWD);
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("UserAgent",        request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader",    request.getHeader("Accept"));
	centinelRequest.add("IPAddress",		request.getRemoteAddr());

	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
	centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
	centinelRequest.add("HandlingAmount", request.getParameter("handling_amount"));
	centinelRequest.add("GiftCardAmount", request.getParameter("gift_card_amount"));
	centinelRequest.add("Recurring", request.getParameter("recurring"));
	centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
	centinelRequest.add("ProductCode", request.getParameter("product_code"));
	centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
	centinelRequest.add("CategoryCode", request.getParameter("category_code"));
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
	centinelRequest.add("EMail", request.getParameter("email_address"));

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

	// -- Payment Type Specific --'
	centinelRequest.add("OverrideCollectShipping", request.getParameter("override_collect_shipping"));


/////////////////////////////////////////////////////////////////////////////////////////
// Send the XML Msg to the MAPS Server, the Response is the CentinelResponse Object
// SendHTTP will send the cmpi_lookup message to the MAPS Server (requires fully qualified URL)
// The Response is the CentinelResponse Object
//////////////////////////////////////////////////////////////////////////////////////////

	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

    session.setAttribute("Centinel_Lookup_Request", centinelRequest.getFormattedRequest());
    session.setAttribute("Centinel_Lookup_Response", centinelResponse.getFormattedResponse());

	String strCardEnrolled = centinelResponse.getValue("Enrolled");		
	String strErrorNo = centinelResponse.getValue("ErrorNo");			 
	String strErrorDesc = centinelResponse.getValue("ErrorDesc");
	String strTransactionId = centinelResponse.getValue("TransactionId");
	String strOrderId = centinelResponse.getValue("OrderId");
	String strECI = centinelResponse.getValue("EciFlag");
	String strACSUrl = centinelResponse.getValue("ACSUrl");
	String strPayload = centinelResponse.getValue("Payload");
	
    session.setAttribute("Centinel_ErrorNo", strErrorNo);
    session.setAttribute("Centinel_ErrorDesc", strErrorDesc);
	session.setAttribute("Centinel_TransactionId", strTransactionId);
	session.setAttribute("Centinel_OrderId", strOrderId);
	session.setAttribute("Centinel_Enrolled", strCardEnrolled); 
	session.setAttribute("Centinel_ECI", strECI); 
    session.setAttribute("Centinel_ACSURL", strACSUrl);
    session.setAttribute("Centinel_PAYLOAD",strPayload);

	session.setAttribute("Centinel_TransactionType", transaction_type);

	//////////////////////////////////////////////////////////////////////////////////////////
	// Handle ALL Logic
	//////////////////////////////////////////////////////////////////////////////////////////
	if ("0".equals(strErrorNo) && "Y".equalsIgnoreCase(strCardEnrolled)) { 
		// Proceed with transaction
		response.sendRedirect("ccTransfer.jsp");

	} else if ("U".equalsIgnoreCase(strCardEnrolled)) {
		// payment type is not Available Prompt for another form of payment
		session.setAttribute("Message", "Payment is unavailable. Please provide another form of payment to complete your transaction.");
		response.sendRedirect("ccStart.jsp");

	} else {	
		// An error was encountered Log Error Message, this is an unexpected state --->
		session.setAttribute("Message", "Payment was unable to complete. Please provide another form of payment to complete your transaction.");
		response.sendRedirect("ccStart.jsp");

	}
	

	
    centinelResponse = null;
    centinelRequest = null;
%>
