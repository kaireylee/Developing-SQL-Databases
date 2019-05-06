
CREATE FUNCTION dbo.fnCustomersDateOrdersDateRange
	(@StartDate as Date,
	 @EndDate as Date) 
RETURNS TABLE 
AS 
RETURN  
	(SELECT c.CompanyName, o.OrderDate, 
				(od.UnitPrice*od.Quantity) As TotalSale
	 FROM Customers As c 
		Inner Join Orders As o on c.CustomerID = o.CustomerID
		Inner Join [Order Details] As od on o.OrderID = od.OrderID
	 WHERE o.OrderDate Between @StartDate AND @EndDate); 
