USE Northwind
GO

--Select Statement
GO

 SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Title,
	HomePhone,
	HireDate	
FROM Employees
ORDER BY LastName, FirstName
FOR JSON AUTO; 

DECLARE   @JSONText NVARCHAR(MAX)
SET   @JSONText = N'{
              "Order":{
                     "OrderID":43663,
                     "Status":5,
                     "PONumber":"PO18009186470"
                     },
              "Product":{
                     "ShipDate":"2011-06-07T00:00:00",
                     "ProductID":760
                     }
       }'

SELECT * FROM OpenJson(@JSONText);
SELECT * FROM OpenJson(@JSONText, '$.Order'); --$ represents the object


