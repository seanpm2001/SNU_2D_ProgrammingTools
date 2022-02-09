IF DATEPART(dw, GETDATE()) = 7 OR DATEPART(dw, GETDATE()) = 1
BEGIN
   PRINT 'It is the weekend.';
   PRINT 'Get some rest on the weekend!';
END;
ELSE
BEGIN
   PRINT 'It is a weekday.';
   PRINT 'Get to work on a weekday!';
END;
