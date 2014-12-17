<%
//////////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	CentinelConfig.php
//	Configuration file for Thin Client Integrations
//
//	Usage
//		Configuration file centralizes integration paramaters for easy management. Each variable
//      is required.
//		Note: Curl thin client does not use  CENTINEL_TIMEOUT_CONNECT
//
//		PROCESSOR_ID
//			Your assigned Centinel Processor Id. Contact Support if you need assistance in
//          determining what value to use.
//
//      MERCHANT_ID
//			Your assigned Centinel Merchant Id. Contact Support if you need assistance in
//          determining what value to use.
//
//      TRANSACTION_PWD
//          Transaction password defined by the merchant within the merchant profile. Note that this
//          is NOT your user password. Contact Support if you need assistance in
//            determining what value to use.
//
//		MAPS_URL
//			The fully qualified URL to the MAPS server. Contact Support if you need assistance in
//          determining what value to use.
//
//          Note: For testing use the following MAPS server URL.
//
//          https://centineltest.cardinalcommerce.com/maps/txns.asp
//
//		CENTINEL_TERM_URL
//          Represents the fully qualified address of the webpage on your website that will
//          receive the HTTP Form POST from the Centinel System. This page will process the
//			cmpi_authenticate message and receive the results of the authentication.
//
//		DEMO_TERM_URL
//          Represents the fully qualified address of the webpage on your website that will
//          receive the HTTP Form POST from the Centinel System. This page will process the
//			cmpi_authenticate message and receive the results of the authentication for the demo.
//
//      RECEIVE_TIMEOUT
//          Connection timeout in value seconds. Timeout value related to receiving the
//          response from the transaction url.
//
//		CONNECT_TIMEOUT
//          Connection timeout in value seconds. Timeout value related to establishing
//          a connection to the transaction url.
//
//
//////////////////////////////////////////////////////////////////////////////////////////////
%>

<%
	String MESSAGE_VERSION, TRANSACTION_URL, MERCHANT_ID, PROCESSOR_ID, CENTINEL_TERM_URL, TRANSACTION_PWD;
	String MESSAGING, MERCHANT_LOGO;
	int RESOLVE_TIMEOUT, SEND_TIMEOUT, CONNECT_TIMEOUT, RECEIVE_TIMEOUT;

	MESSAGE_VERSION  = "1.7";
	TRANSACTION_URL	 = "https://centineltest.cardinalcommerce.com/maps/txns.asp";
	PROCESSOR_ID	 = "enter value";
	MERCHANT_ID	     = "enter value";
	TRANSACTION_PWD  = "enter value";
	CENTINEL_TERM_URL = "http://yoursite.com/affirm/ccAuthenticate.jsp";	

   //Check with Cardinal to determine appropriate Timeout period for this payment type
	CONNECT_TIMEOUT = 5000;
	RECEIVE_TIMEOUT = 15000;
%>
