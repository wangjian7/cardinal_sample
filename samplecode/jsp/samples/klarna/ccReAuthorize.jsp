<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	Sample page used to process ReAuthorize message.
/////////////////////////////////////////////////////////////////////////////////////////%>



<HTML>
<HEAD>
<TITLE>Re-Authorize Page</TITLE>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
	<script type="text/javascript" src="../common/util.js"></script>
	<script type="text/javascript">
        window.onload = function() {
			document.frm.onsubmit = singleSubmit("frm");
        } // end onLoad
    </script>
</HEAD>
<BODY>



<br/>
<b>Re-Authorize Message Request Form</b>
<br/>

		<form name="frm" method=post action="ccReAuthorize.jsp?execute=true">
			<table>
				<table>
				<tr>
					<td bgcolor="#FFFF40">Transaction Type</td>
					<td>
						<select name="txn_type">
								<option value="KL">KL - Klarna</option>
						</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">OrderId</td>
					<td><input type=text size="60" name="order_id" value=""></td>
				</tr>
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
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
					<td width="150">Order Number</td><td><input type="text" name="order_number" value=""></td>
				</tr>
				<tr>
					<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
					<td>Order Description</td>
					<td><input type=text size="60" name="order_description" value=""></td>
				</tr>
				<tr>
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
					<td>Billing House Number</td><td><input type="text" name="b_house_number" value=""></td>
					<td>Shipping House Number</td><td><input type="text" name="s_house_number" value=""></td>
				</tr>
				<tr>
					<td>Billing House Ext</td><td><input type="text" name="b_house_ext" value=""></td>
					<td>Shipping House Ext</td><td><input type="text" name="s_house_ext" value=""></td>
				</tr>
				<tr>
					<td>Billing City</td><td><input type="text" name="b_city" value=""></td>
					<td>Shipping City</td><td><input type="text" name="s_city" value=""></td>
				</tr>
				<tr>
					<td>Billing State</td>
					<td id="b_state_field"><select id="b_state" name="b_state">
												<option value="" selected="selected">(No selection)</option>
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
												<option value="" selected="selected">(No selection)</option>
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
					<td>Billing Phone</td><td><input type="text" name="b_phone" value=""></td>
					<td>Shipping Phone</td><td><input type="text" name="s_phone" value=""></td>
				</tr>
				<tr>
					<td>Email Address</td><td><input type="text" name="email_address" value="consumer@consumerdomain.com"></td>
					<td>&nbsp;</td><td></td>
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
						<input type="submit" name="submit" value="Update Order"></input>
					</td>
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
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("OrderNumber", request.getParameter("order_number"));
		centinelRequest.add("OrderDescription", request.getParameter("order_description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
		
		centinelRequest.add("EMail", request.getParameter("email_address"));
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
		centinelRequest.add("UserAgent", request.getHeader("User-Agent"));
		centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
		centinelRequest.add("IPAddress", request.getRemoteAddr());
	
	/////////////////////////////////////////////////////////////////////////////////////////
	// You need to loop over items in shopping cart and set each variable
	//////////////////////////////////////////////////////////////////////////////////////////
		centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
		centinelRequest.add("Item_Desc_1", request.getParameter("item_desc_1"));
		centinelRequest.add("Item_Price_1", request.getParameter("item_price_1"));
		centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
		centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
		centinelRequest.add("Item_Vat_1", request.getParameter("item_vat_1"));
		centinelRequest.add("Item_Discount_1", request.getParameter("item_discount_1"));
		
		centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
		centinelRequest.add("Item_Desc_2", request.getParameter("item_desc_2"));
		centinelRequest.add("Item_Price_2", request.getParameter("item_price_2"));
		centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
		centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
		centinelRequest.add("Item_Vat_2", request.getParameter("item_vat_2"));
		centinelRequest.add("Item_Discount_2", request.getParameter("item_discount_2"));

		/////////////////////////////////////////////////////////////////////////////////////////
		//Payment Type Specific
		/////////////////////////////////////////////////////////////////////////////////////////
		
		centinelRequest.add("BillingHouseNumber", request.getParameter("b_house_number"));
		centinelRequest.add("ShippingHouseNumber", request.getParameter("s_house_number"));
		centinelRequest.add("BillingHouseExt", request.getParameter("b_house_ext"));
		centinelRequest.add("ShippingHouseExt", request.getParameter("s_house_ext"));
		
		/////////////////////////////////////////////////////////////////////////////////////////
		// Send Message to the MAPS Server
		/////////////////////////////////////////////////////////////////////////////////////////
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");
		String strAuthorizationCode = centinelResponse.getValue("AuthorizationCode");
		String strOrderNumber = centinelResponse.getValue("OrderNumber");
		String strProcessorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");
		String strProcessorTransactionId = centinelResponse.getValue("ProcessorTransactionId");


		centinelResponse = null;
		centinelRequest = null;
		
	
%>

</TABLE>
<br/><br/>
<b>Re-Authorize Request Results </b>
<TABLE>
<TR>
 <TD>Request: </TD><TD><textarea cols="75" rows="20" readonly="readonly"><%=formattedRequest%></textarea></TD>
</TR>
</TABLE>
</TABLE>
<br/><br/>
<b>Re-Authorize Response Results </b>
<TABLE>
<TR>
 <TD>Response: </TD><TD><textarea cols="75" rows="20" readonly="readonly"><%=formattedResponse%></textarea></TD>
</TR>
</TABLE>

<b> Re-Authorization Message Request</b>
<table>
<tr>
	<td>ProcessorId:</td><td><%=PROCESSOR_ID%></td>
</tr>
<tr>
	<td>MerchantId:</td><td><%=MERCHANT_ID%></td>
</tr>
<tr>
	<td>Transaction Type:</td><td><%=request.getParameter("txn_type")%></td>
</tr>
<tr>
	<td>Amount:</td><td><%=request.getParameter("amount")%></td>
</tr>
<tr>
	<td>Currency Code:</td><td><%=request.getParameter("currency_code")%></td>
</tr>
</table>
<br/><br/>
<b> Re-Authorization Message Response</b>
<table>
<tr>
	<td>Order Id:</td><td><%=strOrderId%></td>
</tr>
<tr>
	<td>Order Number:</td><td><%=strOrderNumber%></td>
</tr>
<tr>
	<td>Transaction Id:</td><td><%=strTransactionId%></td>
</tr>
<tr>
	<td>Status Code:</td><td><%=strStatusCode%></td>
</tr>
<tr>
	<td>Authorization Code:</td><td><%=strAuthorizationCode%></td>
</tr>
<tr>
	<td>ErrorNo:</td><td><%=strErrorNo%></td>
</tr>
<tr>
	<td>Error Description:</td><td><%=strErrorDesc%></td>
</tr>
<tr>
	<td>Reason Code:</td><td><%=strReasonCode%></td>
</tr>
<tr>
	<td>Reason Description:</td><td><%=strReasonDesc%></td>
</tr>
</table>

<%
    }
%>

</body>
</html>

