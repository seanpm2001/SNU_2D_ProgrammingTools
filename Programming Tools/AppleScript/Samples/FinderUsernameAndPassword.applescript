tell application "Finder"
	set passAns to "app123"
	set userAns to "John"
	if the text returned of (display dialog "Username" default answer "") is userAns then
		display dialog "Correct" buttons {"Continue"} default button 1
		if the text returned of (display dialog "Username : John" & return & "Password" default answer "" buttons {"Continue"} default button 1 with hidden answer) is passAns then
			display dialog "Access granted" buttons {"OK"} default button 1
		else
			display dialog "Incorrect password" buttons {"OK"} default button 1
		end if
	else
		display dialog "Incorrect username" buttons {"OK"} default button 1
	end if
end tell