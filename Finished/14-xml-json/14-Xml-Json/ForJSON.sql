Use Northwind;
Go

Select EmployeeId, FirstName, LastName, Title, HireDate
From Employees
For JSON Path, Root('Employees')

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
 
SELECT * FROM OPENJSON(@JSONText);
SELECT * FROM OPENJSON(@JSONText, '$.Order');
SELECT * FROM OPENJSON(@JSONText, '$.Product');
 