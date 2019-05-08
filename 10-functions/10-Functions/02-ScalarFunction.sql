USE Northwind;
GO

IF Object_ID('Labs.fnTotalOnOrder','FN') IS Not Null
	DROP FUNCTION Labs.fnTotalOnOrder;
GO
IF Object_ID('Labs.fnGetCategoryID','FN') IS Not Null
	DROP FUNCTION Labs.fnGetCategoryID;
GO

CREATE FUNCTION [Labs].[fnTotalOnOrder](@CategoryID int)
RETURNS smallmoney
AS
	BEGIN
		DECLARE @Total smallmoney;
		SELECT @Total = Sum(UnitPrice * UnitsOnOrder)
		FROM Products p
		WHERE CategoryID = @CategoryID;

		IF(@Total IS NULL)
		BEGIN
			SET @Total = 0;
		END
		RETURN @Total;
	END
GO

CREATE FUNCTION [Labs].[fnGetCategoryID](@CategoryName varchar(50))
RETURNS int
AS
	BEGIN
		RETURN 
		(
			SELECT c.CategoryID
			FROM Categories c
			WHERE CategoryName = @CategoryName
		)
	END
GO
