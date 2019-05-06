Use Northwind;
Go

If Object_ID('Labs.fnTotalOnOrder','FN') IS Not Null
	Drop Function Labs.fnTotalOnOrder;
Go
If Object_ID('Labs.fnGetCategoryID','FN') IS Not Null
	Drop Function Labs.fnGetCategoryID;
Go
