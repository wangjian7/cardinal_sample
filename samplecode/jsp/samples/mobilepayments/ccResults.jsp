<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
// 	Cardinal Commerce (http://www.cardinalcommerce.com)
// 	ccResults.jsp
/////////////////////////////////////////////////////////////////////////////////////////

	if (session.getAttribute("Centinel_OrderId") == null) {
	
		session.setAttribute("Message", "Order Already Processed, User Hit the Back Button");
		response.sendRedirect("ccStart.jsp");

	} else {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>

<b>Transaction Results Page</b>
<br>
Intended to simulate an order confirmation page.

<%
        String message = (String) session.getAttribute("Message");
        if (message != null && message.length() > 0) {
%>
<br/><br/>
	<font color="red"><b>Sample Message : <%= message%></b></font>
<br/><br/>
<%
        }
        	        
%>
<br/><br/>
<b> WAP Results</b>
<table>
<tr>
	<td>Request Token: </td><td><%=request.getParameter("requestToken")%></td>
</tr>
<tr>
	<td>Response Token: </td><td><%=request.getParameter("responseToken")%></td>
</tr>
<tr>
	<td>Error Number: </td><td><%=request.getParameter("errorNo")%></td>
</tr>
<tr>
	<td>Error Desc: </td><td><%=request.getParameter("errorDesc")%></td>
</tr>
</table>
<br/><br/>
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


<%
/////////////////////////////////////////////////////////////////////////////////////////
// Remove All the Session Contents Once the Transaction Is Complete
/////////////////////////////////////////////////////////////////////////////////////////

session.removeAttribute("Message");
session.removeAttribute("Centinel_Enrolled");
session.removeAttribute("Centinel_PAResStatus");
session.removeAttribute("Centinel_SignatureVerification");
session.removeAttribute("Centinel_ErrorNo");
session.removeAttribute("Centinel_ErrorDesc");
session.removeAttribute("Centinel_TransactionId");
session.removeAttribute("Centinel_OrderId");

session.removeAttribute("Centinel_Lookup_Request");
session.removeAttribute("Centinel_Lookup_Response");

}

%>
</body>
</html>








