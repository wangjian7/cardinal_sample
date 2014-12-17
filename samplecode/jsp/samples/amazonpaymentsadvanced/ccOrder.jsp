<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccOrder.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="text/javascript" src="../common/util.js"></script>
<script type="text/javascript">
	function randomOrderNumber() {
		var orderNumber =  new String( Math.floor(Math.random() * (9999999999 + 1)  ) );
		var pad = ""; 
		for(var i = 0; i < 10 - orderNumber.length; i++) {
			pad += "0";
		}

		return pad + orderNumber;

	} // end randomOrderId

	function randomAmount() {
		return new String( Math.floor(Math.random() * (9999 + 1)  ) );
	} // end randomAmount

	window.onload=function() {
		document.frm.order_number.value = randomOrderNumber();
		document.frm.amount.value = 75;

	} // end onLoad
</script>

<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Order Request Form</b>
<form name="frm" method=post action="ccOrder.jsp?execute=true">
    <table>
			<tr>
				<td bgcolor="ffff40">Transaction Type</td>
				<td>
					<select name="txn_type">
							<option value="AC">AC - Amazon Payments Advanced</option>
					</select>
				</td>
				<td bgcolor="ffff40">Order Id</td><td><input type=text name="order_id" value=""></td>
			</tr>
			<tr>
				<td>&nbsp;</td><td></td>
				<td>&nbsp;</td><td></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Order Number</td><td><input type="text" name="order_number" value=""></td>
				<td>Order Description </td><td><input type="text" name="order_description" value="Sample Order..."></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Amount </td><td><input type="text" name="amount" value=""></td>
				<td bgcolor="ffff40" >Currency Code </td><td><input type="text" name="currency_code" value="840"></td>
			</tr>
			<tr>
				<td>Shipping Amount</td><td><input type="text" name="shipping_amount" value=""></td>
				<td>Tax Amount</td><td><input type="text" name="tax_amount" value=""></td>
			</tr>
			<tr>
				<td>Gift Card Amount</td><td><input type="text" name="giftcard_amount" value=""></td>
				<td>Recurring</td>
				<td><select name="recurring" id="recurring">
							<option value=""></option>
							<option value="N">N - No</option>
							<option value="Y">Y - Yes</option>
							<option value="AR">AR - Auto Recuring</option>
						</select>
					</td>
			</tr>		
			<tr>
				<td bgcolor="ffff40">Order Channel</td>
					<td><select name="order_channel" id="order_channel">
								<option value="MARK">MARK</option>
								<option value="CART" selected="selected">CART</option>
								<option value="CALLCENTER" >CALLCENTER</option>
								<option value="WIDGET" >WIDGET</option>
								<option value="PRODUCT" >PRODUCT</option>
							</select>	
					</td>
					<td bgcolor="ffff40">ProductCode</td>
					<td><select name="product_code" id="product_code">
								<option value="PHY" selected="selected">PHY - Physical Delivery</option>
								<option value="CNC">CNC - Cash and Carry</option>
								<option value="DIG">DIG - Digital Good</option>
								<option value="SVC">SVC - Service</option>
								<option value="TBD">TBD - Other</option>
							</select>	
					</td>
			</tr>		
			<tr>
				<td bgcolor="ffff40">Transaction Mode</td>
				<td><select name="txn_mode" id="txn_mode">
							<option value="S">S - E-Commerce</option>
							<option value="M">M - Call Center</option>
						</select>
					</td>
				<td>Category Code</td>
				<td><input type="text" name="category_code" value=""></td>
			</tr>		
			<tr>
				<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
			</tr>
			<tr>
				<td>&nbsp;</td><td></td>
				<td>&nbsp;</td><td></td>
			</tr>
			<tr>
			  <td></td>
			  <td><input type=submit name="submit" value="Process Order"></td>
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
		centinelRequest.add("MsgType", "cmpi_order");
		centinelRequest.add("ProcessorId", PROCESSOR_ID);
		centinelRequest.add("MerchantId", MERCHANT_ID);
		centinelRequest.add("TransactionPwd", TRANSACTION_PWD);
		centinelRequest.add("TransactionType", request.getParameter("txn_type"));
		centinelRequest.add("OrderId", request.getParameter("order_id"));
		
		centinelRequest.add("UserAgent", request.getHeader("User-Agent"));
		centinelRequest.add("BrowserHeader", request.getHeader("Accept"));
		centinelRequest.add("IPAddress", request.getRemoteAddr());
		
		centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));
		centinelRequest.add("Amount", request.getParameter("amount"));
		centinelRequest.add("TaxAmount", request.getParameter("tax_amount"));
		centinelRequest.add("ShippingAmount", request.getParameter("shipping_amount"));
		centinelRequest.add("OrderNumber", request.getParameter("order_number"));
		centinelRequest.add("OrderDescription", request.getParameter("order_description"));
		centinelRequest.add("MerchantData", request.getParameter("merchant_data"));
		centinelRequest.add("OrderChannel", request.getParameter("order_channel"));
		centinelRequest.add("ProductCode", request.getParameter("product_code"));
		centinelRequest.add("TransactionMode", request.getParameter("txn_mode"));
		centinelRequest.add("Recurring", request.getParameter("recurring"));
		

		// Send Message to the MAPS Server
		
		centinelResponse = centinelRequest.sendHTTP(TRANSACTION_URL, TIMEOUT_CONNECT, TIMEOUT_READ);
		
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

		centinelResponse = null;
		centinelRequest = null;
		
	
%>


<b> Order Transaction Request </b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=formattedRequest%></textarea></td>
</tr>
</table>
<br/><br/>
<b> Order Transaction Results </b>
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

