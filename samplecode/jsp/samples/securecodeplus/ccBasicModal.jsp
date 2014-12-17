<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccBasicModal.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%@ include file="CentinelConfig.jsp" %>
<%
session.setAttribute("Centinel_HasAuthorized", "false");
%>

<html>
	<head>
		<title>Centinel - Start Page</title>
		<link rel="stylesheet" type="text/css" href="common/style.css" />				
		<script type="text/javascript" src="common/util.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				document.frm.order_number.value = randomOrderNumber();
				document.frm.item_price_1.value = randomAmount();
				document.frm.item_price_2.value = randomAmount();
				document.frm.amount.value = parseInt(document.frm.item_price_1.value)+parseInt(document.frm.item_price_2.value);
				document.frm.onsubmit = singleSubmit("frm");
				
				// Dynamic country / state functionality
				document.forms["frm"].b_country_code.onchange = function() { countryCodeMonitor(); }
				document.forms["frm"].s_country_code.onchange = function() { countryCodeMonitor(); }
				document.getElementById("s_state_field").innerHTML = getStateSelectionHTML("s_state");
				document.getElementById("b_state_field").innerHTML = getStateSelectionHTML("b_state");
				document.frm.card_number_selector.onchange = 
				function() {
					document.getElementById("card_number").value = document.getElementById("card_number_selector").value;
				}
				build3DSDateOptions();
				build3DSRecurringEnd();

		                // TODO: CardinalCommerce recommends that merchants always pass the JavaScriptSupport field
		                // to indicate whether or not the cardholder's browser can execute JavaScript. This is an
		                // example of how a JavaScript based "onload" event can detect if the browser is capable
		                // of JavaScript.                
		                document.forms["frm"].javascript_support = "True"

			} // end onLoad
		</script>

		<%	
		//=====================================================================================
		//  Include the Widget JS file from Cardinal 
		//=====================================================================================
		%>

		<script type="text/javascript" src="<%= WIDGET_URL %>"></script>
		<script type="text/javascript" src="common/jquery.js"></script>
		
		<script type="text/javascript">
            <%	
            //=====================================================================================
            // We override the forms submit function and have it run the widget first. If the centinel method returns true then something occurred with the widget
            // intialization and run that caused an error - we fall back on the form submission to complete a standard 3DS transaction.
            //=====================================================================================
            %>
			$(function(){
				$('#card_number_selector').change(function(){closeAuthenticationWindow();});
				// Preload images in modal - the loading Icon should be preloaded at a minimum to prevent loading Icon misplacement
				var arrayOfImages = ["includes/imgs/loading.gif" ,"includes/imgs/close-icon.png"];
				CentinelWidget.CentinelPreloadExternalImages(arrayOfImages);
				
				$("#frm").submit(function( e ){  
					if (runCentinelClient('<%= CENTINEL_TERM_URL %>', '<%= MODAL_URL %>', 'ccAjaxLookup.jsp', '<%= WIDGET_TIMEOUT %>') ){
						return true; 
					} else {
						e.stopPropagation(); 
						return false; 
					}
				});
			});
			

            <%	
            //=====================================================================================
            //  Initialize the Widget with the desired configurations
            // This function returns false if we successfully intialized and created our widget object, preventing the form from submitting. If we encounter some
            // kind of issue building the widget object we return true to cause the form to submit.
            //=====================================================================================
            %>
			function runCentinelClient(termUrl, modalUrl, generatePayloadUrl, timeout ) {
				var client = CentinelWidget.CentinelGetInstance();
				client.Debug = <%= DEBUGOUTPUT %>;																// Print debug statements - Default: false
				client.ConsolePrint = <%= DEBUGOUTPUT %>;														// Print debug statements in the browsers console instead of in alert boxes - Default: false
				client.PostVars = "";																// Variables to post over to the lookup page - should keep empty and add variables with the add functions like belowo
				
				try {
					// Check to make sure this is an 3DS order, if it is not, then go ahead and submit the form
					var txn_type = jQuery("[name=txn_type]").val();
					if (txn_type == "C") {
					
						/*
						///////////////////// [ URL DEFINITIONS ] ////////////////////////
						This loads all of the config URL's into the Centinel Widget, nothing should need changed here
						*/
						client.TermUrl = termUrl;												// The page that the widget will submit results to. Traditionally this is the Authentication page
						client.ModalUrl = modalUrl;											// Merchant hosted page that will act as a proxy from Cardinal to the widget. This page should include the notify.js file but can otherwise be an empty valid HTML page.
						client.GeneratePayloadUrl = generatePayloadUrl;			// This is the Lookup page. This page should return the results of the lookup as JSON.
						client.Timeout = timeout;												// Time in miliseconds the Widget should attempt to connect and attempt to complete a SecureCode+ transaction before failing back to normal 3DS; Default: 15000
						
						/*
						///////////////////// [ WIDGET INITIALIZATIONS ] ////////////////////////
						*/
						client.RequestType = "modal";										// Use the modal style. Default: modal
						client.MessageType = "cmpi_lookup";								// If ADS - will complete an ADS transaction
						
						client.MerchantData = "here is some merchant data";		// MerchantData must be specified here
						
						
						/*
						///////////////////// [ OPTIONAL STYLISTIC CONFIGURATIONS ] ////////////////////////
						*/
						client.LoadingImg = "includes/imgs/loading.gif"  			// Designate a loading Icon - If one is not defined then the Widget will not use one - Automatically positioned in center of ModalWindow element
						client.ExitImg = "includes/imgs/close-icon.png"			// Designate an exit Icon - If one is not defined then the Widget will not use one - Use CSS to position

						/*
						///////////////////// [ ERROR HANDLERS ] ////////////////////////
						Javascript handlers for different errors that can occur. It is STRONGLY recommended that these be used.
						*/
						client.LookupErrorHandler = LookupErrorHandler;		// If the Ajax call runs into an error of any kind - execute this handler
						client.AjaxErrorHandler = AjaxErrorHandler;				// If the Ajax call runs into an error of any kind - execute this handler
						client.PromptActionCodeHandler = PromptActionCodeHandler;		// If the Lookup returns an actioncode of Prompt - execute this handler - INSITE: Prompt means we recommend you prompt for another form of Payment
						client.ResizeErrorHandler = ResizeErrorHandler

						/*
						Add all the fields to be sent in Payload to Centinel, you can call client.AddByName, client.AddById, and client.AddByValue to add fields.
						For each of the Add functions the first parameter is the name of the field that will be posted to create the payload and 
						the second parameter is the Form ID, Name, or Value to get off the current page
						
						For our sample we pass the entire cart and any data needed through the widget. A realist intgration would already have that data saved to session or accessible in another fashion.
						Due to this a realistic integration would only pass the credit card information through here.
						*/
						client.AddByName("txn_type", "txn_type");
						client.AddByName("amount", "amount");
						client.AddByName("shipping_amount", "shipping_amount");
						client.AddByName("tax_amount", "tax_amount");
						client.AddByName("currency_code", "currency_code");
						client.AddByName("order_number", "order_number");
						client.AddByName("order_description", "order_description");
						client.AddByName("email_address", "email_address");

						client.AddByName("b_first_name", "b_first_name");
						client.AddByName("b_middle_name", "b_middle_name");
						client.AddByName("b_last_name", "b_last_name");
						client.AddByName("b_address1", "b_address1");
						client.AddByName("b_address2", "b_address2");
						client.AddByName("b_city", "b_city");
						client.AddByName("b_state", "b_state");
						client.AddByName("b_postal_code", "b_postal_code");
						client.AddByName("b_country_code", "b_country_code");
						client.AddByName("b_phone", "b_phone");

						client.AddByName("s_first_name", "s_first_name");
						client.AddByName("s_middle_name", "s_middle_name");
						client.AddByName("s_last_name", "s_last_name");
						client.AddByName("s_address1", "s_address1");
						client.AddByName("s_address2", "s_address2");
						client.AddByName("s_city", "s_city");
						client.AddByName("s_state", "s_state");
						client.AddByName("s_postal_code", "s_postal_code");
						client.AddByName("s_country_code", "s_country_code");
						client.AddByName("s_phone", "s_phone");

						client.AddByName("Item_Name_1", "Item_Name_1");
						client.AddByName("Item_Desc_1", "Item_Desc_1");
						client.AddByName("Item_Price_1", "Item_Price_1");
						client.AddByName("Item_Quantity_1", "Item_Quantity_1");
						client.AddByName("Item_SKU_1", "Item_SKU_1");
						client.AddByName("Item_Name_2", "Item_Name_2");
						client.AddByName("Item_Desc_2", "Item_Desc_2");
						client.AddByName("Item_Price_2", "Item_Price_2");
						client.AddByName("Item_Quantity_2", "Item_Quantity_2");
						client.AddByName("Item_SKU_2", "Item_SKU_2");
						client.AddByName("card_number", "card_number");
						client.AddByName("expr_mm", "expr_mm");
						client.AddByName("expr_yyyy", "expr_yyyy");
						
						client.SendRequestViaBackend();										// Start the Widget transaction
						return false;												// Since we have intialized this on the form's submit function we return false to prevent any kind of redirect
					} else {
						return true;												// Since we have intialized this on the form's submit function we return true to force a page redirect. This allows us to fall back on a full traditional 3DS integration if we desire
					}
				} catch (e) {
					console.log("Error Encountered with Cardinal Widget [" + e.description  + "]");
					return true;													// Since we have intialized this on the form's submit function we return true to force a page redirect. This allows us to fall back on a full traditional 3DS integration if we desire
					
				}
			}
			
			function LookupErrorHandler(){
				var client = CentinelWidget.CentinelGetInstance();
				
				client.CloseEvent();
				alert("There was an error that occurred. Override this method to handle a lookup that returns an error.");
				
			}

			function AjaxErrorHandler(){
				var client = CentinelWidget.CentinelGetInstance();
				
				client.CloseEvent();
				alert("There was an error that occurred. Override this method to handle an ajax call to the lookup page that results in an error.");
				
			}

			function PromptActionCodeHandler(){
				var client = CentinelWidget.CentinelGetInstance();
				
				client.CloseEvent();
				alert("There was an problem with that payment information. Override this method to handle an ActionCode of PROMPT");
			}
			
			function ResizeErrorHandler(height, width){
				var client = CentinelWidget.CentinelGetInstance();
				
				client.CloseEvent();
				alert("There was an error that occurred. Override this method to handle a resizing error. This method will receive height ["+height+"] and width ["+width+"] of the authentication window.");
			}
			
			function closeAuthenticationWindow(){
				var client = CentinelWidget.CentinelGetInstance();
				client.CloseEvent();
				$('input[type=submit]').removeAttr('disabled');
			}
        </script>



	</head>
<body>

<%@ include file="ccMenu.jsp" %>


		<br/>
		<b>Lookup Message Request Form</b>
		<br/>
		This form is intended to simulate your payment page within your ecommerce web site.
		<br/>All payment information is collected, and clicking the submit button at the bottom of the page simulates the consumer clicking the final buy button.
		<br/>
		<% String message = (String) session.getAttribute("Centinel_Message");
		   if (message != null && message.length() > 0) { %>
			<br/>
				<font color="red"><b>Sample Message : <%=message%></b></font>
			<br/>
		<% } %>
		<% session.removeAttribute("Centinel_Message"); %>
		<br/>

		<form id="frm" name="frm" method=post action="ccLookup.jsp">
		
		<!--                                                                                           -->
		<!-- TODO: CardinalCommerce recommends that merchants always pass the JavaScriptSupport field  -->
		<!--       to indicate whether or not the cardholder's browser can execute JavaScript.         -->
		<!--                                                                                           -->		
		<input type="hidden" name="javascript_support" value="False" />
		
			<table>
				<tr>
					<td bgcolor="#FFFF40">Transaction Type</td>
					<td>
						<select name="txn_type">
							<option value="C">C - Credit Card / Debit Card</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">Card Number</td>
					<td><input type="text" name="card_number" id="card_number" value=""></td>
					<td>Test Cases</td>
					<td>
						<select id="card_number_selector" name="card_number_selector">
							<option value="">Select PAN</option>
                 <option value="4000000000000002">4000000000000002 - Y,Y,Y</option>
                 <option value="5200000000000007">5200000000000007 - Y,Y,Y</option>
                 <option value="3000000000000004">3000000000000004 - Y,Y,Y</option>
                 <option value="340000000003961">340000000003961 - Y,Y,Y</option>
                 <option value="1000000000000001">1000000000000001 - Error</option>
                 <option value="4000000000000010">4000000000000010 - Y,Y,N</option>
                 <option value="5200000000000015">5200000000000015 - Y,Y,N</option>
                 <option value="3000000000000012">3000000000000012 - Y,Y,N</option>
                 <option value="340000000006022">340000000006022 - Y,Y,N</option>
                 <option value="4000000000000028">4000000000000028 - Y,N,Y</option>
                 <option value="3000000000000020">3000000000000020 - Y,N,Y</option>
                 <option value="5200000000000023">5200000000000023 - Y,N,Y</option>
                 <option value="340000000000033">340000000000033 - Y,N,Y</option>
                 <option value="4000000000000101">4000000000000101 - Y,A,Y</option>
                 <option value="5200000000000106">5200000000000106 - Y,A,Y</option>
                 <option value="180000000000028">  180000000000028 - Y,A,Y</option>
                 <option value="340000000003391">340000000003391 - Y,A,Y</option>
                 <option value="4000000000000036">4000000000000036 - Y,U</option>
                 <option value="5200000000000031">5200000000000031 - Y,U</option>
                 <option value="3000000000000038">3000000000000038 - Y,U</option>
                 <option value="340000000002302">340000000002302 - Y,U</option>
                 <option value="4000000000000044">4000000000000044 - Timeout Test - Lookup</option>
                 <option value="4000000000000259">4000000000000259 - Timeout Test - Authenticate</option>
                 <option value="5200000000000049">5200000000000049 - Timeout Test - Lookup</option>
                 <option value="5200000000000452">5200000000000452 - Timeout Test - Authenticate</option>
                 <option value="213100000000001">  213100000000001 - Timeout Test - Lookup</option>
                 <option value="3000000000000376">3000000000000376 - Timeout Test - Authenticate</option>
                 <option value="340000000008309">340000000008309 - Timeout Test - Lookup</option>
                 <option value="340000000008150">340000000008150 - Timeout Test - Authenticate</option>
                 <option value="4000000000000051">4000000000000051 - N</option>
                 <option value="5200000000000056">5200000000000056 - N</option>
                 <option value="213100000000019">  213100000000019 - N</option>
                 <option value="340000000008135">340000000008135 - N</option>
                 <option value="4000000000000069">4000000000000069 - U</option>
                 <option value="5200000000000064">5200000000000064 - U</option>
                 <option value="213100000000027">  213100000000027 - U</option>
                 <option value="340000000007780">340000000007780 - U</option>
                 <option value="4000000000000077">4000000000000077 - Error</option>
                 <option value="5200000000000072">5200000000000072 - Error</option>
                 <option value="213100000000035">  213100000000035 - Error</option>
                 <option value="340000000008416">340000000008416 - Error</option>
                 <option value="4000000000000085">4000000000000085 - Error</option>
                 <option value="5200000000000080">5200000000000080 - Error</option>
                 <option value="180000000000002">  180000000000002 - Error</option>
                 <option value="4000000000000093">4000000000000093 - Y, Error</option>
                 <option value="5200000000000098">5200000000000098 - Y, Error</option>
                 <option value="180000000000010">  180000000000010 - Y, Error</option>
                 <option value="340000000009299">340000000009299 - Y, Error</option>
                 <option value="4000000400000093">4000000400000093 - Not Test Card</option>
                 <option value="5200000400000098">5200000400000098 - Not Test Card</option>
                 <option value="180000040000010">  180000040000010 - Not Test Card</option>
                 <option value="4000000000000432">4000000000000432 - Y,A,N</option>
                 <option value="4000000000000606">4000000000000606 - Y,U,N</option>
                 <option value="4000000000000838">4000000000000838 - Y,N,N</option>
                 <option value="5200000000000221">5200000000000221 - Y,A,N</option>
                 <option value="5200000000000270">5200000000000270 - Y,U,N</option>
                 <option value="5200000000000148">5200000000000148 - Y,N,N</option>
                 <option value="3000000000000657">3000000000000657 - Y,A,N</option>
                 <option value="3000000000000962">3000000000000962 - Y,U,N</option>
                 <option value="3000000000000210">3000000000000210 - Y,N,N</option>
                 <option value="340000000001130">340000000001130 - Y,A,N</option>
                 <option value="340000000009281">340000000009281 - Y,U,N</option>
                 <option value="340000000001031">340000000001031 - Y,N,N</option>

						</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFF40">Expiration Month</td>
					<td>
						<select name="expr_mm">
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</td>
					<td bgcolor="#FFFF40">Expiration Year</td>
					<td>
						<select name="expr_yyyy">
						</select>
					</td>
				</tr>
				
				<tr>
					<td>Installment</td><td><input type="text" name="installment" value=""></td>
					<td>Acquirer Password</td><td><input type="text" name="acquirerPassword" value=""></td>
				</tr>
				
				<tr>
					<td>Payment Method</td>
					<td>
                        <select name="override_payment_method">
                            <option value="">(None selected)</option>
                            <option value="NA">Not Applicable</option>
                            <option value="CR">Credit</option>
                            <option value="DB">Debit</option>
                            <option value="VSAVR">Visa Vale Refeicao</option>
                            <option value="VSAVA">Visa Vale Alimentacao</option>
                        </select>
					</td>					
				</td>
					<td>Mobile Phone</td><td><input type="text" name="mobile_phone" value=""></td>
				</tr>
				
				<tr>
				    <td>Card Type</td>
				    <td>
                        <select name="card_type">
                            <option value="">(None selected)</option>			
                            <option value="VSA">Visa</option>
                            <option value="MSC">MasterCard</option>
                            <option value="VSD">Visa Delta/Debit (UK)</option>
                            <option value="VSE">Visa Electron</option>
                            <option value="MAE">Maestro (UK, Spain & Austria)</option>
                            <option value="SLO">Solo (UK)</option>
                            <option value="AMX">American Express</option>
                            <option value="DSC">Discover</option>
                            <option value="DIN">Diners</option>
                            <option value="CBLA">Carte Blanche</option>
                            <option value="JCB">JCB</option>
                            <option value="ENR">EnRoute</option>
                            <option value="JAL">JAL</option>
                            <option value="LSR">Laser (Rep. of Ireland)</option>
                            <option value="CTB">Carte Bleue</option>
                            <option value="DNK">Dankort</option>
                            <option value="CSI">CartaSi</option>
                            <option value="EAN">Encoded Account Number</option>
                            <option value="UATP">UATP</option>
                            <option value="MAEI">Maestro (International)</option>
                            <option value="GEUK">GE Money UK Card</option>
                        </select>			    
				    </td>
				    
				</td>
					<td></td>
					<td></td>
				</tr>
	
				</tr>
				
		
		
	

				
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td bgcolor="ffff40" width="150">Order Number</td><td><input type="text" name="order_number" value=""></td>
					<td>Order Description </td><td><input type="text" name="order_description" value="Sample Order..."></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Amount </td><td><input type="text" name="amount" value=""></td>
					<td bgcolor="ffff40" >Currency Code </td>
					<td>
						<select name="currency_code" id="currency_code">
							<option value="840">US Dollar - (840)</option>
                            <option value="004">Afghani - (004)</option>
                            <option value="012">Algerian Dinar - (012)</option>
                            <option value="020">Andorran Peseta - (020)</option>
                            <option value="032">Argentinian Nuevo Peso - (032)</option>
                            <option value="051">Armenian Dram - (051)</option>
                            <option value="533">Aruban Guilder - (533)</option>
                            <option value="036">Australian Dollar - (036)</option>
                            <option value="040">Austrian Schilling - (040)</option>
                            <option value="031">Azerbaijanian Manat - (031)</option>
                            <option value="044">Bahamian Dollar - (044)</option>
                            <option value="048">Bahraini Dinar - (048)</option>
                            <option value="590">Balboa - (590)</option>
                            <option value="050">Bangladesh Taka - (050)</option>
                            <option value="052">Barbados Dollar - (052)</option>
                            <option value="974">Belarussian Rouble - (974)</option>
                            <option value="056">Belgian Franc - (056)</option>
                            <option value="084">Belize Dollar - (084)</option>
                            <option value="060">Bermudian Dollar - (060)</option>
                            <option value="862">Bolivar - (862)</option>
                            <option value="068">Boliviano - (068)</option>
                            <option value="072">Botswana Pula - (072)</option>
                            <option value="986">Brazilian Real - (986)</option>
                            <option value="096">Brunei Dollar - (096)</option>
                            <option value="100">Bulgarian Lev - (100)</option>
                            <option value="108">Burundi Franc - (108)</option>
                            <option value="124">Canadian Dollar - (124)</option>
                            <option value="132">Cape Verde Escudo - (132)</option>
                            <option value="136">Cayman Islands Dollar - (136)</option>
                            <option value="952">CFA Franc BCEAO  - (952)</option>
                            <option value="950">CFA Franc BEAC - (950)</option>
                            <option value="953">CFP Franc - (953)</option>
                            <option value="152">Chilean Peso - (152)</option>
                            <option value="156">Chinese Yuan Renminbi - (156)</option>
                            <option value="170">Colombian Peso - (170)</option>
                            <option value="174">Comoro Franc - (174)</option>
                            <option value="977">Convertible Marks - (977)</option>
                            <option value="558">Cordoba Oro - (558)</option>
                            <option value="188">Costa Rican Colon - (188)</option>
                            <option value="191">Croatian Kuna - (191)</option>
                            <option value="192">Cuban Peso - (192)</option>
                            <option value="196">Cyprus Pound - (196)</option>
                            <option value="203">Czech Koruna - (203)</option>
                            <option value="270">Dalasi - (270)</option>
                            <option value="208">Danish Krone - (208)</option>
                            <option value="807">Denar - (807)</option>
                            <option value="276">Deutsche Mark - (276)</option>
                            <option value="262">Djibouti Franc - (262)</option>
                            <option value="678">Dobra - (678)</option>
                            <option value="214">Dominican Peso - (214)</option>
                            <option value="704">Dong - (704)</option>
                            <option value="528">Dutch Guilder - (528)</option>
                            <option value="951">East Caribbean Dollar - (951)</option>
                            <option value="818">Egyptian Pound - (818)</option>
                            <option value="222">El Salvador Colon - (222)</option>
                            <option value="230">Ethiopian Birr - (230)</option>
                            <option value="978">EURO - (978)</option>
                            <option value="238">Falkland Islands Pound - (238)</option>
                            <option value="242">Fiji Dollar - (242)</option>
                            <option value="246">Finnish Markka - (246)</option>
                            <option value="976">Franc Congolais - (976)</option>
                            <option value="250">French Franc - (250)</option>
                            <option value="288">Ghana Cedi - (288)</option>
                            <option value="292">Gibraltar Pound - (292)</option>
                            <option value="332">Gourde - (332)</option>
                            <option value="600">Guarani - (600)</option>
                            <option value="324">Guinea Franc - (324)</option>
                            <option value="624">Guinea-Bissau Peso - (624)</option>
                            <option value="328">Guyana Dollar - (328)</option>
                            <option value="344">Hong Kong Dollar - (344)</option>
                            <option value="980">Hryvnia - (980)</option>
                            <option value="348">Hungary Forint - (348)</option>
                            <option value="352">Iceland Krona - (352)</option>
                            <option value="356">Indian Ruppe - (356)</option>
                            <option value="364">Iranian Rial - (364)</option>
                            <option value="368">Iraqi Dinar - (368)</option>
                            <option value="372">Irish Pound - (372)</option>
                            <option value="380">Italian Lira - (380)</option>
                            <option value="388">Jamaican Dollar - (388)</option>
                            <option value="392">Japanese Yen - (392)</option>
                            <option value="400">Jordanian Dinar - (400)</option>
                            <option value="404">Kenyan Shilling - (404)</option>
                            <option value="598">Kina - (598)</option>
                            <option value="418">Kip - (418)</option>
                            <option value="233">Kroon - (233)</option>
                            <option value="414">Kuwaiti Dinar - (414)</option>
                            <option value="454">Kwacha - (454)</option>
                            <option value="894">Kwacha - (894)</option>
                            <option value="104">Kyat - (104)</option>
                            <option value="981">Lari - (981)</option>
                            <option value="428">Latvian Lats - (428)</option>
                            <option value="422">Lebanese Pound - (422)</option>
                            <option value="008">Lek - (008)</option>
                            <option value="340">Lempira - (340)</option>
                            <option value="694">Leone - (694)</option>
                            <option value="430">Liberian Dollar - (430)</option>
                            <option value="434">Libyan Dinar - (434)</option>
                            <option value="748">Lilangeni - (748)</option>
                            <option value="440">Lithuanian Litus - (440)</option>
                            <option value="426">Loti - (426)</option>
                            <option value="442">Luxembourg Franc - (442)</option>
                            <option value="450">Malagasy Franc - (450)</option>
                            <option value="458">Malaysian Ringgit - (458)</option>
                            <option value="470">Maltese Lira - (470)</option>
                            <option value="795">Manat - (795)</option>
                            <option value="480">Mauritius Rupee - (480)</option>
                            <option value="484">Mexican Peso - (484)</option>
                            <option value="498">Moldovan Leu - (498)</option>
                            <option value="504">Moroccan Dirham - (504)</option>
                            <option value="508">Mozambique Metical - (508)</option>
                            <option value="566">Naira - (566)</option>
                            <option value="232">Nakfa - (232)</option>
                            <option value="516">Namibia Dollar - (516)</option>
                            <option value="524">Nepalese Rupee - (524)</option>
                            <option value="532">Netherlands Antillian Guilder - (532)</option>
                            <option value="376">New Israeli Sheqel - (376)</option>
                            <option value="024">New Kwanza - (024)</option>
                            <option value="901">New Taiwan Dollar - (901)</option>
                            <option value="554">New Zealand Dollar - (554)</option>
                            <option value="064">Ngultrum - (064)</option>
                            <option value="408">North Korean Won - (408)</option>
                            <option value="578">Norwegian Krone - (578)</option>
                            <option value="604">Nuevo Sol - (604)</option>
                            <option value="478">Ouguiya - (478)</option>
                            <option value="776">Pa'anga - (776)</option>
                            <option value="586">Pakistan Rupee - (586)</option>
                            <option value="446">Pataca - (446)</option>
                            <option value="858">Peso Uruguayo - (858)</option>
                            <option value="608">Philippine Peso - (608)</option>
                            <option value="620">Portuguese Escudo - (620)</option>
                            <option value="826">Pound Sterling - (826)</option>
                            <option value="634">Qatari Rial - (634)</option>
                            <option value="320">Quetzal - (320)</option>
                            <option value="512">Rial Omani - (512)</option>
                            <option value="116">Riel - (116)</option>
                            <option value="642">Romanian Leu - (642)</option>
                            <option value="946">Romanian New Leu - (946)</option>
                            <option value="462">Rufiyaa - (462)</option>
                            <option value="360">Rupiah - (360)</option>
                            <option value="643">Russian Federation Rouble - (643)</option>
                            <option value="810">Russian Rouble - (810)</option>
                            <option value="646">Rwanda Franc - (646)</option>
                            <option value="654">Saint Helena Pound - (654)</option>
                            <option value="682">Saudi Riyal - (682)</option>
                            <option value="891">Serbian Dinar - (891)</option>
                            <option value="690">Seychelles Rupee - (690)</option>
                            <option value="702">Singapore Dollar - (702)</option>
                            <option value="703">Slovak Koruna - (703)</option>
                            <option value="090">Solomon Islands Dollar - (090)</option>
                            <option value="417">Som - (417)</option>
                            <option value="706">Somali Shilling - (706)</option>
                            <option value="972">Somoni - (972)</option>
                            <option value="710">South Africa Rand - (710)</option>
                            <option value="410">South Korean Won - (410)</option>
                            <option value="724">Spanish Peseta - (724)</option>
                            <option value="144">Sri Lanka Rupee - (144)</option>
                            <option value="736">Sudanese Dinar - (736)</option>
                            <option value="740">Suriname Guilder - (740)</option>
                            <option value="752">Swedish Krona - (752)</option>
                            <option value="756">Swiss Franc - (756)</option>
                            <option value="760">Syrian Pound - (760)</option>
                            <option value="882">Tala - (882)</option>
                            <option value="834">Tanzanian Shilling - (834)</option>
                            <option value="398">Tenge - (398)</option>
                            <option value="764">Thailand Baht - (764)</option>
                            <option value="626">Timor Escudo - (626)</option>
                            <option value="705">Tolar - (705)</option>
                            <option value="780">Trinidad and Tobago Dollar - (780)</option>
                            <option value="496">Tugrik - (496)</option>
                            <option value="788">Tunisian Dinar - (788)</option>
                            <option value="792">Turkish Lira - (792)</option>
                            <option value="784">UAE Dirham - (784)</option>
                            <option value="800">Uganda Shilling - (800)</option>
                            <option value="860">Uzbekistan Sum - (860)</option>
                            <option value="548">Vatu - (548)</option>
                            <option value="886">Yemeni Rial - (886)</option>
                            <option value="891">Yugoslavian Dinar - (891)</option>
                            <option value="716">Zimbabwe Dollar - (716)</option>
                            <option value="985">Zloty - (985)</option>						
						</select>	
					</td>
				</tr>
				<tr>
					<td>Shipping Amount</td><td><input type="text" name="shipping_amount" value=""></td>
					<td>Tax Amount</td><td><input type="text" name="tax_amount" value=""></td>
				</tr>
				<tr>
					<td>Gift Card Amount</td><td><input type="text" name="giftcard_amount" value=""></td>
					<td>Recurring</td>
					<td><select name="recurring" id="recurring">
								<option value="">(None selected)</option>
								<option value="N">N - No</option>
								<option value="Y">Y - Yes</option>
								<option value="AR">AR - Auto Recurring</option>
							</select>
						</td>
				</tr>		
				<tr>
					<td bgcolor="ffff40">Order Channel</td>
						<td><select name="order_channel" id="order_channel">
									<option value="MARK" selected="selected">MARK</option>
									<option value="CART">CART</option>
									<option value="CALLCENTER" >CALLCENTER</option>
									<option value="WIDGET" >WIDGET</option>
									<option value="PRODUCT" >PRODUCT</option>
									<option value="1CLICK">1CLICK</option>
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
					<td>CustomerId </td><td><input type="text" name="customer_id" value=""></td>
				</tr>
			
				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td>Recurring Frequency</td>
					<td><input type="text" name="recurringFrequency" value="30">
						</td>
					<td>Recurring End</td>
					<td><input type="text" name="recurringEnd" value="">
						</td>
				</tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Billing First Name</td><td><input type="text" name="b_first_name" value="John"></td>
					<td bgcolor="ffff40">Shipping First Name</td><td><input type="text" name="s_first_name" value="John"></td>
				</tr>
				<tr>
					<td>Billing Middle Name</td><td><input type="text" name="b_middle_name" value=""></td>
					<td>Shipping Middle Name</td><td><input type="text" name="s_middle_name" value=""></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Billing Last Name</td><td><input type="text" name="b_last_name" value="Consumer"></td>
					<td bgcolor="ffff40">Shipping Last Name</td><td><input type="text" name="s_last_name" value="Consumer"></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Billing Address1</td><td><input type="text" name="b_address1" value="123 Main Street"></td>
					<td bgcolor="ffff40">Shipping Address1</td><td><input type="text" name="s_address1" value="123 Main Street"></td>
				</tr>
				<tr>
					<td>Billing Address2</td><td><input type="text" name="b_address2" value=""></td>
					<td>Shipping Address2</td><td><input type="text" name="s_address2" value=""></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Billing City</td><td><input type="text" name="b_city" value="Cleveland"></td>
					<td bgcolor="ffff40">Shipping City</td><td><input type="text" name="s_city" value="Cleveland"></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Billing State</td>
					<td id="b_state_field"><select id="b_state" name="b_state">
								<option value="">(No selection)</option>
								<option value="AK">AK - Alaska</option>
								<option value="AL">AL - Alabama</option>
								<option value="AR">AR - Arkansas</option>
								<option value="AZ">AZ - Arizona</option>
								<option value="CA">CA - California</option>
								<option value="CO">CO - Colorado</option>
								<option value="CT">CT - Connecticut</option>
								<option value="DC">DC - District Of Columbia</option>
								<option value="DE">DE - Delaware</option>
								<option value="FL">FL - Florida</option>
								<option value="GA">GA - Georgia</option>
								<option value="HI">HI - Hawaii</option>
								<option value="IA">IA - Iowa</option>
								<option value="ID">ID - Idaho</option>
								<option value="IL">IL - Illinois</option>
								<option value="IN">IN - Indiana</option>
								<option value="KS">KS - Kansas</option>
								<option value="KY">KY - Kentucky</option>
								<option value="LA">LA - Louisiana</option>
								<option value="MA">MA - Massachusetts</option>
								<option value="MD">MD - Maryland</option>
								<option value="ME">ME - Maine</option>
								<option value="MI">MI - Michigan</option>
								<option value="MN">MN - Minnesota</option>
								<option value="MO">MO - Missouri</option>
								<option value="MS">MS - Mississippi</option>
								<option value="MT">MT - Montana</option>
								<option value="NC">NC - North Carolina</option>
								<option value="ND">ND - North Dakota</option>
								<option value="NE">NE - Nebraska</option>
								<option value="NH">NH - New Hampshire</option>
								<option value="NJ">NJ - New Jersey</option>
								<option value="NM">NM - New Mexico</option>
								<option value="NV">NV - Nevada</option>
								<option value="NY">NY - New York</option>
								<option value="OH" selected="selected">OH - Ohio</option>
								<option value="OK">OK - Oklahoma</option>
								<option value="OR">OR - Oregon</option>
								<option value="PA">PA - Pennsylvania</option>
								<option value="RI">RI - Rhode Island</option>
								<option value="SC">SC - South Carolina</option>
								<option value="SD">SD - South Dakota</option>
								<option value="TN">TN - Tennessee</option>
								<option value="TX">TX - Texas</option>
								<option value="UT">UT - Utah</option>
								<option value="VA">VA - Virginia</option>
								<option value="VT">VT - Vermont</option>
								<option value="WA">WA - Washington</option>
								<option value="WI">WI - Wisconsin</option>
								<option value="WV">WV - West Virginia</option>
								<option value="WY">WY - Wyoming</option></select>
						</td>
						<td bgcolor="ffff40">Shipping State</td>
						<td id="s_state_field"><select id="s_state" name="s_state">
								<option value="">(No selection)</option>
								<option value="AK">AK - Alaska</option>
								<option value="AL">AL - Alabama</option>
								<option value="AR">AR - Arkansas</option>
								<option value="AZ">AZ - Arizona</option>
								<option value="CA">CA - California</option>
								<option value="CO">CO - Colorado</option>
								<option value="CT">CT - Connecticut</option>
								<option value="DC">DC - District Of Columbia</option>
								<option value="DE">DE - Delaware</option>
								<option value="FL">FL - Florida</option>
								<option value="GA">GA - Georgia</option>
								<option value="HI">HI - Hawaii</option>
								<option value="IA">IA - Iowa</option>
								<option value="ID">ID - Idaho</option>
								<option value="IL">IL - Illinois</option>
								<option value="IN">IN - Indiana</option>
								<option value="KS">KS - Kansas</option>
								<option value="KY">KY - Kentucky</option>
								<option value="LA">LA - Louisiana</option>
								<option value="MA">MA - Massachusetts</option>
								<option value="MD">MD - Maryland</option>
								<option value="ME">ME - Maine</option>
								<option value="MI">MI - Michigan</option>
								<option value="MN">MN - Minnesota</option>
								<option value="MO">MO - Missouri</option>
								<option value="MS">MS - Mississippi</option>
								<option value="MT">MT - Montana</option>
								<option value="NC">NC - North Carolina</option>
								<option value="ND">ND - North Dakota</option>
								<option value="NE">NE - Nebraska</option>
								<option value="NH">NH - New Hampshire</option>
								<option value="NJ">NJ - New Jersey</option>
								<option value="NM">NM - New Mexico</option>
								<option value="NV">NV - Nevada</option>
								<option value="NY">NY - New York</option>
								<option value="OH" selected="selected">OH - Ohio</option>
								<option value="OK">OK - Oklahoma</option>
								<option value="OR">OR - Oregon</option>
								<option value="PA">PA - Pennsylvania</option>
								<option value="RI">RI - Rhode Island</option>
								<option value="SC">SC - South Carolina</option>
								<option value="SD">SD - South Dakota</option>
								<option value="TN">TN - Tennessee</option>
								<option value="TX">TX - Texas</option>
								<option value="UT">UT - Utah</option>
								<option value="VA">VA - Virginia</option>
								<option value="VT">VT - Vermont</option>
								<option value="WA">WA - Washington</option>
								<option value="WI">WI - Wisconsin</option>
								<option value="WV">WV - West Virginia</option>
								<option value="WY">WY - Wyoming</option></select></td>
					</tr>
					<tr>
						<td bgcolor="ffff40">Billing Postal Code</td><td><input type="text" name="b_postal_code" value="44111"></td>
						<td bgcolor="ffff40">Shipping Postal Code</td><td><input type="text" name="s_postal_code" value="44111"></td>
					</tr>
					<tr>
						<td bgcolor="ffff40">Billing Country Code</td>
						<td id="b_country_code_field"><select id="b_country_code" name="b_country_code" >
								<option value="US">US - United States</option>
								<option value="AT">AT - Austria</option>
								<option value="BE">BE - Belgium</option>
								<option value="CA">CA - Canada</option>
								<option value="CH">CH - Switzerland</option>
								<option value="CZ">CZ - Czech Republic</option>
								<option value="DE">DE - Germany</option>
								<option value="DK">DK - Denmark</option>
								<option value="ES">ES - Spain</option>
								<option value="FI">FI - Finland</option>
								<option value="FR">FR - France</option>
								<option value="GB">GB - United Kingdom</option>
								<option value="HK">HK - Hong Kong</option>
								<option value="HU">HU - Hungary</option>
								<option value="IE">IE - Ireland</option>
								<option value="IL">IL - Israel</option>
								<option value="IT">IT - Italy</option>
								<option value="JP">JP - Japan</option>
								<option value="MX">MX - Mexico</option>
								<option value="NL">NL - Netherlands</option>
								<option value="NO">NO - Norway</option>
								<option value="NZ">NZ - New Zealand</option>
								<option value="PL">PL - Poland</option>
								<option value="PT">PT - Portugal</option>
								<option value="SE">SE - Sweden</option>
								<option value="SG">SG - Singapore</option></select></td>
					<td bgcolor="ffff40">Shipping Country Code</td>
					<td id="s_country_code_field"><select id="s_country_code" name="s_country_code">
								<option value="US">US - United States</option>
								<option value="AT">AT - Austria</option>
								<option value="BE">BE - Belgium</option>
								<option value="CA">CA - Canada</option>
								<option value="CH">CH - Switzerland</option>
								<option value="CZ">CZ - Czech Republic</option>
								<option value="DE">DE - Germany</option>
								<option value="DK">DK - Denmark</option>
								<option value="ES">ES - Spain</option>
								<option value="FI">FI - Finland</option>
								<option value="FR">FR - France</option>
								<option value="GB">GB - United Kingdom</option>
								<option value="HK">HK - Hong Kong</option>
								<option value="HU">HU - Hungary</option>
								<option value="IE">IE - Ireland</option>
								<option value="IL">IL - Israel</option>
								<option value="IT">IT - Italy</option>
								<option value="JP">JP - Japan</option>
								<option value="MX">MX - Mexico</option>
								<option value="NL">NL - Netherlands</option>
								<option value="NO">NO - Norway</option>
								<option value="NZ">NZ - New Zealand</option>
								<option value="PL">PL - Poland</option>
								<option value="PT">PT - Portugal</option>
								<option value="SE">SE - Sweden</option>
								<option value="SG">SG - Singapore</option></select></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Billing Phone</td><td><input type="text" name="b_phone" value="2162162116"></td>
					<td>Shipping Phone</td><td><input type="text" name="s_phone" value="2162162116"></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Buyer Email</td><td><input type="text" name="email_address" value="johnconsumer@consumerdomain.com"></td>
					<td>&nbsp;</td><td></td>
				</tr>

				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
			   	<tr>
					<td bgcolor="ffff40">Item 1 Name</td><td><input type="text" name="item_name_1" value="2GB MP3 Player"/></td>
					<td>Item 2 Name</td><td><input type="text" name="item_name_2" value="100GB Hard Drive"/></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Item 1 Description</td><td><input type="text" name="item_desc_1" value="The simple MP3 player"/></td>
					<td>Item 2 Description</td><td><input type="text" name="item_desc_2" value="The simple 100GB Hard Drive"/></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Item 1 SKU</td><td><input type="text" name="item_sku_1" value="123456"/></td>
					<td>Item 2 SKU</td><td><input type="text" name="item_sku_2" value="987654"/></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Item 1 Price</td><td><input type="text" name="item_price_1" value=""/></td>
					<td>Item 2 Price</td><td><input type="text" name="item_price_2" value=""/></td>
				</tr>
				<tr>
					<td bgcolor="ffff40">Item 1 Quantity</td><td><input type="text" name="item_quantity_1" value="1"/></td>
					<td>Item 2 Quantity</td><td><input type="text" name="item_quantity_2" value="1"/></td>
				</tr>

				<tr>
					<td>&nbsp;</td><td></td>
					<td>&nbsp;</td><td></td>
				</tr>
				<tr>
					<td></td>
					<td>
							<a target="_vbvLearnMore" href="learnmore/vbv_learn_more.html" border="0"><img border="0" src="learnmore/vbv_learn_more.gif" /></a>
							<a target="_mcscLearnMore" href="learnmore/mcs_learn_more.html" border="0"><img border="0" src="learnmore/mcsc_learn_more.gif" /></a>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" name="submit" value="Submit Order"></td>
					</tr>
				<tr>
					<td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
				</tr>
			</table>
		</form>
	</body>
</html>