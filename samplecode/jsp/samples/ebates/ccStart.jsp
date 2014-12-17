<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%@ include file="CentinelConfig.jsp" %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccStart.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
<head>
    <title>Centinel - Ebates Click Simulator</title>   
	<link rel="stylesheet" type="text/css" href="../common/style.css" />
	<script type="text/javascript" src="../common/util.js"></script>
    <script type="text/javascript">
        window.onload = function() {
			document.frm.onsubmit = singleSubmit("frm");
            document.frm.sid.value = randomEbatesSid();
        } // end onLoad
    </script>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Lookup Transaction Form</b>
<br/>
This page will simulate a request from Ebates being redirected to your webstore.
<br/>
<br/>
    <form name="frm" method="get" action="<%=EBATESREDIRECTURL%>">
        <input type="hidden" name="sid" value=""></td>
        <input type="hidden" name="mid" value="<%=MERCHANT_ID%>"></td>
        <input type="hidden" name="pid" value="<%=PROCESSOR_ID%>"></td>
        <input type="hidden" name="merchant_url" value="<%=CENTINEL_TERM_URL%>"></td>

        <table>
        <tr>
            <td bgcolor="ffff40" width="150">Commission Percent</td><td><input type="text" name="cp" value="70000"></td>
        </tr>
        <tr>
            <td>&nbsp;</td><td></td>
            <td>&nbsp;</td><td></td>
        </tr>
        <tr>
          <td></td>
          <td colspan="" align="center"><input type=submit name="submit" value="Buy"></td>
        </tr>
        <tr>
          <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
        </tr>
        </table>
    </form>

</body>
</html>
