
function setTestCaseData(index){

	if (index=="1"){

		document.forms[0].card_number.value = "5049900000000000";
		document.forms[0].order_description.value = "Order Desc";
		document.forms[0].currency_code.value = "840";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		document.forms[0].amount.value = "2500";

		document.forms[0].email_address.value = "";
		document.forms[0].b_first_name.value = "";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "";
		document.forms[0].b_address1.value = "";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "";
		document.forms[0].b_state.value = "";
		document.forms[0].b_postal_code.value = "";
		document.forms[0].b_country_code.value = "";
		document.forms[0].b_phone.value = "";
		document.forms[0].s_first_name.value = "TEST";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "TEST";
		document.forms[0].s_address1.value = "1234 Test Rd";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "New York";
		document.forms[0].s_state.value = "NY";
		document.forms[0].s_postal_code.value = "10020";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439212001";
		document.forms[0].promo_code.value = "Business";

		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year.toString() + month.toString() + day.toString();
		
		document.forms[0].c_reg_date.value = strDate;
		document.forms[0].c_new.value = "N";
		document.forms[0].txn_mode.value = "S";
		document.forms[0].category_code.value = "1000";
		document.forms[0].product_code.value = "PHY";		
		document.forms[0].terms_conditions.value = "82103";		

		document.forms[0].business_address1.value = "";
		document.forms[0].business_address2.value = "";
		document.forms[0].business_dba_name.value = "";
		document.forms[0].business_address2.value = "";
		document.forms[0].business_legal_name.value = "";
		document.forms[0].business_city.value = "";
		document.forms[0].business_loan_type.value = "";
		document.forms[0].business_country_code.value = "";
		document.forms[0].business_num_of_employees.value = "";
		document.forms[0].business_phone.value = "";
		document.forms[0].business_type.value = "";
		document.forms[0].business_postal_code.value = "";
		document.forms[0].business_years_in_business.value = "";
		document.forms[0].business_state.value = "";
		document.forms[0].business_tax_id.value = "";
		document.forms[0].business_user_id.value = "";
		document.forms[0].business_pin.value = "";
		document.forms[0].admin_first_name.value = "";
		document.forms[0].admin_email.value = "";
		document.forms[0].admin_last_name.value = "";
		document.forms[0].admin_phone.value = "";
		document.forms[0].admin_title.value = "";
		document.forms[0].admin_fax.value = "";
		document.forms[0].pg_first_name.value = "";
		document.forms[0].pg_title.value = "";
		document.forms[0].pg_last_name.value = "";
		document.forms[0].pg_phone.value = "";
		document.forms[0].pg_address1.value = "";
		document.forms[0].pg_email.value = "";
		document.forms[0].pg_address2.value = "";
		document.forms[0].pg_date_of_birth.value = "";
		document.forms[0].pg_city.value = "";
		document.forms[0].pg_country_code.value = "";
		document.forms[0].pg_state.value = "";
		document.forms[0].pg_postal_code.value = "";
		document.forms[0].pg_ssn.value = "";

	} else if (index=="2"){

		document.forms[0].card_number.value = "";
		document.forms[0].order_description.value = "Order Desc";
		document.forms[0].currency_code.value = "840";
		document.forms[0].shipping_amount.value = "299";
		document.forms[0].tax_amount.value = "199";
		document.forms[0].email_address.value = "";
		document.forms[0].b_first_name.value = "";
		document.forms[0].b_middle_name.value = "";
		document.forms[0].b_last_name.value = "";
		document.forms[0].b_address1.value = "";
		document.forms[0].b_address2.value = "";
		document.forms[0].b_city.value = "";
		document.forms[0].b_state.value = "";
		document.forms[0].b_postal_code.value = "";
		document.forms[0].b_country_code.value = "";
		document.forms[0].b_phone.value = "";
		document.forms[0].s_first_name.value = "NOPGB";
		document.forms[0].s_middle_name.value = "";
		document.forms[0].s_last_name.value = "CENTRALA";
		document.forms[0].s_address1.value = "3501 McCormick Rd";
		document.forms[0].s_address2.value = "";
		document.forms[0].s_city.value = "New York";
		document.forms[0].s_state.value = "NY";
		document.forms[0].s_postal_code.value = "10020";
		document.forms[0].s_country_code.value = "US";
		document.forms[0].s_phone.value = "4439212001";
		document.forms[0].promo_code.value = "Business";

		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		if (day < 10){day = "0" + day;}
		if (month < 10){month = "0" + month;}
		var strDate = year.toString() + month.toString() + day.toString();
		
		document.forms[0].c_reg_date.value = strDate;
		document.forms[0].c_new.value = "N";
		document.forms[0].txn_mode.value = "S";
		document.forms[0].category_code.value = "1000";
		document.forms[0].product_code.value = "PHY";		
		document.forms[0].terms_conditions.value = "82103";		

		document.forms[0].business_address1.value = "3501 McCormick Rd";
		document.forms[0].business_address2.value = "";
		document.forms[0].business_dba_name.value = "DBA CENTRAL 2001";
		document.forms[0].business_address2.value = "";
		document.forms[0].business_legal_name.value = "CENTRAL 2001";
		document.forms[0].business_city.value = "New York";
		document.forms[0].business_loan_type.value = "REV";
		document.forms[0].business_country_code.value = "US";
		document.forms[0].business_num_of_employees.value = "56";
		document.forms[0].business_phone.value = "4439212001";
		document.forms[0].business_type.value = "GVT";
		document.forms[0].business_postal_code.value = "10020";
		document.forms[0].business_years_in_business.value = "20";
		document.forms[0].business_state.value = "NY";
		document.forms[0].business_tax_id.value = "742200001";
		document.forms[0].business_user_id.value = "";
		document.forms[0].business_pin.value = "";
		document.forms[0].admin_first_name.value = "NOPGB";
		document.forms[0].admin_email.value = "NOPGB.CENTRALA@example.com";
		document.forms[0].admin_last_name.value = "CENTRALA";
		document.forms[0].admin_phone.value = "4107682500";
		document.forms[0].admin_title.value = "General Manager";
		document.forms[0].admin_fax.value = "";
		document.forms[0].pg_first_name.value = "";
		document.forms[0].pg_title.value = "";
		document.forms[0].pg_last_name.value = "";
		document.forms[0].pg_phone.value = "";
		document.forms[0].pg_address1.value = "";
		document.forms[0].pg_email.value = "";
		document.forms[0].pg_address2.value = "";
		document.forms[0].pg_date_of_birth.value = "";
		document.forms[0].pg_city.value = "";
		document.forms[0].pg_country_code.value = "";
		document.forms[0].pg_state.value = "";
		document.forms[0].pg_postal_code.value = "";
		document.forms[0].pg_ssn.value = "";

	} else if (index=="6"){

		document.forms[0].card_number.value = "5049901000006297";
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
		
		document.forms[0].promo_code.value = "Business";
		document.forms[0].c_reg_date.value = "20050207";
		document.forms[0].c_new.value = "E";
		document.forms[0].txn_mode.value = "S";
		document.forms[0].category_code.value = "5400";
		document.forms[0].product_code.value = "PHY";		
		
		<!-- We do NOT need to pass in on existing customer -->
		document.forms[0].ssn.value = "";
		document.forms[0].dob.value = "";
		document.forms[0].terms_conditions.value = "";		
	}

}