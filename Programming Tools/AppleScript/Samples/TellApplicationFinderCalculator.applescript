tell application "Finder"
	-- Set variables
	set the1 to text returned of (display dialog "1st" default answer "Number here" buttons {"Continue"} default button 1)
	set the2 to text returned of (display dialog "2nd" default answer "Number here" buttons {"Continue"} default button 1)
	try
		set the1 to the1 as integer
		set the2 to the2 as integer
	on error
		display dialog "You may only input numbers into a calculator." with title "ERROR" buttons {"OK"} default button 1
		return
	end try
	
	-- Add?
	if the button returned of (display dialog "Add?" buttons {"No", "Yes"} default button 2) is "Yes" then
		set ans to (the1 + the2)
		display dialog ans with title "Answer" buttons {"OK"} default button 1
		say ans
	-- Subtract?	
	else if the button returned of (display dialog "Subtract?" buttons {"No", "Yes"} default button 2) is "Yes" then
		set ans to (the1 - the2)
		display dialog ans with title "Answer" buttons {"OK"} default button 1
		say ans
	-- Multiply?	
	else if the button returned of (display dialog "Multiply?" buttons {"No", "Yes"} default button 2) is "Yes" then
		set ans to (the1 * the2)
		display dialog ans with title "Answer" buttons {"OK"} default button 1
		say ans
	-- Divide?	
	else if the button returned of (display dialog "Divide?" buttons {"No", "Yes"} default button 2) is "Yes" then
		set ans to (the1 / the2)
		display dialog ans with title "Answer" buttons {"OK"} default button 1
		say ans
	else
		delay 1
		say "You haven't selected a function. The operation has cancelled."
	end if
	
end tell