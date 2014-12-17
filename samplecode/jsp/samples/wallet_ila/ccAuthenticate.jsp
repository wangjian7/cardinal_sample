<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccAuthenticate.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<html>
<head>
<title>Authenticate Page</title>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
		<script type="text/javascript" src="../common/util.js"></script>
</head>
<body>

<br/>
<b>Authenticate Message Request Form</b>
<br/>

<form name="frm" method="post" action="ccAuthenticate.jsp?execute=true">

<table>
    <tr>
    <td bgcolor="ffff40">Transaction Type</td>
    <td><select name=txn_type>
        <option value="WT">WT - Wallet</option>
      </select></td>
    </tr>
    <tr>
        <td bgcolor="ffff40">Order Id</td>
		<td><input type=text name="order_id" value=""></td>
    </tr>
    <tr>
        <td bgcolor="ffff40">Payload</td>
		<td><input type=text name="pares" value=""></td>
    </tr>
    </tr>
	<tr>
					<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
				</tr>
    <tr>
    <td></td>
    <td><input type=submit name="submit" value="Process Authenticate"></td>
    </tr>
    <tr>
    <td colspan="2"><br>
      <b><i>Required fields highlighted</i></b></td>
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
	// Retrieve the PaRes and MD values from the Form POST to this Term URL page.
	// If you like, the MD data could contain the id
	// that would enable you to reestablish the transaction session. This would be the 
	// alternative to using the Client Session Cookies
	/////////////////////////////////////////////////////////////////////////////////////////

	String pares = request.getParameter("pares");
	String merchant_data = request.getParameter("MD");
		
	/////////////////////////////////////////////////////////////////////////////////////////
	// If the PaRes is Not Empty then process the cmpi_authenticate message
	/////////////////////////////////////////////////////////////////////////////////////////

	if (pares != null && pares.length() > 0) {
	
		centinelRequest.add("MsgType", "cmpi_authenticate");
		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", (String)session.getAttribute("TransactionType"));
		centinelRequest.add("OrderId", (String)session.getAttribute("OrderId"));
		centinelRequest.add("PAResPayload", pares);

        centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
	
		String strCardEnrolled = centinelResponse.getValue("Enrolled");
		String strTransactionId = centinelResponse.getValue("TransactionId");		
		String strOrderId = centinelResponse.getValue("OrderId");
		String strACSUrl = centinelResponse.getValue("ACSUrl");
		String strPayload = centinelResponse.getValue("Payload");
		String strErrorNo = centinelResponse.getValue("ErrorNo");
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		
		centinelRequest = null;
        centinelResponse = null;
		
%>
	<b> Authorize Transaction Request </b>
	<table>
		<tr>
			<td><b>ProcessorId:</b></td><td><%=PROCESSOR_ID%></td>
		</tr>
		<tr>
			<td><b>MerchantId:</b></td><td><%=MERCHANT_ID%></td>
		</tr>
		<tr>
			<td><b>OrderId:</b></td><td><%=request.getParameter("order_id")%></td>
		</tr>
		<tr>
			<td><b>Transaction Type:</b></td><td><%=request.getParameter("txn_type")%></td>
		</tr>
	</table>
	<table>
			<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
		</tr>
	</table>
	<br/><br/>
	
	<b> Authorize Transaction Response </b>
	<table>
		<tr>
			<td><b>ErrorNo:</b></td><td><%=strErrorNo%></td>
		</tr>
		<tr>
			<td><b>Description:</b></td><td><%=strErrorDesc%></td>
		</tr>
		<tr>
			<td><b>Reason Code:</b></td><td><%=strReasonCode%></td>
		</tr>
		<tr>
			<td><b>Reason Desc:</b></td><td><%=strReasonDesc%></td>
		</tr>
		<tr>
			<td><b>Transaction Id:</b></td><td><%=strTransactionId%></td>
		</tr>
		<tr>
			<td><b>Order Id:</b></td><td><%=strOrderId%></td>
		</tr>
		<tr>
	</table>
		<tr>
			<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedResponse%></textarea></td>
		</tr>
	</table>

<%
}
}
%>

</body>
</html>