<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>

<%@ include file="CentinelConfig.jsp" %>

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


<!-- Integration Step 1: Include the Cardinal Widget -->
<script type='text/javascript' src='https://sandbox.cardinalcommerce.com/util/cardinalwidget/unified/js/autoloader.js'></script>
<!-- Integration Step 2: Include the Google Wallet Script -->
<script src='https://wallet-web.sandbox.google.com/online/v2/merchant/merchant.js'></script>

</head>
<body>
<%@ include file="ccMenu.jsp" %>
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

<h3>Sample Code Step 1:</h3>
<p>Using the form below, collect the information you'd like to send on the lookup message. After submitting the form, the Google Wallet button will be generated using the form details.</p>

<form name="frm" method=post action="ccStart.jsp?execute=true#btn">
<table>
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
	<td>Order Channel</td>
		<td><select name="order_channel" id="order_channel">
					<option value="MARK">MARK</option>
					<option value="CART" selected="selected">CART</option>
					<option value="CALLCENTER" >CALLCENTER</option>
					<option value="WIDGET" >WIDGET</option>
					<option value="PRODUCT" >PRODUCT</option>
					<option value="1CLICK">1CLICK</option>
				</select>	
		</td>
		<td>ProductCode</td>
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
	<td>Transaction Mode</td>
	<td><select name="txn_mode" id="txn_mode">
				<option value="S">S - E-Commerce</option>
				<option value="M">M - Call Center</option>
				<option value="P">P - Mobile Device</option>
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
	<td>Shipping State</td>
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
	<td>Billing Postal Code</td><td><input type="text" name="b_postal_code" value="44111"></td>
	<td>Shipping Postal Code</td><td><input type="text" name="s_postal_code" value="44111"></td>
</tr>
<tr>
	<td>Billing Country Code</td>
	<td id="b_country_code_field">
		<select id="b_country_code" name="b_country_code" >
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
	<td>Shipping Country Code</td>
	<td id="s_country_code_field">
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
	<td colspan="2"><input type="submit" /></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
  <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
</tr>
</table>
</form>

<hr />

<h3>Sample Code Step 2:</h3>
<p>Generate the Google Wallet Button</p>

<!-- Integration Step 3: Include the Buy Button div element-->
<div id='gbtn'></div>
<br><br>
<a name="btn"></a>

<%
	boolean executeTransaction = Boolean.valueOf(request.getParameter("execute")).booleanValue();

	if (executeTransaction) {
%>
<!-- Integration Step 4: Initialize the Cardinal Widget -->
<script type='text/javascript'>

	if(window.addEventListener){
		// Majority of browsers
		window.addEventListener('DOMContentLoaded',initCardinalWidget,false); //W3C
	}else if (window.attachEvent){
		// IE
		window.attachEvent("onload", initCardinalWidget);
	}
	
	function initCardinalWidget(){
		CardinalWidget.Initialize({
			paymentTypes : {
				google : {
					'ProxyUrl':'<%= CENTINEL_LOOKUP_URL %>',
					'GoogleWalletButton':'gbtn',
					'ErrorCallback':handleError,
					'AuthenticateCallback':handleAuthentication,
					'Logging':'debug',
					'LogToConsole':true,
					'LookupData' : {
						'OrderNumber':'<%= request.getParameter("order_number") %>',
						'Amount':'<%= request.getParameter("amount") %>',
						'CurrencyCode':'<%= request.getParameter("currency_code") %>',
						'OrderDescription':'<%= request.getParameter("order_description") %>',
						'OrderChannel':'<%= request.getParameter("order_channel") %>',
						'ProductCode':'<%= request.getParameter("product_code") %>',
						'TransactionMode':'<%= request.getParameter("txn_mode") %>',
						'CategoryCode':'<%= request.getParameter("category_code") %>',
						'BillingFirstName':'<%= request.getParameter("b_first_name") %>',
						'BillingMiddleName':'<%= request.getParameter("b_middle_name") %>',
						'BillingLastName':'<%= request.getParameter("b_last_name") %>',
						'BillingAddress1':'<%= request.getParameter("b_address1") %>',
						'BillingAddress2':'<%= request.getParameter("b_address2") %>',
						'BillingCity':'<%= request.getParameter("b_city") %>',
						'BillingState':'<%= request.getParameter("b_state") %>',
						'BillingPostalCode':'<%= request.getParameter("b_postal_code") %>',
						'BillingCountryCode':'<%= request.getParameter("b_country_code") %>',
						'BillingPhone':'<%= request.getParameter("b_phone") %>',
						'ShippingFirstName':'<%= request.getParameter("s_first_name") %>',
						'ShippingMiddleName':'<%= request.getParameter("s_middle_name") %>',
						'ShippingLastName':'<%= request.getParameter("s_last_name") %>',
						'ShippingAddress1':'<%= request.getParameter("s_address1") %>',
						'ShippingAddress2':'<%= request.getParameter("s_address2") %>',
						'ShippingCity':'<%= request.getParameter("s_city") %>',
						'ShippingState':'<%= request.getParameter("s_state") %>',
						'ShippingPostalCode':'<%= request.getParameter("s_postal_code") %>',
						'ShippingCountryCode':'<%= request.getParameter("s_country_code") %>',
						'ShippingPhone':'<%= request.getParameter("s_phone") %>'
					}
				}
			}
		});
	}

	<!-- Integration Step 5: Add Error Handler -->
	function handleError(error){
		log.info(error);
		if(error.type == "Ajax"){
			alert("Ajax Error Encountered. Review console logs for further details.")
		} else if(error.type == "Animation"){
			alert("Animation Error Encountered. Review console logs for further details.")
		} else if(error.type == "General"){
			alert("General Error Encountered. Review console logs for further details.")
		} else if(error.type == "Processor"){
			alert("Processor Error Encountered. Review console logs for further details.")
		} else if(error.type == "Fatal"){
			alert("Fatal Error Encountered. Review console logs for further details.")
		} else if(error.type == "Internal"){
			alert("Internal Error Encountered. Review console logs for further details.")
		} else {
			alert("Unknown Error Encountered. Review console logs for further details.")
		}
	}

	<!-- Integration Step 6: Add Authentication Handler -->
	function handleAuthentication(data){
		log.info(data);
		alert("Authentication data received. The transaction result ["+data.PAResStatus+"]");
	}

</script>
<%
    }
%>
</body>
</html> 