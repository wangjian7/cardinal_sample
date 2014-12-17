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
	String transaction_type = request.getParameter("txn_type");
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
	centinelRequest.add("TransactionType",	request.getParameter("txn_type"));
	centinelRequest.add("UserAgent",        request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader",    request.getHeader("Accept"));
	centinelRequest.add("IPAddress",		request.getRemoteAddr());


	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
	centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
	centinelRequest.add("GiftCardAmount", request.getParameter("gift_card_amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
	centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
	centinelRequest.add("ProductCode", request.getParameter("product_code"));
	centinelRequest.add("CategoryCode", request.getParameter("category_code"));
	centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
	centinelRequest.add("Recurring", request.getParameter("recurring"));

	centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
	centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
	centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
	centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
	centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
	centinelRequest.add("Item_TaxTable_1", request.getParameter("item_taxtable_1"));
	centinelRequest.add("Item_ShipMethod_1_1", request.getParameter("item_shipmethod_1_1"));
	centinelRequest.add("Item_Promotion_1", request.getParameter("item_promotion_1"));
	centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
	centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
	centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
	centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
	centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
	centinelRequest.add("Item_TaxTable_2", request.getParameter("item_taxtable_2"));
	centinelRequest.add("Item_ShipMethod_2_1", request.getParameter("item_shipmethod_2_1"));
	centinelRequest.add("Item_Promotion_2", request.getParameter("item_promotion_2"));


	//--- Payment Type Specific ---'
	centinelRequest.add("CartPromotion", request.getParameter("CartPromotion"));
	centinelRequest.add("OverrideCallbackURL", request.getParameter("overrideCallbackURL"));
	centinelRequest.add("CartPromotion", request.getParameter("overrideCalculateTaxes"));
	centinelRequest.add("OverrideCalculateShipping", request.getParameter("overrideCalculateShipping"));
	centinelRequest.add("OverrideCalculatePromotions", request.getParameter("overrideCalculatePromotions"));
	centinelRequest.add("OverrideAllowCoupons", request.getParameter("overrideAllowCoupons"));
	centinelRequest.add("OverrideProcessOnCallbackFailure", request.getParameter("overrideProcessOnCallbackFailure"));
	centinelRequest.add("OverrideProcessorAPIVersion", request.getParameter("overrideProcessorAPIVersion"));

	//--- OverridePromotionXML is optional ---'
	//centinelRequest.add("OverridePromotionXML", "<Promotions><Promotion><PromotionId>cart-promotion-1</PromotionId><Description>My promo</Description><Benefit><FixedAmountDiscount><Amount>.25</Amount> <CurrencyCode>USD</CurrencyCode></FixedAmountDiscount></Benefit></Promotion></Promotions>");

	//--- OverrideShippingXML is optional ---'
	//centinelRequest.add("OverrideShippingXML", "<ShippingMethods><ShippingMethod><ShippingMethodId>item-shipping-method-1</ShippingMethodId><ServiceLevel>TwoDay</ServiceLevel><Rate><ItemQuantityBased><Amount>0.00</Amount><CurrencyCode>USD</CurrencyCode></ItemQuantityBased></Rate><IncludedRegions><PredefinedRegion>USAll</PredefinedRegion></IncludedRegions></ShippingMethod><ShippingMethod><ShippingMethodId>item-shipping-method-2</ShippingMethodId><ServiceLevel>Expedited</ServiceLevel><Rate><ItemQuantityBased><Amount>0.10</Amount><CurrencyCode>USD</CurrencyCode></ItemQuantityBased></Rate><IncludedRegions><PredefinedRegion>USAll</PredefinedRegion></IncludedRegions></ShippingMethod></ShippingMethods>");

	//--- OverrideTaxXML is optional ---'
	//centinelRequest.add("OverrideTaxXML", "<DefaultTaxTable><TaxTableId>default-tax-table</TaxTableId><TaxRules><TaxRule><Rate>.08</Rate><IsShippingTaxed>true</IsShippingTaxed><PredefinedRegion>USAll</PredefinedRegion></TaxRule></TaxRules></DefaultTaxTable><TaxTables><TaxTable><TaxTableId>item-tax-table-1</TaxTableId><TaxRules><TaxRule><Rate>.083</Rate><USStateRegion>WA</USStateRegion></TaxRule></TaxRules></TaxTable><TaxTable><TaxTableId>item-tax-table-2</TaxTableId><TaxRules><TaxRule><Rate>.099</Rate><USZipRegion>44060</USZipRegion></TaxRule></TaxRules></TaxTable></TaxTables>");

	

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
	String strReasonCode = centinelResponse.getValue("ReasonCode");			 
	String strReasonDesc = centinelResponse.getValue("ReasonDesc");
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
