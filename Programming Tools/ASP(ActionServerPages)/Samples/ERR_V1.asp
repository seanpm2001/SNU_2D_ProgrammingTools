<%
On Error Resume Next

Response.Write 1 / 0 ' Division by zero

If Err.Number <> 0 Then
     Response.Write "Error Code: " & Server.HTMLEncode(Err.Number) & "<br />"
     Response.Write "Error Source: " & Server.HTMLEncode(Err.Source) & "<br />"
     Response.Write "Error Description: " & Server.HTMLEncode(Err.Description) & "<br />"
     Err.Clear 
End If 
%>