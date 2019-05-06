Use Northwind
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

--Modify View
Alter View vwCustomerOrdersUSA
As 
	Select c.CustomerID, 
		   c.CompanyName,
		   c.Region,
		   c.Country,
		   o.OrderID, 
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

Create View vwCustomerOrdersSouthAmerica
As 
	Select c.CustomerID, 
		   c.CompanyName,
		   c.Region,
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
	Where c.Region In('SP','RJ');
Go

--Use Views
Select * From vwCustomerOrdersUSA
Order By Region, CompanyName;

Select * From vwCustomerOrdersSouthAmerica
Order By Region, CompanyName;

exec sp_help vwCustomerOrdersUSA;

Drop View vwCustomerOrdersUSA;
Drop View vwCustomerOrdersSouthAmerica;