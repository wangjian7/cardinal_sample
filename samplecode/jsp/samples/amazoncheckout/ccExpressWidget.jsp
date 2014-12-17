<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccExpressWidget.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%@ include file="CentinelConfig.jsp" %>

<html>
<head>
<Title>Centinel - Start Widget Express</Title>
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
	
		<script type="text/javascript" src="<%=AMAZON_JS_URL%>"></script>

	<script>
		var sendExpressUrl = "<%=INITIATE_URL%>?session=";
		
		new CBA.Widgets.ExpressCheckoutWidget({
		merchantId: '<%=AMAZON_MERCHANT_ID%>',
		onAuthorize: function(widget) {
		window.location = sendExpressUrl + widget.getPurchaseContractId();}
		}).render("AmazonExpressWidget");
	</script>

	
</head>
<body>
<%@ include file="ccMenu.jsp" %>
	<br/>
	<b>CBA V2 - Express Widget</b>
	<br/>
		This demonstrates how to authenticate order directly with Amazon
	<br/>
	<br/>
	Express
	<div id="AmazonExpressWidget"></div>

</body>
</html> 