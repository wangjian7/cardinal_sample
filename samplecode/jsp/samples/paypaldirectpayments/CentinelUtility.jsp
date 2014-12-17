<%
/////////////////////////////////////////////////////////////////////////////////////////
// 	Cardinal Commerce (http://www.cardinalcommerce.com)
// 	CentinelUtility.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%!
static private final int CARD_TYPE_UNKNOWN  = 0;
static private final int CARD_TYPE_VISA     = 1;
static private final int CARD_TYPE_MC       = 2;
static private final int CARD_TYPE_JCB      = 3;
static private final int CARD_TYPE_AMEX     = 5;

private int determineCardType(String pan) {
     
	int cardType = CARD_TYPE_UNKNOWN;

	if (pan.length() == 16 && pan.startsWith("4")) {
		cardType = CARD_TYPE_VISA;
	} else if (pan.length() == 13 && pan.startsWith("5")) {
		cardType = CARD_TYPE_MC;
	} else if (pan.length() == 16 && pan.startsWith("5")) {
		cardType = CARD_TYPE_MC;
	} else if (pan.length() == 15 && pan.startsWith("2131")) {
		cardType = CARD_TYPE_JCB;
	} else if (pan.length() == 15 && pan.startsWith("1800")) {
		cardType = CARD_TYPE_JCB;
	} else if (pan.length() == 16 && pan.startsWith("3")) {
		cardType = CARD_TYPE_JCB;
	} else if (pan.length() == 15 && pan.startsWith("34")) {
		cardType = CARD_TYPE_AMEX;
	} else if (pan.length() == 15 && pan.startsWith("37")) {
		cardType = CARD_TYPE_AMEX;
	}

	return cardType;
	 
}
%>
