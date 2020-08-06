 <% Option Explicit %>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <html>

 	<head>

 		<title>VBScript Example</title>

 	</head>

 	<body>

        <div><% 

 		' Grab current time from Now() function.

                ' An '=' sign occurring after a context switch (<%) is shorthand 

                ' for a call to the Write() method of the Response object.

 		Dim timeValue = Now %>

 		The time, in 24-hour format, is 

                <%=Hour(timeValue)%>:<%=Minute(timeValue)%>:<%=Second(timeValue)%>.

        </div>

 	</body>

 </html>