<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccCapture.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
	<head>
	<title>Capture Message Page</title>

		<link rel="stylesheet" type="text/css" href="../common/style.css" />
		<script type="text/javascript" src="../common/util.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				document.frm.onsubmit = singleSubmit("frm");
			} // end onLoad
		</script>

	</head>

	<body>

		<br/>
		<b>Capture Message Request Form</b>
		<br/>

		<form name="frm" method="post" action="ccCapture.jsp?execute=true">
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
					<td bgcolor="#FFFF40">OrderId</td>
					<td><input type=text size="60" name="order_id" value=""></td>
				</tr>
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">Amount</td>
					<td><input type=text name="amount" value=""></td>
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
					<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
					<td>Description</td>
					<td><input type=text size="60" name="description" value="capture description"></td>
				</tr>
				<tr>
					<TD bgcolor="#FFFF40">AuthorizationCode </TD><TD><input type=text name="authorization_code" value=""></TD>
					<td>&nbsp;</td><td></td>
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
					<td><input type=submit name="submit" value="Process Capture"></td>
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
		centinelRequest.add("MsgType", "cmpi_capture");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Description", request.getParameter("description"));
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
		
		/////////////////////////////////////////////////////////////////////////////////////////
		// Send Message to the MAPS Server
		/////////////////////////////////////////////////////////////////////////////////////////
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, CONNECT_TIMEOUT, RECEIVE_TIMEOUT);
		
		String formattedRequest = centinelRequest.getFormattedRequest();
		String formattedResponse = centinelResponse.getFormattedResponse();
		
		String strErrorNo = centinelResponse.getValue("ErrorNo");			 
		String strErrorDesc = centinelResponse.getValue("ErrorDesc");
		String strReasonCode = centinelResponse.getValue("ReasonCode");
		String strReasonDesc = centinelResponse.getValue("ReasonDesc");
		String strStatusCode = centinelResponse.getValue("StatusCode");
		String strTransactionId = centinelResponse.getValue("TransactionId");
		String strOrderId = centinelResponse.getValue("OrderId");
		String strOrderNumber = centinelResponse.getValue("OrderNumber");
		String strProcessorOrderNumber = centinelResponse.getValue("ProcessorOrderNumber");
		String strProcessorTransactionId = centinelResponse.getValue("ProcessorTransactionId");

		centinelResponse = null;
		centinelRequest = null;
%>


		<b>Capture Message Request</b>
			<table>
				<tr>
					<td>ProcessorId</td><td><%=PROCESSOR_ID%></td>
				</tr>
				<tr>
					<td>MerchantId</td><td><%=MERCHANT_ID%></td>
				</tr>
				<tr>
					<td>TransactionPwd</td><td><%=TRANSACTION_PWD%></td>
				</tr>
				<tr>
					<td>OrderId</td><td><%=request.getParameter("order_id")%></td>
				</tr>
				<tr>
					<td>Transaction Type</td><td><%=request.getParameter("txn_type")%></td>
				</tr>
				<tr>
					<td>Amount</td><td><%=request.getParameter("amount")%></td>
				</tr>
				<tr>
					<td>Currency Code</td><td><%=request.getParameter("currency_code")%></td>
				</tr>
			</table>
		<br/><br/>
		<b> Capture Message Response</b>
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

