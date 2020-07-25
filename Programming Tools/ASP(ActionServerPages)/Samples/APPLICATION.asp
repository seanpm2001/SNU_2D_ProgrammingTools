<%
Application("Ali") = "My ASP Application"
Response.Write "Welcome to " & Server.HTMLEncode(Application("Ali")) & "!"
%>