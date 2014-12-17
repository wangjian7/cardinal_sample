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
	<head>
		<title>Centinel - Start Page</title>
			<link rel="stylesheet" type="text/css" href="../common/style.css" />
		<script type="text/javascript" src="../common/util.js"></script>
		<script type="text/javascript">
	
			 window.onload = function() {
					document.frm.order_number.value = randomOrderNumber();
					document.frm.onsubmit = singleSubmit("frm");
					} // end onLoad

		</script>
		
	</head>
    <body>

        <br/>
		
		
        <b>Lookup Message Request Form</b>
        <br/>
        This form is intended to simulate your payment page within your ecommerce web site.
        <br/>All payment information is collected, and clicking the submit button at the bottom of the page simulates the consumer clicking the final buy button.
        <br/>
         <% String msgStr = (String) session.getAttribute("Centinel_Message");
		if (msgStr != null && msgStr.length() > 0) { %>
            <br/>
                <font color="red"><b>Sample Message : <%=msgStr%></b></font>
            <br/>
        <% } %>
        <br/>

        <form name="frm" method=post action="ccLookup.jsp?execute=true">
			<table>
				<table>
				<tr>
					<td bgcolor="#FFFF40">Transaction Type</td>
					<td>
						<select name="txn_type">
								<option value="KL">KL - Klarna</option>
						</select>
				</tr>
				<tr>
					<td>OrderId</td>
					<td><input type=text size="60" name="order_id" value=""></td>
				</tr>
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
			
				<tr>
					<td bgcolor="#FFFF40">Amount</td>
					<td><input type=text name="amount" value=""></td>
					<td bgcolor="#FFFF40">Currency Code</td>
					<td>
						<select name="currency_code" id="currency_code">
							<option value="840">840 - USD</option>
							<option value="978">978 - EUR</option>
							<option value="208">208 - DKK</option>
							<option value="752">752 - SEK</option>
							<option value="578">578 - NOK</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td bgcolor="ffff40" width="150">Order Number</td><td><input type="text" name="order_number" value=""></td>
					<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
				</tr>
				<tr>
					<td>PClass/Payment Method </td>
					<td><input type="text" name="payment_class_id" id="payment_class_id" value="-1"></td>
					<td>Order Description</td>
					<td><input type=text size="60" name="order_description" value="lookup description"></td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">PaymentCountryCode</td>
					<td>
						<select name="payment_country_code" id="payment_country_code">
								<option value=""></option>
								<option value="DK">DK - Denmark</option>
								<option value="FI">FI - Finland</option>
								<option value="NO">NO - Norway</option>
								<option value="SE">SE - Sweden</option>
						</select>	
					</td>
					<td>&nbsp;</td><td></td>
				</tr>
				</tr>
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
					<td>Billing House Number</td><td><input type="text" name="b_house_number" value=""></td>
					<td>Shipping House Number</td><td><input type="text" name="s_house_number" value=""></td>
				</tr>
				<tr>
					<td>Billing House Ext</td><td><input type="text" name="b_house_ext" value=""></td>
					<td>Shipping House Ext</td><td><input type="text" name="s_house_ext" value=""></td>
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
												<option value=""></option>
												<option value="US">US - United States</option>
												<option value="DK">DK - Denmark</option>
												<option value="FI">FI - Finland</option>
												<option value="NO">NO - Norway</option>
												<option value="SE">SE - Sweden</option></select></td>
					<td>Shipping Country Code</td>
					<td id="s_country_code_field"><select id="s_country_code" name="s_country_code">
												<option value=""></option>
												<option value="US">US - United States</option>
												<option value="DK">DK - Denmark</option>
												<option value="FI">FI - Finland</option>
												<option value="NO">NO - Norway</option>
												<option value="SE">SE - Sweden</option></select></td>
				</tr>
				<tr>
					<td>Billing Phone</td><td><input type="text" name="b_phone" value="2162162116"></td>
					<td>Shipping Phone</td><td><input type="text" name="s_phone" value="2162162116"></td>
				</tr>
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td>Email Address</td><td><input type="text" name="email_address" value="johnconsumer@consumerdomain.com"></td>
					<td bgcolor="#FFFF40">Personal Number/DOB</td><td><input type="text" name="personal_number" value=""></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>
							<select id="gender" name="gender">
								<option value=""></option>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
					</td>
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
					<td>Item 1 Vat</td><td><input type="text" name="item_vat_1" value=""/></td>
					<td>Item 2 Vat</td><td><input type="text" name="item_vat_2" value=""/></td>
				</tr>
				<tr>
					<td>Item 1 Discount</td><td><input type="text" name="item_discount_1" value=""/></td>
					<td>Item 2 Discount</td><td><input type="text" name="item_discount_2" value=""/></td>
				</tr>
				<tr>
                    <td>&nbsp;</td><td></td>
                    <td>&nbsp;</td><td></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
						<br/>
						<input type="submit" name="submit" value="Proceed"></input>
					</td>
                </tr>
                <tr>
                    <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
                </tr>
			</table>

		</form>
    </body>
</html>