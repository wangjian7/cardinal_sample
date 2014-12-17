<%@ language="vbscript" %>
<%response.expires=-1%>
<%response.buffer=true%>
<%
'=========================================================================================
'= CardinalCommerce (http://www.cardinalcommerce.com)
'= Sample page used to simulate the checkout form of an ecommerce web site
'=========================================================================================
%>
<html>
<head>
<Title>Centinel - Start Widget </Title>
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
	<script type="text/javascript" src="../common/util.js"></script>

	<script type="text/javascript" src="hash256.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.js"></script>
	<script type="text/javascript" src="http://jquery.bassistance.de/validate/lib/jquery.metadata.js"></script>

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

			function myCallbackFunctionForVmeEvents(VmeEventType, eventData){
			var MerchantTrans = eventData.merchTrans;
			if (VmeEventType == "purchase.success"){
			alert ( msg );
			mywindow = window.open ("./checkyourorder.php?merchTrans=” + MerchantTrans,”Check your Order ID","width=400,height=300");
			mywindow.moveTo(300,300);
			}
}
		</script>

 <script>           
   window.onload=function() {
    $.ajax({
                 url: 'ajax.asp',
                 type: "POST",
                 data: {
				 'amount':'100',
				 'currency':'USD',
				 'productId':'Testproduct1',
				 'merchTrans':'JBOrder'
				 },              
                 dataType: "html",
                 success: function(data){  
						//console.log('what');
						//alert(data);
						$('#vme').append(data);
						UPay.init();
                   },
                   error: function(event, request, settings){
                        console.log(event);
                        console.log(request);
                        console.log(settings);
                   }
               });
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
<div id="vme">

</div>





</body>
</html> 
