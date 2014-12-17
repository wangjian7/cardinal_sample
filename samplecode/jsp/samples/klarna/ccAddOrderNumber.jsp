<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccAddOrderNumber.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
	<head>
	<title>Add Order Number Page</title>
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
		<script type="text/javascript" src="../common/util.js"></script>
	</head>

	<body>



		<br/>
		<b>Add Order Number Message Request Form</b>
		<br/>

		<form name="frm" method="POST" action="ccAddOrderNumber.jsp?execute=true">
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
					<td bgcolor="#FFFF40">Order Id</td>
					<td><input type=text size="60" name="order_id" value=""></td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">OrderNumber </td>
					<td><input type=text name="order_number" value=""></td>
				</tr>
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type=submit name="submit" value="Add Order Number"></td>
				</tr>
				<tr>
					<td colspan="2"><br>
					<b><i>Required fields highlighted</i></b></td>
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
		centinelRequest.add("MsgType", "cmpi_add_order_number");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("OrderNumber", request.getParameter("order_number"));

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
		String strOrderNumber = centinelResponse.getValue("OrderNumber");

		centinelResponse = null;
		centinelRequest = null;
		
	
%>

</TABLE>
<br/><br/>
<b>Add Order Number Request Results </b>
<TABLE>
<TR>
 <TD>Request: </TD><TD><textarea cols="75" rows="20" readonly="readonly"><%=formattedRequest%></textarea></TD>
</TR>
</TABLE>
</TABLE>
<br/><br/>
<b>Add Order Number Response Results </b>
<TABLE>
<TR>
 <TD>Response: </TD><TD><textarea cols="75" rows="20" readonly="readonly"><%=formattedResponse%></textarea></TD>
</TR>
</TABLE>

		<b>Add Order Number Message Request</b>
			<table>
				<tr>
					<td>Processor Id</td>
					<td><%=PROCESSOR_ID%></td>
				</tr>
				<tr>
					<td>Merchant Id</td>
					<td><%=MERCHANT_ID%></td>
				</tr>
				<tr>
					<td>Order Id</td><td><%=request.getParameter("order_id")%></td>
				</tr>
				<tr>
					<td>Transaction Type</td><td><%=request.getParameter("txn_type")%></td>
				</tr>
			</table>

		<br/>
		<br/>
		
		<b>Add Order Number Message Response</b>
			<table>
				<tr>
					<td>Order Id</td><td><%=strOrderId%></td>
				</tr>
				<tr>
					<td>OrderNumber</td><td><%=strOrderNumber%></td>
				</tr>
				<tr>
					<td>Transaction Id</td><td><%=strTransactionId%></td>
				</tr>
				<tr>
					<td>Status Code</td><td><%=strStatusCode%></td>
				</tr>
				<tr>
					<td>Error No</td><td><%=strErrorNo%></td>
				</tr>
				<tr>
					<td>Error Desc</td><td><%=strErrorDesc%></td>
				</tr>
				<tr>
					<td>Reason Code</td><td><%=strReasonCode%></td>
				</tr>
				<tr>
					<td>Reason Desc</td><td><%=strReasonDesc%></td>
				</tr>
			</table>

		<%
		}
		%>

	</body>
</html>

