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
	
	centinelRequest.add("OverrideProcessorAPIVersion", request.getParameter("overrideProcessorAPIVersion"));
	centinelRequest.add("PaymentProcessorOrderId", request.getParameter("paymentProcessorOrderId"));
	
	String strPaymentProcessorOrderId = request.getParameter("paymentProcessorOrderId");
	
	
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
		
<%@ include file="ccMenu.jsp" %>
		

		<script type="text/javascript" src="<%=AMAZON_JS_URL%>"></script>
		
		<script>
		var reloadpage = false;
		
		var IE = /*@cc_on!@*/false;
		
		if(IE){
			reloadpage = true;
		}else{
		 reloadpage = false;
		}
		
			function reLoad(purchaseContractId){
				if(reloadpage == true){
					reloadpage = true;
					window.location = "<%=INITIATE_URL%>?session=<%=strPaymentProcessorOrderId%>";
				} else {
					reloadpage = true;			
				}
			}
		</script>
		
		<script>
			new CBA.Widgets.AddressWidget({
			merchantId: '<%=AMAZON_MERCHANT_ID%>',
			displayMode: "Edit",		// [Edit] [Read]
			purchaseContractId: "<%=strPaymentProcessorOrderId%>",
			
			onAddressSelect:function(widget) {
			reLoad("<%=strPaymentProcessorOrderId%>");}
			}).render("AmazonAddressWidget");
		</script>

		<script>
			new CBA.Widgets.AddressWidget({
			merchantId: '<%=AMAZON_MERCHANT_ID%>',
			displayMode: "Read",		// [Edit] [Read]
			purchaseContractId: "<%=strPaymentProcessorOrderId%>"
			}).render("AmazonAddressWidgetRead");
		</script>

	
		<script>
			new CBA.Widgets.WalletWidget({
			merchantId: '<%=AMAZON_MERCHANT_ID%>',
			displayMode: "Edit",		// [Edit] [Read]
			purchaseContractId: "<%=strPaymentProcessorOrderId%>"
			}).render("AmazonWalletWidget");
		</script> 
	
		<script>
			new CBA.Widgets.WalletWidget({
			merchantId: '<%=AMAZON_MERCHANT_ID%>',
			displayMode: "Read",		// [Edit] [Read]
			purchaseContractId: "<%=strPaymentProcessorOrderId%>"
			}).render("AmazonWalletWidgetRead");
		</script> 
		
		</head>
		<body>
		<table>
			<tr>
				<td><div id="AmazonAddressWidget"></div></td>
				<td><div id="AmazonAddressWidgetRead"></div></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><div id="AmazonWalletWidget"></div></td>
				<td><div id="AmazonWalletWidgetRead"></div></td>
			</tr>
		</table>		
		<br /><br /><br />
		Order Id :<%=(String) session.getAttribute("Centinel_OrderId")%>
                

        	</body>
	</html>
