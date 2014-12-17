
function setTestCaseData(index){

	if (index=="1"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "karen@merchant.com";
		
		document.forms[0].b_first_name.value = "Karen";
		document.forms[0].b_middle_name.value = "Ann";
		document.forms[0].b_last_name.value = "MerchantK";
		document.forms[0].b_address1.value = "9690 Deereco Rd";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "Timonium";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "2162162116";
		
		document.forms[0].s_first_name.value = "Karen";
		document.forms[0].s_middle_name.value = "Ann";
		document.forms[0].s_last_name.value = "MerchantK";
		document.forms[0].s_address1.value = "9690 Deereco Rd";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "Timonium";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21093";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "2162162116";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071231";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "8521";
		document.forms[0].dob.value = "19531007";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="2"){
		document.forms[0].card_number.value = "5049901000006297";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].shipping_amount.value = "1299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "karen@merchant.com";
		
		document.forms[0].b_first_name.value = "Karen";
		document.forms[0].b_middle_name.value = "Ann";
		document.forms[0].b_last_name.value = "MerchantK";
		document.forms[0].b_address1.value = "9690 Deereco Rd";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "Timonium";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "2162162116";
		
		document.forms[0].s_first_name.value = "Karen";
		document.forms[0].s_middle_name.value = "Ann";
		document.forms[0].s_last_name.value = "MerchantK";
		document.forms[0].s_address1.value = "9690 Deereco Rd";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "Timonium";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21093";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "2162162116";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20070613";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="3"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "29300";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "alison@merchant.com";
		
		document.forms[0].b_first_name.value = "ALISON";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "Tester";
		document.forms[0].b_address1.value = "3112 SICILY STREET";
		document.forms[0].b_address2.value = "#200";
		document.forms[0].b_city.value = "COSTA MESA";
		document.forms[0].b_state.value = "CA";
		document.forms[0].b_postal_code.value = "92626";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "9492590602";
		
		document.forms[0].s_first_name.value = "SAMUAEL";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTP";
		document.forms[0].s_address1.value = "3100 SICILY STREET";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "COSTA MESA";
		document.forms[0].s_state.value = "CA";
		document.forms[0].s_postal_code.value = "92626";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "2162162116";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20070613";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9854";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="4"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "93000";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "TIML@merchant.com";
		
		document.forms[0].b_first_name.value = "TIM";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "LIMIT";
		document.forms[0].b_address1.value = "7504 BELL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4436639119";
		
		document.forms[0].s_first_name.value = "TIM";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "LIMIT";
		document.forms[0].s_address1.value = "7504 BELL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "2162162116";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20070613";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "0002";
		document.forms[0].dob.value = "19720101";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="5"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
//		document.forms[0].amount.value = "93";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "ALLISSA@merchant.com";
		
		document.forms[0].b_first_name.value = "A";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTC";
		document.forms[0].b_address1.value = "7400 BELL AIR RD APT C";
		document.forms[0].b_address2.value = "APT C";
		document.forms[0].b_city.value = "BALTIMORE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21206";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439211";
		
		document.forms[0].s_first_name.value = "A";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTC";
		document.forms[0].s_address1.value = "7504 BELL AIR RD APT C";
		document.forms[0].s_address2.value = "APT C";
		document.forms[0].s_city.value = "BALTIMORE";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21206";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439211";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20070613";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9007";
		document.forms[0].dob.value = "19711207";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="6"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
//		document.forms[0].amount.value = "93";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "SAMUEL@merchant.com";
		
		document.forms[0].b_first_name.value = "SAMUEL";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "DECLINE";
		document.forms[0].b_address1.value = "7445 BELL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219229";
		
		document.forms[0].s_first_name.value = "SAMUEL";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "DECLINE";
		document.forms[0].s_address1.value = "7504 BELL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219229";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20070613";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "6541";
		document.forms[0].dob.value = "19551225";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="7"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3637";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "JOHNNYNEGATIVE@merchant.com";
		
		document.forms[0].b_first_name.value = "JOHNNY";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "NEGATIVE";
		document.forms[0].b_address1.value = "405 TOWSON AVE";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "LUTHERVILLE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4102521117";
		
		document.forms[0].s_first_name.value = "JOHNNY";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "NEGATIVE";
		document.forms[0].s_address1.value = "405 TOWSON AVE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "LUTHERVILLE";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21093";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4102521117";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20070613";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9666";
		document.forms[0].dob.value = "19710125";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="8"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "5236";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "JACKSOND@merchant.com";
		
		document.forms[0].b_first_name.value = "JACKSON";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "DECLINE";
		document.forms[0].b_address1.value = "5 SIPPLE AVE";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219235";
		
		document.forms[0].s_first_name.value = "JACKSON";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "DECLINE";
		document.forms[0].s_address1.value = "5 SIPPLE AVE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219235";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20070613";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "3257";
		document.forms[0].dob.value = "19651225";
		document.forms[0].terms_conditions.value = "32103";		
		
} else if (index=="9"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "93782";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "BRUCED@merchant.com";
		
		document.forms[0].b_first_name.value = "BRUCE";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "DECLINE";
		document.forms[0].b_address1.value = "100 SIPPLE AVE";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219268";
		
		document.forms[0].s_first_name.value = "BRUCE";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "DECLINE";
		document.forms[0].s_address1.value = "100 SIPPLE AVE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219268";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "2235";
		document.forms[0].dob.value = "19721225";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="10"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3782";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "AN@WMmerchantfoo.ent";
		
		document.forms[0].b_first_name.value = "Addy";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "Nottagood";
		document.forms[0].b_address1.value = "444 West Rd";
		document.forms[0].b_address2.value = "Suite 1240";
		document.forms[0].b_city.value = "Baltimore";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "90110";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4105777777";
		
		document.forms[0].s_first_name.value = "Addy";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "Nottagood";
		document.forms[0].s_address1.value = "444 West Rd";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "Baltimore";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "90110";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4105777777";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "1213";
		document.forms[0].dob.value = "19540407";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="11"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "9999999";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "TIM@merchant.com";
		
		document.forms[0].b_first_name.value = "TIM";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTK";
		document.forms[0].b_address1.value = "12210 MAGNOLIA BLVD";
		document.forms[0].b_address2.value = "APT 2";
		document.forms[0].b_city.value = "STUDIO CITY";
		document.forms[0].b_state.value = "CA";
		document.forms[0].b_postal_code.value = "91607";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "8184591309";
		
		document.forms[0].s_first_name.value = "SUSn";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "Howard";
		document.forms[0].s_address1.value = "12210 MAGNOLIA BLVD";
		document.forms[0].s_address2.value = "APT 2";
		document.forms[0].s_city.value = "STUDIO CITY";
		document.forms[0].s_state.value = "CA";
		document.forms[0].s_postal_code.value = "91607";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "8184591309";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "5214";
		document.forms[0].dob.value = "19790224";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="12"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "32679";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "JAN@WM_merchantfoo.ent";
		
		document.forms[0].b_first_name.value = "Jean-Alvin";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "Numerous";
		document.forms[0].b_address1.value = "123";
		document.forms[0].b_address2.value = "456";
		document.forms[0].b_city.value = "Irvine";
		document.forms[0].b_state.value = "CA";
		document.forms[0].b_postal_code.value = "92614";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "9494442222";
		
		document.forms[0].s_first_name.value = "Jean-Alvin";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "Numerous";
		document.forms[0].s_address1.value = "123";
		document.forms[0].s_address2.value = "0";
		document.forms[0].s_city.value = "Irvine";
		document.forms[0].s_state.value = "CA";
		document.forms[0].s_postal_code.value = "92614";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "9494442222";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "DIG";		
		
		document.forms[0].ssn.value = "2219";
		document.forms[0].dob.value = "19520202";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="13"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3269";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "CALL@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "CALLCENTER";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "DECLINED";
		document.forms[0].b_address1.value = "8001 BELL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439211221";
		
		document.forms[0].s_first_name.value = "CALLCENTER";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "DECLIND";
		document.forms[0].s_address1.value = "8001 BELL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439211221";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "DIG";		
		
		document.forms[0].ssn.value = "2219";
		document.forms[0].dob.value = "19520202";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="14"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3269";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "MICHAEL@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "MICHAEL";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTH";
		document.forms[0].b_address1.value = "98 MOUNT WASHINGTON PL";
		document.forms[0].b_address2.value = "APT 2";
		document.forms[0].b_city.value = "BOSTON";
		document.forms[0].b_state.value = "MA";
		document.forms[0].b_postal_code.value = "02127";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "6172590901";
		
		document.forms[0].s_first_name.value = "USER";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "LAST";
		document.forms[0].s_address1.value = "222 22 AVE.";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "ACTION";
		document.forms[0].s_state.value = "CA";
		document.forms[0].s_postal_code.value = "93510";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "6172590901";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9754";
		document.forms[0].dob.value = "19630707";
		document.forms[0].terms_conditions.value = "12103";		
		
	}  else if (index=="15"){
		document.forms[0].card_number.value = "5049901000004805";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3269";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "MICHAEL@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "MICHAEL";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTH";
		document.forms[0].b_address1.value = "98 MOUNT WASHINGTON PL";
		document.forms[0].b_address2.value = "APT 2";
		document.forms[0].b_city.value = "BOSTON";
		document.forms[0].b_state.value = "MA";
		document.forms[0].b_postal_code.value = "02127";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "6172590901";
		
		document.forms[0].s_first_name.value = "USER";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "LAST";
		document.forms[0].s_address1.value = "222 22 AVE.";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "ACTION";
		document.forms[0].s_state.value = "CA";
		document.forms[0].s_postal_code.value = "93510";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "6172590901";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9754";
		document.forms[0].dob.value = "19630707";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="16"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3269";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "MF@WMMERCHANTFOO.COM";
		
		document.forms[0].b_first_name.value = "MISSY";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "FONE";
		document.forms[0].b_address1.value = "456 MAIN ST";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "BALTIMORE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21230";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "";
		
		document.forms[0].s_first_name.value = "MISSY";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "FONE";
		document.forms[0].s_address1.value = "456 MAIN ST";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "BALTIMORE";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21230";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "3319";
		document.forms[0].dob.value = "19530303";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="17"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "32329";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "TIML@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "TIM";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "LIMIT";
		document.forms[0].b_address1.value = "7504 BEL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4436639119";
		
		document.forms[0].s_first_name.value = "TIM";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "LIMIT";
		document.forms[0].s_address1.value = "7504 BEL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4436639119";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "0002";
		document.forms[0].dob.value = "19720101";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="18"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3229";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "SARAHNEGATIVE@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "SARAH";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "NEGATIVE";
		document.forms[0].b_address1.value = "405 TOWSON AVE";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "LUTHERVILLE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4102521117";
		
		document.forms[0].s_first_name.value = "SARAH";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "NEGATIVE";
		document.forms[0].s_address1.value = "405 TOWSON AVE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "LUTHERVILLE";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21093";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4102521117";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9666";
		document.forms[0].dob.value = "19720125";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="19"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3229";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "JAMESU@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "JAMES";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "UNDERAGE";
		document.forms[0].b_address1.value = "233 SIPPLE";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219899";
		
		document.forms[0].s_first_name.value = "JAMES";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "UNDERAGE";
		document.forms[0].s_address1.value = "233 SIPPLE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219899";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9885";
		document.forms[0].dob.value = "19931225";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="20"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3229";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "JAMESU@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "JAMES";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "UNDERAGE";
		document.forms[0].b_address1.value = "233 SIPPLE";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219899";
		
		document.forms[0].s_first_name.value = "JAMES";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "UNDERAGE";
		document.forms[0].s_address1.value = "233 SIPPLE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219399";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9885";
		document.forms[0].dob.value = "19931225";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="21"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3229";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "WILSOND@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "WILSON";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "DECLINE";
		document.forms[0].b_address1.value = "201 SIPPLE";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219854";
		
		document.forms[0].s_first_name.value = "WILSON";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "DECLINE";
		document.forms[0].s_address1.value = "201 SIPPLE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219854";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9874";
		document.forms[0].dob.value = "19651225";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="22"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3229";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "SUSNB@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "SUSN";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "BLOCK";
		document.forms[0].b_address1.value = "8555 BEL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219854";
		
		document.forms[0].s_first_name.value = "SUSN";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "BLOCK";
		document.forms[0].s_address1.value = "8555 BEL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219854";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "0001";
		document.forms[0].dob.value = "19740806";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="23"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "3229";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "SUSNB@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "SUSN";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "BLOCK";
		document.forms[0].b_address1.value = "8555 BEL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439219854";
		
		document.forms[0].s_first_name.value = "SUSN";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "BLOCK";
		document.forms[0].s_address1.value = "8555 BEL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439219854";
		
		document.forms[0].promo_code.value = "Default";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "0001";
		document.forms[0].dob.value = "19740806";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="24"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "25835";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "MARK@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "MARK";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTD";
		document.forms[0].b_address1.value = "22 SANDWICH SLOPES";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "STUDIO CITY";
		document.forms[0].b_state.value = "CA";
		document.forms[0].b_postal_code.value = "91607";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "8184591309";
		
		document.forms[0].s_first_name.value = "TONY";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "BANKS";
		document.forms[0].s_address1.value = "1234 TAMARACK DRIVE";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "LINCOLN PARK";
		document.forms[0].s_state.value = "NV";
		document.forms[0].s_postal_code.value = "89413";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "8184591309";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "6574";
		document.forms[0].dob.value = "19650404";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="25"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "39835";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "mark@merchant.com";
		
		document.forms[0].b_first_name.value = "MATT";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTC";
		document.forms[0].b_address1.value = "7000 YORK RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "LUTHERVILLE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4102521000";
		
		document.forms[0].s_first_name.value = "MATT";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTC";
		document.forms[0].s_address1.value = "7000 YORK RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "LUTHERVILLE";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21093";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4102521000";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9004";
		document.forms[0].dob.value = "19711204";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="26"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "98335";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "ANDREW@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "ANDREW";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTC";
		document.forms[0].b_address1.value = "8600 BEL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4433211301";
		
		document.forms[0].s_first_name.value = "ANDREW";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTC";
		document.forms[0].s_address1.value = "8600 BEL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4433211301";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'M';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9006";
		document.forms[0].dob.value = "19711206";
		document.forms[0].terms_conditions.value = "12103";		
		
	} else if (index=="27"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "26500";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "DELL@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "DELL";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTC";
		document.forms[0].b_address1.value = "7500 BEL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "BALTIMORE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21206";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4109211903";
		
		document.forms[0].s_first_name.value = "DELL";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTC";
		document.forms[0].s_address1.value = "7500 BEL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "BALTIMORE";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21206";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4109211903";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'N';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9008";
		document.forms[0].dob.value = "19711208";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="28"){
		document.forms[0].card_number.value = "5049901000005117";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "36578";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "TEST@TEST.COM";
		
		document.forms[0].b_first_name.value = "MATT";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTC";
		document.forms[0].b_address1.value = "7000 YORK RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "LUTHERVILLE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4102521000";
		
		document.forms[0].s_first_name.value = "MATT";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTC";
		document.forms[0].s_address1.value = "7000 YORK RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "LUTHERVILLE";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21093";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4102521000";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="29"){
		document.forms[0].card_number.value = "5049901000005133";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "65783";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "TEST@TEST.COM";
		
		document.forms[0].b_first_name.value = "ANDREW";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "MERCHANTC";
		document.forms[0].b_address1.value = "8600 BEL AIR RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "NOTTINGHAM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21236";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4433211301";
		
		document.forms[0].s_first_name.value = "ANDREW";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTC";
		document.forms[0].s_address1.value = "8600 BEL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4433211301";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="30"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "65783";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		
		document.forms[0].email_address.value = "";
		
		document.forms[0].b_first_name.value = "Mr Craig";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "Baddally";
		document.forms[0].b_address1.value = "1465 Doom St";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "LUTHERVILLE";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439211111";
		
		document.forms[0].s_first_name.value = "ANDREW";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "MERCHANTC";
		document.forms[0].s_address1.value = "8600 BEL AIR RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "NOTTINGHAM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21236";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4433211301";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "9999";
		document.forms[0].dob.value = "19500101";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="31"){
		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		document.forms[0].amount.value = "65783";
		
		document.forms[0].tax_amount.value = "199";
		document.forms[0].email_address.value = "DELL@MERCHANT.COM";
		
		document.forms[0].b_first_name.value = "Mr Timothyballe";
		document.forms[0].b_middle_name.value = "W";
		document.forms[0].b_last_name.value = "Longfellowspencer Jr";
		document.forms[0].b_address1.value = "1400 South Worcestershire Blvd";
		document.forms[0].b_address2.value = "basement apartment";
		document.forms[0].b_city.value = "Baltimore";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21230";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4104994999";
		
		document.forms[0].s_first_name.value = "Sarahleejohnson";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "Longfellowspencer";
		document.forms[0].s_address1.value = "1400 South Worcestershire Blvd";
		document.forms[0].s_address2.value = "basement apartment";
		document.forms[0].s_city.value = "Baltimore";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21230";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4104994999";
		
		document.forms[0].promo_code.value = "90SAC";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "3351";
		document.forms[0].dob.value = "19500103";
		document.forms[0].terms_conditions.value = "32103";		
		
	} else if (index=="32"){
		
		document.forms[0].card_number.value = "5049900000000000";
		//document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		//document.forms[0].amount.value = "65783";
		
		document.forms[0].tax_amount.value = "199";
		document.forms[0].email_address.value = "";
		
		document.forms[0].b_first_name.value = "IRENE";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "VANNAME";
		document.forms[0].b_address1.value = "1433 RAVIDEA CIR CIR";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "YUCAIPA";
		document.forms[0].b_state.value = "CA";
		document.forms[0].b_postal_code.value = "91709";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "";
		
		document.forms[0].s_first_name.value = "";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "";
		document.forms[0].s_address1.value = "";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "";
		document.forms[0].s_state.value = "";
		document.forms[0].s_postal_code.value = "";
		document.forms[0].s_country_code.value = "";
		document.forms[0].s_phone.value = "";
		
		document.forms[0].promo_code.value = "PreApproval";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "9950";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "90005";		
		
	} else if (index=="33"){
		
		document.forms[0].card_number.value = "5049900000000000";
		//document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		//document.forms[0].amount.value = "65783";
		
		document.forms[0].tax_amount.value = "199";
		document.forms[0].email_address.value = "";
		
		document.forms[0].b_first_name.value = "COLLETTE";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "VOWLES";
		document.forms[0].b_address1.value = "753 ZDOQXW VW";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "PETALUMA";
		document.forms[0].b_state.value = "CA";
		document.forms[0].b_postal_code.value = "91710";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "";
		
		document.forms[0].s_first_name.value = "";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "";
		document.forms[0].s_address1.value = "";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "";
		document.forms[0].s_state.value = "";
		document.forms[0].s_postal_code.value = "";
		document.forms[0].s_country_code.value = "";
		document.forms[0].s_phone.value = "";
		
		document.forms[0].promo_code.value = "PreApproval";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "9950";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "90005";		
		
	} else if (index=="34"){
		
		document.forms[0].card_number.value = "5049900000000000";
		//document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		//document.forms[0].amount.value = "65783";
		
		document.forms[0].tax_amount.value = "199";
		document.forms[0].email_address.value = "";
		
		document.forms[0].b_first_name.value = "VIRGINIA";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "ATTREED";
		document.forms[0].b_address1.value = "275 E DYKE ST";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "REDWOOD CITY";
		document.forms[0].b_state.value = "CA";
		document.forms[0].b_postal_code.value = "91770";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "";
		
		document.forms[0].s_first_name.value = "";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "";
		document.forms[0].s_address1.value = "";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "";
		document.forms[0].s_state.value = "";
		document.forms[0].s_postal_code.value = "";
		document.forms[0].s_country_code.value = "";
		document.forms[0].s_phone.value = "";
		
		document.forms[0].promo_code.value = "PreApproval";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "9950";
		document.forms[0].product_code.value = "PHY";		
		
		document.forms[0].ssn.value = "";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "90005";		
		
	} else if (index=="35"){
				
		document.forms[0].card_number.value = "5049900000000000";
		//document.forms[0].order_id.value = "";
		document.forms[0].order_description.value = "";
		document.forms[0].currency_code.value = "840";
		//document.forms[0].amount.value = "65783";
		
		document.forms[0].tax_amount.value = "199";
		document.forms[0].email_address.value = "CHRIS@NEWEGG.COM";
		
		document.forms[0].b_first_name.value = "CHRIS";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "NEWEGG";
		document.forms[0].b_address1.value = "9690 DEERECO RD";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "TIMONIUM";
		document.forms[0].b_state.value = "MD";
		document.forms[0].b_postal_code.value = "21093";
		document.forms[0].b_country_code.value = "US";
		document.forms[0].b_phone.value = "4439211900";
		
		document.forms[0].s_first_name.value = "CHRIS";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value =  "NEWEGG";
		document.forms[0].s_address1.value = "9690 DEERECO RD";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "TIMONIUM";
		document.forms[0].s_state.value = "MD";
		document.forms[0].s_postal_code.value = "21093";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439211900";
		
		document.forms[0].promo_code.value = "private";
		
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year + month + day;
		
		document.forms[0].c_reg_date.value = "20071009";
		document.getElementById('c_new').value = 'E';
		document.getElementById('txn_mode').value = 'S';
		document.forms[0].category_code.value = "9950";
		document.forms[0].product_code.value = "PHY";		

		document.forms[0].ssn.value = "212557412";
		document.forms[0].dob.value = "19801111";
		document.forms[0].terms_conditions.value = "42204";	
		
		document.forms[0].household_income.value = "10000000";	
		document.forms[0].household_income_currency.value = "USD";	
		document.getElementById('residence_status').value = 'O';
		document.forms[0].business_phone.value = "4439211900";	
		
		document.getElementById('txn_type').value = 'BP';
		
	}
	
}