<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccStartWidget.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%@ include file="CentinelConfig.jsp" %>


<html>
<head>
    <title>Centinel - Start Widget</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	
		<script type="text/javascript" src='<%=AMAZON_JS_URL%>'></script>

		<script> 
		var amazonOrderReferenceId; 
		new  OffAmazonPayments.Widgets.Button ({ 
			sellerId: '<%=AMAZON_MERCHANT_ID%>', 
			useAmazonAddressBook: true,
			onSignIn: function(orderReference) { 
				amazonOrderReferenceId = orderReference.getAmazonOrderReferenceId(); 
				window.location = '<%=INITIATE_URL%>?session=' + amazonOrderReferenceId; 
			}, 
			onError: function(error) { 
			// your error handling code 
			} 
		}).bind("payWithAmazonDiv"); 
		</script>

</head>
<body>
<%@ include file="ccMenu.jsp" %>
	<br/>
	<b>Pay with Amazon</b>
	<br/>
		This demonstrates how to authenticate order directly with Amazon
	<br/>
	<br/>
	Express
	<div id="payWithAmazonDiv"> 
	<img src="https://payments-sandbox.amazon.com/gp/widgets/button?sellerId=<%=AMAZON_MERCHANT_ID%>&size=large&color=orange" style="cursor: pointer;"/> 
	<!-- production Url as of 4/10/13 [https://payments.amazon.com/gp/widgets/button] -->
	</div>
</body>
</html>



