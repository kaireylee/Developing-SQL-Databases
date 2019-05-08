USE Northwind;
GO

DECLARE @CategoryName varchar(50) = 'Condiments';
DECLARE @ID int = [Labs].[fnGetCategoryID]('Condiments');

SELECT 
	@CategoryName AS Category,
	Convert(varchar, [Labs].[fnTotalOnOrder](@ID), 1) AS TotalOrderValue;

GO

DROP FUNCTION [Labs].[fnTotalOnOrder];
DROP FUNCTION [Labs].[fnGetCategoryID];