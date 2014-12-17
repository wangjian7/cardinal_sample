<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.net.URLDecoder.*" %>
<%@ include file="ccMenu.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />

<%@ include file="CentinelConfig.jsp" %>

<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccLookup.jsp
/////////////////////////////////////////////////////////////////////////////////////////


	///////////////////////////////////////////////////////////////////////////////////////// 
	//Using the local variables and constants, build the Centinel message using the
    //Centinel Thin Client.
	/////////////////////////////////////////////////////////////////////////////////////////
	
	centinelRequest.add("MsgType", "cmpi_lookup");
	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("UserAgent", request.getHeader("User_Agent"));
	centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("IPAddress", request.getRemoteAddr());
	
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
	
	centinelRequest.add("HandlingAmount", request.getParameter("handling_amount"));
	centinelRequest.add("InsuranceAmount", request.getParameter("insurance_amount"));
	centinelRequest.add("ItemAmount", request.getParameter("item_amount"));
	centinelRequest.add("ShippingDiscountAmount", request.getParameter("shipping_discount_amount"));
	centinelRequest.add("GiftCardAmount", request.getParameter("giftcard_amount"));
	centinelRequest.add("Recurring", request.getParameter("recurring"));
	centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
	centinelRequest.add("ProductCode", request.getParameter("product_code"));
	centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
	centinelRequest.add("CategoryCode", request.getParameter("category_code"));
	
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
	
	centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
	centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
	centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
	centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
	centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
	
/////////////////////////////////////////////////////////////////////////////////////////
// Payment Specific Centinel Fields
/////////////////////////////////////////////////////////////////////////////////////////
	
	centinelRequest.add("OverridePaymentMethod", request.getParameter("MPPWLT"));
	centinelRequest.add("ForceAuthentication", request.getParameter("force_authentication"));
	centinelRequest.add("NoShipping", request.getParameter("no_shipping"));
	centinelRequest.add("AcceptRewardsProgram", request.getParameter("accept_rewards_program"));
	centinelRequest.add("ShippingLocationProfile", request.getParameter("shipping_location_profile"));
	
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
	String strClipboardData = strOrderId + ":" + strPayload;
	
	session.setAttribute("Enrolled", strCardEnrolled); 
	session.setAttribute("TransactionId", strTransactionId);
	session.setAttribute("OrderId", strOrderId);
	session.setAttribute("ACSUrl", strACSUrl);
	session.setAttribute("Payload", strPayload);
	session.setAttribute("ErrorNo", strErrorNo);
	session.setAttribute("ErrorDesc", strErrorDesc);
	session.setAttribute("ClipboardData", strClipboardData);

	// Needed for the cmpi_authenticate message
	String TransactionType = request.getParameter("txn_type");
	session.setAttribute("TransactionType", TransactionType);
	
	// Add TermUrl to session
	session.setAttribute("TermUrl", CENTINEL_TERM_URL);
	
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
