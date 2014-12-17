<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccOrder.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">
	function randomOrderNumber() {
		var orderNumber =  new String( Math.floor(Math.random() * (9999999999 + 1)  ) );
		var pad = ""; 
		for(var i = 0; i < 10 - orderNumber.length; i++) {
			pad += "0";
		}

		return pad + orderNumber;

	} // end randomOrderId

	function randomAmount() {
		return new String( Math.floor(Math.random() * (9999 + 1)  ) );
	} // end randomAmount

	window.onload=function() {
		document.frm.order_number.value = randomOrderNumber();
		document.frm.item_price_1.value = 50;
		document.frm.item_price_2.value = 25;
		document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);

	} // end onLoad
</script>

<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Order Request Form</b>
<form name="frm" method=post action="ccOrder.jsp?execute=true">
    <table>
			<tr>
				<td bgcolor="ffff40">Transaction Type</td>
				<td>
					<select name="txn_type">
							<option value="AC">AC - Checkout By Amazon</option>
					</select>
				</td>
				<td bgcolor="ffff40">Order Id</td><td><input type=text name="order_id" value=""></td>
			</tr>
			<tr>
				<td>&nbsp;</td><td></td>
				<td>&nbsp;</td><td></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Order Number</td><td><input type="text" name="order_number" value=""></td>
				<td>Order Description </td><td><input type="text" name="order_description" value="Sample Order..."></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Amount </td><td><input type="text" name="amount" value=""></td>
				<td bgcolor="ffff40" >Currency Code </td><td><input type="text" name="currency_code" value="840"></td>
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
				<td>PromotionName</td><td><input type="text" name="promotion_name" value=""></td>
				<td>PromotionDesc</td><td><input type="text" name="promotion_desc" value=""></td>
			</tr>

			<tr>
				<td>PromotionAmount</td><td><input type="text" name="promotion_amount" value=""></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Ship Method</td>
				<td><select name="shipmethod" id="shipmethod">
								<option value="STANDARD" selected="selected">STANDARD</option>
								<option value="EXPEDITED">EXPEDITED</option>
								<option value="ONEDAY" >ONEDAY</option>
								<option value="TWODAY" >TWODAY</option>
								<option value=""></option>
							</select>	
					</td>
				<td>Ship Label</td><td><input type="text" name="shiplabel" value=""/></td>
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
				<td bgcolor="ffff40">Item 1 Tax Amount</td><td><input type="text" name="item_taxamount_1" value=""/></td>
				<td>Item 2 Tax Amount</td><td><input type="text" name="item_taxamount_2" value=""/></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Item 1 Ship Amount</td><td><input type="text" name="item_shipamount_1" value=""/></td>
				<td>Item 2 Ship Amount</td><td><input type="text" name="item_shipamount_2" value=""/></td>
			</tr>
			<tr>
				<td>Item 1 ProductCode</td>
				<td><select name="item_productcode_1" id="item_productcode_1">
								<option value="PHY" selected="selected">PHY - Physical</option>
								<option value="DIG">DIG - Digital Good</option>
							</select>	
					</td>
				<td>Item 2 ProductCode</td>
				<td><select name="item_productcode_2" id="item_productcode_2">
								<option value="PHY" selected="selected">PHY - Physical</option>
								<option value="DIG">DIG - Digital Good</option>
							</select>	
					</td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Item 1 Ship Method</td>
				<td><select name="item_shipmethod_1" id="item_shipmethod_1">
								<option value="STANDARD" selected="selected">STANDARD</option>
								<option value="EXPEDITED">EXPEDITED</option>
								<option value="ONEDAY" >ONEDAY</option>
								<option value="TWODAY" >TWODAY</option>
								<option value="" ></option>
							</select>	
					</td>
				<td>Item 2 Ship Method</td>
					<td><select name="item_shipmethod_2" id="item_shipmethod_2">
								<option value="STANDARD" selected="selected">STANDARD</option>
								<option value="EXPEDITED">EXPEDITED</option>
								<option value="ONEDAY" >ONEDAY</option>
								<option value="TWODAY" >TWODAY</option>
								<option value=""></option>
							</select>	
					</td>
			</tr>
			<tr>
				<td>Item 1 Ship Label</td><td><input type="text" name="item_shiplabel_1" value=""/></td>
				<td>Item 2 Ship Label</td><td><input type="text" name="item_shiplabel_2" value=""/></td>
			</tr>
			<tr>
				<td>Item 1 Promotion Name</td><td><input type="text" name="item_promotionname_1" value=""/></td>
				<td>Item 2 Promotion Name</td><td><input type="text" name="item_promotionname_2" value=""/></td>
			</tr>
			<tr>
				<td>Item 1 Promotion Desc</td><td><input type="text" name="item_promotiondesc_1" value=""/></td>
				<td>Item 2 Promotion Desc</td><td><input type="text" name="item_promotiondesc_2" value=""/></td>
			</tr>
			<tr>
				<td>Item 1 Promotion Amount</td><td><input type="text" name="item_promotionamount_1" value=""/></td>
				<td>Item 2 Promotion Amount</td><td><input type="text" name="item_promotionamount_2" value=""/></td>
			</tr>
			<!--- 
			<tr>
				<td>Item 1 Gift Message</td><td><input type="text" name="item_giftmessage_1" value=""/></td>
				<td>Item 2 Gift Message</td><td><input type="text" name="item_giftmessage_2" value=""/></td>
			</tr>
			<tr>
				<td>Item 1 Gift Option</td><td><input type="text" name="item_giftoption_1" value=""/></td>
				<td>Item 2 Gift Option</td><td><input type="text" name="item_giftoption_2" value=""/></td>
			</tr>
			 --->
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
<br>
<hr>
<br><br>
<%

	boolean executeTransaction = Boolean.valueOf(request.getParameter("execute")).booleanValue();

	if (executeTransaction) {

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_order");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		
		centinelRequest.add("UserAgent", request.getHeader("User-Agent"));
		centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
		centinelRequest.add("IPAddress", request.getRemoteAddr());
		
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
		centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
		centinelRequest.add("OrderNumber", request.getParameter("order_number"));
		centinelRequest.add("OrderDescription", request.getParameter("order_description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
		centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
		centinelRequest.add("ProductCode", request.getParameter("product_code"));
		centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
		centinelRequest.add("Recurring", request.getParameter("recurring"));
		
		centinelRequest.add("PromotionName", request.getParameter("promotion_name"));
		centinelRequest.add("PromotionDesc", request.getParameter("promotion_desc"));
		centinelRequest.add("PromotionAmount", request.getParameter("promotion_amount"));

		centinelRequest.add("ShipMethod", request.getParameter("shipmethod"));
		centinelRequest.add("ShipLabel", request.getParameter("shiplabel"));

		//******************************************************************
		//* You need to loop over items in shopping cart and set each variable
		//******************************************************************
		centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
		centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
		centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
		centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
		centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
		
		centinelRequest.add("Item_TaxAmount_1", request.getParameter("item_taxamount_1"));
		centinelRequest.add("Item_ShipMethod_1", request.getParameter("item_shipmethod_1"));
		centinelRequest.add("Item_ShipAmount_1", request.getParameter("item_shipamount_1"));
		centinelRequest.add("Item_ShipLabel_1", request.getParameter("item_shiplabel_1"));
		centinelRequest.add("Item_ProductCode_1", request.getParameter("item_productcode_1"));

		centinelRequest.add("Item_PromotionName_1", request.getParameter("item_promotionname_1"));
		centinelRequest.add("Item_PromotionDesc_1", request.getParameter("item_promotiondesc_1"));
		centinelRequest.add("Item_PromotionAmount_1", request.getParameter("item_promotionamount_1"));

		centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
		centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
		centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
		centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
		centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
		
		centinelRequest.add("Item_TaxAmount_2", request.getParameter("item_taxamount_2"));
		centinelRequest.add("Item_ShipMethod_2", request.getParameter("item_shipmethod_2"));
		centinelRequest.add("Item_ShipAmount_2", request.getParameter("item_shipamount_2"));
		centinelRequest.add("Item_ShipLabel_2", request.getParameter("item_shiplabel_2"));
		centinelRequest.add("Item_ProductCode_2", request.getParameter("item_productcode_2"));

		centinelRequest.add("Item_PromotionName_2", request.getParameter("item_promotionname_2"));
		centinelRequest.add("Item_PromotionDesc_2", request.getParameter("item_promotiondesc_2"));
		centinelRequest.add("Item_PromotionAmount_2", request.getParameter("item_promotionamount_2"));



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
		String strProcessorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");

		centinelResponse = null;
		centinelRequest = null;
		
	
%>


<b> Order Transaction Request </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Order Transaction Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedResponse%></textarea></td>
</tr>
</table>


<%
   
    if ("Y".equals(strStatusCode)){
    
%>

<script type="text/javascript" src="<%=AMAZON_JS_URL%>"></script>

<p>Your Amazon Payments Order ID is <a href="##" onClick="orderDetailsWidget.open('230px', '554px');">
<%=strProcessorOrderNumber%></a>.</p>

<script>
	var orderDetailsWidget = new CBA.Widgets.OrderDetailsWidget({
	merchantId: '<%=AMAZON_MERCHANT_ID%>',
	orderID: '<%=strProcessorOrderNumber%>'
	});
</script>

<%
   
    }

}
    
%>

</body>
</html>

