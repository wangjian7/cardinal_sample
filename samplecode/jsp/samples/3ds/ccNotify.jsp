<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.net.URLDecoder.*" %>

<%@ include file="CentinelConfig.jsp" %>
<%@ include file="CentinelUtility.jsp" %>

<%
/////////////////////////////////////////////////////////////////////////////////////////
//   Cardinal Commerce (http://www.cardinalcommerce.com)
//   ccNotify.jsp
// 
// 	Usage
//		A page on the same domain as the merchant site. The widget uses this page as a base for creating and sending requests from iframes
//		This prevents some errors and warnings in some versions of IE
//		Additionally this page is used to contact the Widget during a resize operation - Please be sure to include the broadcastResize.js file.
// 
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
	<head>
		<script type="text/javascript" src="<%= BROADCASTRESIZE_URL %>"></script>
	</head>
	<body onLoad="retrieveFrameIdAndHeight()" style="background-color: transparent"></body>
</html>