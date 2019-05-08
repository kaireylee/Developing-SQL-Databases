Use Northwind;
Go
IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'Labs.spDivideNumbers') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure Labs.spDivideNumbers;
Go

ALTER PROCEDURE Labs.spDivideNumbers
	@nom AS INT = 0,
	@denom AS INT = 0
AS
	BEGIN TRY
		DECLARE @total INT = (@nom/@denom)		
		SELECT 
			@nom AS Nominator,
			@denom AS Denominator,
			@total AS Result
	END TRY
	BEGIN CATCH
		SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_MESSAGE() AS ErrorMessage,
			ERROR_SEVERITY() AS ErrorSeverity, --1-10 informational 11-16 user coding error 
			ERROR_PROCEDURE() AS ErrorProcedure
	END CATCH
GO

EXEC Labs.spDivideNumbers @denom=0, @nom=10
EXEC Labs.spDivideNumbers 10, 2
