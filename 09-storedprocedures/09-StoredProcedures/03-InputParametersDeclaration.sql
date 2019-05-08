Use Northwind;
GO
IF EXISTS ( SELECT * FROM   sysobjects 
            WHERE  id = object_id(N'Labs.spGetCustomerOrdersByDate') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
	Drop Procedure Labs.spGetCustomerOrdersByDate;
Go

ALTER PROCEDURE Labs.spGetCustomerOrdersByDate 
    @StartDate Date,
    @EndDate Date,  
	@Top int = NULL --becomes and Optional variable
AS
	BEGIN
		IF(@Top IS NOT NULL)
			SELECT TOP(@Top)
				c.CustomerID,
				c.CompanyName,
				o.OrderID,
				Convert(varchar, o.OrderDate, 101) AS OrderDate,
				od.UnitPrice,
				od.Quantity,
				(od.UnitPrice * od.Quantity) AS TotalSale
			FROM Customers c
				INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				INNER JOIN [Order Details] od on o.OrderID = od.OrderID
			WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
			ORDER BY TotalSale DESC
		ELSE
			SELECT
				c.CustomerID,
				c.CompanyName,
				o.OrderID,
				Convert(varchar, o.OrderDate, 101) AS OrderDate,
				od.UnitPrice,
				od.Quantity,
				(od.UnitPrice * od.Quantity) AS TotalSale
			FROM Customers c
				INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				INNER JOIN [Order Details] od on o.OrderID = od.OrderID
			WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
			ORDER BY TotalSale DESC
	END
GO

EXEC Labs.spGetCustomerOrdersByDate  '19970101', '19970131', 5
EXEC Labs.spGetCustomerOrdersByDate  '19970101', '19970131'