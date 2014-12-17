<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccStart.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
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
		document.frm.onsubmit = singleSubmit("frm");
	} // end onLoad
</script>
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
<form name="frm" method=post action="ccLookup.jsp">
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
					<option value="CART" selected="selected">CART</option>
					<option value="CALLCENTER" >CALLCENTER</option>
					<option value="WIDGET" >WIDGET</option>
					<option value="PRODUCT" >PRODUCT</option>
					<option value="1CLICK">1CLICK</option>
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
	<input alt="Checkout with Amazon Payments" id="amznImage" src="https://payments.amazon.com/gp/cba/button?ie=UTF8&color=orange&background=white&size=medium" type="image">
	</td> 
</tr>
<tr>
  <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
</tr>
</table>
</form>
</body>
</html> 