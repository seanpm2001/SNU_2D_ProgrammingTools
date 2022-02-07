; Make available a library of constant values.
#include <MsgBoxConstants.au3>

; Display a message box with a timeout of 6 seconds.
MsgBox($MB_OK, "Attention", "Avoid touching the keyboard or mouse during automation.", 6)

; Run the Windows Calculator.
Run("calc.exe")

; Wait for the calculator to become active with a timeout of 10 seconds.
WinWaitActive("[CLASS:CalcFrame]", "", 10)

; If the calculator did not appear after 10 seconds then exit the script.
If WinExists("[CLASS:CalcFrame]") = 0 Then Exit

; Automatically type the current year into the calculator.
Send(@YEAR)

; Let's slow the script down a bit so we can see what's going on.
Sleep(600)

; Automatically type in 'divide by 4', and then sleep 600 ms.
Send("/4")
Sleep(600)

; Hit the return key to display the result, and sleep 600 ms.
Send("{ENTER}")
Sleep(600)

; Copy the result to the clipboard using the Windows shortcut Ctrl+C.
Send("^c")

; Declare, and assign the contents of the clipboard to, a variable.
Local $fResult = ClipGet()

; Check to see if the variable contains a decimal point or not.
If StringInStr($fResult, ".") Then
    ; Display a message box with a timeout of 5 seconds.
    MsgBox($MB_OK, "Leap Year", @YEAR & " is not a leap year.", 5)
Else
    ; This message will only display if the current year is a leap year.
    MsgBox($MB_OK, "Leap Year", @YEAR & " is a leap year.", 5)
EndIf

; Close the Windows calculator - always tidy up afterwards.
WinClose("[CLASS:CalcFrame]")

