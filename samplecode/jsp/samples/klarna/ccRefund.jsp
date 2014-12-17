<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccRefund.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<HTML>
<HEAD>
<TITLE>Refund Page</TITLE>
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
<b>Refund Message Request Form</b>
<br/>

<form name="frm" method="POST" action="ccRefund.jsp?execute=true">

<table>
	<tr>
	<td bgcolor="ffff40">Transaction Type</td>
	<td><select name=txn_type>
		<option value="KL">KL - Klarna</option>
	  </select></td>
	</tr>
	<tr>
		<td bgcolor="ffff40">Order Id</td>
	<td><input type=text name="order_id" value=""></td>
	</tr>
	<tr>
		<td>&nbsp;</td><td></td>
		<td>&nbsp;</td><td></td>
	</tr>
	<tr>
		<td>Transaction Id</td>
		<td><input type=text name="transaction_id" value=""></td>
		<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
	</tr>
	</tr>
	<tr >
		<td bgcolor="ffff40">Refund Amount</td>
		<td><input type=text name="refund_amount" value=""></td>
		<td bgcolor="#FFFF40">Currency Code</td>
					<td>
						<select name="currency_code" id="currency_code">
							<option value="840">840 - USD</option>
							<option value="978">978 - EUR</option>
							<option value="208">208 - DKK</option>
							<option value="752">752 - SEK</option>
							<option value="578">578 - NOK</option>
						</select>
					</td>
	</tr>
	<tr>
		<td>Description </td><td><input type=text size="60" name="description" value="Refund Description"></td>
	<tr>
		<td>Vat</td><td><input type="text" name="vat" value=""/></td>
	</tr>
	<tr>
		<td>&nbsp;</td><td></td>
		<td>&nbsp;</td><td></td>
	</tr>
	<tr>
		<td>Item 1 Name</td><td><input type="text" name="item_name_1" value="2GB MP3 Player"/></td>
		<td>Item 2 Name</td><td><input type="text" name="item_name_2" value="100GB Hard Drive"/></td>
	</tr>
	<tr>
		<td>Item 1 SKU</td><td><input type="text" name="item_sku_1" value="123456"/></td>
		<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value="987654"/></td>
	</tr>
	<tr>
		<td>Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value="1"/></td>
		<td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value="1"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td><td></td>
		<td>&nbsp;</td><td></td>
	</tr>
	<tr>
	<td></td>
	<td><input type=submit name="submit" value="Process Refund"></td>
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
		
		centinelRequest.add("MsgType", "cmpi_refund");
		centinelRequest.add("Version", MESSAGE_VERSION);
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionID", request.getParameter("transaction_id"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Amount", request.getParameter("refund_amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Description", request.getParameter("description"));
		centinelRequest.add("Reason", request.getParameter("reason"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
		centinelRequest.add("AuthorizationCode", request.getParameter("authorization_code"));

		/////////////////////////////////////////////////////////////////////////////////////////
		// You need to loop over items in shopping cart and set each variable
		/////////////////////////////////////////////////////////////////////////////////////////
		centinelRequest.add("Item_Name_1", request.getParameter("item_name_1"));
		centinelRequest.add("Item_SKU_1", request.getParameter("item_sku_1"));
		centinelRequest.add("Item_Quantity_1", request.getParameter("item_quantity_1"));
		
		centinelRequest.add("Item_Name_2", request.getParameter("item_name_2"));
		centinelRequest.add("Item_SKU_2", request.getParameter("item_sku_2"));
		centinelRequest.add("Item_Quantity_2", request.getParameter("item_quantity_2"));
		
		centinelRequest.add("Vat", request.getParameter("vat"));
		
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
		String strMerchantReferenceNumber = centinelResponse.getValue("MerchantReferenceNumber");
		String strProcessorTransactionId = centinelResponse.getValue("ProcessorTransactionId");
		String strOrderNumber = centinelResponse.getValue("OrderNumber");
		
		centinelResponse = null;
		centinelRequest = null;
		
	
%>

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


<b> Refund Message Request</b>
<table>
<tr>
	<td>ProcessorId:</td><td><%=PROCESSOR_ID%></td>
</tr>
<tr>
	<td>MerchantId:</td><td><%=MERCHANT_ID%></td>
</tr>
<tr>
		<td>Order Id:</td><td><%=request.getParameter("order_id")%></td>
	</tr>
	<tr>
		<td>Transaction Type:</td><td><%=request.getParameter("txn_type")%></td>
	</tr>
	<tr>
		<td>Amount:</td><td><%=request.getParameter("refund_amount")%></td>
	</tr>
	<tr>
		<td>Currency Code:</td><td><%=request.getParameter("currency_code")%></td>
	</tr>
</table>
<br/><br/>
<b> Refund Message Response</b>
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

