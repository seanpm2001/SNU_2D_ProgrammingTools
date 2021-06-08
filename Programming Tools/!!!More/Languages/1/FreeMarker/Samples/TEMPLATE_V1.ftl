<html>
<body>
<p>Hello ${name}! You have the following messages:
<#list messages as m>
  <p><b>${m.from}:</b> ${m.body}</p>
</#list>
</p>
</body>
</html>

