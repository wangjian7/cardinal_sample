<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<% response.setHeader("Expires", "-1"); %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccPayPalGMAuthenticateUser.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>

<html>
	<Head></Head>
	<body>
		<%@ include file="ccMenu.jsp" %>

		<br/>
		<b>GMAuthenticateUser Request Form</b>
		
		<form name="frm" method="POST" action="https://mobileclient.sandbox.paypal.com/gmadapter/GMAuthenticateUser">
		<table>
			<tr>
				<td bgcolor="ffff40">Email </td>
				<td><input type="text" size="60" name="Email" value=""></td>
			</tr>
			<tr>
				<td bgcolor="ffff40">Password </td>
				<td><input type="password" size="60" name="Password" value=""></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="submit" value="Process Request"></td>
			</tr>
		</table>
		</form>
		
	</body>
</html>

