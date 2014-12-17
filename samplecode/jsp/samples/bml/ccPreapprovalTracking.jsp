<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccPreapprovalTracking.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Preapproval Tracking Request Form</b>
<form name="frm" method="POST" action="ccPreapprovalTracking.jsp?execute=true">
<table>
<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
		  <option value="B">B - Bill Me Later</option>
		  <option value="BP">BP - Bill-Me-Later Preferred</option>
	</select></td>
</tr>
<tr>
				<td bgcolor="ffff40">OrderId </td><td><input type="text"  name="order_id" value=""></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Offer Flag</td>
				<td><select name="offer_flag" id="offer_flag" style="width:125px">
							<option value="Y">Y - Yes</option>
							<option value="N">N - No</option>
						</select></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Accepted Flag</td>
				<td><select name="accepted_flag" id="accepted_flag" style="width:125px">
							<option value="Y">Y - Yes</option>
							<option value="N">N - No</option>
							<option value="A">A - abandoned</option>
						</select>
				</td>
			</tr>
			<tr>
      	<td>Description </td><td><input type="text" size="60" name="description" value="Preapproval Tracking"></td>
    	</tr>
      <tr>
        <td></td>
        <td>
					<input type=submit name="submit" value="Submit Order">
					<!--- This fields are here to allow javascript to populate form --->
					<input type="hidden" name="transaction_id" value="">
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

String executeTransaction = request.getParameter("execute");

if ("true".equals(executeTransaction)){

	String 	strErrorNo, strErrorDesc, strReferenceId, strStatus, strTransactionId, strReasonCode;

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_preapproval_tracking");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	centinelRequest.add("TransactionType", request.getParameter("txn_type"));
	centinelRequest.add("Description", request.getParameter("description"));
	centinelRequest.add("OfferFlag", request.getParameter("offer_flag"));
	centinelRequest.add("AcceptedFlag", request.getParameter("accepted_flag"));



	// Send Message to the MAPS Server

    centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();	

	strErrorNo = centinelResponse.getValue("ErrorNo");
	strErrorDesc = centinelResponse.getValue("ErrorDesc");
	strReferenceId = centinelResponse.getValue("ReferenceId");
	strStatus = centinelResponse.getValue("StatusCode");
	strTransactionId = centinelResponse.getValue("TransactionId");
	strReasonCode = centinelResponse.getValue("ReasonCode");

    centinelRequest = null;
    centinelResponse = null;

	%>


	<b> Preapproval Tracking Transaction Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Preapproval Tracking Transaction Response </b>
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

