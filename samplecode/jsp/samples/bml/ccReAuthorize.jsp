<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccReAuthorize.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%
session.setAttribute("TID", request.getParameter("transaction_id"));
session.setAttribute("OID", request.getParameter("order_id"));
session.setAttribute("amount", request.getParameter("amount"));
session.setAttribute("currencyCode", request.getParameter("currency_code"));


String order_id = request.getParameter("order_id");
String amount = request.getParameter("amount");
String currency_code = request.getParameter("currency_code");

if (order_id == null) {
	order_id = "";
}
if (amount == null) {
	amount = "";
}
if (currency_code == null) {
	currency_code = "";
}


%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
	<script type="text/javascript" src="../common/util.js"></script>
	<script type="text/javascript">

		 window.onload = function() {
				document.frm.order_number.value = randomOrderNumber();
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
<b>Re-Authorization Request Form</b>
<form name="frm" method="POST" action="ccReAuthorize.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
   		  <option value="B">B - Bill Me Later</option>
		  <option value="BP">BP - Bill-Me-Later Preferred</option>
	</select></td>
	<td bgcolor="ffff40">OrderId </td><td><input type=text size="60" name="order_id" value=""></td>
</tr>
<tr>
</tr>
<tr>
	<td bgcolor="ffff40">Order Number</td><td><input type="text" name="order_number" value=""></td>
	<td>Order Description </td><td><input type="text" name="order_description" value="Sample Order..."></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td>
	<td><input type="text" name="amount" value=""></td>
	<td bgcolor="ffff40">Currency Code </td>
	<td><select name="currency_code">
			<option value="840">840 - USD</option>
		</select>
</td>
</tr>
<tr>
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
	<td></td><td></td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td colspan="2"><b>Billing and shipping data is only required if it was been changed</b><td>
</tr>
<tr>
	<td>&nbsp;</td><td></td>
	<td>&nbsp;</td><td></td>
</tr>
<tr>
	<td>Billing First Name</td><td><input type="text" name="b_first_name" value=""></td>
	<td>Shipping First Name</td><td><input type="text" name="s_first_name" value=""></td>
</tr>
<tr>
	<td>Billing Middle Name</td><td><input type="text" name="b_middle_name" value=""></td>
	<td>Shipping Middle Name</td><td><input type="text" name="s_middle_name" value=""></td>
</tr>
<tr>
	<td>Billing Last Name</td><td><input type="text" name="b_last_name" value=""></td>
	<td>Shipping Last Name</td><td><input type="text" name="s_last_name" value=""></td>
</tr>
<tr>
	<td>Billing Address1</td><td><input type="text" name="b_address1" value=""></td>
	<td>Shipping Address1</td><td><input type="text" name="s_address1" value=""></td>
</tr>
<tr>
	<td>Billing Address2</td><td><input type="text" name="b_address2" value=""></td>
	<td>Shipping Address2</td><td><input type="text" name="s_address2" value=""></td>
</tr>
<tr>
	<td>Billing City</td><td><input type="text" name="b_city" value=""></td>
	<td>Shipping City</td><td><input type="text" name="s_city" value=""></td>
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
								<option value="OH">OH - Ohio</option>
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
								<option value="OH">OH - Ohio</option>
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
	<td>Billing Postal Code</td><td><input type="text" name="b_postal_code" value=""></td>
	<td>Shipping Postal Code</td><td><input type="text" name="s_postal_code" value=""></td>
</tr>
<tr>
	<td>Billing Country Code</td>
	<td id="b_country_code_field"><select id="b_country_code" name="b_country_code" >
								<option value="">(No selection)</option>
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
								<option value="">(No selection)</option>
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
	<td>Billing Phone</td><td><input type="text" name="b_phone" value=""></td>
	<td>Shipping Phone</td><td><input type="text" name="s_phone" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Re-Authorization"></td>
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
		centinelRequest.add("MsgType", "cmpi_reauthorize");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Amount", request.getParameter("amount"));;
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));

		// Billing and shipping data is optional
		// It is only required if shipping data has changed
		centinelRequest.add("BillingFirstName", request.getParameter("b_first_name"));
		centinelRequest.add("BillingMiddleName", request.getParameter("b_middle_name"));
		centinelRequest.add("BillingLastName", request.getParameter("b_last_name"));
		centinelRequest.add("BillingAddress1", request.getParameter("b_address1"));
		centinelRequest.add("BillingAddress2", request.getParameter("b_address2"));
		centinelRequest.add("BillingCity", request.getParameter("b_city"));
		centinelRequest.add("BillingState", request.getParameter("b_state"));
		centinelRequest.add("BillingCountryCode", request.getParameter("b_country_code"));
		centinelRequest.add("BillingPostalCode", request.getParameter("b_postal_code"));
		centinelRequest.add("BillingPhone", request.getParameter("b_phone"));
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
		
		String strAccountNumber = centinelResponse.getValue("AccountNumber");
		String strAuthCode = centinelResponse.getValue("AuthorizationCode");

		centinelResponse = null;
		centinelRequest = null;
%>


<b> Re-Authorize Transaction Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Re-Authorize Transaction Results </b>
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

