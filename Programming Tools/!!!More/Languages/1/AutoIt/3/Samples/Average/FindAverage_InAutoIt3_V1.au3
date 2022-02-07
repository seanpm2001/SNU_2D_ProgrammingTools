; Find Average by JohnOne, modified by czardas
#include <MsgBoxConstants.au3>

_Example() ; Run the example.

Func _Example()
    ; Display an input box and ask the user to enter some numbers separated by commas.
    Local $sInput = InputBox("Find Average", "Enter some numbers separated by commas: 1,2,42,100,3")

	; If an error occurred then exit the script.
	If @error Then Exit

    ; Populate an array with the user's input.
    Local $aSplit = StringSplit($sInput, ",")

    ; Pass the array to the function _Find_Average() and then check for errors.
    Local $fAverage = _Find_Average($aSplit)
    If @error Then Exit

    ; Display the result in a message box.
    MsgBox($MB_OK, "Find Average", "Result: " & $fAverage)
EndFunc   ;==>_Example

Func _Find_Average($aArray)
    ; If the input is not of the correct type (an array), then return an error along with the details.
    If Not IsArray($aArray) Then Return SetError(1, 0, VarGetType($aArray))
	; More detailed checks are possible, but for brevity just one is performed here.

    ; Declare a variable to store the sum of the numbers.
    Local $iArraySum = 0

    ; Loop through the array.
    For $i = 1 To $aArray[0]
        ; Increment the sum by the number in each array element.
        $iArraySum += Number($aArray[$i])
    Next

    ; Return the average rounded to 2 decimal places.
    Return Round($iArraySum / $aArray[0], 2)
EndFunc   ;==>_Find_Average

