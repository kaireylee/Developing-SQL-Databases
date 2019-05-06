Use Northwind;
Go

Create View vwCustomerOrdersUSA
As 
	Select c.CustomerID, 
		   c.CompanyName,
		   c.Country, 
		   Convert(VarChar(10),o.OrderDate,101) As OrderDate, 
		   od.UnitPrice, 
		   od.Quantity,
		   od.UnitPrice + od.Quantity as TotalSale,
		   p.ProductName
	From Customers As c 
		Inner Join Orders As o On c.CustomerID = o.CustomerID
		Inner Join [Order Details] As od On o.OrderID = od.OrderID
		Inner Join Products As p On od.ProductID = p.ProductID
	Where c.Country = 'USA';
Go

Select * From vwCustomerOrdersUSA;

--Drop View vwCustomerOrdersUSA;