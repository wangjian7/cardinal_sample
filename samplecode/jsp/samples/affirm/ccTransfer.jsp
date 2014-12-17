<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.net.URLDecoder.*" %>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>
<% response.setHeader("Expires", "-1"); %>


<html>
<head>
<script Language="Javascript">
<!--
	function onLoadHandler(){
		document.frmLaunch.submit();
	}
//-->
</script>
</head>

<body onLoad="onLoadHandler();">
<br><br><br><br>
<center>
<FORM name="frmLaunch" method="Post" action="<%= java.net.URLDecoder.decode( (String) session.getAttribute("ACSUrl")) %>">
<noscript>
	<br><br>
	<center>
	<font color="red">
	<h1>Processing Your Transaction</h1>
	<h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
	<h3>Please click Submit to continue the processing of your transaction.</h3>
	</font>
	<input type="submit" value="Submit">
	</center>
</noscript>
<input type=hidden name="PaReq" value="<%= (String) session.getAttribute("Payload") %>">
<input type=hidden name="TermUrl" value="<%= (String) session.getAttribute("TermURL") %>">
</FORM>
</center>
</body>
</html>
