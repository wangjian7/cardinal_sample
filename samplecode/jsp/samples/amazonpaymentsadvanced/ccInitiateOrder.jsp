<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccInitiateOrder.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%@ include file="CentinelConfig.jsp" %>
<%
String paymentProcessorOrderId = request.getParameter("session");
%>

<html>
	<head>
		<title>Centinel - Initiate Order</title>
		<link rel="stylesheet" type="text/css" href="../common/style.css" />
		<script type="text/javascript" src="../common/util.js"></script>
		<script type="text/javascript" src='<%=AMAZON_JS_URL%>'></script>
		<script type="text/javascript">
	
			 window.onload = function() {
					document.frm.order_number.value = randomOrderNumber();
					document.frm.item_price_1.value = 50;
					document.frm.item_price_2.value = 25;
					document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);
					document.frm.onsubmit = singleSubmit("frm");

			} // end onLoad
			
	</script>
	
		<script> 
	new OffAmazonPayments.Widgets.AddressBook({ 
		sellerId: '<%=AMAZON_MERCHANT_ID%>', 
		amazonOrderReferenceId: '<%=paymentProcessorOrderId%>', // amazonOrderReferenceId obtained from Button widget 
		onAddressSelect: function(orderReference) { 
			// Replace the following code with the action you that want to perform 
			// after the address is selected.  
			document.frm.submit();
		}, 
		design: { size : {width:'400px', height:'260px'} 
		}, 
		onError: function(error) { // your error handling code 
		} 
	}).bind("addressBookWidgetDiv"); 
</script>
	

	</head>
    <body>

<%@ include file="ccMenu.jsp" %>

        <br/>
        <b>Order Request</b>
        <br/>
        This form is intended to simulate your payment page within your ecommerce web site.
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
        
	<div id="addressBookWidgetDiv"> 
	</div>         

        <form name="frm" method="post" action="ccInitiateOrderAction.jsp">
		<table>
			<tr>
			<td bgcolor="ffff40">Transaction Type</td>
			<td>
				<select name="txn_type">
						<option value="AC">AC - Amazon Payments Advanced</option>
				</select>
			</td>
			</tr>

			<tr>
				<td>&nbsp;</td><td></td>
				<td>&nbsp;</td><td></td>
			</tr>

			<tr>
				<td>PaymentProcessorOrderId</td><td><input type="text" name="paymentProcessorOrderId" value="<%=paymentProcessorOrderId%>"/></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
			<tr>
				<td>&nbsp;</td><td></td>
				<td>&nbsp;</td><td></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Order Number</td><td><input type="text" id="" name="order_number" value=""/></td>
				<td>Order Description </td><td><input type="text" id="" name="order_description" value="Sample Order..."/></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Amount </td><td><input type="text" id="" name="amount" value=""/></td>
				<td bgcolor="ffff40" >Currency Code </td><td><input type="text" id="" name="currency_code" value="840"/></td>
			</tr>
			<tr>
				<td>Shipping Amount</td><td><input type="text" id="" name="shipping_amount" value=""/></td>
				<td>Tax Amount</td><td><input type="text" id="" name="tax_amount" value=""/></td>
			</tr>
			<tr>
				<td>Gift Card Amount</td><td><input type="text" id="" name="giftcard_amount" value=""/></td>
				<td>Recurring</td>
				<td><select name="recurring" id="recurring">
							<option value=""></option>
							<option value="N">N - No</option>
							<option value="Y">Y - Yes</option>
							<option value="AR">AR - Auto Recuring</option>
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
				<td><input type="text" id="" name="category_code" value=""/></td>
			</tr>		
			<tr>
				<td>MerchantData </td><td><input type="text" id="" name="merchant_data" value=""/></td>
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
				<td>&nbsp;</td><td></td>
				<td>&nbsp;</td><td></td>
			</tr>

			</table>
        </form>

    </body>
</html>