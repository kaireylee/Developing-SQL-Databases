Use Northwind;
Go

/*
With Include:
=====================================================================
When an index is used, the index key is used to navigate through the index 
pages to the correct index data page.

If the index has INCLUDE columns, that data is IMMEDIATELY AVAILABLE should the query need it.

Included columns can be VarChar(MAX), VarBinary(MAX) or XML data types, 
that you CANNOT ADD as INDEX keys. Computed columns can also be used as included columns. 
*/

