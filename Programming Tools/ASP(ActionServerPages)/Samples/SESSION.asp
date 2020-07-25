<%
If Len(Request.QueryString("name")) > 0 Then
     Session("name") = Request.QueryString("name") 
End If

Response.Write "Welcome " & Server.HTMLEncode(Session("name")) & "!"
%>