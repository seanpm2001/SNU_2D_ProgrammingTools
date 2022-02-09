-- begin transaction
BEGIN TRAN;

BEGIN TRY
   -- execute each statement
   INSERT INTO MYTABLE(NAME) VALUES ('ABC');
   INSERT INTO MYTABLE(NAME) VALUES ('123');

   -- commit the transaction
   COMMIT TRAN;
END TRY
BEGIN CATCH
   -- roll back the transaction because of error
   ROLLBACK TRAN;
END CATCH;
