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
	<head>
		<title>Centinel - Start Page</title>
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
				document.frm.card_number_selector.onchange = 
				function() {
					document.getElementById("card_number").value = document.getElementById("card_number_selector").value;
				}
				build3DSDateOptions();
				build3DSRecurringEnd();

			} // end onLoad
		</script>

	</head>
	<body>

		<%@ include file="ccMenu.jsp" %>

		<br/>
		<b>Lookup Message Request Form</b>
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

		<form name="frm" method=post action="ccLookup.jsp">
			<table>
				<tr>
					<td bgcolor="#FFFF40">Transaction Type</td>
					<td>
						<select name="txn_type">
							<option value="CC">CC - Credit Card / Debit Card</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">Card Number</td>
					<td><input type="text" name="card_number" id="card_number" value=""></td>
					<td>Test Cases</td>
					<td>
						<select id="card_number_selector" name="card_number_selector">
							<option value="">Select PAN</option>
                 <option value="4000000000000002">4000000000000002 - Y,Y,Y</option>
                 <option value="5200000000000007">5200000000000007 - Y,Y,Y</option>
                 <option value="3000000000000004">3000000000000004 - Y,Y,Y</option>
                 <option value="340000000003961">340000000003961 - Y,Y,Y</option>
                 <option value="1000000000000001">1000000000000001 - Error</option>
                 <option value="4000000000000010">4000000000000010 - Y,Y,N</option>
                 <option value="5200000000000015">5200000000000015 - Y,Y,N</option>
                 <option value="3000000000000012">3000000000000012 - Y,Y,N</option>
                 <option value="340000000006022">340000000006022 - Y,Y,N</option>
                 <option value="4000000000000028">4000000000000028 - Y,N,Y</option>
                 <option value="3000000000000020">3000000000000020 - Y,N,Y</option>
                 <option value="5200000000000023">5200000000000023 - Y,N,Y</option>
                 <option value="340000000000033">340000000000033 - Y,N,Y</option>
                 <option value="4000000000000101">4000000000000101 - Y,A,Y</option>
                 <option value="5200000000000106">5200000000000106 - Y,A,Y</option>
                 <option value="180000000000028">  180000000000028 - Y,A,Y</option>
                 <option value="340000000003391">340000000003391 - Y,A,Y</option>
                 <option value="4000000000000036">4000000000000036 - Y,U</option>
                 <option value="5200000000000031">5200000000000031 - Y,U</option>
                 <option value="3000000000000038">3000000000000038 - Y,U</option>
                 <option value="340000000002302">340000000002302 - Y,U</option>
                 <option value="4000000000000044">4000000000000044 - Timeout Test - Lookup</option>
                 <option value="4000000000000259">4000000000000259 - Timeout Test - Authenticate</option>
                 <option value="5200000000000049">5200000000000049 - Timeout Test - Lookup</option>
                 <option value="5200000000000452">5200000000000452 - Timeout Test - Authenticate</option>
                 <option value="213100000000001">  213100000000001 - Timeout Test - Lookup</option>
                 <option value="3000000000000376">3000000000000376 - Timeout Test - Authenticate</option>
                 <option value="340000000008309">340000000008309 - Timeout Test - Lookup</option>
                 <option value="340000000008150">340000000008150 - Timeout Test - Authenticate</option>
                 <option value="4000000000000051">4000000000000051 - N</option>
                 <option value="5200000000000056">5200000000000056 - N</option>
                 <option value="213100000000019">  213100000000019 - N</option>
                 <option value="340000000008135">340000000008135 - N</option>
                 <option value="4000000000000069">4000000000000069 - U</option>
                 <option value="5200000000000064">5200000000000064 - U</option>
                 <option value="213100000000027">  213100000000027 - U</option>
                 <option value="340000000007780">340000000007780 - U</option>
                 <option value="4000000000000077">4000000000000077 - Error</option>
                 <option value="5200000000000072">5200000000000072 - Error</option>
                 <option value="213100000000035">  213100000000035 - Error</option>
                 <option value="340000000008416">340000000008416 - Error</option>
                 <option value="4000000000000085">4000000000000085 - Error</option>
                 <option value="5200000000000080">5200000000000080 - Error</option>
                 <option value="180000000000002">  180000000000002 - Error</option>
                 <option value="4000000000000093">4000000000000093 - Y, Error</option>
                 <option value="5200000000000098">5200000000000098 - Y, Error</option>
                 <option value="180000000000010">  180000000000010 - Y, Error</option>
                 <option value="340000000009299">340000000009299 - Y, Error</option>
                 <option value="4000000400000093">4000000400000093 - Not Test Card</option>
                 <option value="5200000400000098">5200000400000098 - Not Test Card</option>
                 <option value="180000040000010">  180000040000010 - Not Test Card</option>
                 <option value="4000000000000432">4000000000000432 - Y,A,N</option>
                 <option value="4000000000000606">4000000000000606 - Y,U,N</option>
                 <option value="4000000000000838">4000000000000838 - Y,N,N</option>
                 <option value="5200000000000221">5200000000000221 - Y,A,N</option>
                 <option value="5200000000000270">5200000000000270 - Y,U,N</option>
                 <option value="5200000000000148">5200000000000148 - Y,N,N</option>
                 <option value="3000000000000657">3000000000000657 - Y,A,N</option>
                 <option value="3000000000000962">3000000000000962 - Y,U,N</option>
                 <option value="3000000000000210">3000000000000210 - Y,N,N</option>
                 <option value="340000000001130">340000000001130 - Y,A,N</option>
                 <option value="340000000009281">340000000009281 - Y,U,N</option>
                 <option value="340000000001031">340000000001031 - Y,N,N</option>

						</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">Expiration Month</td>
					<td>
						<select name="expr_mm">
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</td>
					<td bgcolor="#FFFF40">Expiration Year</td>
					<td>
						<select name="expr_yyyy">
						</select>
					</td>
				</tr>
				<tr>
				 <td width="150">CardCode</td><td><input type="text" name="cardCode" value=""></td>
				 <td width="150">CardType</td>
					<td>
					<select name="card_type">
						<option value=""></option>
						<option value="VSA">Visa</option>
						<option value="MSC">MasterCard</option>
						<option value="VSD">Visa Delta/Debit (UK)</option>
						<option value="VSE">Visa Electron</option>
						<option value="MAE">Maestro (UK, Spain &amp; Austria)</option>
						<option value="SLO">Solo (UK)</option>
						<option value="AMX">American Express</option>
						<option value="DSC">Discover</option>
						<option value="DIN">Diners</option>
						<option value="CBLA">Carte Blanche</option>
						<option value="JCB">JCB</option>
						<option value="ENR">EnRoute</option>
						<option value="JAL">JAL</option>
						<option value="LSR">Laser (Rep. of Ireland)</option>
						<option value="CTB">Carte Bleue</option>
						<option value="DNK">Dankort</option>
						<option value="CSI">CartaSi</option>
						<option value="EAN">Encoded Account Number</option>
						<option value="UATP">UATP</option>
						<option value="MAEI">Maestro (International)</option>
						<option value="GEUK">GE Money UK Card</option>	
					</select>
					</td>
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
					<td bgcolor="ffff40">Order Channel</td>
						<td><select name="order_channel" id="order_channel">
									<option value="MARK" selected="selected">MARK</option>
									<option value="CART">CART</option>
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
									<option value="CHA">CHA - Check Acceptance</option>
									<option value="ACF">ACF - Account funding</option>
									<option value="QCT">QCT - Quasi Cash</option>
									<option value="PAL">PAL - Perpaid Activation and Load</option>
									
								</select>	
						</td>
				</tr>
				
				<tr>
					<td>Installment</td><td><input type="text" name="installment" value=""></td>
					<td>Acquirer Password</td><td><input type="text" name="acquirerPassword" value=""></td>
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
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td>Recurring</td>
					<td><select name="recurring" id="recurring">
							<option value=""></option>
							<option value="N">N - No</option>
							<option value="Y">Y - Yes</option>
							<option value="AR">AR - Auto Recurring</option>
						</select>
					</td>
					<td>JavaScript Support</td>
					<td><select name="javascript_support" id="javascript_support">
							<option value=""></option>
							<option value="N">N - No</option>
							<option value="Y">Y - Yes</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Recurring Frequency</td><td><input type="text" name="recurring_frequency" value=""></td>
					<td>Recurring End</td><td><input type="text" name="recurring_end" value=""></td>
				</tr>
				</tr>
				
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td>Override Payment Method</td><td><select name="override_payment_method" id="override_payment_method">
									<option value=""></option>
									<option value="NA">NA</option>
									<option value="CR">Credit</option>
									<option value="DB">Debit</option>
									<option value="VSAVR">Visa Vale Refeicao</option>
									<option value="VSAVA">Visa Vale Alimentacao</option>
									<option value="1CLICK">1CLICK</option>
								</select>	
						</td>
						<td>Mobile Phone</td><td><input type="text" name="mobile_phone" value=""/></td>
				</tr>
				<tr>
						<td>&nbsp;</td><td></td>
						<td>&nbsp;</td><td></td>
					</tr>
					<tr>
						<td >Billing First Name</td><td><input type="text" name="b_first_name" value="John"></td>
						<td >Shipping First Name</td><td><input type="text" name="s_first_name" value="John"></td>
					</tr>
					<tr>
						<td>Billing Middle Name</td><td><input type="text" name="b_middle_name" value=""></td>
						<td>Shipping Middle Name</td><td><input type="text" name="s_middle_name" value=""></td>
					</tr>
					<tr>
						<td >Billing Last Name</td><td><input type="text" name="b_last_name" value="Consumer"></td>
						<td >Shipping Last Name</td><td><input type="text" name="s_last_name" value="Consumer"></td>
					</tr>
					<tr>
						<td >Billing Address1</td><td><input type="text" name="b_address1" value="123 Main Street"></td>
						<td >Shipping Address1</td><td><input type="text" name="s_address1" value="123 Main Street"></td>
					</tr>
					<tr>
						<td>Billing Address2</td><td><input type="text" name="b_address2" value=""></td>
						<td>Shipping Address2</td><td><input type="text" name="s_address2" value=""></td>
					</tr>
					<tr>
						<td >Billing City</td><td><input type="text" name="b_city" value="Cleveland"></td>
						<td >Shipping City</td><td><input type="text" name="s_city" value="Cleveland"></td>
					</tr>
					<tr>
						<td >Billing State</td>
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
						<td >Shipping State</td>
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
						<td >Billing Postal Code</td><td><input type="text" name="b_postal_code" value="44111"></td>
						<td >Shipping Postal Code</td><td><input type="text" name="s_postal_code" value="44111"></td>
					</tr>
					<tr>
						<td >Billing Country Code</td>
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
						<td >Shipping Country Code</td>
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
						<td >Billing Phone</td><td><input type="text" name="b_phone" value="2162162116"></td>
						<td>Shipping Phone</td><td><input type="text" name="s_phone" value="2162162116"></td>
					</tr>
					<tr>
						<td >Buyer Email</td><td><input type="text" name="email_address" value="johnconsumer@consumerdomain.com"></td>
						<td>&nbsp;</td><td></td>
					</tr>

				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
			   <tr>
					<td >Item 1 Name</td><td><input type="text" name="item_name_1" value="2GB MP3 Player"/></td>
					<td>Item 2 Name</td><td><input type="text" name="item_name_2" value="100GB Hard Drive"/></td>
				</tr>
				<tr>
					<td >Item 1 Description</td><td><input type="text" name="item_desc_1" value="The simple MP3 player"/></td>
					<td>Item 2 Description</td><td><input type="text" name="item_desc_2" value="The simple 100GB Hard Drive"/></td>
				</tr>
				<tr>
					<td >Item 1 SKU</td><td><input type="text" name="item_sku_1" value="123456"/></td>
					<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value="987654"/></td>
				</tr>
				<tr>
					<td >Item 1 Price</td><td><input type="text" name="item_price_1" value=""/></td>
					<td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""/></td>
				</tr>
				<tr>
					<td >Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value="1"/></td>
					<td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value="1"/></td>
				</tr>

				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td></td>
					<td>
							<a target="_vbvLearnMore" href="vbv_learn_more.html" border="0"><img border="0" src="../images/vbv_learn_more.gif" /></a>
							<a target="_mcscLearnMore" href="mcs_learn_more.html" border="0"><img border="0" src="../images/mcsc_learn_more.gif" /></a>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" name="submit" value="Submit Order"></td>
					</tr>
				<tr>
					<td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
				</tr>
			</table>
		</form>
	</body>
</html>
