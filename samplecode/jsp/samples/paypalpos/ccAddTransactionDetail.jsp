<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccCancelRecurring.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">

		window.onload = function() {
				document.frm.order_number.value = randomOrderNumber();
				document.frm.msg_sub_id.value = randomOrderNumber();
				document.frm.item_price_1.value = randomAmount();
				document.frm.item_price_2.value = randomAmount();
				document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);
				document.frm.onsubmit = singleSubmit("frm");

        } // end onLoad

</script>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Add Transaction Detail Request Form</b>
<form name="frm" method="POST" action="ccAddTransactionDetail.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		  <option value="PP">PP - PayPal POS</option>
	</select></td>
	<td bgcolor="ffff40">Order Id</td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Promotion Name</td>
	<td><input type="text" name="promotion_name" value=""></td>
	<td bgcolor="ffff40">Message Sub Id</td>
	<td><input type="text" name="msg_sub_id" value=""></td>
</tr>
<tr>
	<td>Promotion Amount</td>
	<td><input type="text" name="promotion_amount" value=""></td>
	<td>Promotion Desc</td>
	<td><input type="text" name="promotion_desc" value=""></td>
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
		  <option value="036">036 - AUD</option>
          <option value="124">124 - CAD</option>
		  <option value="203">203 - CZK</option>
		  <option value="208">208 - DKK</option>
          <option value="978">978 - EUR</option>
		  <option value="344">344 - HKD</option>
		  <option value="348">348 - HUF</option>
		  <option value="376">376 - ILS</option>
          <option value="392">392 - JPY</option>
		  <option value="484">484 - MXN</option>
		  <option value="578">578 - NOK</option>
		  <option value="554">554 - NZD</option>
		  <option value="985">985 - PLN</option>
          <option value="826">826 - GBP</option>
		  <option value="702">702 - SGD</option>
		  <option value="752">752 - SEK</option>
		  <option value="756">756 - CHF</option>
		</select>	
	</td>
</tr>
<tr>
	<td>Shipping Amount</td><td><input type="text" name="shipping_amount" value=""></td>
	<td>Tax Amount</td><td><input type="text" name="tax_amount" value=""></td>
</tr>
<tr>
	<td>Handling Amount</td><td><input type="text" name="handling_amount" value=""></td>
	<td>Insurance Amount</td><td><input type="text" name="insurance_amount" value=""></td>
</tr>
<tr>
	<td>Item Amount</td><td><input type="text" name="item_amount" value=""></td>
	<td>Shipping Discount Amount</td><td><input type="text" name="shipping_discount_amount" value=""></td>
</tr>
<tr>
	<td>Gift Card Amount</td><td><input type="text" name="giftcard_amount" value=""></td>
	<td>Recurring</td>
	<td><select name="recurring" id="recurring">
				<option value=""></option>
				<option value="N">N - No</option>
				<option value="Y">Y - Yes</option>
				<option value="AR">AR - Auto Recurring</option>
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
	<td>Item 2 Description</td><td><input type="text" name="item_desc_2" value="The simple 100GB Hard Drive"/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 SKU</td><td><input type="text" name="item_sku_1" value="123456"/></td>
	<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value="987654"/></td>
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
	<td>Item 1 Quantity Unit</td><td><input type="text" name="item_unit_1" value=""/></td>
	<td>Item 2 Quantity Unit</td><td><input type="text" name="item_unit_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Promotion Name</td><td><input type="text" name="item_promo_name_1" value=""/></td>
	<td>Item 2 Promotion Name</td><td><input type="text" name="item_promo_name_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Promotion Desc</td><td><input type="text" name="item_promo_desc_1" value=""/></td>
	<td>Item 2 Promotion Desc</td><td><input type="text" name="item_promo_desc_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Promotion Amount</td><td><input type="text" name="item_promo_amount_1" value=""/></td>
	<td>Item 2 Promotion Amount</td><td><input type="text" name="item_promo_amount_2" value=""/></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Promotion 1 Name</td><td><input type="text" name="promotion_name_1" value=""/></td>
	<td>Promotion 2 Name</td><td><input type="text" name="promotion_name_2" value=""/></td>
</tr>
<tr>
	<td>Promotion 1 Desc</td><td><input type="text" name="promotion_desc_1" value=""/></td>
	<td>Promotion 2 Desc</td><td><input type="text" name="promotion_desc_2" value=""/></td>
</tr>
<tr>
	<td>Promotion 1 Amount</td><td><input type="text" name="promotion_amount_1" value=""/></td>
	<td>Promotion 2 Amount</td><td><input type="text" name="promotion_amount_2" value=""/></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Add Transaction Detail"></td>
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
		centinelRequest.add("MsgType", "cmpi_baseserver_api");
		centinelRequest.add("SubMsgType", "cmpi_add_order_detail");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));

		centinelRequest.add("OrderNumber", request.getParameter("order_number"));
		centinelRequest.add("OrderDescription", request.getParameter("order_description"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
		centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
		centinelRequest.add("HandlingAmount", request.getParameter("handling_amount"));
		centinelRequest.add("InsuranceAmount", request.getParameter("insurance_amount"));
		centinelRequest.add("ItemAmount", request.getParameter("item_amount"));
		centinelRequest.add("ShippingDiscountAmount", request.getParameter("shipping_discount_amount"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));

		centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
		centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
		centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
		centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
		centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
		centinelRequest.add("Item_Unit_1", request.getParameter("item_unit_1"));
		centinelRequest.add("Item_Promotion_Name_1", request.getParameter("item_promo_name_1"));
		centinelRequest.add("Item_Promotion_Desc_1", request.getParameter("item_promo_desc_1"));
		centinelRequest.add("Item_Promotion_Amount_1", request.getParameter("item_promo_amount_1"));
		centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
		centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
		centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
		centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
		centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
		centinelRequest.add("Item_Unit_2", request.getParameter("item_unit_2"));
		centinelRequest.add("Item_Promotion_Name_2", request.getParameter("item_promo_name_2"));
		centinelRequest.add("Item_Promotion_Desc_2", request.getParameter("item_promo_desc_2"));
		centinelRequest.add("Item_Promotion_Amount_2", request.getParameter("item_promo_amount_2"));

		// -- Payment Type Specific --'
		centinelRequest.add("MsgSubId", request.getParameter("msg_sub_id"));
		centinelRequest.add("PromotionName", request.getParameter("promotion_name"));
		centinelRequest.add("PromotionDesc", request.getParameter("promotion_desc"));
		centinelRequest.add("PromotionAmount", request.getParameter("promotion_amount"));
		centinelRequest.add("PromotionName_1", request.getParameter("promotion_name_1"));
		centinelRequest.add("PromotionDesc_1", request.getParameter("promotion_desc_1"));
		centinelRequest.add("PromotionAmount_1", request.getParameter("promotion_amount_1"));
		centinelRequest.add("PromotionName_2", request.getParameter("promotion_name_2"));
		centinelRequest.add("PromotionDesc_2", request.getParameter("promotion_desc_2"));
		centinelRequest.add("PromotionAmount_2", request.getParameter("promotion_amount_2"));


/*centinelRequest.add("Item_Name_1","1050400");
centinelRequest.add("Item_Desc_1","SHOOTERS WALKING S");
centinelRequest.add("Item_Price_1","799");
centinelRequest.add("Item_Quantity_1","1");
centinelRequest.add("Item_SKU_1","000105040");
centinelRequest.add("Item_Taxable_1","Y");
centinelRequest.add("Item_Name_2","1000000000000004193090");
centinelRequest.add("Item_Desc_2","SCOPE MOUNT & BORE");
centinelRequest.add("Item_Price_2","1499");
centinelRequest.add("Item_Quantity_2","1");
centinelRequest.add("Item_SKU_2","000419309");
centinelRequest.add("Item_Taxable_2","Y");
centinelRequest.add("Item_Name_3","1000000000000001171768");
centinelRequest.add("Item_Desc_3","90 PK-ORANGE DOME");
centinelRequest.add("Item_Price_3","399");
centinelRequest.add("Item_Quantity_3","1");
centinelRequest.add("Item_SKU_3","000117176");
centinelRequest.add("Item_Taxable_3","Y");
centinelRequest.add("Item_Name_4","1000000000000006504799");
centinelRequest.add("Item_Desc_4","DEER CORN - 40 LBS");
centinelRequest.add("Item_Price_4","399");
centinelRequest.add("Item_Quantity_4","1");
centinelRequest.add("Item_SKU_4","000650479");
centinelRequest.add("Item_Taxable_4","Y");
centinelRequest.add("Item_Name_5","1000000000000003598968");
centinelRequest.add("Item_Desc_5","TRAIL-LIX APPLE DE");
centinelRequest.add("Item_Price_5","599");
centinelRequest.add("Item_Quantity_5","1");
centinelRequest.add("Item_SKU_5","000359896");
centinelRequest.add("Item_Taxable_5","Y");
centinelRequest.add("Item_Name_6","1000000000000001050400");
centinelRequest.add("Item_Desc_6","SHOOTERS WALKING S");
centinelRequest.add("Item_Price_6","799");
centinelRequest.add("Item_Quantity_6","1");
centinelRequest.add("Item_SKU_6","000105040");
centinelRequest.add("Item_Taxable_6","Y");
*/

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

		centinelResponse = null;
		centinelRequest = null;
		
	
%>


<b> Add Transaction Detail Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Add Transaction Detail Results </b>
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

