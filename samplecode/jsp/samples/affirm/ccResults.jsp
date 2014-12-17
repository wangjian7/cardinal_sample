<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="ccMenu.jsp" %>
<%@ page import="java.net.URLDecoder.*" %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
// 	Cardinal Commerce (http://www.cardinalcommerce.com)
// 	ccResults.jsp
/////////////////////////////////////////////////////////////////////////////////////////
	
	if (session.getAttribute("OrderId") == null) {
	
		session.setAttribute("Message", "Order Already Processed, User Hit the Back Button");
		response.sendRedirect("ccStart.jsp");

	} else {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
</head>
<body>

<br/>

<b>Transaction Results Page</b>
<br>
Intended to simulate an order confirmation page.

<%
        String message = (String) session.getAttribute("Message");
        if (message != null && message.length() > 0) {
%>
<br/><br/>
	<font color="red"><b>Sample Message : <%=message%></b></font>
<br/><br/>
<%
		}
%>

<b> Lookup Transaction Request</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Lookup_Request")%></textarea></td>
</tr>
</table>
<br/><br/>

<b> Lookup Transaction Response</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Lookup_Response")%></textarea></td>
</tr>
</table>
<br/><br/>

<b> Authenticate Transaction Request</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Authenticate_Request")%></textarea></td>
</tr>
</table>
<br/><br/>

<b> Authenticate Transaction Response</b>
<table>
<tr>
	<td colspan="2"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Authenticate_Response")%></textarea></td>
</tr>
</table>

<%
/////////////////////////////////////////////////////////////////////////////////////////
// Remove All the Session Contents Once the Transaction Is Complete
/////////////////////////////////////////////////////////////////////////////////////////

session.removeAttribute("Message");
session.removeAttribute("Enrolled");
session.removeAttribute("Centinel_PAResStatus");
session.removeAttribute("Centinel_SignatureVerification");
session.removeAttribute("ErrorNo");
session.removeAttribute("ErrorDesc");
session.removeAttribute("TransactionId");
session.removeAttribute("OrderId");

session.removeAttribute("Centinel_Lookup_Request");
session.removeAttribute("Centinel_Lookup_Response");
session.removeAttribute("Centinel_Authenticate_Request");
session.removeAttribute("Centinel_Authenticate_Response");

}

%>
</body>
</html>








