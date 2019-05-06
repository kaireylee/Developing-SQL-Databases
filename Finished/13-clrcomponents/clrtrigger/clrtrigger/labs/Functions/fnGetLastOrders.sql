
-----------------------------------------------------
--Get Last Orders By Date
-----------------------------------------------------
CREATE FUNCTION Labs.fnGetLastOrders()
RETURNS @CustomerOrder TABLE
    (
    SaleOrderID INT			NOT NULL,
    CustomerID  varchar(5)	NOT NULL,
	ProductName varchar(50) NULL,
    OrderDate   DATETIME    NOT NULL,
    Quantity    INT         NOT NULL,
	Price		smallMoney  NOT NULL
    )
AS
BEGIN
    INSERT @CustomerOrder
		SELECT o.OrderID, o.CustomerID, p.ProductName, o.OrderDate, od.Quantity,od.UnitPrice
		FROM Orders o 
			INNER JOIN [Order Details] od
				ON o.OrderID = od.OrderID
			INNER JOIN Products p 
				ON od.ProductID = p.ProductID
		WHERE o.OrderDate = (
                        Select Max(md.OrderDate)
                        FROM Orders As md)
    RETURN
END
