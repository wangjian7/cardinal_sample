<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccAuthorize.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="testCases.js"></script>
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">
	
			 window.onload = function() {
					document.frm.order_number.value = randomOrderNumber();
					document.frm.item_price_1.value = randomAmount();
					document.frm.item_price_2.value = randomAmount();
					document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);
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
<b>Authorization Request Form</b>
<form name="frm" method="POST" action="ccAuthorize.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
				<option value="BB">BB - Bill-Me-Later Business</option>
			</select>
	</td>
	<td>Test Case</td>
		<td><select name="testCase" onChange="setTestCaseData(document.forms[0].testCase.options[document.forms[0].testCase.selectedIndex].value);" style="width:125px">
					<option value="">
		<option value="1">Test Case 1
		<option value="2">Test Case 2
		<option value="3">Test Case 3
		<option value="4">Test Case 4
		<option value="5">Test Case 5
		<option value="6">Test Case 6
		<option value="7">Test Case 7
		<option value="8">Test Case 8
		<option value="9">Test Case 9
			</select>
		</td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td bgcolor="ffff40">Card Number</td><td><input type="text" name="card_number" value="5049900000000000"></td>
	<td>OrderId</td><td><input type="text" name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Customer Reg Date</td><td><input type=text name="c_reg_date" value=""></td>
	<td>Promo Code</td><td><input type=text name="promo_code" value="Default"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Customer Flag</td><td><input type=text name="c_new" value="N"></td>
	<td>Terms And Conditions</td><td><input type=text name="terms_conditions" value=""></td>
</tr>
<tr>
	<td>SSN</td><td><input type=text name="ssn" value=""></td>
	<td>DateOfBirth</td><td><input type=text name="dob" value=""></td>
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
	<td bgcolor="ffff40">Billing First Name</td><td><input type="text" name="b_first_name" value="John"></td>
	<td bgcolor="ffff40">Shipping First Name</td><td><input type="text" name="s_first_name" value="John"></td>
</tr>
<tr>
	<td>Billing Middle Name</td><td><input type="text" name="b_middle_name" value=""></td>
	<td>Shipping Middle Name</td><td><input type="text" name="s_middle_name" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Billing Last Name</td><td><input type="text" name="b_last_name" value="Consumer"></td>
	<td bgcolor="ffff40">Shipping Last Name</td><td><input type="text" name="s_last_name" value="Consumer"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Billing Address1</td><td><input type="text" name="b_address1" value="123 Main Street"></td>
	<td bgcolor="ffff40">Shipping Address1</td><td><input type="text" name="s_address1" value="123 Main Street"></td>
</tr>
<tr>
	<td>Billing Address2</td><td><input type="text" name="b_address2" value=""></td>
	<td>Shipping Address2</td><td><input type="text" name="s_address2" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Billing City</td><td><input type="text" name="b_city" value="Cleveland"></td>
	<td bgcolor="ffff40">Shipping City</td><td><input type="text" name="s_city" value="Cleveland"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Billing State</td>
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
	<td bgcolor="ffff40">Shipping State</td>
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
	<td bgcolor="ffff40">Billing Postal Code</td><td><input type="text" name="b_postal_code" value="44111"></td>
	<td bgcolor="ffff40">Shipping Postal Code</td><td><input type="text" name="s_postal_code" value="44111"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Billing Country Code</td>
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
	<td bgcolor="ffff40">Shipping Country Code</td>
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
	<td bgcolor="ffff40">Billing Phone</td><td><input type="text" name="b_phone" value="2162162116"></td>
	<td>Shipping Phone</td><td><input type="text" name="s_phone" value="2162162116"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Buyer Email</td><td><input type="text" name="email_address" value="johnconsumer@consumerdomain.com"></td>
	<td>&nbsp;</td><td></td>
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
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>BusinessAddress1</td><td><input type=text name="business_address1" value="1234 Main Street"></td>
	<td>BusinessDbaName</td><td><input type=text name="business_dba_name" value="Cardinal"></td>
</tr>
<tr>
	<td>BusinessAddress2</td><td><input type=text name="business_address2" value=""></td>
	<td>BusinessLegalName</td><td><input type=text name="business_legal_name" value="Cardinal Commerce"></td>
</tr>
<tr>
	<td>BusinessCity</td><td><input type=text name="business_city" value="Mentor"></td>
	<td>BusinessLoanType</td><td><input type=text name="business_loan_type" value="REV"></td>
</tr>
<tr>
	<td>BusinessCountryCode</td><td><input type=text name="business_country_code" value="US"></td>
	<td>BusinessNumOfEmployees</td><td><input type=text name="business_num_of_employees" value="50"></td>
</tr>
<tr>
	<td>BusinessPhone</td><td><input type=text name="business_phone" value="2162162116"></td>
	<td>BusinessType</td><td><input type=text name="business_type" value="CRP"></td>
</tr>
<tr>
	<td>BusinessPostalCode</td><td><input type=text name="business_postal_code" value="44060"></td>
	<td>BusinessYearsInBusiness</td><td><input type=text name="business_years_in_business" value="10"></td>
</tr>
<tr>
	<td>BusinessState</td><td><input type=text name="business_state" value="OH"></td>
	<td>BusinessTaxId</td><td><input type=text name="business_tax_id" value="622232123"></td>
</tr>
<tr>
	<td>BusinessUserId</td><td><input type=text name="business_user_id" value=""></td>
	<td>BusinessPin</td><td><input type=text name="business_pin" value=""></td>
</tr>
<tr>
	<td>AdminFirstName</td><td><input type=text name="admin_first_name" value="Test"></td>
	<td>AdminEmail</td><td><input type=text name="admin_email" value="testuser@cardinalcommerce.com"></td>
</tr>
<tr>
	<td>AdminLastName</td><td><input type=text name="admin_last_name" value="User"></td>
	<td>AdminPhone</td><td><input type=text name="admin_phone" value="2162162116"></td>
</tr>
<tr>
	<td>AdminTitle</td><td><input type=text name="admin_title" value="Manager"></td>
	<td>AdminFax</td><td><input type=text name="admin_fax" value=""></td>
</tr>
<tr>
	<td>PGFirstName</td><td><input type=text name="pg_first_name" value=""></td>
	<td>PGTitle</td><td><input type=text name="pg_title" value=""></td>
</tr>
<tr>
	<td>PGLastName</td><td><input type=text name="pg_last_name" value=""></td>
	<td>PGPhone</td><td><input type=text name="pg_phone" value=""></td>
</tr>
<tr>
	<td>PGAddress1</td><td><input type=text name="pg_address1" value=""></td>
	<td>PGEmail</td><td><input type=text name="pg_email" value=""></td>
</tr>
<tr>
	<td>PGAddress2</td><td><input type=text name="pg_address2" value=""></td>
	<td>PGDateOfBirth</td><td><input type=text name="pg_date_of_birth" value=""></td>
</tr>
<tr>
	<td>PGCity</td><td><input type=text name="pg_city" value=""></td>
	<td>PGCountryCode</td><td><input type=text name="pg_country_code" value=""></td>
</tr>
<tr>
	<td>PGState</td><td><input type=text name="pg_state" value=""></td>
	<td>PGPostalCode</td><td><input type=text name="pg_postal_code" value=""></td>
</tr>
<tr>
	<td>PGSSN</td><td><input type=text name="pg_ssn" value=""></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td></td>
	<td>
		<input type=submit name="submit" value="Submit Order">
		<!--- This fields are here to allow javascript to populate form --->
		<input type="hidden" name="transaction_id" value="">
	</td>
</tr>
<tr>
<td colspan="2"><br>
  <b><i>Required fields highlighted</i></b></td>
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
		centinelRequest.add("MsgType","cmpi_authorize");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("IPAddress", request.getRemoteAddr());

		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));

		centinelRequest.add("OrderNumber", request.getParameter("order_number"));
		centinelRequest.add("OrderDescription", request.getParameter("order_description"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
		centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
		centinelRequest.add("GiftCardAmount", request.getParameter("gift_card_amount"));
		centinelRequest.add("Recurring", request.getParameter("recurring"));
		centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
		centinelRequest.add("ProductCode", request.getParameter("product_code"));
		centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
		centinelRequest.add("CategoryCode", request.getParameter("category_code"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));

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

		//--- Payment Type Specific ---'
		centinelRequest.add("CardNumber", request.getParameter("card_number"));
		centinelRequest.add("PromoCode", request.getParameter("promo_code"));
		centinelRequest.add("CustomerRegistrationDate", request.getParameter("c_reg_date"));
		centinelRequest.add("CustomerFlag", request.getParameter("c_new"));
		centinelRequest.add("DateOfBirth", request.getParameter("dob"));
		centinelRequest.add("SSN", request.getParameter("ssn"));
		centinelRequest.add("TermsAndConditions", request.getParameter("terms_conditions"));
		
		
		centinelRequest.add("BusinessAddress1", request.getParameter("business_address1"));
		centinelRequest.add("BusinessAddress2", request.getParameter("business_address2"));
		centinelRequest.add("BusinessDbaName", request.getParameter("business_dba_name"));
		centinelRequest.add("BusinessLegalName", request.getParameter("business_legal_name"));
		centinelRequest.add("BusinessCity", request.getParameter("business_city"));
		centinelRequest.add("BusinessLoanType", request.getParameter("business_loan_type"));
		centinelRequest.add("BusinessCountryCode", request.getParameter("business_country_code"));
		centinelRequest.add("BusinessNumOfEmployees", request.getParameter("business_num_of_employees"));
		centinelRequest.add("BusinessPhone", request.getParameter("business_phone"));
		centinelRequest.add("BusinessType", request.getParameter("business_type"));
		
		centinelRequest.add("BusinessPostalCode", request.getParameter("business_postal_code"));
		centinelRequest.add("BusinessYearsInBusiness", request.getParameter("business_years_in_business"));
		centinelRequest.add("BusinessState", request.getParameter("business_state"));
		centinelRequest.add("BusinessTaxId", request.getParameter("business_tax_id"));
		centinelRequest.add("BusinessUserId", request.getParameter("business_user_id"));
		centinelRequest.add("BusinessPin", request.getParameter("business_pin"));
		centinelRequest.add("AdminFirstName", request.getParameter("admin_first_name"));
		centinelRequest.add("AdminEmail", request.getParameter("admin_email"));
		centinelRequest.add("AdminLastName", request.getParameter("admin_last_name"));
		centinelRequest.add("AdminPhone", request.getParameter("admin_phone"));
		
		centinelRequest.add("AdminTitle", request.getParameter("admin_title"));
		centinelRequest.add("AdminFax", request.getParameter("admin_fax"));
		centinelRequest.add("PGFirstName", request.getParameter("pg_first_name"));
		centinelRequest.add("PGTitle", request.getParameter("pg_title"));
		centinelRequest.add("PGLastName", request.getParameter("pg_last_name"));
		centinelRequest.add("PGPhone", request.getParameter("pg_phone"));
		centinelRequest.add("PGAddress1", request.getParameter("pg_address1"));
		centinelRequest.add("PGEmail", request.getParameter("pg_email"));
		centinelRequest.add("PGAddress2", request.getParameter("pg_address2"));
		centinelRequest.add("PGDateOfBirth", request.getParameter("pg_date_of_birth"));

		centinelRequest.add("PGCity", request.getParameter("pg_city"));
		centinelRequest.add("PGCountryCode", request.getParameter("pg_country_code"));
		centinelRequest.add("PGState", request.getParameter("pg_state"));
		centinelRequest.add("PGPostalCode", request.getParameter("pg_postal_code"));
		centinelRequest.add("PGSSN", request.getParameter("pg_ssn"));
		
		

		// Send Message to the MAPS Server
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");			 
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatus = centinelResponse.getValue("StatusCode");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");
		String strAcctNum = centinelResponse.getValue("AccountNumber");
		String strAuthCode = centinelResponse.getValue("AuthorizationCode");

		centinelResponse = null;
		centinelRequest = null;
%>


<b> Authorize Transaction Request</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Authorize Transaction Response</b>
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

