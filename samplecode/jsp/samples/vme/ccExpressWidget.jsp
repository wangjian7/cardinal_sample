<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
	
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  Sample page used to simulate the checkout form of an ecommerce web site
/////////////////////////////////////////////////////////////////////////////////////////
%>


<html>
<head>
	<style id="antiClickjack">body{display:none;}</style>




<Title>Centinel - Start Widget </Title>
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
	<script type="text/javascript" src="../common/util.js"></script>
	<script type="text/javascript" src="hash256.js"></script>
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
				document.frm.item_price_1.value = randomAmount();
				document.frm.item_price_2.value = randomAmount();
				document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);

				//document.getElementById("vmebutton").setAttribute("currency", "JB");

			} // end onLoad

			function updateVmeButton(){
			
			var amount =  document.frm.amount.value;
			var currency = document.frm.currency_code.value;
			var productId = document.frm.order_description.value;
			var merchTrans = document.frm.order_number.value;
			var toHash = "<%=VME_SECRETKEY%>" + amount + currency +merchTrans + productId;
			var token = hex_sha256(toHash) ;
		
			document.getElementById("vmebutton").setAttribute("currency", currency);
			document.getElementById("vmebutton").setAttribute("amount", amount);
			document.getElementById("vmebutton").setAttribute("product-id", productId);
			document.getElementById("vmebutton").setAttribute("merch-trans", merchTrans);
			document.getElementById("vmebutton").setAttribute("token", token);

			}

			function myCallbackFunctionForVmeEvents(VmeEventType, eventData) {

				var merchTrans = eventData.merchTrans;

				if (VmeEventType == "purchase.success"){
					/// Purchase flow completed; store call id if needed, redirect consumer to next page in the payment flow (e.g.  page 
					/// makes the V.me Get Checkout Detail API before displaying an Order Review page 
					var status = eventData.status; 
					var callId = eventData.callId; 
					var type = eventData.type; 
					var state = eventData.state; 
					var subTotal = eventData.subTotal;
					var amount = eventData.amount; 
					var currency = eventData.currency; 
					var symbol = eventData.symbol; 
					var productId = eventData.productId; 
					var signature = eventData.signature; 
					
					var msg = "purchase.success\n\nStatus: " + status 
						+ "\nCall ID: " + callId 
						+ "\nType: " + type 
						+ "\nSubtotal: " + subTotal.symbol + subTotal.amount + " in " + subTotal.currency 
						+ "\nAmount: " + amount 
						+ "\nCurrency: " + currency 
						+ "\nSymbol: " + symbol 
						+ "\nProduct ID: " + productId 
						+ "\nSignature: " + signature; 
					
					 //alert ( msg );
					
					window.location.href = "./ccInitiateOrder.jsp?callId=" + callId; 
					
				} else if (VmeEventType == "purchase.cancel") {
					/// User closed the Payment Widget before the purchase flow is complete. No JSON data returned.
					var msg = "purchase.cancel"; 
					 alert(msg); 
					
				} else if (VmeEventType == "purchase.pending") {
					/// V.me server failed to validate shipping address or payment within a reasonable amount of time after the user clicks Confirm button. 
					/// No JSON data returned. 
					var msg = "purchase.pending"; 
					 alert(msg); 
					
				} else if (VmeEventType == "purchase.init") {
					/// Payment Widget was launched and a callid is obtained. 
					var status = eventData.status; 
					var callId = eventData.callId; 
					
					var msg = "purchase.init\n\nStatus: " + status + "\nCall ID: " + callId; 
					//! alert(msg); 
				}

			} 

		</script>
		
		
<script type="text/javascript">
		if (self === top) {
			var antiClickjack = document.getElementById("antiClickjack");
			antiClickjack.parentNode.removeChild(antiClickjack);
		} else {
			top.location = self.location;
		}
		</script>
</head>
<body>

	<br/>
	<b>V.Me - Express Widget</b>
	<br/>
		This demonstrates how to authenticate order directly with V.me
	<br/>
	<br/>

	 <form name="frm" method=post action="#">
            <table>
				<tr>
	<td bgcolor="ffff40" width="150">Order Number</td><td><input type="text" name="order_number" value=""></td>
	<td>Order Description </td><td><input type="text" name="order_description" value="Sample Order..."></td>
</tr>
<tr>
	<td bgcolor="ffff40">Amount </td><td><input type="text" name="amount" value=""></td>
	<td bgcolor="ffff40" >Currency Code </td>
	<td>
		<select name="currency_code" id="currency_code">
			<option value="USD">840 - USD</option>
			<option value="JB">JB - JB</option>
		</select>	
	</td>
</tr>

<tr>
	<td>MerchantData </td><td><input type="text" name="merchant_data" value=""></td>
</tr>
			

                <tr>
                    <td>Item 1 Price</td><td><input type="text" name="item_price_1" value=""></td>
                    <td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""></td>
                </tr>
                <tr>
                    <td>Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value="1"></td>
                    <td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value="1"></td>
                </tr>
              
			
                <tr>
                 
                  <td colspan="4" align="center"><input type="button" name="Update Order" value="Update Order" onClick="updateVmeButton();"></td>
                </tr>
                <tr>
                    <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
                </tr>
            </table>
        </form>

<!-- v:buy root container -->
<div id="v-root"></div>
<!-- Initialize Widgets -->

<v:init apikey="<%=VME_MERCHANT_ID%>"></v:init>

<!-- Site content and v:buy buttons (see below) -->

<!-- v:buy widget script include -->
<script type="text/javascript" src="<%=VME_JS_URL%>"></script>

<v:buy
  apikey = "<%=VME_MERCHANT_ID%>"
  token = "1e31c468db9b7c370a143a39a6e3c0f18ec6efa4210652218ec556d0a1588184"
  amount = "1"
  currency = "USD"
  product-id = "Testproduct1"
  merch-trans = "" 
  collect-shipping = "true"
  process = "validate"
  callback= "myCallbackFunctionForVmeEvents"
  id="vmebutton">
</v:buy>

</body>
</html> 
