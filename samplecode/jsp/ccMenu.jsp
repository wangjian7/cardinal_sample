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



<table width="750" cellpadding="2" cellspacing="0" border="0">
	<tr bgcolor="#990000">
		<td><font color="#FFFFFF"><b>Centinel API Messages - Payer Authentication</b></font></td>
		<td align="right"><a href="../index.html"><font color="#FFFFFF"><b>Main Menu</b></font></a></td>
	</tr>
	<tr align="center" bgcolor="#E0E0E0">
		<td colspan="2"><a href="ccStart.jsp">Lookup / Authenticate</a></td>
	</tr>
</table>
