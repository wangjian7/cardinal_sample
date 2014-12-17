<%@ page language="java" %>
<%@ page session="true" %>
<%
//////////////////////////////////////////////////////////////////////////////////////////////
//	CardinalCommerce (http://www.cardinalcommerce.com)
//	ccFrame.jsp
//////////////////////////////////////////////////////////////////////////////////////////////
%>

<%@ include file="../CentinelConfig.jsp" %>
<%

    String order_id = (String) session.getAttribute("Centinel_OrderId");
	if (order_id == null || order_id.length() == 0) {
	
        session.setAttribute("Message", "Order Already Processed, User Hit the Back Button");
        response.sendRedirect("../ccStart.jsp");

	}

%>
<html>
<head>
<title>Processing Your Transaction</title>
</head>
<body>

	

<table width="100%" border="0" cellpadding="1" cellspacing="0" >

  <tr valign="top"> 
	<td width="20%" align="right"><img src="<%=MERCHANT_LOGO%>"/></td>
	<td width="*"></td>
	<td width="20%"></td>
  </tr>
  <tr><td colspan="3"><hr/></td></tr>
  <tr>
<td width="20%"></td>
<td width="60%" align="center">
<IFRAME SRC="ccLaunch.jsp" WIDTH="450" HEIGHT="450" FRAMEBORDER="0">
Frames are currently disabled or not supported by your browser.  Please click <A HREF="ccLaunch.jsp">here</A> to continue processing your transaction.
</IFRAME>
</td>
</tr>
</table>


</body>
</html>