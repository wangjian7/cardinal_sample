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
		 window.onload = function() {
				document.frm.order_number.value = randomOrderNumber();
				document.frm.item_price_1.value = randomAmount();
				document.frm.item_price_2.value = randomAmount();
				document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);
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
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name="txn_type">
			<option value="G">G - Google Checkout</option>
	</select></td>
	<td></td><td></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>

</tr>
<tr><td bgcolor="ffff40">Order Number</td>
	<td id="order_number_field">
		<input id="order_number" type="text" name="order_number" value="" style="null"/>
	</td>
<td>Order Description</td>
	<td id="order_description_field">
		<input id="order_description" type="text" name="order_description" value="Sample Order..." style="null"/>
	</td>
</tr><tr><td bgcolor="ffff40">Amount</td>
	<td id="amount_field">
		<input id="amount" type="text" name="amount" value="" style="null"/>
	</td>
<td bgcolor="ffff40">Currency Code</td>
	<td id="currency_code_field">
		<select id="currency_code" name="currency_code" style="width: 125px;">
			
<option value ="840">840 - USD</option>
<option value ="036">036 - AUD </option>
<option value ="124">124 - CAD</option>
<option value ="978">978 - EUR</option>
<option value ="826">826 - GBP</option>
<option value ="392">392 - JPY</option>
<option value ="203">203 - CZK</option>
<option value ="208">208 - DKK</option>
<option value ="344">344 - HKD</option>
<option value ="348">348 - HUF</option>
<option value ="376">376 - ILS</option>
<option value ="484">484 - MXN</option>
<option value ="578">578 - NOK</option>
<option value ="554">554 - NZD</option>
<option value ="985">985 - PLN</option>
<option value ="702">702 - SGD</option>
<option value ="752">752 - SEK</option>
<option value ="756">756 - CHF</option>
 
		</select>
	</td></tr><tr><td>Shipping Amount</td>
	<td id="shipping_amount_field">
		<input id="shipping_amount" type="text" name="shipping_amount" value="" style="null"/>
	</td>
<td>Tax Amount</td>
	<td id="tax_amount_field">
		<input id="tax_amount" type="text" name="tax_amount" value="" style="null"/>
	</td>
</tr><tr><td>Gift Card Amount</td>
	<td id="gift_card_amount_field">
		<input id="gift_card_amount" type="text" name="gift_card_amount" value="" style="null"/>
	</td>
<td>Category Code</td>
	<td id="category_code_field">
		<input id="category_code" type="text" name="category_code" value="" style="null"/>
	</td>
</tr><tr><td>Merchant Data</td>
	<td id="merchant_data_field">
		<input id="merchant_data" type="text" name="merchant_data" value="" style="null"/>
	</td>
<td bgcolor="ffff40">Order Channel</td>
	<td id="order_channel_field">
		<select id="order_channel" name="order_channel" style="width: 125px;">
			
<option value="MARK">MARK - Mark</option>
<option selected="selected" value="CART" >CART - Cart</option>
<option value="CALLCENTER" >CALLCENTER - Call Center</option>
<option value="WIDGET" >WIDGET - Widget</option>
<option value="PRODUCT" >PRODUCT - Product</option>
<option value="1CLICK" >1CLICK - 1 Click</option>
 
		</select>
	</td></tr><tr><td bgcolor="ffff40">Product Code</td>
	<td id="product_code_field">
		<select id="product_code" name="product_code" style="width: 125px;">
			
<option value="PHY">PHY - Physical Delivery</option>
<option value="CNC">CNC - Cash and Carry</option>
<option value="DIG">DIG - Digital Good</option>
<option value="SVC">SVC - Service</option>
<option value="TBD">TBD - Other</option>
 
		</select>
	</td><td bgcolor="ffff40">Transaction Mode</td>
	<td id="transaction_mode_field">
		<select id="transaction_mode" name="transaction_mode" style="width: 125px;">
			
<option value="S">S - E-Commerce</option>
<option value="M">M - Call Center</option>
<option value="R">R - Retail</option>
 
		</select>
	</td>
</tr>
<tr>
<tr><td>Recurring</td>
	<td id="recurring_field">
		<select id="recurring" name="recurring" style="width: 125px;">
			
               <option value="">Not Supported</option>
		</select>
	</td>
 
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
	<td bgcolor="ffff40">Item 1 SKU</td><td><input type="text" name="item_sku_1" value="123456"/></td>
	<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value="456123"/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 Price</td><td><input type="text" name="item_price_1" value=""/></td>
	<td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""/></td>
</tr>
<tr>

	<td bgcolor="ffff40">Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value="1"/></td>
	<td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value="1"/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 Description</td><td><input type="text" name="item_desc_1" value="The simple MP3 player"/></td>
	<td>Item 2 Description</td><td><input type="text" name="item_desc_2" value="The simple 100GB Hard Drive"/></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td colspan="4" align="right"><input type="image" name="Google Checkout" alt="Fast Checkout through Google" src="http://checkout.google.com/buttons/checkout.gif?merchant_id=MERCHANTID&w=180&h=46&style=white&variant=text&loc=en_US" height="46" width="180"/>
	<input type="hidden" name="analyticsdata" value="">
	</td> 
</tr>
<tr>
  <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
</tr>
</table>
</form>

</body>
</html> 
