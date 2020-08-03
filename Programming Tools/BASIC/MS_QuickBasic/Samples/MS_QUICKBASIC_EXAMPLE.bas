REM QuickBASIC example

REM Forward declaration - allows the main code to call a
REM    subroutine that is defined later in the source code
DECLARE SUB PrintSomeStars (StarCount!)

REM Main program follows
INPUT "What is your name: ", UserName$
PRINT "Hello "; UserName$
DO
   INPUT "How many stars do you want: ", NumStars
   CALL PrintSomeStars(NumStars)
   DO
      INPUT "Do you want more stars? ", Answer$
   LOOP UNTIL Answer$ <> ""
   Answer$ = LEFT$(Answer$, 1)
LOOP WHILE UCASE$(Answer$) = "Y"
PRINT "Goodbye "; UserName$
END

REM subroutine definition
SUB PrintSomeStars (StarCount)
   REM This procedure uses a local variable called Stars$
   Stars$ = STRING$(StarCount, "*")
   PRINT Stars$
END SUB