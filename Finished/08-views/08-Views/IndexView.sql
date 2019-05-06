Use Northwind;
Go

Create View dbo.vwCustomerOrders
With SchemaBinding
As
	Select Customers.CustomerID,  Customers.CompanyName, 
		   Orders.OrderID, Orders.OrderDate
	From dbo.Customers 
		Inner Join dbo.Orders On Customers.CustomerID = Orders.CustomerID;
Go

Create unique Clustered Index CustomerOrders_Index
	On dbo.vwCustomerOrders(CustomerID,OrderId)

Select * From vwCustomerOrders;
Drop View vwCustomerOrders;
 