<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccActiveCards.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<title>Active Cards Page</title>
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
<b>Active Cards Request Form</b>
<form name="frm" method="POST" action="ccActiveCards.jsp?execute=true">
    <table>
	<tr>
		<td bgcolor="#FFFF40">Transaction Type</td><td>
			<select name="txn_type">
	                  <option value="OB">OB - Open Bucks</option>
			</select>
		</td>
	</tr>
	<tr>
					<td></td>
					<td>
						<br/>
						<p><b>Cash and Gift Cards using Openbucks</b></p>
						<input type=submit name="submit" value="Process Authorization">
							<img src="https://demo-pay.openbucks.com/paybutton_v2.php?pubkey=8634508e-d48a-4179-942e-a77e8e0d4db2&amp;style=obx-80-30-tr-anim" alt="Pay with Cash and Gift Cards using Openbucks" style="border: 0;width: 110px; height: 40px;"/>
						</input>
					</td>
				</tr>
	<tr>
		<td colspan="2"><br/><b><i>Required fields highlighted</i></b></td>
	</tr>
</table>
</form>
<br>
<hr>
<br><br>
<%

String executeTransaction = request.getParameter("execute");

if ("true".equals(executeTransaction)){

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_baseserver_api");
	centinelRequest.add("SubMsgType", "cmpi_get_active_cards");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("UserAgent",        request.getHeader("User-Agent"));
	centinelRequest.add("BrowserHeader",    request.getHeader("Accept"));
	centinelRequest.add("IPAddress",		request.getRemoteAddr());

	// Send Message to the MAPS Server

	centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
	
	String strErrorNo = centinelResponse.getValue("ErrorNo");
	String strErrorDesc = centinelResponse.getValue("ErrorDesc");
	String strStatus = centinelResponse.getValue("StatusCode");
	String strOrderId = centinelResponse.getValue("OrderId");
	String strTransactionId = centinelResponse.getValue("TransactionId");
	String strReasonCode = centinelResponse.getValue("ReasonCode");
	String strReasonDesc = centinelResponse.getValue("ReasonDesc");

	centinelRequest = null;
	centinelResponse = null;

	%>


	<b> Active Cards Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Active Cards Transaction Response </b>
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

