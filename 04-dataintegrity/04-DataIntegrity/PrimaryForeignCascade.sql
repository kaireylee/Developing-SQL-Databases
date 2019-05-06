Use LabData;
Go

Create Table Orders
(
	OrderId int Not Null,
	OrderDate DateTime Not Null
Constraint Pk_Orders Primary Key(
	OrderId Asc
));

Create Table OrderDetails 
(
	OrderDetailID int Not Null,
	OrderID Int Not Null,
	Quantity smallmoney not Null,
	Price smallmoney not null
Constraint Pk_OrderDetails Primary Key
(
	OrderDetailID asc
));

Alter Table OrderDetails Add Constraint
	Fk_Orderdetails Foreign Key(OrderID)
	References Orders(OrderID)
--On Delete Cascade
--On Update Cascade;
Go

INSERT INTO Orders (OrderID, OrderDate)
SELECT 1, '2017-01-01'
UNION ALL
SELECT 2, '2017-03-31'
UNION ALL
SELECT 3, '2017-04-01'

INSERT INTO OrderDetails
	(OrderDetailID,OrderID,Quantity,Price)
	SELECT 1, 1, 2, 200
	UNION ALL
	SELECT 2, 1, 1, 100
	UNION ALL
	SELECT 3, 1, 5, 111
	UNION ALL
	SELECT 4, 2, 1, 200
	UNION ALL
	SELECT 5, 3, 2, 100
	UNION ALL
	SELECT 6, 3, 3, 100
	UNION ALL
	SELECT 7, 3, 1, 200

SELECT *
	FROM Orders
SELECT *
	FROM OrderDetails
	
--Cascade Delete
--DELETE
--	FROM Orders
--	WHERE OrderID = 1

--Update Orders
--	Set OrderID = 10 Where OrderID = 1;

SELECT *
	FROM Orders;
SELECT *
FROM OrderDetails;

DROP TABLE OrderDetails;
DROP TABLE Orders;