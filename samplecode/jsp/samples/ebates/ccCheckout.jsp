<%@ page language="java" %>
<%@ page session="true"%>
<%@ include file="CentinelConfig.jsp" %>
<jsp:useBean id="centinelRequest" scope="page" class="com.cardinalcommerce.client.CentinelRequest" />
<jsp:useBean id="centinelResponse" scope="page" class="com.cardinalcommerce.client.CentinelResponse" />
<%
/////////////////////////////////////////////////////////////////////////////////////////
//	Cardinal Commerce (http://www.cardinalcommerce.com)
//	ccCheckout.jsp
/////////////////////////////////////////////////////////////////////////////////////////%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
    <title>Centinel - Merchant Webstore Checkout</title>
    
    <script type="text/javascript" src="../common/util.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            document.frm.amount.value = randomAmount();
            document.frm.order_number.value = randomOrderNumber();

        } // end onLoad
    </script>

</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>
<b>Merchant Webstore Checkout</b>
<br/>
This page simulates your webstore checkout page after the consumer has been redirected over from Ebates.
<br/>
<br/>
    <form name="frm"method="POST" action="ccOrderComplete.jsp">

        <table>
            <tr>
                <td bgcolor="ffff40" width="150">Amount</td><td><input type="text" name="amount" value=""></td>
            </tr>
            <tr>
                <td bgcolor="ffff40" width="150">OrderNumber</td><td><input type="text" name="order_number" value=""></td>
            </tr>
            <tr>
                <td bgcolor="ffff40" width="150">CurrencyCode</td><td><input type="text" name="currency_code" value="840"></td>
            </tr>
            <tr>
                <td width="150">Ebates SessionId</td><td><input type="text" disabled="disabled" name="sid" value="<%=request.getParameter("sid")%>"></td>
            </tr>
        <tr>
            <td>&nbsp;</td><td></td>
            <td>&nbsp;</td><td></td>
        </tr>
        <tr>
          <td></td>
          <td colspan="" align="center"><input type=submit name="submit" value="Submit Order"></td>
        </tr>
        <tr>
          <td colspan="2"><br><b><i>Required fields highlighted</i></b></td>
        </tr>
        </table>
    </form>

</body>
</html>
