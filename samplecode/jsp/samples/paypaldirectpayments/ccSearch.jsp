<%@ page language="java" %>
<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccSearch.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%

String order_id = request.getParameter("order_id");
String report_format = request.getParameter("report_format");
String from_dt = request.getParameter("from_dt");
String to_dt = request.getParameter("to_dt");
String payer = request.getParameter("payer");
String order_number = request.getParameter("order_number");
String raw_amount = request.getParameter("raw_amount");
String purchase_currency = request.getParameter("purchase_currency");
String transaction_status = request.getParameter("transaction_status");
String transaction_type = request.getParameter("transaction_type");

SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
Calendar today = Calendar.getInstance();
Calendar yesterday = Calendar.getInstance();
today.add(Calendar.DATE, 1);

if (from_dt == null || from_dt.length() == 0) {
	from_dt = df.format(yesterday.getTime()) + " 00:00:00";
}
if (to_dt == null || to_dt.length() == 0) {
	to_dt = df.format(today.getTime()) + " 00:00:00";
}
if (order_id == null) {
	order_id = "";
}
if (payer == null) {
	payer = "";
}
if (order_number == null) {
	order_number = "";
}
if (raw_amount == null) {
	raw_amount = "";
}

%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script LANGUAGE="JavaScript">
function clearResults() {
	document.frmResults.reportResults.value = ""
}
</script>
</head>
<Body>

<%@ include file="ccMenu.jsp" %>

</table>
<br/>
<b>Transaction Search Request Form</b>
<form name="frm" method="POST" action="ccSearch.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">From Date </td><td><input type=text name="from_dt" value="<%= from_dt %>"></td>
</tr>
<tr>
	<td bgcolor="ffff40">To Date </td><td><input type=text name="to_dt" value="<%= to_dt %>"></td>
</tr>
<tr>
	<td bgcolor="ffff40">Report Format</td>
    <td><select name="report_format">
          <option value="CSV">CSV</option>
          <option value="XML">XML</option>
        </select>
    </td>
</tr>
<tr>
	<td>OrderId </td><td><input type=text name="order_id" size="60" value="<%= order_id %>"></td>
</tr>
<tr>
	<td>Payer </td><td><input type=text name="payer" size="60" value="<%= payer %>"></td>
</tr>
<tr>
	<td>Order Number </td><td><input type=text name="order_number" value="<%= order_number%>"></td>
</tr>
<tr>
	<td>Raw Amount </td><td><input type=text name="raw_amount" value="<%= raw_amount %>"></td>
</tr>
<tr>
	<td>Purchase Currency </td>
    <td><select name="purchase_currency">
          <option value="">Empty</option>
          <option value="840">840 - USD</option>
          <option value="978">978 - EUR</option>
          <option value="392">392 - JPY</option>
          <option value="124">124 - CAD</option>
          <option value="826">826 - GBP</option>
        </select>
    </td>
</tr>
<tr>
	<td>Transaction Type </td>
    <td><select name="transaction_type">
          <option value="">Empty</option>
          <option value="All">All</option>
          <option value="Sent">Sent</option>
          <option value="Received">Received</option>
          <option value="MassPay">MassPay</option>
          <option value="MoneyRequest">MoneyRequest</option>
          <option value="FundsAdded">FundsAdded</option>
          <option value="FundsWithdrawn">FundsWithdrawn</option>
          <option value="PayPalDebitCard">PayPalDebitCard</option>
          <option value="Referral">Referral</option>
          <option value="Fee">Fee</option>
          <option value="Subscription">Subscription</option>
          <option value="Dividend">Dividend</option>
          <option value="Billpay">Billpay</option>
          <option value="Refund">Refund</option>
          <option value="CurrencyConversions">CurrencyConversions</option>
          <option value="BalanceTransfer">BalanceTransfer</option>
          <option value="Reversal">Reversal</option>
          <option value="Shipping">Shipping</option>
          <option value="BalanceAffecting">BalanceAffecting</option>
          <option value="ECheck">ECheck</option>
          <option value="Invalid">Invalid</option>
        </select>
    </td>
</tr>
<tr>
	<td>Transaction Status </td>
    <td><select name="transaction_status">
          <option value="">Empty</option>
          <option value="Completed">Completed</option>
          <option value="Pending">Pending</option>
          <option value="Denied">Denied</option>
          <option value="Reversed">Reversed</option>
          <option value="Processing">Processing</option>
          <option value="Invalid">Invalid</option>
        </select>
    </td>
</tr>
<tr>
  <td></td>
  <td><input type=submit name="submit" value="Transaction Search" ></td>
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

		///////////////////////////////////////////////////////////////////////////////////////
		// Construct Message using Name / Value pairs
		///////////////////////////////////////////////////////////////////////////////////////

		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("MsgType", "cmpi_paypal_transaction_search");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", order_id);
		centinelRequest.add("FromDt", from_dt);
		centinelRequest.add("ToDt", to_dt);
		centinelRequest.add("ReportFormat", report_format);
		centinelRequest.add("Payer", payer);
		centinelRequest.add("Amount", raw_amount);
		centinelRequest.add("OrderNumber", order_number);
		centinelRequest.add("CurrencyCode", purchase_currency);
		centinelRequest.add("TransactionStatus", transaction_status);
		centinelRequest.add("TransactionType", transaction_type);


		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");		 
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strReportResults = centinelResponse.getValue("Report");

        if (strReportResults == null) {
            strReportResults = "";
        }
		
		centinelResponse = null;
		centinelRequest = null;
%>


<b> Transaction Search Request </b>
<TABLE width="300">
<tr>
	<td>ProcessorId</td><td><%=PROCESSOR_ID %></td>
</tr>
<tr>
	<td>MerchantId</td> <td><%=MERCHANT_ID %></td>
</tr>
<tr>
	<td>TransactionPwd</td><td><%=TRANSACTION_PWD %></td>
</tr>
<tr>
	<td>OrderId</td><td><%= order_id %></td>
</tr>
<tr>
	<td>Report Format</td><td><%= report_format %></td>
</tr>
<tr>
	<td>Payer </td><td><%= payer %></td>
</tr>
<tr>
	<td>Order Number </td><td><%= order_number %></td>
</tr>
<tr>
	<td>Amount </td><td><%= raw_amount %></td>
</tr>
<tr>
	<td>Currency Code </td><td><%= purchase_currency %></td>
</tr>
<tr>
	<td>Transaction Type </td><td><%= transaction_type %></td>
</tr>
<tr>
	<td>Transaction Status </td><td><%= transaction_status %></td>
</tr>
<tr>
	<td>&nbsp;</td><td>&nbsp;</td>
</tr>
</table>
<br/><br/>
<b> Transaction Search Results </b>
<form name="frmResults">
<TABLE width="100%">
<tr>
	<td>ErrorNo</td><td><%=strErrorNo%></td>
</tr>
<tr>
	<td>Description</td><td><%=strErrorDesc%></td>
</tr>
<tr>
	<td>Report</td><td><textarea name="reportResults" cols="100" rows="10"><%=strReportResults%></textarea></td>
</tr>
</table>
</form>


<%

	}
%>


</body>
</html>