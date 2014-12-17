<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
//===========================================================================
//  CardinalCommerce (http://www.cardinalcommerce.com)
//  ccNotification.jsp
//===========================================================================
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Notification Page</title>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Notification Request Form</b>
<form name="frm" method="POST" action="ccNotification.jsp?execute=true">
<table>
<tr>
				<td bgcolor="ffff40">NotificationId </td>
				<td><input type="text" size="60" name="NotificationId" value=""></td>
			</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Status"></td>
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

	String formattedRequest = "";
	String formattedResponse = "";

	String notificationId = request.getParameter("NotificationId");

	if (notificationId == null){
		notificationId = "";
	}

	if (notificationId.length() > 1) {

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_payment_status");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("NotificationId", request.getParameter("NotificationId"));
		centinelRequest.add("TransactionType", "MO");



		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

		formattedRequest = centinelRequest.getFormattedRequest();
		formattedResponse = centinelResponse.getFormattedResponse();

		String errorNo = centinelResponse.getValue("ErrorNo");		 
		String errorDesc = centinelResponse.getValue("ErrorDesc");
		String transactionId = centinelResponse.getValue("TransactionId");
		String orderId = centinelResponse.getValue("OrderId");
		String processorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");
		String orderNumber = centinelResponse.getValue("OrderNumber");
		String notificationType = centinelResponse.getValue("NotificationType");
		String merchantData = centinelResponse.getValue("MerchantData");
		String paymentType = centinelResponse.getValue("PaymentType");
		String statusCode = centinelResponse.getValue("StatusCode");
		String reasonCode = centinelResponse.getValue("ReasonCode");
		String reasonDesc = centinelResponse.getValue("ReasonDesc");
		String transactionType = centinelResponse.getValue("TransactionType");
		String currencyCode = centinelResponse.getValue("CurrencyCode");
		String statusDescription = centinelResponse.getValue("StatusDescription");

		if ("NewOrderNotification".equalsIgnoreCase(notificationType) || "OrderStateChangeNotification".equalsIgnoreCase(notificationType) || "AuthorizationNotification".equalsIgnoreCase(notificationType)) { 
		
			String amount = centinelResponse.getValue("Amount");
			String orderTotal = centinelResponse.getValue("OrderTotal"); //--- same as amount but with decimal --->
			String shipAmount = centinelResponse.getValue("ShippingAmount");
			String shipTaxAmount = centinelResponse.getValue("ShippingTaxAmount");
			String taxAmount = centinelResponse.getValue("TaxAmount");
			String promotionAmount = centinelResponse.getValue("PromotionAmount");
			String shipName = centinelResponse.getValue("ShippingName");
			String shipMethod = centinelResponse.getValue("ShippingMethod");	
			String email = centinelResponse.getValue("EMail");
			String ipAddress = centinelResponse.getValue("IPAddress");
			String avsResult = centinelResponse.getValue("AVSResult");
			String accountNumber = centinelResponse.getValue("AccountNumber");
			String authorizationCode = centinelResponse.getValue("AuthorizationCode");
			String cardCodeResult = centinelResponse.getValue("CardCodeResult");
			String eligibleForProtection = centinelResponse.getValue("EligibleForProtection");
			String orderType = centinelResponse.getValue("OrderType");
			String partialCardNumber = centinelResponse.getValue("PartialCardNumber");
			String consolidatedOrders = centinelResponse.getValue("ConsolidatedOrders");
			String processorMerchantCallbackSuccess = centinelResponse.getValue("ProcessorMerchantCallbackSuccess");
			String processorUserAccountAge = centinelResponse.getValue("ProcessorUserAccountAge");
			String processorUserEmailAllowed = centinelResponse.getValue("ProcessorUserEmailAllowed");
			String processorUserId = centinelResponse.getValue("ProcessorUserId");

			String billingFullName	= centinelResponse.getValue("BillingFullName");
			String billingCompanyName = centinelResponse.getValue("BillingCompanyName");
			String billingPhone = centinelResponse.getValue("BillingPhone");
			String billingAddress1 = centinelResponse.getValue("BillingAddress1");
			String billingAddress2 = centinelResponse.getValue("BillingAddress2");
			String billingCity = centinelResponse.getValue("BillingCity");
			String billingState = centinelResponse.getValue("BillingState");
			String billingPostalCode = centinelResponse.getValue("BillingPostalCode");
			String billingCountryCode = centinelResponse.getValue("BillingCountryCode");

			String shippingFullName = centinelResponse.getValue("ShippingFullName");
			String shippingCompanyName = centinelResponse.getValue("ShippingCompanyName");
			String shippingPhone = centinelResponse.getValue("ShippingPhone");
			String shippingAddress1 = centinelResponse.getValue("ShippingAddress1");
			String shippingAddress2 = centinelResponse.getValue("ShippingAddress2");
			String shippingCity = centinelResponse.getValue("ShippingCity");
			String shippingState = centinelResponse.getValue("ShippingState");
			String shippingPostalCode = centinelResponse.getValue("ShippingPostalCode");
			String shippingCountryCode = centinelResponse.getValue("ShippingCountryCode");

			//--- Loop Over and set all items ---'
			//--- NOTE - We are only setting the first item ---'
																	
			String itemName1 = centinelResponse.getValue("Item_Name_1");
			String itemQuantity1 = centinelResponse.getValue("Item_Quantity_1");
			String itemAmazonId = centinelResponse.getValue("Item_Amazon_Id_1");
			String itemPrice1 = centinelResponse.getValue("Item_Price_1");
			String itemSKU1 = centinelResponse.getValue("Item_SKU_1");

			//--- Returned depending on profile settings ---'
			// String itemPrincipal1 = centinelResponse.getValue("Item_Principal_1");
			// String itemShippingAmount1 = centinelResponse.getValue("Item_ShippingAmount_1");
			// String itemTax1 = centinelResponse.getValue("Item_TaxAmount_1");
			// String itemShippingTaxAmount1 = centinelResponse.getValue("Item_ShippingTaxAmount_1");
			// String itemPrinciplePromoAmount1 = centinelResponse.getValue("Item_PrincipalPromotionAmount_1");
			// String itemShippingPromoAmount1 = centinelResponse.getValue("Item_ShippingPromotionAmount_1");

			//--- Loop Over and set all promotions ---'
			String promotionName1 = centinelResponse.getValue("Promotion_Name_1");
			String promotionDesc1 = centinelResponse.getValue("Promotion_Desc_1");
			String promotionAmount1 = centinelResponse.getValue("Promotion_Amount_1");

			// ADD LOGIC

		} else if ("ChargeNotification".equalsIgnoreCase(notificationType)) { 

			String amount = centinelResponse.getValue("Amount");

			// ADD LOGIC

		} else if ("RefundNotification".equalsIgnoreCase(notificationType)) { 

			String amount = centinelResponse.getValue("Amount");

			// ADD LOGIC

		} else if ("ChargebackNotification".equalsIgnoreCase(notificationType)) { 

			String amount = centinelResponse.getValue("Amount");

			// ADD LOGIC

		} else if ("CancelNotification".equalsIgnoreCase(notificationType)) { 

			// ADD LOGIC

		} else {
			// Unable to determine notification type
		}

		centinelResponse = null;
		centinelRequest = null;
		
	}

	String executeTransaction = request.getParameter("execute");

	if ("true".equals(executeTransaction)){

%>

<b> Payment Status Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Payment Status Response Results </b>
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
