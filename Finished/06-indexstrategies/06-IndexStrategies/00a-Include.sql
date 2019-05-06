Use Northwind;
Go

/*
With Include:
=====================================================================
When an index is used, the index key is used to navigate through the index 
pages to the correct index data page.

If the index has INCLUDE columns, that data is IMMEDIATELY AVAILABLE should the query need it.
*/

CREATE NONCLUSTERED INDEX idx_ProdCat 
  ON Products(ProductID, CategoryID)
  INCLUDE (ProductName); --Covered w/o sorting 

--      index       index     Retieve but not sort
SELECT ProductId, CategoryID, ProductName
FROM Products
WHERE CategoryID = 5; 

--DROP INDEX idx_ProdCat ON Products;  
