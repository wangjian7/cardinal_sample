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
//	MESSAGE_VERSION
//		Identifies the current API version to use for processing.
//
//	TRANSACTION_URL
//		The fully qualified URL to the MAPS server. Contact Support if you need assistance in
//		determining what value to use.
//			
//		Note: For testing using the following MAPS server URL.
//		
//				https://centineltest.cardinalcommerce.com/maps/txns.asp
//			
//	PROCESSOR_ID
//		Your assigned Centinel Processor Id. Contact Support if you need assistance in
//		determining what value to use.
//
//	MERCHANT_ID
//		Your assigned Centinel Merchant Id. Contact Support if you need assistance in
//		determining what value to use.
//
//	TRANSACTION_PWD
//		Centinel Password defined within the Merchant Profile.
//
//	CENTINEL_TERM_URL
//		Represents the fully qualified address of the webpage on your website that will 
//		receive the HTTP Form POST from the ACS. This page will process the 
//		cmpi_authenticate message and receive the results.
//
//	MODAL_URL
//		Represents the fully qualified address of the webpage on your website that will 
//		be used to resize the window.
//
//	BROADCASTRESIZE_URL
//		Represents the fully qualified address of the javascript file that is used to
//		 resize the window
//
//	WIDGET_URL
//		Represents the fully qualified address of the javascript file that is used to
//		display the widget.
//
//	DEBUGOUTPUT
//		When set to "true" the widget will run in debug mode to display additional logging
//		messages. 
//
//	TIMEOUT_READ
//		Read timeout in value (ms). Timeout value related to receiving the 
//		response from the transaction url.
//
//	TIMEOUT_CONNECT
//		Connection timeout value (ms). Timeout value related to establishing 
//		a connection to the transaction url.
//
////////////////////////////////////////////////////////////////////////////////

%>
<%
	String MESSAGE_VERSION, TRANSACTION_URL, PROCESSOR_ID, MERCHANT_ID, TRANSACTION_PWD;
	String CENTINEL_TERM_URL, CENTINEL_LOOKUP_URL, MODAL_URL, BROADCASTRESIZE_URL, WIDGET_URL, DEBUGOUTPUT;
	String AUTHENTICATION_MESSAGING, MERCHANT_LOGO;
	int TIMEOUT_CONNECT, TIMEOUT_READ, WIDGET_TIMEOUT;

	MESSAGE_VERSION		= "1.7";
	TRANSACTION_URL		= "http://centineltest.cardinalcommerce.com/maps/txns.asp";
	PROCESSOR_ID		= "enter value";
	MERCHANT_ID		    = "enter value";
	TRANSACTION_PWD		= "enter value";
	CENTINEL_TERM_URL	= "http://yoursite.com/3ds/ccAuthenticate.jsp";
	CENTINEL_LOOKUP_URL	= "http://yoursite.com/3ds/ccLookup.jsp";
	MODAL_URL       	= "http://yoursite.com/3ds/ccNotify.jsp";
	BROADCASTRESIZE_URL = "https://includestest.ccdc02.com/cardinalwidget/v3/js/broadcastResize.js";
	WIDGET_URL    		= "https://includestest.ccdc02.com/cardinalwidget/v3/widgetv3.asp";
	DEBUGOUTPUT     	= "false";
    
	AUTHENTICATION_MESSAGING = "For your security, please fill out the form below to complete your order.</b><br/>Do not click the refresh or back button or this transaction may be interrupted or cancelled.";
	MERCHANT_LOGO = "../../images/merchant_logo.gif";

	// Check with Cardinal to determine appropriate Timeout period for this payment type.
	TIMEOUT_READ		= 15000;
	TIMEOUT_CONNECT		= 10000;
	WIDGET_TIMEOUT 		= 15000;

%>
