
Create Procedure dbo.spGetCustomerOrdersByDateRange
	@StartDate Date,
	@EndDate Date
AS
SELECT Customers.CustomerID, Customers.CompanyName, Orders.OrderDate, 
	   [Order Details].UnitPrice, [Order Details].Quantity
FROM   Customers INNER JOIN
			Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
			[Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderDate BETWEEN '19970101' AND '19970131'
ORDER BY Orders.OrderDate
