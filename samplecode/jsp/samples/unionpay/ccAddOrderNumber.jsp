<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
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
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Add Order Number Request Form</b>
<form name="frm" method="POST" action="ccAddOrderNumber.jsp?execute=true">
    <table>
        <tr>
                <td style="background-color:#ffff40">Transaction Type </td>
                <td><select name="txn_type">
	                  <option value="UP">UP - UnionPay</option>
                </select></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Order Id </td>
		        <td><input type="text" name="order_id" value="" /></td>
        </tr>
        <tr>
                <td style="background-color:#ffff40">Order Number </td>
		        <td><input type="text" name="order_number" value="" /></td>
        </tr>
        <tr>
                <td>&nbsp;</td><td></td>
                <td>&nbsp;</td><td></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center"><input type="submit" name="submit" value="Process" style="width:auto" /></td>
        </tr>
        <tr>
            <td colspan="2" style="font-weight:bold; font-style:italic"><br />Required fields highlighted</td>
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


		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");

		centinelResponse = null;
		centinelRequest = null;
		
	
%>


<b> Add Order Number Transaction Request Results </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Add Order Number Transaction Results </b>
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
