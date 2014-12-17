<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccInitiateOrderAction.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<%

	String strPaymentProcessorOrderId = request.getParameter("paymentProcessorOrderId");

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////
	
	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_initiate_order");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));

	centinelRequest.add("UserAgent", request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
	centinelRequest.add("IPAddress", request.getRemoteAddr());
	
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("GiftCardAmount", request.getParameter("giftcard_amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("OrderDescription", request.getParameter("order_description"));
	centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
	centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
	centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
	centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
	centinelRequest.add("ProductCode", request.getParameter("product_code"));
	centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
	centinelRequest.add("Recurring", request.getParameter("recurring"));
	
	
	//******************************************************************
	//* You need to loop over items in shopping cart and set each variable
	//******************************************************************
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
	
	centinelRequest.add("PaymentProcessorOrderId", strPaymentProcessorOrderId);
	centinelRequest.add("OverrideAmazonPaymentsAdvanced", "True");
	
	
	
	// Send Message to the MAPS Server
	
	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);
	
	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
	
	String strErrorNo = centinelResponse.getValue("ErrorNo");
	String strErrorDesc = centinelResponse.getValue("ErrorDesc");
	String strStatusCode = centinelResponse.getValue("StatusCode");
	String strReasonCode = centinelResponse.getValue("ReasonCode");
	String strReasonDesc = centinelResponse.getValue("ReasonDesc");
	String strTransactionId = centinelResponse.getValue("TransactionId");
	String strOrderId = centinelResponse.getValue("OrderId");
	
        session.setAttribute("Centinel_ErrorNo", centinelResponse.getValue("ErrorNo"));		 
	session.setAttribute("Centinel_ErrorDesc", centinelResponse.getValue("ErrorDesc"));
	session.setAttribute("Centinel_TransactionId", centinelResponse.getValue("TransactionId"));
	session.setAttribute("Centinel_OrderId", strOrderId);
	
	centinelResponse = null;
	centinelRequest = null;	
	
%>

	<html>
		<head>
		

		<script type="text/javascript" src='<%=AMAZON_JS_URL%>'></script>


		<script> 
		new OffAmazonPayments.Widgets.Wallet({ 
			sellerId: '<%=AMAZON_MERCHANT_ID%>', 
			amazonOrderReferenceId: '<%=strPaymentProcessorOrderId%>', 
			// amazonOrderReferenceId obtained from Button widget 
			design: { 
				size : {width:'400px', height:'260px'} 
			}, 
			
			onPaymentSelect: function(orderReference) { 
			// Replace this code with the action that you want to perform 
			// after the payment method is selected. 
			}, onError: function(error) { 
			// your error handling code 
			} 
		}).bind("walletWidgetDiv"); 
		</script>
				
		</head>
		<body>
		
<%@ include file="ccMenu.jsp" %>		
		
		<br /><br /><br />
		Order Id : <%=(String) session.getAttribute("Centinel_OrderId")%>
		<br />
		Error No : <%=(String) session.getAttribute("Centinel_ErrorNo")%>
		<br/>
		PaymentProcesseror Id: <%=strPaymentProcessorOrderId%>

		<div id="walletWidgetDiv"></div> 

    <br/><br/>
    
<b> InitiateOrder Request</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>

<b> InitiateOrder Response</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedResponse%></textarea></td>
</tr>
</table>
                

        	</body>
	</html>
