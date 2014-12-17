<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccOrderComplete.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<%

centinelRequest.add("Amount", request.getParameter("amount"));
centinelRequest.add("OrderNumber", request.getParameter("order_number"));
centinelRequest.add("CurrencyCode", request.getParameter("currency_code"));

String ebatesPayload = centinelRequest.generatePayload(TRANSACTION_PWD);

centinelRequest = null;

%>

<html>

<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<title>Centinel - Merchant Webstore Order Complete Page</title>

    <script type="text/javascript" src="ebates-complete.js"></script>
    <script type="text/javascript">
   
        window.onload = function() {
            EBates.complete(
                {
                    Url             : "<%=EBATESORDERCOMPLETE%>",
                    Payload         : "<%=ebatesPayload%>"
                }
            );
        }

    </script>

</head>

<body>
<%@ include file="ccMenu.jsp" %>
<br/>

<b>Transaction Results Page</b>
<br>
    <br/>
        <b>Merchant Webstore Order Complete Page</b>
    <br/>
        This page simulates your webstore order complete page.
    <br/><br/>

    <table id="results">
        <tr>
            <td><b>Amount</b></td>
            <td> : </td>
            <td><%=request.getParameter("amount")%></td>
        </tr>
        <tr>
            <td><b>OrderNumber</b></td>
            <td> : </td>
            <td><%=request.getParameter("order_number")%></td>
        </tr>
        <tr>
            <td><b>CurrencyCode</b></td>
            <td> : </td>
            <td><%=request.getParameter("currency_code")%></td>
        </tr>
    
    </table>

    <br />
    <div style="color: red; font-size: 14pt; font-weight: bold;">Thank you for your order!</div>

</body>
</html>
