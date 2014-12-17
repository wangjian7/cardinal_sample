<%
/////////////////////////////////////////////////////////////////////////////////////////
// Cardinal Commerce (http://www.cardinalcommerce.com)
// This configuration file centralizes all Centinel related configurables.
// These values are required to be defined to enable the samples for work properly.
//	
// Transaction Testing URL : https://centineltest.cardinalcommerce.com/maps/txns.jsp
//
// Your Production Transaction URL, Processor Id, and Merchant Id were assigned to you
// upon registration for the Cardinal Centinel service.
// 
// Term URL is the fully qualified URL to the ccAuthenticate.jsp file that is provided in theses samples.
//
////////////////////////////////////////////////////////////////////////////////
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
	CENTINEL_TERM_URL = "http://yoursite.com/klarna/ccAuthenticate.jsp";	


   //Check with Cardinal to determine appropriate Timeout period for this payment type
	RESOLVE_TIMEOUT = 30000;
	SEND_TIMEOUT    = 30000;
	CONNECT_TIMEOUT = 30000;
	RECEIVE_TIMEOUT = 30000;

	MESSAGING = "<b>Please complete the form below to complete your order.</b><br/>Do not click the refresh or " +
				"back button or this transaction may be interrupted or cancelled.";
	MERCHANT_LOGO = "../../images/merchant_logo.gif";

%>
