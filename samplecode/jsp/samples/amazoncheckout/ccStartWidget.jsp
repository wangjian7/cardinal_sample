<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccStartWidget.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%@ include file="CentinelConfig.jsp" %>
<html>
<head><title>Centinel - Start Page</title>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">
	window.onload=function() {
		document.frm.order_number.value = randomOrderNumber();
		document.frm.item_price_1.value = 50;
		document.frm.item_price_2.value = 25;
		document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);
	} // end onLoad
</script>

<!-- SECTION 3 START -->
<script type="text/javascript" src="https://util.cardinalcommerce.com/widget/ac_jquery.asp"></script>
<script type="text/javascript" src="https://util.cardinalcommerce.com/widget/CentinelWidgetRC3.asp"></script>
<script type="text/javascript" src="https://util.cardinalcommerce.com/widget/ac_widget.asp"></script>
<!-- SECTION 3 END -->

<!-- SECTION 4 Start -->
<script type="text/javascript">

function runCentinelClient(transactionUrl, termUrl, modalUrl, utilityUrl, generatePayloadUrl, validatePayloadUrl, timeout) {
	var client = CentinelGetInstance();
	client.PostVars = "";
	client.debug = false;
	
	// Encase in try/catch block, that way if there are any errors we can revert back to the standard flow:
	try {
	
		// Check to make sure this is an Amazon order, if it is not, then go ahead and submit the form
		var txn_type = jQuery("[name=txn_type]").val();
		if (txn_type == "AC") {

			// This loads all of the config URL's into the Centinel Widget, nothing should need changed here
			client.TransactionUrl = transactionUrl;
			client.TermUrl = termUrl;
			client.ModalUrl = modalUrl;
			client.UtilityUrl = utilityUrl;
			client.GeneratePayloadUrl = generatePayloadUrl;
			client.ValidatePayloadUrl = validatePayloadUrl;
			client.Timeout = timeout;
		
			// This tells the Centinel Widget how to handle the request
			client.requestType = client.REQUEST_TYPE_1CLICK;
			client.messageType = "cmpi_lookup";
			client.transactionType = "AC";

			client.PaymentButtonId = "amznImage";
		
			/*
			Add all the fields to be sent in Payload to Centinel, you can call client.AddByName, client.AddById, and client.AddByValue to add fields.
			For each of the Add functions the first parameter is the name of the field that will be posted to create the payload and 
			the second parameter is the Form ID, Name, or Value to get off the current page
			*/
		
			client.AddByName("txn_type", "txn_type");
			client.AddByName("amount", "amount");
			client.AddByName("currency_code", "currency_code");
			client.AddByName("order_number", "order_number");
			client.AddByName("order_description", "order_description");
			client.AddByName("order_channel", "order_channel");
			client.AddByName("merchant_data", "merchant_data");

			client.AddByName("item_name_1", "item_name_1");
			client.AddByName("item_sku_1", "item_sku_1");
			client.AddByName("item_price_1", "item_price_1");
			client.AddByName("item_quantity_1", "item_quantity_1");
			client.AddByName("item_desc_1", "item_desc_1");
			client.AddByName("item_taxtable_1", "item_taxtable_1");
			client.AddByName("item_shipmethod_1_1", "item_shipmethod_1_1");
			client.AddByName("item_promotion_1", "item_promotion_1");
			client.AddByName("item_name_2", "item_name_2");
			client.AddByName("item_sku_2", "item_sku_2");
			client.AddByName("item_price_2", "item_price_2");
			client.AddByName("item_quantity_2", "item_quantity_2");
			client.AddByName("item_desc_2", "item_desc_2");
			client.AddByName("item_taxtable_2", "item_taxtable_2");
			client.AddByName("item_shipMethod_2_1", "item_shipmethod_2_1");
			client.AddByName("item_promotion_2", "item_promotion_2");
			
			client.AddByName("overrideCallbackURL", "overrideCallbackURL");
			client.AddByName("overrideCalculateTaxes", "overrideCalculateTaxes");
			client.AddByName("overrideCalculateShipping", "overrideCalculateShipping");
			client.AddByName("overrideCalculatePromotions", "overrideCalculatePromotions");
			client.AddByName("overrideProcessOnCallbackFailure", "overrideProcessOnCallbackFailure");
			client.AddByName("overrideAllowCoupons", "overrideAllowCoupons");
			client.AddByName("overrideProcessorAPIVersion", "overrideProcessorAPIVersion");
			client.AddByName("CartPromotion", "CartPromotion");
		
			//client.SendRequestViaFrontend();
			client.SendRequestViaBackend();
			return false;
		} else {
			return true;
		}
	} catch (e) {
		// If there was an error caught, revert back to the standard transaction flow
		return true;
	}
}

</script>
<!-- SECTION 4 End -->

</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Lookup Transaction Form</b>
<br/>
This form is intended to simulate your payment page within your ecommerce website.
<br/>All payment information is collected, and clicking the submit button at the bottom of the page simulates the consumer clicking the final buy button.
<br/>
<%
    String msgStr = (String) session.getAttribute("Message");
    if (msgStr != null && msgStr.length() > 0) {
%>
<br/>
	<font color="red"><b>Sample Message : <%=msgStr%></b></font>
<br/>
<%
    }
	session.removeAttribute("Message");
%>
<br/>
<!-- SECTION 5 Start -->
<form name="frm" method="POST" action="ccLookup.jsp" onSubmit="return runCentinelClient('<%=TRANSACTION_URL%>', '<%=CENTINEL_TERM_URL%>', '', '', 'ccLookupWidget.jsp', '', '<%=TIMEOUT_READ%>')">
<!-- SECTION 5 End -->
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td>
		<select name="txn_type">
				<option value="AC">AC - Checkout By Amazon</option>
		</select>
	</td>
</tr>

<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Cart Promotion</td><td><input type="text" name="CartPromotion" value=""/></td>
	<td>Override Callback URL</td><td><input type="text" name="overrideCallbackURL" value=""/></td>
</tr>
<tr>
	<td>Override Calculate Taxes</td>
	<td>
		<select name="overrideCalculateTaxes">
				<option value=""></option>
				<option value="false">false
				<option value="true">true
		</select>
	</td>
	<td>Override Calculate Shipping</td>
	<td>
		<select name="overrideCalculateShipping">
				<option value=""></option>
				<option value="false">false
				<option value="true">true
		</select>
	</td>
</tr>
<tr>
	<td>Override Calculate Promotions</td>
	<td>
		<select name="overrideCalculatePromotions">
				<option value=""></option>
				<option value="false">false
				<option value="true">true
		</select>
	</td>
	<td>OverrideAllowCoupons</td>
	<td>
		<select name="overrideAllowCoupons">
				<option value=""></option>
				<option value="false">false
				<option value="true">true
		</select>
	</td>
</tr>
<tr>
	<td>OverrideProcessOnCallbackFailure</td>
	<td>
		<select name="overrideProcessOnCallbackFailure">
				<option value=""></option>
				<option value="false">false
				<option value="true">true
		</select>
	</td>
	<td>OverrideProcessorAPIVersion</td>
	<td>
		<select name="overrideProcessorAPIVersion">
				<option value=""></option>
				<option value="2009-05-15">2009-05-15
		</select>
	</td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td bgcolor="ffff40" width="150">Order Number</td><td><input type="text" name="order_number" value=""></td>
	<td>Order Description </td><td><input type="text" name="order_description" value="Sample Order..."></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td><td><input type="text" name="amount" value=""></td>
	<td bgcolor="ffff40" >Currency Code </td>
	<td>
		<select name="currency_code" id="currency_code">
			<option value="840">840 - USD</option>
		</select>	
	</td>
</tr>
<tr>
	<td>Shipping Amount</td><td><input type="text" name="shipping_amount" value=""></td>
	<td>Tax Amount</td><td><input type="text" name="tax_amount" value=""></td>
</tr>
<tr>
	<td>Gift Card Amount</td><td><input type="text" name="giftcard_amount" value=""></td>
	<td>Recurring</td>
	<td><select name="recurring" id="recurring">
				<option value=""></option>
				<option value="N">N - No</option>
				<option value="Y">Y - Yes</option>
				<option value="AR">AR - Automatic Recurring</option>
			</select>
		</td>
</tr>		
<tr>
	<td bgcolor="ffff40">Order Channel</td>
		<td><select name="order_channel" id="order_channel">
					<option value="MARK">MARK</option>
					<option value="CART">CART</option>
					<option value="CALLCENTER" >CALLCENTER</option>
					<option value="WIDGET" >WIDGET</option>
					<option value="PRODUCT" >PRODUCT</option>
					<option value="1CLICK" selected="selected">1CLICK</option>
				</select>	
		</td>
		<td bgcolor="ffff40">ProductCode</td>
		<td><select name="product_code" id="product_code">
					<option value="PHY" selected="selected">PHY - Physical Delivery</option>
					<option value="CNC">CNC - Cash and Carry</option>
					<option value="DIG">DIG - Digital Good</option>
					<option value="SVC">SVC - Service</option>
					<option value="TBD">TBD - Other</option>
					
				</select>	
		</td>
</tr>		
<tr>
	<td bgcolor="ffff40">Transaction Mode</td>
	<td><select name="txn_mode" id="txn_mode">
				<option value="S">S - E-Commerce</option>
				<option value="M">M - Call Center</option>
			</select>
		</td>
	<td>Category Code</td>
	<td><input type="text" name="category_code" value=""></td>
</tr>		
<tr>
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 Name</td><td><input type="text" name="item_name_1" value="2GB MP3 Player"/></td>
	<td>Item 2 Name</td><td><input type="text" name="item_name_2" value="100GB Hard Drive"/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 Description</td><td><input type="text" name="item_desc_1" value="The simple MP3 player"/></td>
	<td>Item 2 Description</td><td><input type="text" name="item_desc_2" value="100GB Hard Drive"/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 Price</td><td><input type="text" name="item_price_1" value=""/></td>
	<td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 SKU</td><td><input type="text" name="item_sku_1" value="111"/></td>
	<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value="222"/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value="1"/></td>
	<td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value="1"/></td>
</tr>
<tr>
	<td>Item 1 TaxTable</td><td><input type="text" name="item_taxtable_1" value="item-tax-table-1"/></td>
	<td>Item 2 TaxTable</td><td><input type="text" name="item_taxtable_2" value="item-tax-table-1"/></td>
</tr>
<tr>
	<td>Item 1 Promotion</td><td><input type="text" name="item_promotion_1" value=""/></td>
	<td>Item 2 Promotion</td><td><input type="text" name="item_promotion_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Ship Method</td><td><input type="text" name="item_shipmethod_1_1" value="item-shipping-method-1"/></td>
	<td>Item 2 Ship Method</td><td><input type="text" name="item_shipmethod_2_1" value="item-shipping-method-1"/></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<TD colspan="4" align="right">
<!-- SECTION 6 Start -->
       <input align="right" id="amznImage" alt="Checkout with Amazon Payments" src="https://payments.amazon.com/gp/cba/button?ie=UTF8&color=orange&background=white&size=medium&type=express" type="image">
<!-- SECTION 6 Start -->
	</td> 
</tr>
<tr>
  <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
</tr>
</table>
</form>
<!-- SECTION 7 Start -->
<form name="cbaForm" action="" method=POST >
        <input name="order-input" value="" type="hidden">
        <!-- this form does not have a submit button -->
</form>
<!-- SECTION 7 End -->
</body>
</html> 