Public Module StarsProgram
   Private Function Ask(prompt As String) As String
      Console.Write(prompt)
      Return Console.ReadLine()
   End Function

   Public Sub Main()
      Dim userName = Ask("What is your name: ")
      Console.WriteLine("Hello {0}", userName)

      Dim answer As String

      Do
         Dim numStars = CInt(Ask("How many stars do you want: "))
         Dim stars As New String("*"c, numStars)
         Console.WriteLine(stars)

         Do
            answer = Ask("Do you want more stars? ")
         Loop Until answer <> ""
      Loop While answer.StartsWith("Y", StringComparison.OrdinalIgnoreCase)

      Console.WriteLine("Goodbye {0}", userName)
   End Sub
End Module