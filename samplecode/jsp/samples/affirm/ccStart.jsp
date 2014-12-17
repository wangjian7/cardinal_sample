<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
// CardinalCommerce (http://www.cardinalcommerce.com)
// Sample page used to simulate the checkout form of an ecommerce web site
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
			document.frm.amount.value = parseInt(document.frm.item_price_1.value) + parseInt(document.frm.item_price_2.value);
			document.frm.onsubmit = singleSubmit("frm");
			
			// Dynamic country / state functionality
			document.forms["frm"].b_country_code.onchange = function() { countryCodeMonitor(); }
			document.forms["frm"].s_country_code.onchange = function() { countryCodeMonitor(); }
			document.getElementById("s_state_field").innerHTML = getStateSelectionHTML("s_state");
			document.getElementById("b_state_field").innerHTML = getStateSelectionHTML("b_state");
			
	} // end onLoad
</script>
<script type="text/javascript">
        var _affirm = _affirm || [];
        (function(){
            var af = document.createElement('script');
            af.type = 'text/javascript';
            af.async = true;
            af.src = "https://sandbox.affirm.com/v1.1/affirm.js";
            var t = document.getElementsByTagName('script')[0];
            t.parentNode.insertBefore(af, t);
        })();
</script>
</head>
<body>
<br/>
<b>Lookup Transaction Form</b>
<br/>
This form is intended to simulate your payment page within your ecommerce website.
<br/>All payment information is collected, and clicking the submit button at the bottom of the page simulates the consumer clicking the final buy button.
<br/>
<%
    String msgStr = (String) session.getAttribute("Message");
	String centResp = (String) session.getAttribute("Centinel_Authenticate_Response");
	
    if (msgStr != null && msgStr.length() > 0) {
%>
<br/>
	<font color="red"><b>Sample Message : <%=msgStr%></b></font>
	<br>
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
		  <option value="AF">AF - Affirm</option>
	</select></td>
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
	<td bgcolor="ffff40" >Currency Code </td>
	<td>
		<select name="currency_code" id="currency_code">
			<option value="840">840 - USD</option>
		</select>	
	</td>
	<td>Shipping Amount</td><td><input type="text" name="shipping_amount" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Order Channel</td>
	<td><select name="order_channel" id="order_channel">
			<option value="cart" selected="selected">CART</option>
			<option value="product_page">PRODUCT PAGE</option>
		</select>	
	</td>
	<td>Tax Amount</td><td><input type="text" name="tax_amount" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount</td><td><input type="text" name="amount" value=""></td>
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
	<td>Address Type</td><td><select name="address_type" id="address_type">
			<option value="R">RESIDENTIAL</option>
			<option value="B">BUSINESS</option>
		</select>
	</td>
</tr>
<tr>
	<td>Req. Billing Fields</td><td><input type="text" name="required_billing_fields" value=""></td>
	<td>Req. Shipping Fields</td><td><input type="text" name="required_shipping_fields" value=""></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>Shipping Type</td><td><input type="text" name="shipping_type" value="Fedex Ground"></td>
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
	<td bgcolor="ffff40">Item 1 Image URL</td><td><input type="text" name="item_image_url_1" value="https://billing.cardinalcommerce.com/centineldev/affirm/item.jpg"/></td>
	<td>Item 2 Image URL</td><td><input type="text" name="item_image_url_2" value="https://billing.cardinalcommerce.com/centineldev/affirm/item.jpg"/></td>
</tr>
<tr>
	<td bgcolor="ffff40">Item 1 Type</td>
	<td><select name="item_type_1" id="txn_mode">
			<option value="physical">Physical</option>
			<option value="service">Service</option>
			<option value="digital">Digital</option>
		</select>
	</td>
	<td>Item 2 Type</td>
	<td><select name="item_type_2" id="txn_mode">
			<option value="physical">Physical</option>
			<option value="service">Service</option>
			<option value="digital">Digital</option>
		</select>
	</td>
</tr>
<tr>
	<td>Item 1 Shipping Date</td><td><input type="text" name="item_shipping_date_1" value=""/></td>
	<td>Item 2 Shipping Date</td><td><input type="text" name="item_shipping_date_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Delivery Date</td><td><input type="text" name="item_delivery_date_1" value=""/></td>
	<td>Item 2 Delivery Date</td><td><input type="text" name="item_delivery_date_2" value=""/></td>
</tr>
<tr>
	<td>Item 1 Shipping Exclusions</td><td><input type="text" name="shipping_exclusions_1" value="state=HI,state=AL"></td>
	<td>Item 2 Shipping Exclusions</td><td><input type="text" name="shipping_exclusions_2" value="state=HI,state=AL"></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>

<tr>
  <td></td>
  <td><input type=submit name="submit" value="Submit Order"></td>
</tr>
<tr>
  <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
</tr>
</table>
</form>
</body>
</html> 