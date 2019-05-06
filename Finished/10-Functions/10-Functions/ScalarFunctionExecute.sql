Use Northwind;
Go

Select CategoryName,
	   Labs.fnTotalOnOrder(CategoryID) As TotalOnOrder
From Categories

Select Labs.fnTotalOnOrder(Labs.fnGetCategoryID('Beverages'));
