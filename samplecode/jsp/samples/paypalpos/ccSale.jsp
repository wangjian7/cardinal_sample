<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccSale.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<title>Sale Page</title>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">

		window.onload = function() {
				document.frm.order_number.value = randomOrderNumber();
				document.frm.msg_sub_id.value = randomOrderNumber();
				document.frm.amount.value = randomAmount();
				document.frm.onsubmit = singleSubmit("frm");
				
				// Dynamic country / state functionality
				document.forms["frm"].b_country_code.onchange = function() { countryCodeMonitor(); }
				document.forms["frm"].s_country_code.onchange = function() { countryCodeMonitor(); }
				document.getElementById("s_state_field").innerHTML = getStateSelectionHTML("s_state");
				document.getElementById("b_state_field").innerHTML = getStateSelectionHTML("b_state");
        } // end onLoad

</script>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Sale Request Form</b>
<form name="frm" method="POST" action="ccSale.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
  		  <option value="PP">PayPal POS</option>
	</select></td>
	<td bgcolor="ffff40">Order Id</td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">PayPal POS Flag</td>
	<td><select name="pos_flag">
		  <option value="true">true</option>
		  <option value="false">false</option>
	</select></td>
	<td bgcolor="ffff40">Message Sub Id</td>
	<td><input type="text" name="msg_sub_id" value=""></td>
</tr>
<tr>
	<td>Override Account Id</td>
	<td><input type="text" name="override_account_id" value="6RQNNT3NAU2LU"></td>
	<td>Merchant Email</td>
	<td><input type="text" name="merchant_email" value=""></td>
</tr>
<tr>
	<td>Store Id</td>
	<td><input type="text" name="store_id" value="098"></td>
	<td>Terminal Id</td>
	<td><input type="text" name="terminal_id" value="023"></td>
</tr>
<tr>
	<td>Phone Number</td>
	<td><input type="text" name="phone_number" value="6056003645"></td>
	<td>PIN</td>
	<td><input type="text" name="pin" value=""></td>
</tr>
<tr>
	<td>Track 1 Data</td>
	<td><input type="text" name="track1_data" value=""></td>
	<td>Track 2 Data</td>
	<td><input type="text" name="track2_data" value=""></td>
</tr>
<tr>
	<td>Terminal Type</td>
	<td><input type="text" name="terminal_type" value=""></td>
	<td>Terminal Capability Used</td>
	<td><input type="text" name="terminal_cap_used" value=""></td>
</tr>
<tr>
	<td>Data Collection Answer</td>
	<td><input type="text" name="data_collection_answer" value=""></td>
	<td>Verification Answer</td>
	<td><select name="verification_answer">
		  <option value=""></option>
		  <option value="true">true</option>
		  <option value="false">false</option>
	</select></td>
</tr>
<tr>
	<td>Cashier Id</td>
	<td><input type="text" name="cashier_id" value=""></td>
	<td>Cashier Name</td>
	<td><input type="text" name="cashier_name" value=""></td>
</tr>
<tr>
	<td>Store Manager Id</td>
	<td><input type="text" name="store_manager_id" value=""></td>
	<td>Store Manager Name</td>
	<td><input type="text" name="store_manager_name" value=""></td>
</tr>
<tr>
	<td>Receipt Template</td>
	<td><input type="text" name="receipt_template" value=""></td>
	<td>Barcode Data</td>
	<td><input type="text" name="barcode_data" value=""></td>
</tr>
<tr>
	<td>Return Policy Message</td>
	<td><input type="text" name="return_policy_message" value=""></td>
	<td>Receipt Data</td>
	<td><input type="text" name="receipt_data" value=""></td>
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
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
	<td bgcolor="ffff40">Transaction Mode</td>
	<td><select name="txn_mode" id="txn_mode">
			<option value="R">R - Retail (POS)</option>
			<option value="S">S - E-Commerce</option>
			<option value="M">M - Call Center</option>
			<option value="P">P - Mobile Device</option>
		</select>
	</td>	
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Billing First Name</td><td><input type="text" name="b_first_name" value="John"></td>
	<td>Shipping First Name</td><td><input type="text" name="s_first_name" value="John"></td>
</tr>
<tr>
	<td>Billing Middle Name</td><td><input type="text" name="b_middle_name" value=""></td>
	<td>Shipping Middle Name</td><td><input type="text" name="s_middle_name" value=""></td>
</tr>
<tr>
	<td>Billing Last Name</td><td><input type="text" name="b_last_name" value="Consumer"></td>
	<td>Shipping Last Name</td><td><input type="text" name="s_last_name" value="Consumer"></td>
</tr>
<tr>
	<td>Billing Address1</td><td><input type="text" name="b_address1" value="123 Main Street"></td>
	<td>Shipping Address1</td><td><input type="text" name="s_address1" value="123 Main Street"></td>
</tr>
<tr>
	<td>Billing Address2</td><td><input type="text" name="b_address2" value=""></td>
	<td>Shipping Address2</td><td><input type="text" name="s_address2" value=""></td>
</tr>
<tr>
	<td>Billing City</td><td><input type="text" name="b_city" value="Cleveland"></td>
	<td>Shipping City</td><td><input type="text" name="s_city" value="Cleveland"></td>
</tr>
<tr>
	<td>Billing State</td>
	<td id="b_state_field"><select id="b_state" name="b_state">
								<option value="">(No selection)</option>
								<option value="AK">AK - Alaska</option>
								<option value="AL">AL - Alabama</option>
								<option value="AR">AR - Arkansas</option>
								<option value="AZ">AZ - Arizona</option>
								<option value="CA">CA - California</option>
								<option value="CO">CO - Colorado</option>
								<option value="CT">CT - Connecticut</option>
								<option value="DC">DC - District Of Columbia</option>
								<option value="DE">DE - Delaware</option>
								<option value="FL">FL - Florida</option>
								<option value="GA">GA - Georgia</option>
								<option value="HI">HI - Hawaii</option>
								<option value="IA">IA - Iowa</option>
								<option value="ID">ID - Idaho</option>
								<option value="IL">IL - Illinois</option>
								<option value="IN">IN - Indiana</option>
								<option value="KS">KS - Kansas</option>
								<option value="KY">KY - Kentucky</option>
								<option value="LA">LA - Louisiana</option>
								<option value="MA">MA - Massachusetts</option>
								<option value="MD">MD - Maryland</option>
								<option value="ME">ME - Maine</option>
								<option value="MI">MI - Michigan</option>
								<option value="MN">MN - Minnesota</option>
								<option value="MO">MO - Missouri</option>
								<option value="MS">MS - Mississippi</option>
								<option value="MT">MT - Montana</option>
								<option value="NC">NC - North Carolina</option>
								<option value="ND">ND - North Dakota</option>
								<option value="NE">NE - Nebraska</option>
								<option value="NH">NH - New Hampshire</option>
								<option value="NJ">NJ - New Jersey</option>
								<option value="NM">NM - New Mexico</option>
								<option value="NV">NV - Nevada</option>
								<option value="NY">NY - New York</option>
								<option value="OH" selected="selected">OH - Ohio</option>
								<option value="OK">OK - Oklahoma</option>
								<option value="OR">OR - Oregon</option>
								<option value="PA">PA - Pennsylvania</option>
								<option value="RI">RI - Rhode Island</option>
								<option value="SC">SC - South Carolina</option>
								<option value="SD">SD - South Dakota</option>
								<option value="TN">TN - Tennessee</option>
								<option value="TX">TX - Texas</option>
								<option value="UT">UT - Utah</option>
								<option value="VA">VA - Virginia</option>
								<option value="VT">VT - Vermont</option>
								<option value="WA">WA - Washington</option>
								<option value="WI">WI - Wisconsin</option>
								<option value="WV">WV - West Virginia</option>
								<option value="WY">WY - Wyoming</option></select>
	</td>
	<td>Shipping State</td>
	<td id="s_state_field"><select id="s_state" name="s_state">
								<option value="">(No selection)</option>
								<option value="AK">AK - Alaska</option>
								<option value="AL">AL - Alabama</option>
								<option value="AR">AR - Arkansas</option>
								<option value="AZ">AZ - Arizona</option>
								<option value="CA">CA - California</option>
								<option value="CO">CO - Colorado</option>
								<option value="CT">CT - Connecticut</option>
								<option value="DC">DC - District Of Columbia</option>
								<option value="DE">DE - Delaware</option>
								<option value="FL">FL - Florida</option>
								<option value="GA">GA - Georgia</option>
								<option value="HI">HI - Hawaii</option>
								<option value="IA">IA - Iowa</option>
								<option value="ID">ID - Idaho</option>
								<option value="IL">IL - Illinois</option>
								<option value="IN">IN - Indiana</option>
								<option value="KS">KS - Kansas</option>
								<option value="KY">KY - Kentucky</option>
								<option value="LA">LA - Louisiana</option>
								<option value="MA">MA - Massachusetts</option>
								<option value="MD">MD - Maryland</option>
								<option value="ME">ME - Maine</option>
								<option value="MI">MI - Michigan</option>
								<option value="MN">MN - Minnesota</option>
								<option value="MO">MO - Missouri</option>
								<option value="MS">MS - Mississippi</option>
								<option value="MT">MT - Montana</option>
								<option value="NC">NC - North Carolina</option>
								<option value="ND">ND - North Dakota</option>
								<option value="NE">NE - Nebraska</option>
								<option value="NH">NH - New Hampshire</option>
								<option value="NJ">NJ - New Jersey</option>
								<option value="NM">NM - New Mexico</option>
								<option value="NV">NV - Nevada</option>
								<option value="NY">NY - New York</option>
								<option value="OH" selected="selected">OH - Ohio</option>
								<option value="OK">OK - Oklahoma</option>
								<option value="OR">OR - Oregon</option>
								<option value="PA">PA - Pennsylvania</option>
								<option value="RI">RI - Rhode Island</option>
								<option value="SC">SC - South Carolina</option>
								<option value="SD">SD - South Dakota</option>
								<option value="TN">TN - Tennessee</option>
								<option value="TX">TX - Texas</option>
								<option value="UT">UT - Utah</option>
								<option value="VA">VA - Virginia</option>
								<option value="VT">VT - Vermont</option>
								<option value="WA">WA - Washington</option>
								<option value="WI">WI - Wisconsin</option>
								<option value="WV">WV - West Virginia</option>
								<option value="WY">WY - Wyoming</option></select></td>
</tr>
<tr>
	<td>Billing Postal Code</td><td><input type="text" name="b_postal_code" value="44111"></td>
	<td>Shipping Postal Code</td><td><input type="text" name="s_postal_code" value="44111"></td>
</tr>
<tr>
	<td>Billing Country Code</td>
	<td id="b_country_code_field"><select id="b_country_code" name="b_country_code" >
								<option value="US">US - United States</option>
								<option value="AT">AT - Austria</option>
								<option value="BE">BE - Belgium</option>
								<option value="CA">CA - Canada</option>
								<option value="CH">CH - Switzerland</option>
								<option value="CZ">CZ - Czech Republic</option>
								<option value="DE">DE - Germany</option>
								<option value="DK">DK - Denmark</option>
								<option value="ES">ES - Spain</option>
								<option value="FI">FI - Finland</option>
								<option value="FR">FR - France</option>
								<option value="GB">GB - United Kingdom</option>
								<option value="HK">HK - Hong Kong</option>
								<option value="HU">HU - Hungary</option>
								<option value="IE">IE - Ireland</option>
								<option value="IL">IL - Israel</option>
								<option value="IT">IT - Italy</option>
								<option value="JP">JP - Japan</option>
								<option value="MX">MX - Mexico</option>
								<option value="NL">NL - Netherlands</option>
								<option value="NO">NO - Norway</option>
								<option value="NZ">NZ - New Zealand</option>
								<option value="PL">PL - Poland</option>
								<option value="PT">PT - Portugal</option>
								<option value="SE">SE - Sweden</option>
								<option value="SG">SG - Singapore</option></select></td>
	<td>Shipping Country Code</td>
	<td id="s_country_code_field"><select id="s_country_code" name="s_country_code">
								<option value="US">US - United States</option>
								<option value="AT">AT - Austria</option>
								<option value="BE">BE - Belgium</option>
								<option value="CA">CA - Canada</option>
								<option value="CH">CH - Switzerland</option>
								<option value="CZ">CZ - Czech Republic</option>
								<option value="DE">DE - Germany</option>
								<option value="DK">DK - Denmark</option>
								<option value="ES">ES - Spain</option>
								<option value="FI">FI - Finland</option>
								<option value="FR">FR - France</option>
								<option value="GB">GB - United Kingdom</option>
								<option value="HK">HK - Hong Kong</option>
								<option value="HU">HU - Hungary</option>
								<option value="IE">IE - Ireland</option>
								<option value="IL">IL - Israel</option>
								<option value="IT">IT - Italy</option>
								<option value="JP">JP - Japan</option>
								<option value="MX">MX - Mexico</option>
								<option value="NL">NL - Netherlands</option>
								<option value="NO">NO - Norway</option>
								<option value="NZ">NZ - New Zealand</option>
								<option value="PL">PL - Poland</option>
								<option value="PT">PT - Portugal</option>
								<option value="SE">SE - Sweden</option>
								<option value="SG">SG - Singapore</option></select></td>
</tr>
<tr>
	<td>Billing Phone</td><td><input type="text" name="b_phone" value="2162162116"></td>
	<td>Shipping Phone</td><td><input type="text" name="s_phone" value="2162162116"></td>
</tr>
<tr>
	<td>Buyer Email</td><td><input type="text" name="email_address" value="johnconsumer@consumerdomain.com"></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Item 1 Name</td><td><input type="text" name="item_name_1" value=""/></td>
	<td>Item 2 Name</td><td><input type="text" name="item_name_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Description</td><td><input type="text" name="item_desc_1" value=""/></td>
	<td>Item 2 Description</td><td><input type="text" name="item_desc_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 SKU</td><td><input type="text" name="item_sku_1" value=""/></td>
	<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Price</td><td><input type="text" name="item_price_1" value=""/></td>
	<td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value=""/></td>
	<td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value=""/></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Sale"></td>
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

String executeTransaction = request.getParameter("execute");

if ("true".equals(executeTransaction)){

	String 	strErrorNo, strErrorDesc, strReferenceId, strStatus, strOrderId, strTransactionId, strReasonCode, strReasonDesc;

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_sale");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("IPAddress",		request.getRemoteAddr());

	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	
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
	centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));

	centinelRequest.add("BillingFirstName", request.getParameter("b_first_name"));
	centinelRequest.add("BillingMiddleName", request.getParameter("b_middle_name"));
	centinelRequest.add("BillingLastName", request.getParameter("b_last_name"));
	centinelRequest.add("BillingAddress1", request.getParameter("b_address1"));
	centinelRequest.add("BillingAddress2", request.getParameter("b_address2"));
	centinelRequest.add("BillingCity", request.getParameter("b_city"));
	centinelRequest.add("BillingState", request.getParameter("b_state"));
	centinelRequest.add("BillingPostalCode", request.getParameter("b_postal_code"));
	centinelRequest.add("BillingCountryCode", request.getParameter("b_country_code"));
	centinelRequest.add("BillingPhone", request.getParameter("b_phone"));
	centinelRequest.add("ShippingFirstName", request.getParameter("s_first_name"));
	centinelRequest.add("ShippingMiddleName", request.getParameter("s_middle_name"));
	centinelRequest.add("ShippingLastName", request.getParameter("s_last_name"));
	centinelRequest.add("ShippingAddress1", request.getParameter("s_address1"));
	centinelRequest.add("ShippingAddress2", request.getParameter("s_address2"));
	centinelRequest.add("ShippingCity", request.getParameter("s_city"));
	centinelRequest.add("ShippingState", request.getParameter("s_state"));
	centinelRequest.add("ShippingPostalCode", request.getParameter("s_postal_code"));
	centinelRequest.add("ShippingCountryCode", request.getParameter("s_country_code"));
	centinelRequest.add("ShippingPhone", request.getParameter("s_phone"));
	centinelRequest.add("EMail", request.getParameter("email_address"));

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

	// -- Payment Type Specific --'
	centinelRequest.add("POSFlag", request.getParameter("pos_flag"));
	centinelRequest.add("MsgSubId", request.getParameter("msg_sub_id"));
	centinelRequest.add("OverrideAccountId", request.getParameter("override_account_id"));
	centinelRequest.add("MerchantEmail", request.getParameter("merchant_email"));
	centinelRequest.add("StoreId", request.getParameter("store_id"));
	centinelRequest.add("TerminalId", request.getParameter("terminal_id"));
	centinelRequest.add("PhoneNumber", request.getParameter("phone_number"));
	centinelRequest.add("PIN", request.getParameter("pin"));
	centinelRequest.add("PaymentCardTrack1", request.getParameter("track1_data"));
	centinelRequest.add("PaymentCardTrack2", request.getParameter("track2_data"));
	centinelRequest.add("TerminalType", request.getParameter("terminal_type"));
	centinelRequest.add("TerminalCapabilityUsed", request.getParameter("terminal_cap_used"));
	centinelRequest.add("DataCollectionAnswer", request.getParameter("data_collection_answer"));
	centinelRequest.add("VerificationAnswer", request.getParameter("verification_answer"));
	centinelRequest.add("CashierId", request.getParameter("cashier_id"));
	centinelRequest.add("CashierName", request.getParameter("cashier_name"));
	centinelRequest.add("StoreManagerId", request.getParameter("store_manager_id"));
	centinelRequest.add("StoreManagerName", request.getParameter("store_manager_name"));
	centinelRequest.add("ReceiptTemplate", request.getParameter("receipt_template"));
	centinelRequest.add("BarcodeData", request.getParameter("barcode_data"));
	centinelRequest.add("ReturnPolicyMessage", request.getParameter("return_policy_message"));
	centinelRequest.add("ReceiptData", request.getParameter("receipt_data"));
	
/*	
	centinelRequest.add("PartialTender", "true");
	centinelRequest.add("Tender_Name_1", "Cash");
	centinelRequest.add("Tender_Amount_1", "500");
	centinelRequest.add("Tender_Name_2", "CreditCard");
	centinelRequest.add("Tender_Amount_2", "1000");
*/

	// Send Message to the MAPS Server

    centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	strErrorNo = centinelResponse.getValue("ErrorNo");
	strErrorDesc = centinelResponse.getValue("ErrorDesc");
	strReferenceId = centinelResponse.getValue("ReferenceId");
	strStatus = centinelResponse.getValue("StatusCode");
	strOrderId = centinelResponse.getValue("OrderId");
	strTransactionId = centinelResponse.getValue("TransactionId");
	strReasonCode = centinelResponse.getValue("ReasonCode");
	strReasonDesc = centinelResponse.getValue("ReasonDesc");

    centinelRequest = null;
    centinelResponse = null;

	%>


	<b> Sale Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Sale Transaction Response </b>
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

