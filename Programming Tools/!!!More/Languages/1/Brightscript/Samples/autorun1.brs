Sub Main()

gaa =  GetGlobalAA()

gaa.vm = CreateObject("roVideoMode")
' Set up HD resolution
gaa.vm.SetMode("1920x1080x60p")

v = CreateObject("roVideoPlayer")
r1 = CreateObject("roRectangle", 0, 0, 1920, 1080)
v.SetRectangle(r1)

gaa.mp = CreateObject("roMessagePort")

' Stream hdmi-in to udp://239.194.0.202:2234
streamer = CreateObject("roMediaStreamer")
streamer.SetPipeline("hdmi:,encoder:vbitrate=5000,udp://239.194.0.202:2234")
streamer.Start()

' Create the browser object that will display the stream via html
CreateHtmlWidget("file:///index.html")

' Detect the presence of network connection
receivedIpAddr = false
nc = CreateObject("roNetworkConfiguration", 0)
currentConfig = nc.GetCurrentConfig()
if currentConfig.ip4_address <> "" then
	' We already have an IP addr
	receivedIpAddr = true
	print "=== BS: already have an IP addr: ";currentConfig.ip4_address
end if

receivedLoadFinished = false
' Wait for events
While true
	ev = gaa.mp.WaitMessage(0)
	if type(ev) = "roHdmiInputChanged" then
		aa = gaa.vm.GetHdmiInputStatus()
		if type(aa) = "roAssociativeArray" then
			print "GetHdmiInputStatus=";aa
			if aa.device_present then
				streamer.Start()
			end if
		else
			streamer.Reset()
		end if
	else if type(ev) = "roHtmlWidgetEvent" then
		eventData = ev.GetData()
		if type(eventData) = "roAssociativeArray" and type(eventData.reason) = "roString" then
			if eventData.reason = "load-error" then
				print "=== BS: HTML load error: "; eventData.message
			else if eventData.reason = "load-finished" then
				print "=== BS: Received load finished"
				receivedLoadFinished = true
			endif
		else
			print "=== BS: Unknown eventData: "; type(eventData)
		endif
	end if
	if receivedIpAddr and receivedLoadFinished then
		print "=== BS: OK to show HTML, showing widget now"
		gaa.htmlWidget.Show()
		receivedIpAddr = false
		receivedLoadFinished = false
	endif
End While

End Sub

Sub CreateHtmlWidget(url$ as String)

	gaa =  GetGlobalAA()
	width=gaa.vm.GetResX()
	height=gaa.vm.GetResY()
	rect=CreateObject("roRectangle", 0, 0, width, height)

	gaa.htmlWidget = CreateObject("roHtmlWidget", rect)
	gaa.htmlWidget.EnableSecurity(false)
	gaa.htmlWidget.SetUrl(url$)
	gaa.htmlWidget.EnableJavascript(true)
	gaa.htmlWidget.StartInspectorServer(2999)
	gaa.htmlWidget.EnableMouseEvents(true)
	gaa.htmlWidget.AllowJavaScriptUrls({ all: "*" })
	gaa.htmlWidget.setPort(gaa.mp)

End Sub
