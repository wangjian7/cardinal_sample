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
  <tr valign="top"> 
	<td width="20%" align="right"></td>
	<td width="60%" align="center">
	<font size="2" color="#000000" face="Arial, Helvetica, sans-serif">
	<%=BILLMELATER_MESSAGING%>
	</font>
	</td>

  </tr>
</table>


<IFRAME SRC="ccLaunch.jsp" WIDTH="100%" HEIGHT="80%" FRAMEBORDER="0">
If you can see this, your browser doesn't 
understand IFRAME.  However, we'll still 
<A HREF="ccLaunch.jsp">link</A> 
you to the file.
</IFRAME>


</body>
</html>