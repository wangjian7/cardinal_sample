<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccInlinePromptAddress.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<%
String paymentProcessorOrderId = request.getParameter("session");
%>

<html>
	<head>
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
	
		<script type="text/javascript" src="<%=AMAZON_JS_URL%>"></script>
		
	<script>
	
		var sendExpressUrl = "<%=INITIATE_URL%>?session=";
		
		new CBA.Widgets.InlineCheckoutWidget({
		merchantId: '<%=AMAZON_MERCHANT_ID%>',
		onAuthorize: function(widget) {
		
		window.location = sendExpressUrl + widget.getPurchaseContractId();}
		}).render("AmazonInlineWidget");
	</script>
		
		<script>
		
			function promptWallet(purchaseContractId){
			
				new CBA.Widgets.WalletWidget({
				merchantId: '<%=AMAZON_MERCHANT_ID%>',
				displayMode: "Edit",		// [Edit] [Read]
				purchaseContractId: "<%=paymentProcessorOrderId%>",
				
				onPaymentSelect:function(widget) {
				window.location = "<%=INITIATE_URL%>?session=<%=paymentProcessorOrderId%>";}
				}).render("AmazonWalletWidget");
				}
			
		</script>
		
		<script>
			new CBA.Widgets.AddressWidget({
			merchantId: '<%=AMAZON_MERCHANT_ID%>',
			displayMode: "Edit",		// [Edit] [Read]
			purchaseContractId: "<%=paymentProcessorOrderId%>",
			
			onAddressSelect:function(widget) {
			promptWallet("<%=paymentProcessorOrderId%>");}
			}).render("AmazonAddressWidget");
		</script>
	
</head>
<body>
<%@ include file="ccMenu.jsp" %>

<br/>
<b>CBA V2 - Inline Widget</b>
<br/>
This demonstrates how to authenticate order directly with Amazon
<br/>

<br/>

Inline
<div id="AmazonInlineWidget"></div>

</body>
</html> 