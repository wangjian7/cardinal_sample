<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccFetchPClass.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>


<html>
	<head>
		<title>Fetch PClass Message Page</title>

			<link rel="stylesheet" type="text/css" href="../common/style.css" />
			<script type="text/javascript" src="../common/util.js"></script>
			<script type="text/javascript">
				window.onload = function() {
					document.frm.onsubmit = singleSubmit("frm");
				} // end onLoad
			</script>
	</head>
	<body>

		<br/>
		<b>Klarna Fetch PClass Request Form</b>
		<br/>

		<form name="frm" method="post" action="ccFetchPClass.jsp?execute=true">

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
					<td bgcolor="#FFFF40">PaymentCountryCode</td>
					<td>
						<select name="payment_country_code" id="payment_country_code">
							<option value=""></option>
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
					<td>PClass/Payment Method </td>
					<td>
						<select name="payment_class" id="payment_class">
							<option value=""></option>
							<option value="-1">INVOICE</option>
							<option value="0">CAMPAIGN</option>
							<option value="1">ACCOUNT</option>
							<option value="2">SPECIAL</option>
							<option value="3">FIXED</option>
							<option value="4">DELAY</option>
							<option value="5">MOBILE</option>
						</select>
					</td>
				</tr>
			</table>
				<tr>
					<td></td>
					<td>
						<br/>
						<td></td>
						<input type=submit name="submit" value="Process Request"></input>
					</td>
				</tr>
				<tr>
					<td colspan="2"><br>
					<b><i>required fields highlighted</i></b></td>
				</tr>
			</table>

		</form>

		<br>
		<hr>
		<br>
		<br>
		<%

	boolean executeTransaction = Boolean.valueOf(request.getParameter("execute")).booleanValue();

	if (executeTransaction) {

		/////////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		/////////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_baseserver_api");
		centinelRequest.add("SubMsgType", "cmpi_get_pclasses");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("PaymentCountryCode", request.getParameter("payment_country_code"));
		centinelRequest.add("UserAgent", request.getHeader("User-Agent"));
		centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
		centinelRequest.add("IPAddress", request.getRemoteAddr());
		
		/////////////////////////////////////////////////////////////////////////////////////////
		//Payment Type Specific
		/////////////////////////////////////////////////////////////////////////////////////////
		centinelRequest.add ("PaymentClass", request.getParameter("payment_class"));

		
		// Send Message to the MAPS Server
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");

		centinelResponse = null;
		centinelRequest = null;
		
%>


			<b> Fetch PClass Message Request</b>
				<table>
					<tr>
						<td>ProcessorId</td><td><%=PROCESSOR_ID%></td>
					</tr>
					<tr>
						<td>MerchantId</td><td><%=MERCHANT_ID%></td>
					</tr>
					<tr>
						<td>Transaction Type</td><td><%=request.getParameter("txn_type")%></td>
					</tr>
				</table>
			<br/><br/>
			<b> Fetch PClass Message Response</b>
				<table>
					<tr>
						<td>Status Code:</td><td><%=strStatusCode%></td>
					</tr>
					<tr>
						<td>ErrorNo</td><td><%=strErrorNo%></td>
					</tr>
					<tr>
						<td>ErrorDesc</td><td><%=strErrorDesc%></td>
					</tr>
					<tr>
						<td>ReasonCode</td><td><%=strReasonCode%></td>
					</tr>
					<tr>
						<td>ReasonDesc</td><td><%=strReasonDesc%></td>
					</tr>
					<tr>
						<td>StatusCode</td><td><%=strStatusCode%></td>
					</tr>
					
					<tr>
						<td>Fetch PClass Request: </td><td><textarea cols="100" rows="5" readonly="readonly"><%=formattedRequest%></textarea></td>
					</tr>	
					<tr>
						<td>Fetch PClass Response: </td><td><textarea cols="100" rows="5" readonly="readonly"><%=formattedResponse%></textarea></td>
					</tr>	
				</table>
		<%
		}
		%>


		</body>
</html>