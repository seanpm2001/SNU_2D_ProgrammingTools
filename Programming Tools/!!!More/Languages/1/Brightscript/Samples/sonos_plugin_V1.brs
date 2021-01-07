' Plug-in script for BA 3.7.0.6 and greater

Function sonos_Initialize(msgPort As Object, userVariables As Object, bsp as Object)

    print "Sonos_Initialize - entry"
    print "type of msgPort is ";type(msgPort)
    print "type of userVariables is ";type(userVariables)

    Sonos = newSonos(msgPort, userVariables, bsp)

    return Sonos

End Function


Function newSonos(msgPort As Object, userVariables As Object, bsp as Object)
	print "initSonos"

	' Create the object to return and set it up
	s = {}
	s.msgPort = msgPort
	s.userVariables = userVariables
	s.bsp = bsp
	s.ProcessEvent = sonos_ProcessEvent
	s.objectName = "sonos_object"
	s.disco = invalid 

	' Create timer to renew register events, we will renew every hour at 15 mins past the hour
	s.timer=CreateObject("roTimer")  
	s.timer.SetPort(msgPort) 
	s.timer.SetDate(-1, -1, -1) 
	s.timer.SetTime(-1, 25, 0, 0) 
	s.timer.Start()


	' Need to remove once all instances of this are taken out of the Sonos code
    s.mp = msgPort

	' Create the http server for this app, use port 111 since 80 will be used by DWS
	s.server = CreateObject("roHttpServer", { port: 111 })
	if (s.server = invalid) then
		print "Unable to create server on port 111"
		stop
	end if
	s.server.SetPort(msgPort)

	' Create the arrary to hold the Sonos devices
	s.sonosDevices = CreateObject("roArray",1, True)

	' Create the array to hold all UPnP devices found
	s.devices = CreateObject("roArray",1, True)

	' Create an array to hold roUrlTransferObject that are being used by the SOAP commands
	s.xferObjects = createObject("roArray",0, true)

	' Create an array to hold commands that have come in when the device is busy processing other commands
	s.commandQ = createObject("roArray",0, true)

	' Create the UDP receiver port for the Sonos commands
	s.udpReceiverPort = 21000
    s.udpReceiver = CreateObject("roDatagramReceiver", s.udpReceiverPort)
    s.udpReceiver.SetPort(msgPort)

	return s
End Function


Function sonos_ProcessEvent(event As Object) as boolean

	retval = false
    ' print "Sonos_ProcessEvent - entry"
    ' print "type of m is ";type(m)
    print "Sonos_ProcessEvent - type of event is ";type(event)

	if type(event) = "roDatagramEvent" and type(event.GetUserData()) = "roAssociativeArray" and type(event.GetUserData().OnEvent) = "roFunction" then
		event.GetUserData().OnEvent(event)
		retval = true
	else if type(event) = "roDatagramEvent" then
		retval = ParseSonosUDP(event, m)
	else if (type(event) = "roUrlEvent") and (type(event.GetUserData()) = "roAssociativeArray") and (event.GetUserData().objectName = "sonos_object") then
		print "Got roUrlEvent - now processing the XML"
		UPNPDiscoverer_ProcessDeviceXML(event)
		retval = true
	else if (type(event) = "roUrlEvent") then
		print "*****  Got roUrlEvent in Sonos"	
		retval = HandleSonosXferEvent(event, m)
	else if type(event) = "roHttpEvent" then
		print "roHttp event received in Sonos processing"
	else if type(event) = "roTimerEvent" then
		if (event.GetSourceIdentity() = m.timer.GetIdentity()) then
			print "renewing for registering events"
			SonosRenewRegisterForEvents(m)
			retval = true
		end if
	end if

	return retval

End Function


Sub isSonosDevicePresent(s as object , devType as string ) as boolean

	found = false
	sonosDevice = invalid
	for each device in s.sonosDevices
		if device.modelNumber = devType
			found = true			
		endif
	end for

	' if (not found) then
		' print "Count not find ";devType;" in scanned device list"
	' else
		' print "Found ";devType;" in scanned device list"
	' end if

	return found
End Sub


Sub FindAllSonosDevices(s as Object) 
	print "FindAllSonosDevices"

	devices = s.devices
    CreateUPnPDiscoverer(s.msgPort, OnFound, s)
    s.disco.Discover("upnp:rootdevice")

	' make sure we don't leak roDatagramSockets on multiple tries to find units
	' disco.sock.SetUserData(invalid)

End Sub



Sub UPnPDiscoverer_OnEvent(ev as Object)
	'print "UPnPDiscoverer_OnEvent"
	response = ev.GetString()

	m.callback(response)
End Sub

Sub UPnPDiscoverer_Discover(name as String)
    lf = chr(10)
    q = chr(34)

    packet = ""
    packet = packet + "M-SEARCH * HTTP/1.1" + lf
    packet = packet + "ST: " + name + lf
    packet = packet + "MX: 5" + lf
    packet = packet + "MAN: " + q + "ssdp:discover" + q + lf
    packet = packet + "HOST: 239.255.255.250:1900" + lf

    count = 0
	ready = false
	while not ready 
		ret=m.sock.SendTo("239.255.255.250", 1900, packet)
		if ret < 0 then
    		print "ERROR SENDING: " + str(ret) 
 			print m.sock.GetFailureReason()
		end if

		' -128 indicates the network is not up
		if ret = -128 then
    		sleep(2000)
    		count = count+1
    		if count > 200 then
    			stop
			end if
		else
			ready = true
		end if
	end while

End Sub



Sub CreateUPnPDiscoverer(mp as Object, callback as Object, s as object) 
	if (s.disco = invalid) then
		o = {}
		o.sock = CreateObject("roDatagramSocket")
		o.sock.SetUserData(o)
		o.OnEvent = UPnPDiscoverer_OnEvent
		o.Discover = UPnPDiscoverer_Discover
		o.callback = callback
		o.ProcessDeviceXML = UPNPDiscoverer_ProcessDeviceXML
		o.mp = mp
		o.list = s.devices
		o.s = s

		o.sock.BindToLocalPort(1900)
		o.port = o.sock.GetLocalPort()
		o.sock.SetPort(mp)
		o.sock.JoinMulticastGroup("239.255.255.250")
		s.disco = o
	end if
End Sub
   

Sub OnFound(response as String)
    'print "Found:"
    ' print response

	uuidString="none"

	' Ignore M-Search requests...
	if left(response,8) = "M-SEARCH"  
		print "Ignoring M-search"
	else if left(response, 15) = "HTTP/1.1 200 OK" then
		SendXMLQuery(m.s, response)
	else if left(response, 6) = "NOTIFY" then
		'print "Received NOTIFY event"
		hhid=GetHouseholdFromUPNPMessage(response)
		responseLocation = GetLocationFromUPNPMessage(response)
		responseBaseURL = GetBaseURLFromLocation(responseLocation)
		sonosDevice = invalid
		for i = 0 to m.s.sonosDevices.count() - 1
			if m.s.sonosDevices[i].baseURL = responseBaseURL then
				sonosDevice = m.s.sonosDevices[i]
				sonosDeviceIndex = i				
			endif
		end for

		byebyeFound = instr(1,response,"NTS: ssdp:byebye")
		if (byebyeFound) then
			'print "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  Received ssdp:byebye"
			rootDeviceString = instr(1,response,"NT: upnp:rootdevice")
			if(rootDeviceString) then
				uuidStart=instr(1,response,"USN: uuid:")
				if (uuidStart) then 
					uuidStart=uuidStart+10
					uuidEnd=instr(uuidStart,response,"::")
					uuidString=mid(response,uuidStart,uuidEnd-uuidStart)
					'print "uuid: "+uuidString
					for i = 0 to m.s.sonosDevices.count() - 1
						if (uuidString=m.s.sonosDevices[i].uuid)then
							print "deleting player "+m.s.sonosDevices[i].modelNumber+"with uuid: " + uuidString + m.s.sonosDevices.delete(i)
						end if
					end for
				end if
			end if
		else if (sonosDevice <> invalid) then
			aliveFound = instr(1,response,"NTS: ssdp:alive")
			if (aliveFound) then
				print "Received ssdp:alive, device already in list "; responseBaseURL
			end if
		end if
    end if

End Sub

Sub SendXMLQuery(s as object, response as string)
	Query = {}
	Query.response = response
	Query.hhid = GetHouseholdFromUPNPMessage(response)
	Query.location = GetLocationFromUPNPMessage(response)
	Query.transfer = CreateObject("roURLTransfer")
	Query.transfer.SetURL(Query.location)
	Query.transfer.SetPort(s.mp)
	Query.transfer.SetUserData(s)
	Query.complete = false
	Query.sonosDevice = false

	print "sending Query, location: ";Query.location
	print "initial response was:"
	print response

	Query.uuid = ""
	rootDeviceString = instr(1,response,"ST: upnp:rootdevice")
	if(rootDeviceString) then
		uuidStart=instr(1,response,"USN: uuid:")
		if (uuidStart) then 
			uuidStart=uuidStart+10
			uuidEnd=instr(uuidStart,response,"::")
			uuidString=mid(response,uuidStart,uuidEnd-uuidStart)
			print "uuid: "+uuidString
			Query.uuid = uuidString
		end if
	end if

	print "**************"
	good = Query.transfer.AsyncGetToObject("roXMLElement")
	if (good) then 
		print "XML Query sent"
		s.devices.push(Query)
	else
		print "**** XML Query NOT Sent ****"
	end if
end sub

Function GetHouseholdFromUPNPMessage(response as String) as string
''	print "GetHouseholdFromUPNPMessage"
''	print "["+response+"]"
	household_string="X-RINCON-HOUSEHOLD:"
	lens=len(household_string)
	start = instr(1,response,household_string)
	if start=0
	  return ""
	end if
	last = instr(start+lens+1,response, chr(13))
	untrimmed = mid(response, start, last-start)
	hhid = untrimmed.trim()
''	print "HHID: "+hhid
	return hhid
end Function

Function GetLocationFromUPNPMessage(response as String) as string
	lowerCase = lcase(response)
	start = instr(1,lowerCase,"location:") + 9
	last = instr(start+1,lowerCase, chr(13))
	untrimmed = mid(response, start, last-start)
	location = untrimmed.trim()

	return location
end Function

Function GetBaseURLFromLocation(location as string) as string
	baseURL = left(location, instr(8, location, "/")-1)	

	return baseURL
end Function


Sub UPNPDiscoverer_ProcessDeviceXML(ev as Object)
	print "UPNPDiscoverer_ProcessDeviceXML"
	s = ev.GetUserData()
	deviceList = s.devices
	deviceXML = ev.GetObject()
	print deviceXML
	deviceTransferID = ev.GetSourceIdentity()

	if ev.GetResponseCode() / 100 <> 2 then
	    print "Retrieve device descriptor failed: "; ev.GetFailureReason();" response code:";ev.GetResponseCode()
		print "User data on the request was:"
		print s.response
	    return
	end if
	
	i = 0
	found = false
	numDevices = deviceList.count()
	print "Num devices = ";numDevices
	while (i < numDevices) and (not found)
		id = deviceList[i].transfer.GetIdentity()
		if (id = deviceTransferID) then
			print "device matches transfer ID"
			found = true
			deviceList[i].complete = true
			deviceMfg = deviceXML.device.manufacturer.gettext()
			if (instr(1, deviceMfg, "Sonos")) then
				print "Found Sonos device on device XML"
				baseURL = GetBaseURLFromLocation(deviceList[i].location)
				model = GetPlayerModelByBaseIP(s.sonosDevices, baseURL)				
				if (model = "") then
					deviceList[i].deviceXML = deviceXML
					model = deviceXML.device.modelNumber.getText()
					print "Adding player ";model;" at ";baseURL
					SonosDevice = newSonosDevice(deviceList[i])
					s.sonosDevices.push(SonosDevice)

					' Register Events from the Sonos Devices and set user variables
					' print "subscribing for events from: " + SonosDevice.baseURL +" ("+ SonosDevice.UDN+")"
					SonosRegisterForEvents(s, s.mp, SonosDevice)
					if (s.userVariables[SonosDevice.modelNumber] <> invalid) then
						s.userVariables[SonosDevice.modelNumber].currentValue$ = "present"
					end if
				else
					print "Player ";model;" already exists in device list"
				end if
			end if
			deviceList.delete(i)
		end if
		i = i + 1
	end while
	if (not found) then
		stop
		print "Was unable to find a match for transfer"
	end if
end Sub	

Sub PopulateSonosDevices( allDevices as Object, sonosDevices as Object)
	
	SonosIndex = 0
	for i = 0 to allDevices.count() - 1
		if (allDevices[i].sonosDevice) then
			sonosDevices[SonosIndex] = newSonosDevice(allDevices[i])
			SonosIndex = SonosIndex + 1
		end if
	end for
end Sub

Sub newSonosDevice(device as Object) as Object
	sonosDevice = { baseURL: "", deviceXML: invalid, modelNumber: "", modelDescription: "", UDN: "", deviceType: "", hhid: "", uuid: "", avTransportSID: "",renderingSID: "" }

	sonosDevice.baseURL = GetBaseURLFromLocation(device.location)
	sonosDevice.deviceXML = device.deviceXML
	sonosDevice.modelNumber = lcase(device.deviceXML.device.modelNumber.getText())
	sonosDevice.modelDescription = lcase(device.deviceXML.device.modelDescription.getText())
	sonosDevice.UDN = mid(device.deviceXML.device.UDN.getText(),6)
	sonosDevice.deviceType = device.deviceXML.device.deviceType.getText()
	sonosDevice.volume=-1
	sonosDevice.rdm=-1
	sonosDevice.mute=-1
	sonosDevice.transportState = "STOPPED"
	sonosDevice.hhid=device.hhid
	sonosDevice.uuid=device.uuid


	print "*************************************************"
	print "device HHID: "+sonosDevice.hhid
	print "device UUID: "+sonosDevice.uuid

	return sonosDevice
end Sub

Sub GetPlayerModelByBaseIP(sonosDevices as Object, IP as string) as string
	
	returnModel = ""
	for i = 0 to sonosDevices.count() - 1
		if (sonosDevices[i].baseURL = IP) then
			returnModel = sonosDevices[i].modelNumber
		end if
	end for

	return returnModel
end sub


Sub GetBaseIPByPlayerModel(sonosDevices as Object, modelNumber as string) as string
	
	newIP = ""
	for i = 0 to sonosDevices.count() - 1
		if (sonosDevices[i].modelNumber = modelNumber) then
			newIP = sonosDevices[i].baseURL
		end if
	end for

	return newIP
end sub


Function ParseSonosUDP(origMsg as Object, sonos as object) as boolean

	' print "Received command - parseSonosUDP: "+origMsg

	retval = false

	' verify it is actually a UDP message'
	if type(origMsg) = "roDatagramEvent" then
		
		' convert the message to all lower case for easier string matching later
		msg = lcase(origMsg)
		print "Received UDP message: "+msg
		' verify its a SONOS message'
		r = CreateObject("roRegex", "^SONOS", "i")
		match=r.IsMatch(msg)

		' Is this a sonos request
		if match then
			retval = true

			' split the string
			r2 = CreateObject("roRegex", "!", "i")
			fields=r2.split(msg)
			numFields = fields.count()
			if (numFields < 3) or (numFields > 4) then
				print "Incorrect number of fields for Sonos command:";msg
				' need to have a least 3 fields and not more than 4 fields to be valid
				return retval
			else if (numFields = 3) then
				' command with no details
				devType=fields[1]
				command=fields[2]
				detail = ""
			else if (numFields = 4) then
				' command with details
				devType=fields[1]
				command=fields[2]
				detail =fields[3]
			end if

			if ((devType = "sall") or (command = "present")) then
				' Do not try to validate the device
			else
				'get the IP of the desired device
				sonosDevices=sonos.sonosDevices

				sonosDevice = invalid
				for each device in sonosDevices
					if device.modelNumber=devType
						sonosDevice=device
						exit for				
					endif
				end for

				if sonosDevice = invalid then
					print "No device of that type on this network"
					return retval
				endif

				print command +" " + devType + " " + detail + " " +sonosDevice.baseURL
			end if

			' if the Sonos device is not already processing a command, the process if
			if (not SonosDeviceBusy(sonos, devType)) or (command = "present") or (devType = "sall") then
				' TOTO: should consider putting xferobjects inside functions where they belong!'
				if command="mute" then
					' print "Sending mute"
					xfer = SonosSetMute(sonos.mp, sonosDevice.baseURL,1) 
					sonos.xferObjects.push(xfer)
				else if command="unmute" then
					' print "Sending unMute"
					xfer = SonosSetMute(sonos.mp, sonosDevice.baseURL,0) 
					sonos.xferObjects.push(xfer)
				else if command="volume" then
					' print "Setting volume"
					volume = val(detail)
					xfer = SonosSetVolume(sonos.mp, sonosDevice.baseURL, volume )
					sonos.xferObjects.push(xfer)
				else if command="getvol" then
					' print "Getting volume"
					xfer = SonosGetVolume(sonos.mp, sonosDevice.baseURL)
					sonos.xferObjects.push(xfer)
				else if command="volup" then
					if detail="" then
						volincrease=1
					else
						volincrease=abs(val(detail))
					end if
					sonosDevice.volume = sonosDevice.volume + volincrease
					if (sonosDevice.volume > 100) then
						sonosDevice.volume = 100
					end if
					print "Sending Volume Up "+str(volincrease)+ " to "+str(sonosDevice.volume)
					xfer = SonosSetVolume(sonos.mp, sonosDevice.baseURL, sonosDevice.volume)
					sonos.xferObjects.push(xfer)
				else if command="voldown" then
					if detail="" then
						voldecrease = 1
					else
						voldecrease=abs(val(detail))
					end if
					sonosDevice.volume = sonosDevice.volume - voldecrease
					if (sonosDevice.volume < 0) then
						sonosDevice.volume = 0
					end if
					'print "Sending Volume Down "+str(voldecrease)+ " to "+str(sonosDevice.volume)
					xfer = SonosSetVolume(sonos.mp, sonosDevice.baseURL, sonosDevice.volume)
					sonos.xferObjects.push(xfer)
				else if command="playmp3" then
					' print "Playing MP3"
					netConfig = CreateObject("roNetworkConfiguration", 0)
					currentNet = netConfig.GetCurrentConfig()
					xfer = SonosSetSong(sonos.mp, currentNet.ip4_address, sonosDevice.baseURL, detail)
					sonos.xferObjects.push(xfer)
				else if command="spdif" then
					' print "Swithching to SPDIF input"
					xfer = SonosSetSPDIF(sonos.mp, sonosDevice.baseURL, sonosDevice.UDN)
					sonos.xferObjects.push(xfer)
				else if command="group" then
					' print "Grouping players"
					MasterSonosDevice = invalid
					for each device in sonos.sonosDevices
						if device.modelNumber = detail
							MasterSonosDevice = device			
						endif
					end for
					if MasterSonosDevice = invalid then
						print "No  master device of that type on this network"
					else
						xfer = SonosSetGroup(sonos.mp, sonosDevice.baseURL, MasterSonosDevice.UDN)
						sonos.xferObjects.push(xfer)						
					endif
				else if command = "play" then
					xfer = SonosPlaySong(sonos.mp, sonosDevice.baseURL)
					sonos.xferObjects.push(xfer)
				else if command = "subon" then
					' print "Sub ON"
					xfer = SonosSubCtrl(sonos.mp, sonosDevice.baseURL,1)
					sonos.xferObjects.push(xfer)
				else if command = "suboff" then
					' print "Sub OFF"
					xfer = SonosSubCtrl(sonos.mp, sonosDevice.baseURL,0)
					sonos.xferObjects.push(xfer)
				else if command = "surroundon" then
					' print "Surround ON"
					xfer = SonosSurroundCtrl(sonos.mp, sonosDevice.baseURL,1)
					sonos.xferObjects.push(xfer)
				else if command = "surroundoff" then
					' print "Surround OFF"
					xfer = SonosSurroundCtrl(sonos.mp, sonosDevice.baseURL,0)
					sonos.xferObjects.push(xfer)
				else if command = "getmute" then
					' print "Getting Mute"
					xfer = SonosGetMute(sonos.mp, sonosDevice.baseURL)
					sonos.xferObjects.push(xfer)
				else if command = "rdmon" then
					xfer = SonosSetRDM(sonos.mp, sonosDevice.baseURL,1)
					sonos.xferObjects.push(xfer)
				else if command = "rdmoff" then
					xfer = SonosSetRDM(sonos.mp, sonosDevice.baseURL,0)
					sonos.xferObjects.push(xfer)
				else if command = "rdmdefault" then
					xfer = SonosApplyRDMDefaultSettings(sonos.mp, sonosDevice.baseURL)
					sonos.xferObjects.push(xfer)
				else if command = "getrdm" then
					xfer = SonosGetRDM(sonos.mp, sonosDevice.baseURL)
					sonos.xferObjects.push(xfer)
				else if command = "wifi" then
					xfer = SonosSetWifi(sonos.mp, sonosDevice.baseURL, detail)
					sonos.xferObjects.push(xfer)
				else if command = "scan" then
					FindAllSonosDevices(sonos)
					sendSelfUDP("scancomplete")
				else if command = "addmp3" then
					AddMP3(sonos, detail)
				else if command = "present" then
					present = isSonosDevicePresent(sonos, devType)
					if present then 
						sendSelfUDP(devType + ":present")
					else
						sendSelfUDP(devType + ":notpresent")
					end if				
				else
					print "Discarding UNSUPPORTED command :"; command
				end if
			else
				print "Queueing command due to device being busy: ";msg
				commandToQ = {}
				commandToQ.IP = sonosDevice.baseURL
				commandToQ.msg = msg
				sonos.commandQ.push(commandToQ)				
			end if
		else
			' See if it is a Brightsign message
			r = CreateObject("roRegex", "^brightsign", "i")
			match=r.IsMatch(msg)
			if (match) then
				retval = true

				r2 = CreateObject("roRegex", "!", "i")
				fields=r2.split(msg)
				numFields = fields.count()
				if (numFields < 3) or (numFields > 5) then
					print "Incorrect number of fields for BrightSign command:";msg
					' need to have a least 3 fields and not more than 4 fields to be valid
					return retval
				else if (numFields = 3) then
					' command with no details
					command =fields[1]
					field1 =fields[2]
					field2 = ""
					field3 = ""
				else if (numFields = 4) then
					' command with details
					command =fields[1]
					field1 =fields[2]
					field2 =fields[3]
					field3 =""
				else if (numFields = 5) then
					' command with details
					command =fields[1]
					field1 =fields[2]
					field2 =fields[3]
					field3 =fields[4]
				end if

				if command = "chpresent" then
					available = ChannelAvailable(sonos, field1, field2, field3)
					if available then 
						print "Channel: ";field2;" ";field1;" is available"
						sendSelfUDP("ATSC")
					else
						print "Channel: ";field2;" ";field1;" is NOT available"
						sendSelfUDP("noATSC")
					end if
				else if (command = "resolution") then
					vm=CreateObject("roVideoMode")
					print "Switching Resolution"
					vm.SetMode(field1+"-noreboot")
				end if
			end if
		end if
	end if

	return retval
end Function

sub SonosGetVolume(mp as object, connectedPlayerIP as string) as object

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="GetVolume"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	soapTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/RenderingControl/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:RenderingControl:1#GetVolume")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	volXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"
	volXML=volXML+chr(34)+"?><s:Envelope s:encodingStyle="+chr(34)
	volXML=volXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)+" xmlns:s=" 
	volXML=volXML+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)+">"
	volXML=volXML+"<s:Body><u:GetVolume xmlns:u=" +chr(34)
	volXML=volXML+"urn:schemas-upnp-org:service:RenderingControl:1"+chr(34)
	volXML=volXML+"><InstanceID>0</InstanceID><Channel>Master</Channel>"
	volXML=volXML+"</u:GetVolume></s:Body></s:Envelope>"

	ok = soapTransfer.AsyncPostFromString(volXML)
	if not ok then
		stop
	end if

	return soapTransfer
end sub


Sub SonosSetVolume(mp as object, connectedPlayerIP as string, volume as integer) as object

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SetVolume"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	
	soapTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/RenderingControl/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:RenderingControl:1#SetVolume")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	'volXML = ReadASCIIFile("volume.xml")
	volXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"
	volXML=volXML+chr(34)+"?><s:Envelope s:encodingStyle="+chr(34)
	volXML=volXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)+" xmlns:s=" 
	volXML=volXML+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)+">"
	volXML=volXML+"<s:Body><u:SetVolume xmlns:u=" +chr(34)
	volXML=volXML+"urn:schemas-upnp-org:service:RenderingControl:1"+chr(34)
	volXML=volXML+"><InstanceID>0</InstanceID><Channel>Master</Channel><DesiredVolume>"
	volXML=volXML+"VOLUMEVALUE</DesiredVolume></u:SetVolume></s:Body></s:Envelope>"

	r = CreateObject("roRegex", "VOLUMEVALUE", "i")
	reqString=r.ReplaceAll(volXML,mid(stri(volume),2))
	' print reqString
	ok = soapTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return soapTransfer
end sub


Sub SonosSetMute(mp as object, connectedPlayerIP as string, muteVal as integer) as object

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SetMute"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	muteXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)+"?>"
	muteXML=muteXML+"<s:Envelope s:encodingStyle="+chr(34)
	muteXML=muteXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	muteXML=muteXML+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)
	muteXML=muteXML+"><s:Body><u:SetMute xmlns:u="+chr(34)
	muteXML=muteXML+"urn:schemas-upnp-org:service:RenderingControl:1"+chr(34)
	muteXML=muteXML+"><InstanceID>0</InstanceID><Channel>Master</Channel>"
	muteXML=muteXML+"<DesiredMute>MUTEVALUE</DesiredMute></u:SetMute></s:Body></s:Envelope>"
	
	soapTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/RenderingControl/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:RenderingControl:1#SetMute")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	' set the correct Mute value in the request string
	r = CreateObject("roRegex", "MUTEVALUE", "i")
	if muteVal=0 then 
		reqString=r.ReplaceAll(muteXML,"0")
	else
		reqString=r.ReplaceAll(muteXML,"1")
	end if

	' print reqString
	ok = soapTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return soapTransfer
end sub

Sub SonosGetMute(mp as object, connectedPlayerIP as string) as object

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="GetMute"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	muteXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)+"?>"
	muteXML=muteXML+"<s:Envelope s:encodingStyle="+chr(34)
	muteXML=muteXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	muteXML=muteXML+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)
	muteXML=muteXML+"><s:Body><u:GetMute xmlns:u="+chr(34)
	muteXML=muteXML+"urn:schemas-upnp-org:service:RenderingControl:1"+chr(34)
	muteXML=muteXML+"><InstanceID>0</InstanceID><Channel>Master</Channel>"
	muteXML=muteXML+"</u:GetMute></s:Body></s:Envelope>"
	
	soapTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/RenderingControl/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:RenderingControl:1#GetMute")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	' print muteXML
	ok = soapTransfer.AsyncPostFromString(muteXML)
	if not ok then
		stop
	end if

	return soapTransfer
end sub


Sub SonosSetRDMDefaults(mp as object, connectedPlayerIP as string) as object

	print "SonosSetRDMDefaults"

	fTransfer = CreateObject("roUrlTransfer")

	sURL=connectedPlayerIP+"/rdm"

	fTransfer.SetUrl(sURL)

	' this is a hard coded POST string - the right way is to build this from variables '
	postString="enable=1&to=0&vol%3AZP100=15&vol%3AZP80=15&vol%3AZP90=15&vol%3AZP120=15&vol%3AS5=15&vol%3AS3=15&vol%3AS1=15&vol%3AS9=15"

	' print postString

	ret=fTransfer.PostFromString(postString)
	' print str(ret)
	' make sure it's a 200


end sub	


Sub SonosSetRDM(mp as object, connectedPlayerIP as string, rdmVal as integer) as object

	' this function is not yet working - the SOAP string appears to be wrong'

	if rdmVal=0 then 
		print "SonosSetRDM "+connectedPlayerIP+" off"
	else
		print "SonosSetRDM "+connectedPlayerIP+" on"
	end if

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="EnableRDM"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	mXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)+"?>"
	mXML=mXML+"<s:Envelope s:encodingStyle="+chr(34)
	mXML=mXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	mXML=mXML+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)
	mXML=mXML+"><s:Body><u:EnableRDM xmlns:u="+chr(34)
	mXML=mXML+"urn:schemas-upnp-org:service:SystemProperties:1"+chr(34)
	mXML=mXML+"><RDMValue>RDMVALUEVAR</RDMValue></u:EnableRDN></s:Body></s:Envelope>"
	
	soapTransfer.SetUrl( connectedPlayerIP + "/SystemProperties/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:SystemProperties:1#EnableRDM")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	' set the correct Mute value in the request string
	r = CreateObject("roRegex", "RDMVALUEVAR", "i")
	if rdmVal=0 then 
		reqString=r.ReplaceAll(mXML,"0")
	else
		reqString=r.ReplaceAll(mXML,"1")
	end if

	' print reqString
	ok = soapTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return soapTransfer
end sub

sub SonosGetRDM(mp as object, connectedPlayerIP as string) as object

	' this function is not yet working - the SOAP string appears to be wrong'


	print "SonosGetRDM "+connectedPlayerIP

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="GetVolume"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	soapTransfer.SetUrl( connectedPlayerIP + "/SystemProperties/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:SystemProperties:1#GetRDM")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	rXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"
	rXML=rXML+chr(34)+"?><s:Envelope s:encodingStyle="+chr(34)
	rXML=rXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)+" xmlns:s=" 
	rXML=rXML+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)+">"
	rXML=rXML+"<s:Body><u:GetRDM xmlns:u=" +chr(34)
	rXML=rXML+"urn:schemas-upnp-org:service:SystemProperties:1"+chr(34)
	rXML=rXML+"></u:GetRDM></s:Body></s:Envelope>"

	' print rXML

	ok = soapTransfer.AsyncPostFromString(rXML)
	if not ok then
		stop
	end if

	return soapTransfer
end sub

sub SonosApplyRDMDefaultSettings(mp as object, connectedPlayerIP as string) as object

	' this function is not yet working - the SOAP string appears to be wrong'
	' we also don't know all the other calls to set the default values 

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="ApplyRDMDefaultSettings"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	soapTransfer.SetUrl( connectedPlayerIP + "/SystemProperties/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:SystemProperties:1#ApplyRDMDefaultSettings")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	volXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"
	volXML=volXML+chr(34)+"?><s:Envelope s:encodingStyle="+chr(34)
	volXML=volXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)+" xmlns:s=" 
	volXML=volXML+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)+">"
	volXML=volXML+"<s:Body><u:ApplyRDMDefaultSettings xmlns:u=" +chr(34)
	volXML=volXML+"urn:schemas-upnp-org:service:SystemProperties:1"+chr(34)
	volXML=volXML+"></u:ApplyRDMDefaultSettings></s:Body></s:Envelope>"

	ok = soapTransfer.AsyncPostFromString(volXML)
	if not ok then
		stop
	end if

	return soapTransfer
end sub


Sub SonosSetWifi(mp as object, connectedPlayerIP as string, setValue as string) as object
	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SubCtrl"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	soapTransfer.SetUrl( connectedPlayerIP + "/wifictrl?wifi="+ setValue)

	ok = soapTransfer.AsyncGetToString()
	if not ok then
		stop
	end if

	return (soapTransfer)
end Sub


Sub SonosSubCtrl(mp as object, connectedPlayerIP as string, enableVal as integer) as object
	
	' print "SonosSubCtrl"

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SubCtrl"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	subXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)+"?>"
	subXML=subXML+"<s:Envelope s:encodingStyle="+chr(34)
	subXML=subXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	subXML=subXML+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)
	subXML=subXML+"><s:Body><u:SetEQ xmlns:u="+chr(34)
	subXML=subXML+"urn:schemas-upnp-org:service:RenderingControl:1"+chr(34)
	subXML=subXML+"><InstanceID>0</InstanceID>"
	subXML=subXML+"<EQType>SubEnable</EQType><DesiredValue>ENABLEVALUE</DesiredValue></u:SetEQ>"
	subXML=subXML+"</s:Body></s:Envelope>"
	
	soapTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/RenderingControl/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:RenderingControl:1#SetEQ")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	' set the correct Mute value in the request string
	r = CreateObject("roRegex", "ENABLEVALUE", "i")
	if enableVal=0 then 
		reqString=r.ReplaceAll(subXML,"0")
	else
		reqString=r.ReplaceAll(subXML,"1")
	end if

	' print reqString
	ok = soapTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return soapTransfer
end sub


Sub SonosSurroundCtrl(mp as object, connectedPlayerIP as string, enableVal as integer) as object
	
	' print "SonosSurroundCtrl"

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 500, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SubCtrl"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)

	subXML="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)+"?>"
	subXML=subXML+"<s:Envelope s:encodingStyle="+chr(34)
	subXML=subXML+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	subXML=subXML+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)
	subXML=subXML+"><s:Body><u:SetEQ xmlns:u="+chr(34)
	subXML=subXML+"urn:schemas-upnp-org:service:RenderingControl:1"+chr(34)
	subXML=subXML+"><InstanceID>0</InstanceID>"
	subXML=subXML+"<EQType>SurroundEnable</EQType><DesiredValue>ENABLEVALUE</DesiredValue></u:SetEQ>"
	subXML=subXML+"</s:Body></s:Envelope>"
	
	soapTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/RenderingControl/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:RenderingControl:1#SetEQ")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if

	' set the correct Mute value in the request string
	r = CreateObject("roRegex", "ENABLEVALUE", "i")
	if enableVal=0 then 
		reqString=r.ReplaceAll(subXML,"0")
	else
		reqString=r.ReplaceAll(subXML,"1")
	end if

	' print reqString
	ok = soapTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return soapTransfer
end sub




Sub SonosSetSong(mp as object, myIP as string, connectedPlayerIP as string, mp3file as string) as object

	'xmlString = readASCIIFile("setsong.xml")

	xmlString="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)
	xmlString=xmlString+"?><s:Envelope s:encodingStyle="+chr(34)
	xmlString=xmlString+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	xmlString=xmlString+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"
	xmlString=xmlString+chr(34)+"><s:Body><u:SetAVTransportURI xmlns:u="+chr(34)
	xmlString=xmlString+"urn:schemas-upnp-org:service:AVTransport:1"+chr(34)
	xmlString=xmlString+"><InstanceID>0</InstanceID><CurrentURI>http://BSPIP:111/MP3STRING"
	xmlString=xmlString+"</CurrentURI><CurrentURIMetaData /></u:SetAVTransportURI>"
	xmlString=xmlString+"</s:Body></s:Envelope>"

	r1 = CreateObject("roRegex", "BSPIP", "i")
	newString1 = r1.ReplaceAll(xmlString, myIP)
	r2 = CreateObject("roRegex", "MP3STRING", "i")
	reqString = r2.ReplaceAll(newString1, mp3file)

	songTransfer = CreateObject("roUrlTransfer")
	songTransfer.SetMinimumTransferRate( 2000, 1 )
	songTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SetSong"
	sonosReqData["dest"]=connectedPlayerIP
	songTransfer.SetUserData(sonosReqData)

	songTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/AVTransport/Control")
	ok = songTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:AVTransport:1#SetAVTransportURI")
	if not ok then
		stop
	end if
	ok = songTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if
	' print reqString
	ok = songTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return songTransfer
end Sub

Sub SonosSetSPDIF(mp as object, connectedPlayerIP as string, sonosPlayerUDN as string) as object

	xmlString="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)
	xmlString=xmlString+"?><s:Envelope s:encodingStyle="+chr(34)
	xmlString=xmlString+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	xmlString=xmlString+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"
	xmlString=xmlString+chr(34)+"><s:Body><u:SetAVTransportURI xmlns:u="+chr(34)
	xmlString=xmlString+"urn:schemas-upnp-org:service:AVTransport:1"+chr(34)
	xmlString=xmlString+"><InstanceID>0</InstanceID><CurrentURI>SPDIFSTRING"
	xmlString=xmlString+"</CurrentURI><CurrentURIMetaData /></u:SetAVTransportURI>"
	xmlString=xmlString+"</s:Body></s:Envelope>"

	SPDIFString = "x-sonos-htastream:" + sonosPlayerUDN + ":spdif"
	r1 = CreateObject("roRegex", "SPDIFSTRING", "i")
	reqString = r1.ReplaceAll(xmlString, SPDIFString)

	songTransfer = CreateObject("roUrlTransfer")
	songTransfer.SetMinimumTransferRate( 2000, 1 )
	songTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SetSPDIF"
	sonosReqData["dest"]=connectedPlayerIP
	songTransfer.SetUserData(sonosReqData)


	songTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/AVTransport/Control")
	ok = songTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:AVTransport:1#SetAVTransportURI")
	if not ok then
		stop
	end if
	ok = songTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if
	' print reqString
	ok = songTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return songTransfer
end Sub

Sub SonosSetGroup(mp as object, connectedPlayerIP as string, sonosPlayerUDN as string) as object

	xmlString="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="+chr(34)+"utf-8"+chr(34)
	xmlString=xmlString+"?><s:Envelope s:encodingStyle="+chr(34)
	xmlString=xmlString+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	xmlString=xmlString+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"
	xmlString=xmlString+chr(34)+"><s:Body><u:SetAVTransportURI xmlns:u="+chr(34)
	xmlString=xmlString+"urn:schemas-upnp-org:service:AVTransport:1"+chr(34)
	xmlString=xmlString+"><InstanceID>0</InstanceID><CurrentURI>UDNSTRING"
	xmlString=xmlString+"</CurrentURI><CurrentURIMetaData /></u:SetAVTransportURI>"
	xmlString=xmlString+"</s:Body></s:Envelope>"

	UDNString = "x-rincon:" + sonosPlayerUDN
	r1 = CreateObject("roRegex", "UDNSTRING", "i")
	reqString = r1.ReplaceAll(xmlString, UDNString)

	songTransfer = CreateObject("roUrlTransfer")
	songTransfer.SetMinimumTransferRate( 2000, 1 )
	songTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="SetGroup"
	sonosReqData["dest"]=connectedPlayerIP
	songTransfer.SetUserData(sonosReqData)


	songTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/AVTransport/Control")
	ok = songTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:AVTransport:1#SetAVTransportURI")
	if not ok then
		stop
	end if
	ok = songTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if
	' print reqString
	ok = songTransfer.AsyncPostFromString(reqString)
	if not ok then
		stop
	end if

	return songTransfer
end Sub

Sub SonosPlaySong(mp as object, connectedPlayerIP as string) as object

	'reqString = readASCIIFile("play.xml")
	
	reqString="<?xml version="+chr(34)+"1.0"+chr(34)+" encoding="
	reqString=reqString+chr(34)+"utf-8"+chr(34)+"?>"
	reqString=reqString+"<s:Envelope s:encodingStyle="+chr(34)
	reqString=reqString+"http://schemas.xmlsoap.org/soap/encoding/"+chr(34)
	reqString=reqString+" xmlns:s="+chr(34)+"http://schemas.xmlsoap.org/soap/envelope/"+chr(34)
	reqString=reqString+"><s:Body><u:Play xmlns:u="+chr(34)
	reqString=reqString+"urn:schemas-upnp-org:service:AVTransport:1"+chr(34)
	reqString=reqString+"><InstanceID>0</InstanceID><Speed>1</Speed></u:Play>"
	reqString=reqString+"</s:Body></s:Envelope>"

	soapTransfer = CreateObject("roUrlTransfer")
	soapTransfer.SetMinimumTransferRate( 2000, 1 )
	soapTransfer.SetPort( mp )

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="PlaySong"
	sonosReqData["dest"]=connectedPlayerIP
	soapTransfer.SetUserData(sonosReqData)


	soapTransfer.SetUrl( connectedPlayerIP + "/MediaRenderer/AVTransport/Control")
	ok = soapTransfer.addHeader("SOAPACTION", "urn:schemas-upnp-org:service:AVTransport:1#Play")
	if not ok then
		stop
	end if
	ok = soapTransfer.addHeader("Content-Type", "text/xml; charset="+ chr(34) + "utf-8" + chr(34))
	if not ok then
		stop
	end if
	' print reqString
	ok = soapTransfer.AsyncPostFromString(reqString)

	return soapTransfer
end sub


Function processSonosVolumeResponse(msg as object, connectedPlayerIP as string, sonos as Object)

	print "processSonosVolumeResponse from " + connectedPlayerIP
''	print msg

	match="<CurrentVolume>"
	pos1=instr(1,msg,match)
	pos2=instr(pos1+len(match)+1,msg,"</CurrentVolume>")
	if pos1 > 0 then
		pos1=pos1+len(match)
		volStr=mid(msg,pos1,pos2-pos1)
		print "Current Volume: " + volStr

		le = chr(10)
		for each d in sonos.sonosDevices
			ipstring=stripIP(d.baseURL)
			if d.baseURL=connectedPlayerIP then
				d.volume=val(volStr)
			end if
		end for
	end if

End Function


Function processSonosRDMResponse(msg as object, connectedPlayerIP as string, sonos as Object)

	print "processSonosRDMResponse from " + connectedPlayerIP
	' print msg

	match="<CurrentRDM>"
	pos1=instr(1,msg,match)
	pos2=instr(pos1+len(match)+1,msg,"</CurrentRDM>")
	if pos1 > 0 then
		pos1=pos1+len(match)
		rdmStr=mid(msg,pos1,pos2-pos1)
		print "Current RDM: " + rdmStr
	end if

	le = chr(10)

	for each d in sonos.sonosDevices
		ipstring=stripIP(d.baseURL)
		if d.baseURL=connectedPlayerIP then
			d.rdm=val(rdmStr)
		end if

	end for

	' need to match up the device and set the volume value for it'
	' looks like we currently only store a single volme for all devices'
	' I think we need to change that?'

End Function

Function processSonosMuteResponse(msg as object, connectedPlayerIP as string, sonos as Object)

	print "processSonosMuteResponse from " + connectedPlayerIP
	' print msg

	match="<CurrentMute>"
	pos1=instr(1,msg,match)
	pos2=instr(pos1+len(match)+1,msg,"</CurrentMute>")
	if pos1 > 0 then
		pos1=pos1+len(match)
		muteStr=mid(msg,pos1,pos2-pos1)
		print "Current Mute: " + muteStr
	end if

	' Send UDP indicating Mute Status
	netConfig = CreateObject("roNetworkConfiguration", 0)
	currentNet = netConfig.GetCurrentConfig()
	sender = createObject("roDatagramSender")
	ok = sender.SetDestination(currentNet.ip4_address, 5000)
	if not ok then
		stop
	end if

	if muteStr = "0" then 
		retVal = sender.send("mute:off")
		if (retVal <> 0) then 
			stop
		end if
	else
		retVal = sender.send("mute:on")
		if (retVal <> 0) then 
			stop
		end if
	end if
End Function

Function stripIP(baseURL as string) as string

	match="//"
	pos1=instr(1,baseURL,match)
	pos2=instr(pos1+len(match)+1,baseURL,":")
	if pos1 > 0 then
		pos1=pos1+len(match)
		if pos2 > 0 then
			ip=mid(baseURL,pos1,pos2-pos1)
		else
			ip=mid(baseURL,pos1,pos2)
		end if
		print "IP: " + ip
	end if
	return ip
end function


Function HandleSonosXferEvent(msg as object, sonos as object) as boolean
	
	eventID = msg.GetSourceIdentity()
	eventCode = msg.GetResponseCode()

	found = false
	numXfers = sonos.xferObjects.count()
	i = 0
	while (not found) and (i < numXfers)
		id = sonos.xferObjects[i].GetIdentity()
		sonosReqData=sonos.xferObjects[i].GetUserData()
		if (id = eventID) then
			' See if this is the transfer being complete
			if (sonosReqData <> invalid) then 
				connectedPlayerIP=sonosReqData["dest"]
				reqData=sonosReqData["type"]
			else
				connectedPlayerIP = ""
				reqData = ""
			end if
			if (msg.getInt() = 1) then
				print "Http transfer code: "; eventCode; " request type: ";reqData;" ";connectedPlayerIP
				if (eventCode = 200) then 
					if reqData="GetVolume" then
						processSonosVolumeResponse(msg,connectedPlayerIP,sonos)
					else if reqData="GetRDM" then
						processSonosRDMResponse(msg,connectedPlayerIP,sonos)
					else if reqData="GetMute" then
						processSonosMuteResponse(msg,connectedPlayerIP,sonos)
				    else if reqData="RegisterForAVTransportEvent" then
					    OnGenaSubscribeResponse(sonosReqData,msg, sonos)
					else if reqData="RegisterForRenderingControlEvent" then
					    OnGenaSubscribeResponse(sonosReqData,msg, sonos)
				    else if reqData="RenewRegisterForAVTransportEvent" then
					    OnGenaRenewResponse(sonosReqData,msg, sonos)
					else if reqData="RenewRegisterForRenderingControlEvent" then
					    OnGenaRenewResponse(sonosReqData,msg, sonos)
					end if
				end if		
					
				' See if we have a command in the command queue for this player
				numCmds = sonos.commandQ.count()
				cmdFound = false
				x = 0
				if (numCmds > 0) then 
					print "There are ";numCmds;" in the queue"
				end if
				while (not cmdFound) and (x < numCmds)
					if (sonos.commandQ[x].IP = connectedPlayerIP) then 
						netConfig = CreateObject("roNetworkConfiguration", 0)
						currentNet = netConfig.GetCurrentConfig()
						sender = createObject("roDatagramSender")
						ok = sender.SetDestination(currentNet.ip4_address, sonos.udpReceiverPort)
						if not ok then
							stop
						end if
						print "Sending Queued command";sonos.commandQ[x]
						retVal = sender.send(sonos.commandQ[x].msg)
						if (retVal <> 0) then 
							stop
						end if
						sonos.commandQ.Delete(x)
						cmdFound = true
					end if
					x = x + 1
				end while
				sonos.xferObjects.Delete(i)
				found = true
			end if
		end if
		i = i + 1
	end while

	return found
end Function

Function ChannelAvailable(sonos as object, virtualChannel as string, modulation as string, rfChannel as string) as boolean
	print "Looking for Virtual Channel: ";virtualChannel;" with modulation type: ";modulation;" on RF Channel: ";rfChannel
	c = CreateObject("roChannelManager")

	channelAvail = false
	' See if there are any cached channels
	count = c.GetChannelCount()
	if (count > 0 ) then
		print "Tuner Channels found"
		cinfo  = CreateObject("roAssociativeArray")
		cinfo["VirtualChannel"] = virtualChannel
		desc = c.CreateChannelDescriptor(cinfo)
		if (desc <> invalid)
			ChannelAvail = true
			print "Channnel: ";virtualChannel;" found, descriptor ="
			print desc
			' Make sure the channel that was cached is really available now
			aa  = CreateObject("roAssociativeArray")
			aa["ChannelMap"] = desc["ChannelMap"]
			aa["FirstRfChannel"] = desc["RfChannel"]
			aa["LastRfChannel"] = desc["RfChannel"]
			' Clear the channel data
			c.ClearChannelData()
			print "Do scan to validate channel is really available now"
			c.Scan(aa)
			cinfo["VirtualChannel"] = virtualChannel
			desc = c.CreateChannelDescriptor(cinfo)
			if (desc <> invalid) then 
				print "Descriptor after confirmation scan"
				print desc
				ChannelAvail = true
			else
				' Do a complete scan to see if we can find the channel
				Print "Doing a complete scan, found cached channel but single scan did not find channel"
				ChannelAvail = FindChannelByScan(modulation, virtualChannel, rfChannel)
			end if
		else
			print "Channel: ";channel;" not in list, scan again..."
			ChannelAvail = FindChannelByScan(modulation, virtualChannel, rfChannel)
		end if
	else
		print "No channels available, run a scan..."
		ChannelAvail = 	FindChannelByScan(modulation, virtualChannel, rfChannel)
	end if

	if (channelAvail) then
		cinfo  = CreateObject("roAssociativeArray")
		cinfo["VirtualChannel"] = virtualChannel
		desc = c.CreateChannelDescriptor(cinfo)
		sonos.channelDesc = desc
	end if
		
	return (channelAvail)
end Function

Function FindChannelByScan(modulation as string, virtualChannel as string, rfChannel as string) as Boolean

	c = CreateObject("roChannelManager")
	aa  = CreateObject("roAssociativeArray")
	if (modulation <> "") then
		aa["ChannelMap"] = modulation
	end if
	if (rfChannel <> "") then
		rfChannelNum = int(val(rfChannel))
		print "RF Channel Number = "; rfChannelNum		
		aa["FirstRfChannel"] = rfChannelNum
		aa["LastRfChannel"] = rfChannelNum
	end if
	c.Scan(aa)
	cinfo  = CreateObject("roAssociativeArray")
	cinfo["VirtualChannel"] = virtualChannel
	desc = c.CreateChannelDescriptor(cinfo)
	if (desc <> invalid)
		ChannelAvail = true
		print "Channnel: ";virtualChannel;" found, descriptor ="
		print desc
	else
		print "Channnel: ";virtualChannel;" NOT found after scan.."
		ChannelAvail = false
	end if

	return ChannelAvail
end function

Function SonosDeviceBusy(sonos as object, devType as String) as Boolean

	found = false
	IP = GetBaseIPByPlayerModel(sonos.sonosDevices, devType)
	if (IP <> "") then 
		numXfers = sonos.xferObjects.count()
		i = 0
		while (not found) and (i < numXfers)
			sonosReqData=sonos.xferObjects[i].GetUserData()
			if sonosReqData <> invalid
				connectedPlayerIP=sonosReqData["dest"]
				if connectedPlayerIP = IP
					found = true
				end if
			end if
			i = i + 1
		end while
	end if
	
	' if we found the device in the list it means the device is busy processing a request	
	return found
End Function

Function SendSelfUDP( msg as string)

	netConfig = CreateObject("roNetworkConfiguration", 0)
	currentNet = netConfig.GetCurrentConfig()
	sender = createObject("roDatagramSender")
	ok = sender.SetDestination(currentNet.ip4_address, 5000)
	if not ok then
		stop
	end if

	retVal = sender.send(msg)
	if (retVal <> 0) then 
		stop
	end if
End Function

Function AddMP3(s as object, directory as string)

	' Serve up two files to play....
	s.server.AddGetFromFile({ url_path: "/misery.mp3", filename: "SD:/misery.mp3", content_type: "audio/mpeg" })
	s.server.AddGetFromFile({ url_path: "/warning.mp3", filename: "SD:/warning.mp3", content_type: "audio/mpeg" })

	'  add the files 
	filepathmp3 = GetPoolFilePath(s.bsp.syncpoolfiles, "1.mp3")
	s.server.AddGetFromFile({ url_path: "/1.mp3", filename: filepathmp3, content_type: "audio/mpeg" })
	print "File path for 1.mp3 = ";filepathmp3
	filepathmp3 = GetPoolFilePath(s.bsp.syncpoolfiles, "2.mp3")
	s.server.AddGetFromFile({ url_path: "/2.mp3", filename: filepathmp3, content_type: "audio/mpeg" })
	print "File path for 2.mp3 = ";filepathmp3
	filepathmp3 = GetPoolFilePath(s.bsp.syncpoolfiles, "3.mp3")
	s.server.AddGetFromFile({ url_path: "/3.mp3", filename: filepathmp3, content_type: "audio/mpeg" })
	print "File path for 3.mp3 = ";filepathmp3
	filepathmp3 = GetPoolFilePath(s.bsp.syncpoolfiles, "4.mp3")
	s.server.AddGetFromFile({ url_path: "/4.mp3", filename: filepathmp3, content_type: "audio/mpeg" })

'	files = MatchFiles(directory, "*.mp3")
'	print "File count in dir ";directory; files.Count()
'	for each fileName in files
'		transferObj = createObject("roURLTransfer")
'		escapedUrlPath = directory + "/" + transferObj.escape(fileName)
'		print "adding ";escapedUrlPath;" as available MP3 to server"
'		s.server.AddGetFromFile({ url_path: escapedUrlPath, filename: "SD:" + directory + "/" + fileName, content_type: "audio/mpeg" })	
'	end for
End Function

Function SonosRegisterForEvents(sonos as Object, mp as Object,device as Object) as Object
	' SUBSCRIBE to events - requires 4.5.18 or later '
	avtransport_event_handler = { name: "AVTransport", HandleEvent: OnAVTransportEvent, SonosDevice: device, sonos:sonos}
	renderingcontrol_event_handler = { name: "RenderingControl", HandleEvent: OnRenderingControlEvent, SonosDevice: device, sonos:sonos}

	sAVT="/gena/avtransport/"+device.UDN
	sRC ="/gena/renderingconrol/"+device.UDN

	if not sonos.server.AddMethodToString({ method: "NOTIFY", url_path: sAVT, user_data: avtransport_event_handler }) then
		print "FAILURE:  cannot register a local URL for Sonos avtransport notifications"
	end if

	if not sonos.server.AddMethodToString({ method: "NOTIFY", url_path: sRC , user_data: renderingcontrol_event_handler }) then
		print "FAILURE:  cannot register a local URL for Sonos rendering notifications"
	end if

	sonosReqData=CreateObject("roAssociativeArray")
	sonosReqData["type"]="RegisterForAVTransportEvent"
	sonosReqData["dest"]=device.baseURL

	netConfig = CreateObject("roNetworkConfiguration", 0)
	currentNet = netConfig.GetCurrentConfig()
	'print "IP Address is :";currentNet.ip4_address
	ipAddress = currentNet.ip4_address

	eventRegister = CreateObject("roUrlTransfer")
	eventRegister.SetMinimumTransferRate( 2000, 1 )
	eventRegister.SetPort( mp )

	sURL=device.baseURL+"/MediaRenderer/AVTransport/Event"
	eventRegister.SetUrl(sURL)
	sHeader="<http://"+ipAddress+":111"+sAVT+">"
	eventRegister.AddHeader("Callback", sHeader)
	print "Setting Sonos at ["+sURL+"] to use callback at: ["+sHeader+"]"
	eventRegister.AddHeader("NT", "upnp:event")
	eventRegister.AddHeader("Timeout", "Second-7200")
	eventRegister.SetUserData(sonosReqData)
	sonos.xferObjects.push(eventRegister)

	if not eventRegister.AsyncMethod({ method: "SUBSCRIBE", response_body_string: true }) then
		print "Failed to send SUBSCRIBE request: "; eventRegister.GetFailureReason()
		stop
	end if

	sonosReqData2=CreateObject("roAssociativeArray")
	sonosReqData2["type"]="RegisterForRenderingControlEvent"
	sonosReqData2["dest"]=device.baseURL

	eventRegister2 = CreateObject("roUrlTransfer")
	eventRegister2.SetMinimumTransferRate( 2000, 1 )
	eventRegister2.SetPort( mp )
	sURL2=device.baseURL+"/MediaRenderer/RenderingControl/Event"
	sHeader2="<http://"+ipAddress+":111"+sRC+">"
	' print "Setting Sonos at ["+sURL2+"] to use callback at ["+sHeader2+"]"
	eventRegister2.SetUrl(sURL2)
	eventRegister2.AddHeader("Callback", sHeader2)
	eventRegister2.AddHeader("NT", "upnp:event")
	eventRegister2.AddHeader("Timeout", "Second-7200")
  
	eventRegister2.SetUserData(sonosReqData2)
	sonos.xferObjects.push(eventRegister2)

	if not eventRegister2.AsyncMethod({ method: "SUBSCRIBE", response_body_string: true }) then
		print "Failed to send SUBSCRIBE request: "; eventRegister2.GetFailureReason()
		stop
	end if
end Function


Sub OnGenaSubscribeResponse(userData as object,e as Object, s as object)
	
	sonosPlayerBaseUrl = userData.dest
	reqType = userData.type
    print "GENA "+ reqType + " subscribe response from: " + sonosPlayerBaseUrl
    code=e.GetResponseCode()
	headers = e.GetResponseHeaders()
	SID = headers["sid"]

	for i = 0 to s.sonosDevices.count() - 1
		if (s.sonosDevices[i].baseURL = sonosPlayerBaseUrl) then
			if (reqType = "RegisterForAVTransportEvent") then
				s.sonosDevices[i].avTransportSID = SID
			else if (reqType = "RegisterForRenderingControlEvent") then
				s.sonosDevices[i].renderingSID = SID
			end if
		end if
	end for
End Sub

Function SonosRenewRegisterForEvents(sonos as Object)

	' Loop thru all of the devices and renew the register for events
	for each device in sonos.sonosDevices
		' Set up the Transfer Object AV Transport
		eventRegister = CreateObject("roUrlTransfer")
		eventRegister.SetMinimumTransferRate( 2000, 1 )
		eventRegister.SetPort( sonos.msgPort )

		' Set the URL for the AVTransport Events
		sURL=device.baseURL+"/MediaRenderer/AVTransport/Event"
		eventRegister.SetUrl(sURL)

		'  Add the headers for renewing, we only need 2, SID and Timeout
		' avTransportSID: "",renderingSID 
		eventRegister.AddHeader("SID", device.avTransportSID)
		eventRegister.AddHeader("Timeout", "Second-7200")

		' Set up the request data so we get http return we know where it came from
		sonosReqData=CreateObject("roAssociativeArray")
		sonosReqData["type"]="RenewRegisterForAVTransportEvent"
		sonosReqData["dest"]=device.baseURL
		eventRegister.SetUserData(sonosReqData)

		' Start the renew request
		if not eventRegister.AsyncMethod({ method: "SUBSCRIBE", response_body_string: true }) then
			print "Failed to send SUBSCRIBE request: "; eventRegister.GetFailureReason()
			stop
		else
			' put the request in the list 
			sonos.xferObjects.push(eventRegister)
		end if

		' Set up the Transfer Object for Rendering Control
		eventRegister2 = CreateObject("roUrlTransfer")
		eventRegister2.SetMinimumTransferRate( 2000, 1 )
		eventRegister2.SetPort( sonos.msgPort )

		' Set the URL for the AVTransport Events
		sURL2=device.baseURL+"/MediaRenderer/RenderingControl/Event"
		eventRegister2.SetUrl(sURL2)

		'  Add the headers for renewing, we only need 2, SID and Timeout
		' avTransportSID: "",renderingSID 
		eventRegister2.AddHeader("SID", device.renderingSID)
		eventRegister2.AddHeader("Timeout", "Second-7200")

		' Set up the request data so we get http return we know where it came from
		sonosReqData2=CreateObject("roAssociativeArray")
		sonosReqData2["type"]="RenewRegisterForRenderingControlEvent"
		sonosReqData2["dest"]=device.baseURL
		eventRegister2.SetUserData(sonosReqData2)

		' Start the renew request
		if not eventRegister2.AsyncMethod({ method: "SUBSCRIBE", response_body_string: true }) then
			print "Failed to send SUBSCRIBE request: "; eventRegister2.GetFailureReason()
			stop
		else
			' put the request in the list 
			sonos.xferObjects.push(eventRegister2)
		end if
	end for

end Function

Sub OnGenaRenewResponse(userData as object,e as Object, s as object)
	
	sonosPlayerBaseUrl = userData.dest
	reqType = userData.type
    print "GENA "+ reqType + " subscribe response from: " + sonosPlayerBaseUrl
    code=e.GetResponseCode()
	headers = e.GetResponseHeaders()
	SID = headers["sid"]

	for i = 0 to s.sonosDevices.count() - 1
		if (s.sonosDevices[i].baseURL = sonosPlayerBaseUrl) then
			if (reqType = "RegisterForAVTransportEvent") then
				s.sonosDevices[i].avTransportSID = SID
			else if (reqType = "RegisterForRenderingControlEvent") then
				s.sonosDevices[i].renderingSID = SID
			end if
		end if
	end for
End Sub

Sub OnAVTransportEvent(userdata as Object, e as Object)
    print "AV Transport Event"
    ' print e.GetRequestHeaders()

	s = userData.sonos
	sonosDevice=userData.SonosDevice
    ' Big chunk of XML comes in here.
	rsp=CreateObject("roXMLElement")
	rsp.Parse(e.GetRequestBodyString())
	eventString = rsp.getnamedelements("e:property").lastchange.gettext()
	event = CreateObject("roXMLElement")
	event.parse(eventString)
	transportState = event.instanceid.transportstate@val
	if (transportState <> invalid) then 
		print "Transport state change:";transportState
		sonosDevice.transportState = transportState
		if (s.userVariables[sonosDevice.modelNumber+"TransportState"] <> invalid) then
			s.userVariables[sonosDevice.modelNumber+"TransportState"].currentValue$ = transportState
			print "User Variable:";sonosDevice.modelNumber+"TransportState";" = ";transportState

			 ' send ZoneMessage message for transport event change
             zoneMessageCmd = CreateObject("roAssociativeArray")
             zoneMessageCmd["EventType"] = "SEND_ZONE_MESSAGE"
             zoneMessageCmd["EventParameter"] = sonosDevice.modelNumber+"TransportState"
             s.msgPort.PostMessage(zoneMessageCmd)
		end if
	end if

    if not e.SendResponse(200) then
		stop
    end if
End Sub

Sub OnRenderingControlEvent(userdata as Object, e as Object)
    print "Rendering Control Event"
    ' print e.GetRequestHeaders()
    sonosDevice=userData.SonosDevice    
    x=e.GetRequestBodyString()
    corrected=escapeDecode(x)
    ' print corrected
    r2 = CreateObject("roRegex", "e:property", "i")
    pstr=r2.ReplaceAll(corrected,"eproperty")

    r=CreateObject("roXMLElement")
    r.Parse(pstr)

    vals=r.eproperty.LastChange.event.InstanceID
    for each x in vals.GetChildElements()
    	name=x.GetName()
	'    print "|"+name"|"	
		if name="Volume"
			c=x@channel
			v=x@val
			if c="Master"
				print "Volume at {"+sonosDevice.UDN+"} is ["+v+"]"
				sonosDevice.volume=val(v)
			end if	
		end if
		if name="Mute"
			c=x@channel
			v=x@val
			if c="Master"
				print "Mute at {"+sonosDevice.UDN+"} is ["+v+"]"
				sonosDevice.mute=val(v)
			end if	
		end if
    end for

    if not e.SendResponse(200) then
		stop
    end if
End Sub


function escapeDecode(str as String) as String
	nstr="" 
	pstr="" 
	n=0
	r = CreateObject("roRegex", "&", "i")
	frags=r.split(str)
	for each s in frags
		if n <> 0 then
			r2 = CreateObject("roRegex", "lt;", "i")
			pstr=r2.ReplaceAll(s,"<")
			r3 = CreateObject("roRegex", "gt;", "i")
			pstr=r3.ReplaceAll(pstr,">")
			r4 = CreateObject("roRegex", "quot;", "i")
			pstr=r4.ReplaceAll(pstr,chr(34))
			r5 = CreateObject("roRegex", "apos;", "i")
			pstr=r5.ReplaceAll(pstr,chr(39))
			nstr=nstr+pstr
		else
			nstr=nstr+s   
		end if
		n=n+1
	end for

	return nstr
end function


Sub PrintXML(element As Object, depth As Integer)
	print tab(depth*3);"Name: ";element.GetName()
	if not element.GetAttributes().IsEmpty() then
		print tab(depth*3);"Attributes: ";
		for each a in element.GetAttributes()
			print a;"=";left(element.GetAttributes()[a], 20);
			if element.GetAttributes().IsNext() then print ", ";
		end for
		print
	end if
	if element.GetText()<>invalid then
		print tab(depth*3);"Contains Text: ";left(element.GetText(), 40)
	end if
	if element.GetChildElements()<>invalid
		print tab(depth*3);"Contains roXMLList:"
		for each e in element.GetChildElements()
			PrintXML(e, depth+1)
		end for
	end if
	print
end sub