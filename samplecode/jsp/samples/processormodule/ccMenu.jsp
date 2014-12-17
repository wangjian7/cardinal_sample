<%@ page language="java" %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
//  Cardinal Commerce (http://www.cardinalcommerce.com)
//  ccMenu.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%!
private String randomOrderNumber(){
	int intLow;  // declare lowest number variable 
	int intHigh; // declare highest number variable

	intLow =  100000000;  // set lowest number variable
	intHigh = 999999999; // set highest number variable
    // generate a random number
	java.util.Random generator = new java.util.Random();
    String randomOrderNumber = String.valueOf(generator.nextInt(intHigh) + intLow);
	return randomOrderNumber;
}
%>


<%!
private String randomAmount(){
	int intLow;		// declare lowest number variable 
	int intHigh;	// declare highest number variable

	intLow = 100;	// set lowest number variable
	intHigh = 9999; // set highest number variable
    // generate a random number
    java.util.Random generator = new java.util.Random();
	String randomAmount = String.valueOf(generator.nextInt(intHigh) + intLow);
	return randomAmount;
}
%>



<TABLE Width="750" cellpadding="2" cellspacing="2" border="0">
<tr bgcolor="#990000">
	<td colspan="6"><font size="3" color="#ffffff"><b>Centinel - API Transactions</b></font></td>
	<td align="center"><a href="../index.html"><font color="#ffffff">Main Menu</font></a></td>
</tr>
<tr bgcolor="#e0e0e0">
	<td align="center"><a href="ccStart.jsp">Lookup/ Authenticate</a></td>
	<td align="center"><a href="ccSale.jsp">Sale</a></td>
	<td align="center"><a href="ccAuthorize.jsp">Authorize</a></td>
	<td align="center"><a href="ccReAuthorize.jsp">ReAuthorize</a></td>
	<td align="center"><a href="ccCapture.jsp">Capture</a></td>
	<td align="center"><a href="ccRefund.jsp">Refund</a></td>
	<td align="center"><a href="ccVoid.jsp">Void</a></td>
</tr>
</table>
