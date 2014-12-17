<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccCallback.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
	<script type="text/javascript" src="../common/util.js"></script>
	<script type="text/javascript">
	        window.onload = function() {
			document.frm.onsubmit = singleSubmit("frm");
			document.frm.item_price_1.value = randomAmount();
			document.frm.item_price_2.value = randomAmount();
	        } // end onLoad
    	</script>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Callback Request Form</b>
<form name="frm" method="POST" action="ccCallback.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		<option value="MPS">MPS - MPS</option>
	</select></td>
	<td bgcolor="ffff40">Sub Transaction Type</td>
	<td>
		<select name="sub_txn_type">
			  <option value="GMPP">GMPP - PayPal GMAPI
			  <option value="WALLET">WALLET - Wallet Transaction
		</select>
	</td>	
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td bgcolor="ffff40">Callback Type</td>
	<td>
		<select name="callback_type">
			  <option value="SHIPPING">Shipping
			  <option value="TAX">Tax
			  <option value="TAX_SHIPPING">Tax and Shipping
		</select>
	</td>
	<td></td><td></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td bgcolor="ffff40">Currency Code </td><td><input type=text name="currency_code" value="840"></td>
	<td bgcolor="ffff40">Buyer Email</td><td><input type=text name="email_address" value="testuser@cardinalcommerce.com"></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td width="150">Shipping First Name</td><td><input type=text name="s_first_name" value="Test"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td width="150">Shipping Middle Name</td><td><input type=text name="s_middle_name" value=""></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping Last Name</td><td><input type=text name="s_last_name" value="User"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping Address1</td><td><input type=text name="s_address1" value="1234 Main Street"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping Address2</td><td><input type=text name="s_address2" value=""></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping City</td><td><input type=text name="s_city" value="Mentor"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping State</td><td><input type=text name="s_state" value="OH"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping Postal Code</td><td><input type=text name="s_postal_code" value="44060"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping Country Code</td><td><input type=text name="s_country_code" value="US"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Shipping Phone</td><td><input type=text name="s_phone" value=""></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Item 1 Name</td><td><input type="text" name="item_name_1" value="2GB MP3 Player"/></td>
	<td>Item 2 Name</td><td><input type="text" name="item_name_2" value="100GB Hard Drive"/></td>
</tr>
<tr>
	<td>Item 1 Description</td><td><input type="text" name="item_desc_1" value="The simple MP3 player"/></td>
	<td>Item 2 Description</td><td><input type="text" name="item_desc_2" value="The simple 100GB Hard Drive"/></td>
</tr>
<tr>
	<td>Item 1 SKU</td><td><input type="text" name="item_sku_1" value="123456"/></td>
	<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value="987654"/></td>
</tr>
<tr>
	<td>Item 1 Price</td><td><input type="text" name="item_price_1" value=""/></td>
	<td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value="1"/></td>
	<td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value="1"/></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process"></td>
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
		centinelRequest.add("SubMsgType", "cmpi_callback");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("SubTransactionType", request.getParameter("sub_txn_type"));
		centinelRequest.add("CallbackType", request.getParameter("callback_type"));

		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("EMail", request.getParameter("email_address"));
		centinelRequest.add("UserAgent",        request.getHeader("User-Agent"));
		centinelRequest.add("BrowserHeader",    request.getHeader("Accept"));
		centinelRequest.add("IPAddress",		request.getRemoteAddr());
		
		centinelRequest.add("ShippingFirstName", request.getParameter("s_first_name"));
		centinelRequest.add("ShippingMiddleName", request.getParameter("s_middle_name"));
		centinelRequest.add("ShippingLastName", request.getParameter("s_last_name"));
		centinelRequest.add("ShippingAddress1", request.getParameter("s_address1"));
		centinelRequest.add("ShippingAddress2", request.getParameter("s_address2"));
		centinelRequest.add("ShippingCity", request.getParameter("s_city"));
		centinelRequest.add("ShippingState", request.getParameter("s_state"));
		centinelRequest.add("ShippingCountryCode", request.getParameter("s_country_code"));
		centinelRequest.add("ShippingPostalCode", request.getParameter("s_postal_code"));
		centinelRequest.add("ShippingPhone", request.getParameter("s_phone"));

		centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
		centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
		centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
		centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
		centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
		centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
		centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
		centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
		centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
		centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));

		//*** Additional fields used for shipping callbacks ***//
		//centinelRequest.add("ShippingName_1", "UPS");
		//centinelRequest.add("ShippingName_2", "DHL");
		//centinelRequest.add("ShippingName_3", "FedEx");
		//centinelRequest.add("ShippingName_4", "USPS");

		//centinelRequest.add("OverrideCallbackURL", "http://localhost/googleCallbackExample.jsp");


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


<b> Callback Transaction Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Callback Transaction Results </b>
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

