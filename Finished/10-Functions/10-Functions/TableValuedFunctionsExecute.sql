Use Northwind;
Go

Select * From Labs.fnTopProductsBySupplier(2);

Select s.SupplierID, s.CompanyName, p.ProductName, p.UnitPrice
From Suppliers As s
	Cross Apply labs.fnTopProductsBySupplier(s.SupplierID) p
