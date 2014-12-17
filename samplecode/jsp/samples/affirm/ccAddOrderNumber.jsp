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
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<body>
<br/>
<b>Add Order Number Request Form</b>
<form name="frm" method="POST" action="ccAddOrderNumber.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td><td>
	<select name=txn_type>
		  <option value="AF">AF - Affirm</option>
	</select></td>
</tr>
<tr>
	<td bgcolor="ffff40">OrderId </td><td><input type=text name="order_id" value=""></td>
</tr>
<tr>
	<td bgcolor="ffff40">Order Number </td><td><input type=text name="order_number" value=""></td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Process Add Order Number"></td>
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
		centinelRequest.add("MsgType", "cmpi_add_order_number");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("OrderNumber", request.getParameter("order_number"));

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
<b> Add Order Number Request</b>
	<table>
		<tr>
			<td><b>Processor Id:</b></td><td><%=PROCESSOR_ID%></td>
		</tr>
		<tr>
			<td><b>Merchant Id:</b></td><td><%=MERCHANT_ID%></td>
		</tr>
		<tr>
			<td><b>Transaction Type:</b></td><td><%=request.getParameter("txn_type")%></td>
		</tr>
		<tr>
			<td><b>Order Id:</b></td><td><%=request.getParameter("order_id")%></td>
		</tr>
		<tr>
			<td><b>Order Number:</b></td><td><%=request.getParameter("order_number")%></td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
		</tr>
	</table>
<br/>
<br/>

<b> Add Order Number Response</b>
	<table>
		<tr>
			<td><b>Error No:</b></td><td><%=strErrorNo%></td>
		</tr>
		<tr>
			<td><b>Error Desc:</b></td><td><%=strErrorDesc%></td>
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
			<td><b>Transaction Id:</b></td><td><%=strTransactionId%></td>
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

