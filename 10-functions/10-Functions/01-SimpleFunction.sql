Use Northwind;
Go

IF Object_ID('Labs.[fnMultiplyNumbers]','FN') IS Not Null
	DROP FUNCTION Labs.[fnMultiplyNumbers];
GO

CREATE FUNCTION [Labs].[fnMultiplyNumbers]
(
    @n1 int,
	@n2 int
)
RETURNS int
AS
	BEGIN

		RETURN @n1 * @n2

	END
GO 

DECLARE @Result int;
SELECT @Result = Labs.[fnMultiplyNumbers](4, 2)

DROP FUNCTION Labs.[fnMultiplyNumbers];