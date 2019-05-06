
Create Procedure Labs.spGetCustomerOrdersByDate
	@StartDate Date,
	@EndDate Date,
	@Total int = null --Optional
As
Begin		
	IF(@Total Is Null)
		Select c.CustomerID,
			   c.CompanyName,
				   o.OrderId,
				   Convert(VarChar(10),o.OrderDate,101) As OrderDate,
				   od.UnitPrice,
				   od.Quantity,
				   od.UnitPrice + od.Quantity As TotalPrice
			From Customers c
				Inner Join Orders o On c.CustomerID = o.CustomerID
				Inner Join [Order Details] od On o.OrderID = od.OrderID
			Where OrderDate Between @StartDate And @EndDate
			Order By OrderDate Desc 
	Else
		Select Top(@Total) 
		   c.CustomerID,
		   c.CompanyName,
			   o.OrderId,
			   Convert(VarChar(10),o.OrderDate,101) As OrderDate,
			   od.UnitPrice,
			   od.Quantity,
			   od.UnitPrice + od.Quantity As TotalPrice
		From Customers c
			Inner Join Orders o On c.CustomerID = o.CustomerID
			Inner Join [Order Details] od On o.OrderID = od.OrderID
		Where OrderDate Between @StartDate And @EndDate
		Order By OrderDate Desc 
End
