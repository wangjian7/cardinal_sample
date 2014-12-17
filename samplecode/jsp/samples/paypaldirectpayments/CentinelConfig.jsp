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
	String MESSAGE_VERSION, TRANSACTION_URL, MERCHANT_ID, PROCESSOR_ID, TRANSACTION_PWD;
	int TIMEOUT_CONNECT, TIMEOUT_READ;

	MESSAGE_VERSION  = "1.7";
	TRANSACTION_URL	 = "https://centineltest.cardinalcommerce.com/maps/txns.asp";
	PROCESSOR_ID	 = "enter value";
	MERCHANT_ID		 = "enter value";
	TRANSACTION_PWD  = "enter value";

	// Check with Cardinal to determine appropriate Timeout period for this payment type.
	TIMEOUT_READ     = 65000;
	TIMEOUT_CONNECT  = 10000;

%>
