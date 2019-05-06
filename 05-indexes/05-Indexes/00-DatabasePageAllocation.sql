Use Northwind;
Go

-- Examine data page allocations in the following tables using the 
-- new DMF sys.dm_db_database_page_allocations
SELECT *
FROM sys.dm_db_database_page_allocations(db_id('Northwind'), 
object_id('Order_Details'), 1, null, 'DETAILED')
WHERE page_type_desc = 'DATA_PAGE'
Order By extent_page_id;
