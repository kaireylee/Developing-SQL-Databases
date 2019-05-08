Use AdventureWorks2016;
Go

SET NOCOUNT ON
GO

CREATE TABLE DemoSalesOrderDetail (
       SalesOrderID int
      ,SalesOrderDetailID int
      ,CarrierTrackingNumber nvarchar(25) NULL
      ,OrderQty smallint
      ,ProductID int
      ,SpecialOfferID int
      ,UnitPrice money
      ,UnitPriceDiscount money
      ,LineTotal numeric(38, 6)
      ,rowguid uniqueidentifier
      ,ModifiedDate datetime
      )
GO

INSERT INTO DemoSalesOrderDetail
SELECT * FROM Sales.SalesOrderDetail
GO 10

--To show that columnstore index does not interfere with regular clustered index
CREATE CLUSTERED INDEX CIX_DemoSales ON DemoSalesOrderDetail(SalesOrderDetailID);

--Columnstore index
CREATE NONCLUSTERED COLUMNSTORE INDEX CSIX_DemoSales
	ON DemoSalesOrderDetail(UnitPrice, OrderQty, ProductID); 

SELECT ProductID, SUM(UnitPrice) SumUnitPrice, AVG(UnitPrice) AvgUnitPrice,
SUM(OrderQty) SumOrderQty, AVG(OrderQty) AvgOrderQty
FROM DemoSalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID
GO

SELECT ProductID, SUM(UnitPrice) SumUnitPrice, AVG(UnitPrice) AvgUnitPrice,
SUM(OrderQty) SumOrderQty, AVG(OrderQty) AvgOrderQty
FROM DemoSalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID
GO
