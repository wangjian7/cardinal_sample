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

/////////////////////////////////////////////////////////////////////////////////////////////
// Complete Mapping of Merchant Form Field Names to the Centinel Identifiers
/////////////////////////////////////////////////////////////////////////////////////////////

	String order_number = request.getParameter("order_number");		// Transaction Order Number
	String order_description = request.getParameter("order_description");	// Transaction Order Description
	String currency_code = request.getParameter("currency_code");		// ISO Currency Code (USD - 840)
	String transaction_type = request.getParameter("txn_type");		// Type of Transaction 
	String ip_address = request.getRemoteAddr();

	session.setAttribute("Centinel_TermURL", CENTINEL_TERM_URL);
	
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
	centinelRequest.add("TransactionType",	transaction_type);
	centinelRequest.add("UserAgent",        request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader",    request.getHeader("Accept"));
	centinelRequest.add("IPAddress",		ip_address);

	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
	centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
	centinelRequest.add("GiftCardAmount", request.getParameter("gift_card_amount"));
	centinelRequest.add("CategoryCode", request.getParameter("category_code"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
	centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
	centinelRequest.add("ProductCode", request.getParameter("product_code"));
	centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
	centinelRequest.add("Recurring", request.getParameter("recurring"));
	
	centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
	centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
	centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
	centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
	centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
		
	centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
	centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
	centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
	centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
	centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));

	
	// CODE FOR GOOGLE ANALYTICS DATA TRACKING
	//centinelRequest.add("AnalyticsData", request.getParameter("analyticsdata"));

	// CODE TO OVERRIDE CONFIG LEVEL SHIPPING XML
	//centinelRequest.add("Flat_Shipping_Name_1", "Free Saver Shipper");
	//centinelRequest.add("Flat_Shipping_Amount_1", "0.00");
	//centinelRequest.add("Flat_Shipping_Name_2", "USPS Priority");
	//centinelRequest.add("Flat_Shipping_Amount_2", "15.69");
	//centinelRequest.add("Flat_Shipping_Name_3", "USPS Overnight");
	//centinelRequest.add("Flat_Shipping_Amount_3", "25.69");

	// CODE FOR UPSELL
	//centinelRequest.add("Offer_Text_1", "Murrey Dominator Pro Series 8' Pool Table with Drop Pockets.");
	//centinelRequest.add("Offer_Detail_Text_1", "The Murrey Dominator Pro Series Pool Table combines a modern design, tournament style pedestal legs, and K66 rail cushions to create professional quality play at an affordable price.");
	//centinelRequest.add("Offer_Link_1", "http://www.dazadi.com/product_initial/Billiards/Murrey_Dominator_Pro_Series_8'_Pool_Table_with_Drop_Pockets.html");
	//centinelRequest.add("Offer_Image_Link_1", "http://www.dazadi.com/images/p100/my_dominator.jpg");
	//centinelRequest.add("Offer_Valid_To_1", "2007-08-10T11:59:59-05:00");
	//centinelRequest.add("Offer_Valid_From_1", "2007-07-01T11:59:59-05:00");
	
	// CODE FOR DYNAMIC PRIVATE ITEM DATA
	//centinelRequest.add("Item_Data_1_Color", "Red");
	//centinelRequest.add("Item_Data_1_Engraving", "ENGRAVING MESSAGE");

	// TRACKING URL INFORMATION
	//centinelRequest.add("Tracking_Url_1", "https://ssl.google-analytics.com/urchin.js");
	//centinelRequest.add("Tracking_Parameter_1_OrderTotal", "order-total");
	//centinelRequest.add("Tracking_Parameter_1_OrderSubtotal", "order-subtotal");

	// CODE FOR DYNAMIC PRIVATE MERCHANT DATA
	//centinelRequest.add("Private_Data_1_source", "Mobile");

	// MESSAGE LEVEL OVERRIDE
	//centinelRequest.add("OverrideEditCartURL", "http://yourshoppingcart.com/cart.html");
	//centinelRequest.add("OverrideContinueShoppingURL", "http://localhost:8080/8.1.1/googlecheckout/ccLookup.jsp");

	// Calc Shipping Override --->
	//String standardShipping = "4.50";
	//String priorityShipping = "9.50";
	
	//String shippingMethods = "<shipping-methods><flat-rate-shipping name=\"STANDARD SHIPPING: 4-10 business days\"><price currency=\"USD\">" + standardShipping + "</price><shipping-restrictions><allowed-areas><world-area></world-area><us-country-area country-area=\"ALL\"/></allowed-areas><excluded-areas><us-state-area><state>HI</state></us-state-area><us-state-area><state>AK</state></us-state-area></excluded-areas><allow-us-po-box>false</allow-us-po-box></shipping-restrictions></flat-rate-shipping><flat-rate-shipping name=\" PRIORITY SHIPPING: 4-5 business days\"><price currency=\"USD\">" + priorityShipping + "</price><shipping-restrictions><allowed-areas><us-country-area country-area=\"ALL\"/></allowed-areas><allow-us-po-box>false</allow-us-po-box></shipping-restrictions></flat-rate-shipping></shipping-methods>";
	
	//centinelRequest.add("OverrideAllowMerchantCalcShipping", shippingMethods);
	
	// Calc Taxes Override 		
	//centinelRequest.add("OverrideAllowMerchantCalcTaxes","<tax-tables merchant-calculated=\"false\"><default-tax-table><tax-rules></tax-rules></default-tax-table></tax-tables>");	


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
