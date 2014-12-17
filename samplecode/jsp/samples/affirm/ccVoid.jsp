<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	Sample pages used to process the Void message
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
    <head>
        <title>Centinel - Void Page</title>
		<link rel="stylesheet" type="text/css" href="../common/style.css" />
        <script type="text/javascript" src="../common/util.js"></script>
        <script type="text/javascript">
            window.onload = function() {
                document.frm.onsubmit = singleSubmit("frm");
            } // end onLoad
        </script>
    </head>
<body>

    <br />
    <b>Void Request Form</b>
    <form name="frm" method="POST" action="?execute=true">
    <table>
    <tr>
        <td bgcolor="ffff40">Transaction Type</td><td>
        <select name=txn_type>
              <option value="AF">AF - Affirm</option>
        </select></td>
    </tr>

    <tr><td>&nbsp;</td><td></td><td>&nbsp;</td><td></td></tr><tr>
	
<td bgcolor="ffff40">Order Id</td>
	<td id="order_id_field">
		<input id="order_id" type="text" name="order_id" value="" style="null"/>
	</td>

</tr><tr>
<td bgcolor="ffff40">Description</td>
	<td id="description_field">
		<input id="description" type="text" name="description" value="Sample description..." style="null"/>
	</td>

</tr><tr>
<td bgcolor="ffff40">Reason</td>
	<td id="reason_field">
		<select id="reason" name="reason" style="width: 125px;">
			
                <option value=""></option>
                <option value="Other">Other</option>
                <option value="NoInventory">NoInventory</option>
                <option value="CustomerReturn">CustomerReturn</option>
                <option value="GeneralAdjustment">GeneralAdjustment</option>
                <option value="CouldNotShip">CouldNotShip</option>
                <option value="DifferentItem">DifferentItem</option>
                <option value="Abandoned">Abandoned</option>
                <option value="CustomerCancel">CustomerCancel</option>
                <option value="PriceError">PriceError</option>
                <option value="ProductOutofStock">ProductOutofStock</option>
                <option value="CustomerAddressIncorrect">CustomerAddressIncorrect</option>
                <option value="Exchange">Exchange</option>
                <option value="RiskAssessmentInformationNotValid">RiskAssessmentInformationNotValid</option>
                <option value="CarrierCoverageFailure">CarrierCoverageFailure</option>
                <option value="TransactionRecord">TransactionRecord</option>
		</select>
	</td>
</tr><tr>
<td>Merchant Data</td>
	<td id="merchant_data_field">
		<input id="merchant_data" type="text" name="merchant_data" value="" style="null"/>
	</td>

</tr>

    

    <tr>
      <td></td>
      <td><input type=submit name="submit" value="Process Void"></td>
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

		centinelRequest.add("MsgType", "cmpi_void");
		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("Reason", request.getParameter("reason"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
		
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
		String strOrderNumber = centinelResponse.getValue("OrderNumber");
		
		centinelResponse = null;
		centinelRequest = null;
		
		
%>
	<b> Void Transaction Request </b>
	<table>
		<tr>
			<td><b>ProcessorId:</b></td><td><%=PROCESSOR_ID%></td>
		</tr>
		<tr>
			<td><b>MerchantId:</b></td><td><%=MERCHANT_ID%></td>
		</tr>
		<tr>
			<td><b>TransactionPwd:</b></td><td><%=TRANSACTION_PWD%></td>
		</tr>
		<tr>
			<td><b>OrderId:</b></td><td><%=request.getParameter("order_id")%></td>
		</tr>
		<tr>
			<td><b>Transaction Type:</b></td><td><%=request.getParameter("txn_type")%></td>
		</tr>
		<tr>
			<td><b>Description:</b></td><td><%=request.getParameter("description")%></td>
		</tr>
		<tr>
			<td><b>Reason:</b></td><td><%=request.getParameter("reason")%></td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
		</tr>
	</table>
	<br/><br/>
	
	<b> Void Transaction Response </b>
	<table>
		<tr>
			<td><b>ErrorNo:</b></td><td><%=strErrorNo%></td>
		</tr>
		<tr>
			<td><b>Description:</b></td><td><%=strErrorDesc%></td>
		</tr>
		<tr>
			<td><b>Status Code:</b></td><td><%=strStatusCode%></td>
		</tr>
		<tr>
			<td><b>Reason Code:</b></td><td><%=strReasonCode%></td>
		</tr>
		<tr>
			<td><b>Reason Desc:</b></td><td><%=strReasonDesc%></td>
		</tr>
		<tr>
			<td><b>TransactionId:</b></td><td><%=strTransactionId%></td>
		</tr>
		<tr>
			<td><b>Order Id:</b></td><td><%=strOrderId%></td>
		</tr>
		<tr>
			<td><b>OrderNumber:</b></td><td><%=strOrderNumber%></td>
		</tr>
	</table>
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

