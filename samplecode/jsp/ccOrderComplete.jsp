<%@ page language="java" %>
<%@ page session="true"%>
<% response.setHeader("Expires", "-1"); %>
<%
/////////////////////////////////////////////////////////////////////////////////////////
// 	Cardinal Commerce (http://www.cardinalcommerce.com)
// 	ccOrderComplete.jsp
/////////////////////////////////////////////////////////////////////////////////////////
%>
<%@ include file="CentinelConfig.jsp" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../common/style.css" />
<script type="application/x-javascript" src="<%= WIDGET_URL %>"></script>
</head>
<body>
<%@ include file="ccMenu.jsp" %>
<br/>

<b>Transaction Results Page</b>
<br>
Intended to simulate an order confirmation page.

<%
        String message = (String) session.getAttribute("Centinel_Message");
        if (message != null && message.length() > 0) {
%>
<br/><br/>
	<font color="red"><b>Sample Message : <%= message%></b></font>
<br/><br/>
<%
        }
%>


<% if ( "AUTHORIZE_ACTIVATE".equalsIgnoreCase((String) session.getAttribute("Centinel_ActionCode") )){ %>

    <br /><br />
    <a href="#" onClick="runAAS('<%= CENTINEL_TERM_URL %>', '<%= MODAL_URL %>')">Activate SecureCode Now!</a>
    
    <!-- JavaScript required to initiate the Activate After Shopping (AAS) flow -->
    <script>
        function runAAS(TermUrl, ModalUrl){
            var client = CentinelWidget.CentinelGetInstance();
            
            client.Debug = <%= DEBUGOUTPUT %>;
            client.ConsolePrint = <%= DEBUGOUTPUT %>;
    
            client.AjaxData = <%= (String) session.getAttribute("Centinel_LookupResponseJSON") %>;
            client.MessageType = "AAS";
            client.TermUrl = TermUrl;
            client.ModalUrl = ModalUrl;
            
            // Modal Config
            client.RequestType = "modal";
            
            
            client.SendRequestViaBackend();
            return false;
        }
    </script>
    
<% } %>

<table id="results">
    <tr>
        <td>Enrolled</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_Enrolled") %></td>
    </tr>
    <tr>
        <td>PAResStatus</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_PAResStatus") %></td>
    </tr>
    <tr>
    <td>SignatureVerification</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_SignatureVerification") %></td>
    </tr>
        <tr>
        <td>ActionCode</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_ActionCode") %></td>
    </tr>
    </tr>
        <tr>
        <td>AuthenticationChannel</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_AuthenticationChannel") %></td>
    </tr>
    <tr>
        <td>ECI</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_ECI") %></td>
    </tr>
    <tr>
        <td>AuthenticationPath</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_AuthenticationPath") %></td>
    </tr>
    <tr>
        <td>XID</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_XID") %></td>
    </tr>
    <tr>
        <td>CAVV</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_CAVV") %></td>
    </tr>
    <tr>
        <td>ErrorNo</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_ErrorNo") %></td>
    </tr>
    <tr>
        <td>ErrorDesc</td>
        <td> : </td>
        <td><%= (String) session.getAttribute("Centinel_ErrorDesc") %></td>
    </tr>
  
<tr><td colspan="4"><br/></td></tr>
<tr><td colspan="4"><b> Lookup Transaction Request</b></td></tr>
<tr>
	<td colspan="4"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Lookup_Request")%></textarea></td>
</tr>
<tr><td colspan="4"><br/></td></tr>
<tr><td colspan="4"><b> Lookup Transaction Response</b></td></tr>
<tr>
	<td colspan="4"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Lookup_Response")%></textarea></td>
</tr>
<tr><td colspan="4"><br/></td></tr>
<tr><td colspan="4"><b> Authenticate Transaction Request</b></td></tr>
<tr>
	<td colspan="4"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Authenticate_Request")%></textarea></td>
</tr>
<tr><td colspan="4"><br/></td></tr>
<tr><td colspan="4"><b> Authenticate Transaction Response</b></td></tr>
<tr>
	<td colspan="4"><textarea cols="100" rows="20" readonly="readonly"><%=(String) session.getAttribute("Centinel_Authenticate_Response")%></textarea></td>
</tr>          

</table>
	
</body>
</html>
<%

/////////////////////////////////////////////////////////////////////////////////////////
// Remove All the Session Contents Once the Transaction Is Complete
/////////////////////////////////////////////////////////////////////////////////////////
session.removeAttribute("Centinel_Message");
session.removeAttribute("Centinel_Enrolled");
session.removeAttribute("Centinel_PAResStatus");
session.removeAttribute("Centinel_SignatureVerification");
session.removeAttribute("Centinel_ECI");
session.removeAttribute("Centinel_ErrorNo");
session.removeAttribute("Centinel_ErrorDesc");
session.removeAttribute("Centinel_TransactionId");
session.removeAttribute("Centinel_OrderId");
session.removeAttribute("Centinel_Lookup_Request");
session.removeAttribute("Centinel_Lookup_Response");
session.removeAttribute("Centinel_Authenticate_Request");
session.removeAttribute("Centinel_Authenticate_Response");
    
%>




