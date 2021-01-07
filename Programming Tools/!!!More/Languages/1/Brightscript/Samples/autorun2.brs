Sub Main()

vm = CreateObject("roVideoMode")
' Set up HD resolution
vm.SetMode("1920x1080x60p")

v = CreateObject("roVideoPlayer")
r1 = CreateObject("roRectangle", 0, 0, 1920, 1080)
v.SetRectangle(r1)

mp = CreateObject("roMessagePort")

' Stream hdmi-in to udp://239.194.0.202:2234
streamer = CreateObject("roMediaStreamer")
streamer.SetPipeline("hdmi:,encoder:vbitrate=5000,udp://239.194.0.202:2234")
streamer.Start()

' Set up a timer to tune the stream. If it's not yet available, we will retry every second
timer = CreateObject("roTimer")
timer.SetPort(mp)
timer.SetElapsed(1, 0)

' Decode the hdmi-in stream
rtspStream = CreateObject("roRtspStream", "udp://239.194.0.202:2234")
aa = {}
aa["Rtsp"] = rtspStream

ok = v.PlayFile(aa)
if ok then
	print "=== Up and running!"
else
	print "=== Starting timer"
	timer.Start()
end if

' Wait for events
While true
	ev = mp.WaitMessage(0)
	if type(ev) = "roTimerEvent" then
		' Try tuning to the stream. If it's not yet available, we will retry every second
		ok = v.PlayFile(aa)
		if ok then
			print "=== Up and running!"
		else
			print "=== Starting timer to try again"
			timer.Start()
		end if
	else if type(ev) = "roHdmiInputChanged" then
		' If the user plugs in the hdmi cable to hdmi-in after boot-up, this will handle it
		aa2 = vm.GetHdmiInputStatus()
		if type(aa2) = "roAssociativeArray" then
			print "GetHdmiInputStatus=";aa2
			if aa2.device_present then
				' Start the stream once hdmi-in is detected
				streamer.Start()
			end if
		else
			streamer.Reset()
		end if
	end if
End While

End Sub



