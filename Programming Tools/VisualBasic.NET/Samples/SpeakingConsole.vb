Module Module1
    Private Voice = CreateObject("Sapi.Spvoice")
    Private Text As String

    Sub Main()
        Console.Write("Enter the text to speak: ") ' Say "Enter the text to speak: "
        Text = Console.ReadLine() ' The user must enter the text to speak.
        Voice.Speak(Text) ' Speak the text the user has entered.
    End Sub
End Module