USE Northwind
GO

--Select Statement

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
 

 