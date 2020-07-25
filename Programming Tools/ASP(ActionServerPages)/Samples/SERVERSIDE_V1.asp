<%
Dim oAdoCon, oAdoRec, oAdoStm, oCdoCon, oCdoMsg, oSciDic, oSciFsm, oMswAdr

Set oAdoCon = Server.CreateObject("ADODB.Connection")
Set oAdoRec = Server.CreateObject("ADODB.Recordset")
Set oAdoStm = Server.CreateObject("ADODB.Stream")
Set oCdoCon = Server.CreateObject("CDO.Configuration")
Set oCdoMsg = Server.CreateObject("CDO.Message")
Set oSciDic = Server.CreateObject("Scripting.Dictionary")
Set oSciFsm = Server.CreateObject("Scripting.FileSystemObject")
Set oMswAdr = Server.CreateObject("MSWC.Swingbridge")
%>