<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccGoogleItemBackOrdered.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Google Item Back Ordered Form</b>
<form name="frm" method="POST" action="ccGoogleItemBackOrdered.jsp?execute=true">
<table>
      <tr>
        <td bgcolor="ffff40">OrderId </td>
        <td><input type="text" name="order_id" value=""></td>
      </tr>
	  <tr>
        <td bgcolor="ffff40">Item 1 SKU </td>
        <td><input type=text size="60" name="Item_SKU_1" value=""></td>
      </tr>
	  <tr>
        <td>Item 2 SKU </td>
        <td><input type=text size="60" name="Item_SKU_2" value=""></td>
      </tr>
	  <tr>
        <td bgcolor="ffff40">Send Email</td>
        <td><select name="send_email">
            <option value="true">True
            <option value="false">False
          </select></td>
      </tr>
      <tr>
        <td></td>
        <td><input type=submit name="submit" value="Submit"></td>
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

String executeTransaction = request.getParameter("execute");

if ("true".equals(executeTransaction)){

	String 	strErrorNo, strErrorDesc, strReferenceId, strStatusCode, strOrderId, strTransactionId, strReasonCode, strReasonDesc;

	/////////////////////////////////////////////////////////////////////////////////////////
	// Construct Message using Name / Value pairs
	/////////////////////////////////////////////////////////////////////////////////////////


	centinelRequest.add("Version", MESSAGE_VERSION);
	centinelRequest.add("MsgType", "cmpi_void");
	centinelRequest.add("ProcessorId", PROCESSOR_ID);
	centinelRequest.add("MerchantId", MERCHANT_ID);
	centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
	centinelRequest.add("TransactionType", "G");
	centinelRequest.add("OrderId", request.getParameter("order_id"));
	
	centinelRequest.add("SendEmail", request.getParameter("send_email"));
	centinelRequest.add("Item_SKU_1", request.getParameter("Item_SKU_1"));

	if (request.getParameter("Item_SKU_2").length() > 1) {
		centinelRequest.add("Item_SKU_2", request.getParameter("Item_SKU_2"));
	}

	// Send Message to the MAPS Server

    centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);

	String formattedRequest = centinelRequest.getFormattedRequest();
	String formattedResponse = centinelResponse.getFormattedResponse();
		
	strErrorNo = centinelResponse.getValue("ErrorNo");
	strErrorDesc = centinelResponse.getValue("ErrorDesc");
	strReferenceId = centinelResponse.getValue("ReferenceId");
	strStatusCode = centinelResponse.getValue("StatusCode");
	strTransactionId = centinelResponse.getValue("TransactionId");
	strOrderId = centinelResponse.getValue("OrderId");
	strReasonCode = centinelResponse.getValue("ReasonCode");
	strReasonDesc = centinelResponse.getValue("ReasonDesc");

    centinelRequest = null;
    centinelResponse = null;

	%>


	<b> Google Item Back Ordered Request </b>
	<table>
	<tr>
		<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
	</tr>
	</table>
	<br/><br/>
	<b> Google Item Back Ordered Response </b>
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

