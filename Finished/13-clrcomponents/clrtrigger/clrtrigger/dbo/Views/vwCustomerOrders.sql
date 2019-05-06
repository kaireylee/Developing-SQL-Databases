Create View dbo.vwCustomerOrders
With SchemaBinding
As
	Select Customers.CustomerID,  Customers.CompanyName, 
		   Orders.OrderID, Orders.OrderDate
	From dbo.Customers 
		Inner Join dbo.Orders On Customers.CustomerID = Orders.CustomerID;

GO
CREATE UNIQUE CLUSTERED INDEX [CustomerOrders_Index]
    ON [dbo].[vwCustomerOrders]([CustomerID] ASC, [OrderID] ASC);

