<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
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
<title>Authorize Page</title>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">

		window.onload = function() {
				document.frm.onsubmit = singleSubmit("frm");
    } // end onLoad

    </script>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Authorize Request Form</b>
<form name="frm" method="POST" action="ccAuthorize.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		  <option value="CC">CC - Credit Card / Debit Card
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId</td><td><input type=text name="order_id" value=""></td>
</tr>

<tr>
<td  bgcolor="ffff40">Card Number</td>
<td colspan="5">
	<select id="card_number" name="card_number">
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
<td bgcolor="ffff40">Expiration Month </td>
<td>
<select name="expr_mm">
	<option value=""></option>
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
</tr>
<tr>
<td bgcolor="ffff40">Expiration Year </td>
<td>
<select name="expr_yyyy">
	<option value=""></option>
	<option value="2010">2010</option>
	<option value="2011">2011</option>
	<option value="2012">2012</option>
	<option value="2013">2013</option>
	<option value="2014">2014</option>
	<option value="2015">2015</option>
	<option value="2016">2016</option>
	<option value="2017">2017</option>
	<option value="2018">2018</option>
</select>
</td>
</tr>

<tr>
<td bgcolor="ffff40">CardCode</td>
<td>
<input type="text" name="cardCode" value="">
</td>
</tr>
<tr>
<td>Card Type </td>
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
	<TD bgcolor="ffff40">Amount </td><td><input type=text name="amount" value=""></td>
</tr>
<tr>
	<TD bgcolor="ffff40">Currency </td><td><input type=text name="currency_code" value="840"></td>
</tr>
<tr>
	<td>Order Number </td><td><input type=text name="order_number" value=""></td>
</tr>
<tr>
	<td>Description </td><td><input type=text name="order_description" value="Sample Order..."></td>
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
  <td></td>
  <td><input type=submit name="submit" value="Authorize"></td>
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
	centinelRequest.add("MsgType", "cmpi_authorize");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("IPAddress",		request.getRemoteAddr());

	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("OrderNumber", request.getParameter("order_number"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("Amount", request.getParameter("amount"));
	centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
	centinelRequest.add("Description", request.getParameter("order_description"));
	
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
	centinelRequest.add("EMail", request.getParameter("email_address"));
	
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
	
	centinelRequest.add("CardNumber", request.getParameter("card_number"));
	centinelRequest.add("CardExpMonth", request.getParameter("expr_mm"));
	centinelRequest.add("CardExpYear", request.getParameter("expr_yyyy"));
	centinelRequest.add("CardCode", request.getParameter("cardCode"));
	centinelRequest.add("CardType", request.getParameter("card_type"));
		

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


	<b> Authorize Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Authorize Transaction Response </b>
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

