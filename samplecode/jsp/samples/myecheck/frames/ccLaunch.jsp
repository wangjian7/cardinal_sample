<%@ page language="java" %>
<%@ page session="true" %>
<%
//////////////////////////////////////////////////////////////////////////////////////////////
// 	Cardinal Commerce (http://www.cardinalcommerce.com)
// 	ccLaunch.jsp
//////////////////////////////////////////////////////////////////////////////////////////////
%>
<%@ include file="../CentinelConfig.jsp" %>

<html>
<head>
<script Language="Javascript">
<!--
	function onLoadHandler(){
		document.frmLaunchACS.submit();
	}
//-->
</script>
</head>
<body onLoad="onLoadHandler();">
<center>

<form name="frmLaunchACS" method="Post" action="<%= (String) session.getAttribute("Centinel_ACSURL") %>">
    <noscript>
        <br><br>
        <center>
        <font color="red">
        <h1>Processing your Transaction</h1>
        <h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
        <h3>Please click Submit to continue	the processing of your transaction.</h3>
        </font>
        <input type="submit" value="Submit">
        </center>
    </noscript>
    <input type=hidden name="PaReq" value="<%= (String) session.getAttribute("Centinel_PAYLOAD") %>">
    <input type=hidden name="TermUrl" value="<%= (String) session.getAttribute("Centinel_TermURL") %>">
    <input type=hidden name="MD" value="Session Value">
</form>
</center>
</body>
</html>
