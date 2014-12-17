<%@ page language="java" %>
<%@ page session="true"%>
<%@ page import="java.net.URLDecoder.*" %>
<%@ page import="java.util.Enumeration" %>
<%@ include file="CentinelConfig.jsp" %>
<%@ include file="ccMenu.jsp" %>

<html>
<head>
<script Language="Javascript">
	
	function CopyToClipboard(text) {
		window.prompt("Please Copy to your Clipboard (Ctrl+C), Then click OK : ", text);
	}
	
	function onLoadHandler(){
		document.frmLaunch.submit();
	}
</script>

</head>
<body onLoad="onLoadHandler();">

<script>
CopyToClipboard("<% out.print(session.getAttribute("ClipboardData")); %>");
</script>

<br><br><br><br>
<center>

<form name="frmLaunch" method="Post" action="<%out.print(session.getAttribute("ACSUrl"));%>">
<noscript>
	<br><br>
	<center>
	<font color="red">
	<h1>Processing Your Transaction</h1>
	<h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
	<h3>Please click Submit to continue	the processing of your transaction.</h3>
	</font>
	<input type="submit" value="Submit">
	</center>
</noscript>

<input type=hidden name="PaReq" value="<%out.print(session.getAttribute("Payload"));%>">
<input type=hidden name="TermUrl" value="<%out.print(session.getAttribute("TermUrl"));%>">
<input type=hidden name="MD" value="Session Value">
</form>
</center>
</body>
</html>
