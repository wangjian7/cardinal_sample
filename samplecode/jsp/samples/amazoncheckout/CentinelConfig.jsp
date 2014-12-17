<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  CentinelConfig.jsp
// 
// 	Usage
//
//	This configuration file centralizes all Centinel related configurables.
//	These values are required to be defined to enable the samples for work properly.
//
//      MESSAGE_VERSION
//          Identifies the current API version to use for processing.
//
//		TRANSACTION_URL
//			The fully qualified URL to the MAPS server. Contact Support if you need assistance in
//			determining what value to use.
//			
//			Note: For testing using the following MAPS server URL.
//		
//					https://centineltest.cardinalcommerce.com/maps/txns.asp
//			
//		PROCESSOR_ID
//			Your assigned Centinel Processor Id. Contact Support if you need assistance in
//			determining what value to use.
//
//		MERCHANT_ID
//			Your assigned Centinel Merchant Id. Contact Support if you need assistance in
//			determining what value to use.
//
//      TRANSACTION_PWD
//          Centinel Password defined within the Merchant Profile.
//
//		CENTINEL_TERM_URL
//			Represents the fully qualified address of the webpage on your website that will 
//			receive the HTTP Form POST from the Card Issuer ACS. This page will process the 
//			cmpi_authenticate message and receive the results of the authentication.
//
//		INITIATE_URL
//			Represents the fully qualified address of the webpage on your website that will 
//			handle the initiate order message.
//
//		AMAZON_MERCHANT_ID
//			Merchant Id associated with Amazon Merchant account.
//
//		AMAZON_JS_URL
//			Represents the fully qualified address of the Amazon javascript that is used when
//			during transaction processing.
//
//      TIMEOUT_READ
//          Connection timeout in value (ms). Timeout value related to receiving the 
//			response from the transaction url.
//
//      TIMEOUT_CONNECT
//          Connection timeout value (ms). Timeout value related to establishing 
//			a connection to the transaction url.
//
////////////////////////////////////////////////////////////////////////////////

%>
<%
	String MESSAGE_VERSION, TRANSACTION_URL, MERCHANT_ID, PROCESSOR_ID, CENTINEL_TERM_URL, TRANSACTION_PWD, INITIATE_URL, AMAZON_MERCHANT_ID, AMAZON_JS_URL;
	int TIMEOUT_CONNECT, TIMEOUT_READ;

	MESSAGE_VERSION  = "1.7";
	TRANSACTION_URL	 = "https://centineltest.cardinalcommerce.com/maps/txns.asp";
	PROCESSOR_ID	 = "enter value";
	MERCHANT_ID	 = "enter value";
	TRANSACTION_PWD  = "enter value";
	CENTINEL_TERM_URL = "http://yoursite.com/amazoncheckout/ccAuthenticate.jsp";
	INITIATE_URL 	 = "http://yoursite.com/amazoncheckout/ccInitiateOrder.jsp";
	AMAZON_MERCHANT_ID = "enter value";
	AMAZON_JS_URL = "https://static-na.payments-amazon.com/cba/js/us/sandbox/PaymentWidgets.js"; //Sandbox
	//AMAZON_JS_URL = "https://static-na.payments-amazon.com/cba/js/us/PaymentWidgets.js"; //Production
	
	// Check with Cardinal to determine appropriate Timeout period for this payment type.
	TIMEOUT_READ     = 30000;
	TIMEOUT_CONNECT  = 10000;	

%>
