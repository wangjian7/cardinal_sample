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

<HTML>
<HEAD>
<TITLE>Void Page</TITLE>
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
<b>Void Message Request Form</b>
<br/>

<form name="frm" method="POST" action="ccVoid.jsp?execute=true">

<table>
	<tr>
		<td bgcolor="ffff40">Transaction Type</td>
		<td><select name=txn_type>
		<option value="KL">KL - Klarna</option>
		</select></td>
	</tr>
	<tr>
		<td bgcolor="ffff40">Order Id</td>
		<td><input type=text size="60" name="order_id" value=""></td>
	</tr>
	<tr>
		<td>&nbsp;</td><td></td>
		<td>&nbsp;</td><td></td>
	</tr>
	<tr>
		<td bgcolor="ffff40">Transaction Id</td>
		<td><input type=text size="60" name="transaction_id" value=""></td>
		<TD>AuthorizationCode </TD><TD><input type=text name="authorization_code" value=""></TD>
	</tr>
	<tr>
		<td bgcolor="ffff40">Description </td>
		<td><input type=text size="60" name="description" value="Void Description"></td>
		<td bgcolor="ffff40">Reason </td>
		<td><select name="reason">
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
						</select></td>
	</tr>
	<tr>
					<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
				</tr>
	<tr>
		<td></td>
		<td><input type=submit name="submit" value="Process Void"></td>
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
</body>
</html>
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
		centinelRequest.add("TransactionId", request.getParameter("transaction_id"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("AuthorizationCode", request.getParameter("authorization_code"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("Reason", request.getParameter("reason"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));

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
		String strProcessorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");
		String strProcessorTransactionId = centinelResponse.getValue("ProcessorTransactionId");
		String strOrderNumber = centinelResponse.getValue("OrderNumber");
		

		centinelResponse = null;
		centinelRequest = null;
		
	
%>


</TABLE>
<br/><br/>
<b>OrderStatus Request Results </b>
<TABLE>
<TR>
 <TD>Request: </TD><TD><textarea cols="75" rows="20" readonly="readonly"><%=formattedRequest%></textarea></TD>
</TR>
</TABLE>
</TABLE>
<br/><br/>
<b>OrderStatus Response Results </b>
<TABLE>
<TR>
 <TD>Response: </TD><TD><textarea cols="75" rows="20" readonly="readonly"><%=formattedResponse%></textarea></TD>
</TR>
</TABLE>

<b>Void Message Request</b>
<table>
<tr>
	<td>ProcessorId</td>
	<td><%=PROCESSOR_ID%></td>
</tr>
<tr>
	<td>MerchantId</td>
	<td><%=MERCHANT_ID%></td>
</tr>
	<tr>
		<td>Order Id:</td><td><%=request.getParameter("order_id")%></td>
	</tr>
	<tr>
		<td>Transaction Type:</td><td><%=request.getParameter("txn_type")%></td>
	</tr>
</tr>
</table>
<br/><br/>
<b>Void Message Response</b>
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
	<td>Processor Order Number:</td><td><%=strProcessorOrderNumber%></td>
</tr>
<tr>
	<td>Processor Transaction Id:</td><td><%=strProcessorTransactionId%></td>
</tr>
<tr>
	<td>Error No:</td><td><%=strErrorNo%></td>
</tr>
<tr>
	<td>Error Desc:</td><td><%=strErrorDesc%></td>
</tr>
<tr>
	<td>Reason Code:</td><td><%=strReasonCode%></td>
</tr>
<tr>
	<td>Reason Desc:</td><td><%=strReasonDesc%></td>
</tr>
</table>
<%
    }
%>

</body>
</html>

