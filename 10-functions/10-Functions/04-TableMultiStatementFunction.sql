USE Northwind;
GO

If Object_ID('Labs.fnGetLastOrders','FN') IS Not Null
	Drop Function Labs.fnGetLastOrders;
Go

-----------------------------------------------------
--Get Last Orders By Date
-----------------------------------------------------






SELECT o.OrderID, o.CustomerID, p.ProductName, o.OrderDate, od.Quantity,od.UnitPrice
		FROM Orders o 
			INNER JOIN [Order Details] od
				ON o.OrderID = od.OrderID
			INNER JOIN Products p 
				ON od.ProductID = p.ProductID
		WHERE o.OrderDate = (
                        Select Max(md.OrderDate)
                        FROM Orders As md)