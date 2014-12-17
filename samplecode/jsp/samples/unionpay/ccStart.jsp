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
                <td style="background-color:#ffff40">Transaction Type </td>
                <td>
                    <select name="txn_type">
	                  <option value="UP">UP - UnionPay</option>
                    </select>
                </td>
                <td></td><td></td>
        </tr>
        <tr>
		<td>&nbsp;</td><td></td>
		<td>&nbsp;</td><td></td>
	</tr>
        <tr>
                <td style="background-color:#ffff40">Order Number </td>
                <td><input type="text" name="order_number" value="" /></td>
	        
                <td>Description </td>
                <td><input type="text" name="description" value="Sample Order..." /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Amount </td>
                <td><input type="text" name="amount" value="" /></td>
	        
                <td style="background-color:#ffff40">Currency Code </td>
                <td>
                    <select id="currency_code" name="currency_code">
                        <option value="840">840 - USD</option>
                    </select>
                </td>
        </tr>
        <tr>
                <td>Shipping Amount </td>
                <td><input type="text" name="shipping_amount" value="" /></td>
	        
                <td>Tax Amount </td>
                <td><input type="text" name="tax_amount" value="" /></td>
        </tr>
        
        <tr>
	            <td>Gift Card Amount </td>
	            <td><input type="text" name="giftcard_amount" value="" /></td>
            
	            <td>Recurring</td>
		        <td>
		            <select name="recurring" id="recurring">
		                <option value=""></option>
				        <option value="N">N - No</option>
				        <option value="Y">Y - Yes</option>
				        <option value="AR">AR - Auto Recurring</option>
			        </select>
	            </td>
        </tr>
        <tr>
	        <td style="background-color:#ffff40">Order Channel </td>
	        <td>
		        <select name="order_channel" id="order_channel">
			        <option value="MARK">MARK</option>
			        <option value="CART">CART</option>
			        <option value="CALLCENTER">CALLCENTER</option>
			        <option value="WIDGET">WIDGET</option>
			        <option value="PRODUCT">PRODUCT</option>
			        <option value="1CLICK">1CLICK</option>
		        </select>          
	        </td>
	        <td style="background-color:#ffff40">Product Code </td>
	        <td>
	            <select name="product_code" id="product_code">
		            <option value="PHY" selected="selected">PHY - Physical Delivery</option>
		            <option value="CNC">CNC - Cash and Carry</option>
		            <option value="DIG">DIG - Digital Good</option>
		            <option value="SVC">SVC - Service</option>
		            <option value="TBD">TBD - Other</option>
	            </select>	
	        </td>
        </tr>
        <tr>
	        <td style="background-color:#ffff40">Transaction Mode </td>
	        <td>
	            <select name="txn_mode" id="txn_mode">
				        <option value="S">S - E-Commerce</option>
				        <option value="M">M - Call Center</option>
		        </select>
	        </td>
		
	        <td>Category Code </td>
    		<td><input type="text" name="category_code" /></td>
        </tr>  
        <tr>
		        <td>Merchant Data </td>
		        <td><input type="text" name="merchant_data" value="" /></td>

            <td>&nbsp;</td><td>&nbsp;</td>
	        </tr>
        <tr>
                <td>&nbsp;</td><td></td>
                <td>&nbsp;</td><td></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing First Name </td>
                <td><input type="text" name="b_first_name" value="John" /></td>
	        
                <td style="background-color:#ffff40">Shipping First Name </td>
                <td><input type="text" name="s_first_name" value="John" /></td>
        </tr>
        <tr>
                <td>Billing Middle Name </td>
                <td><input type="text" name="b_middle_name" value="" /></td>
	        
                <td>Shipping Middle Name </td>
                <td><input type="text" name="s_middle_name" value="" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing Last Name </td>
                <td><input type="text" name="b_last_name" value="Consumer" /></td>
	        
                <td style="background-color:#ffff40">Shipping Last Name </td>
                <td><input type="text" name="s_last_name" value="Consumer" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing Address1 </td>
                <td><input type="text" name="b_address1" value="123 Main Street" /></td>
	        
                <td style="background-color:#ffff40">Shipping Address1 </td>
                <td><input type="text" name="s_address1" value="123 Main Street" /></td>
        </tr>
        <tr>
                <td>Billing Address2 </td>
                <td><input type="text" name="b_address2" value="" /></td>
	        
                <td>Shipping Address2 </td>
                <td><input type="text" name="s_address2" value="" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing City </td>
                <td><input type="text" name="b_city" value="Cleveland" /></td>
	        
                <td style="background-color:#ffff40">Shipping City </td>
                <td><input type="text" name="s_city" value="Cleveland" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing State </td>
                <td id="b_state_field">
                    <select id="b_state" name="b_state">
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
                    <option value="WY">WY - Wyoming</option>
                </select>
                </td>
	        
                <td style="background-color:#ffff40">Shipping State </td>
                <td id="s_state_field">
                    <select id="s_state" name="s_state">
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
                    <option value="WY">WY - Wyoming</option>
                </select>
                </td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing Postal Code </td>
                <td><input type="text" name="b_postal_code" value="44111" /></td>
	        
                <td style="background-color:#ffff40">Shipping Postal Code </td>
                <td><input type="text" name="s_postal_code" value="44111" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing Country Code </td>
                <td>
                    <select id="b_country_code" name="b_country_code">
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
                    <option value="SG">SG - Singapore</option>
                </select>
                </td>
	        
                <td style="background-color:#ffff40">Shipping Country Code </td>
                <td>
                    <select id="s_country_code" name="s_country_code">
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
                    <option value="SG">SG - Singapore</option>
                </select>
                </td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Billing Phone </td>
                <td><input type="text" name="b_phone" value="2162162116" /></td>
	        
                <td>Shipping Phone </td>
                <td><input type="text" name="s_phone" value="2162162116" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Buyer Email </td>
                <td><input type="text" name="email_address" value="johnconsumer@consumerdomain.com" /></td>
	        
                <td></td><td></td>
        </tr>
        <tr>
                <td>&nbsp;</td><td></td>
                <td>&nbsp;</td><td></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Item 1 Name </td>
                <td><input type="text" name="item_name_1" value="2GB MP3 Player" /></td>
	        
                <td>Item 2 Name </td>
                <td><input type="text" name="item_name_2" value="100 GB Hard Drive" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Item 1 Description </td>
                <td><input type="text" name="item_desc_1" value="The simple MP3 player" /></td>
	        
                <td>Item 2 Description </td>
                <td><input type="text" name="item_desc_2" value="The simple 100 GB hard drive" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Item 1 SKU </td>
                <td><input type="text" name="item_sku_1" value="123456" /></td>
	        
                <td>Item 2 SKU </td>
                <td><input type="text" name="item_sku_2" value="987654" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Item 1 Price </td>
                <td><input type="text" name="item_price_1" value="" /></td>
	        
                <td>Item 2 Price </td>
                <td><input type="text" name="item_price_2" value="" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Item 1 Quantity </td>
                <td><input type="text" name="item_quantity_1" value="1" /></td>
	        
                <td>Item 2 Quantity </td>
                <td><input type="text" name="item_quantity_2" value="1" /></td>
        </tr>
        <tr>
                <td>&nbsp;</td><td></td>
                <td>&nbsp;</td><td></td>
        </tr>
        <tr>
                <td colspan="4" style="text-align:center"><input type="submit" name="submit" value="Submit Order" /></td>
        </tr>
        <tr>
            <td colspan="2" style="font-weight:bold; font-style:italic"><br />Required fields highlighted</td>
        </tr>
    </table>
</form>
</body>
</html> 