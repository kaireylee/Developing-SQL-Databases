Use Northwind;
Go

--Step One Create a Catalog

CREATE FULLTEXT CATALOG NorthwindCatalog
GO

CREATE UNIQUE INDEX EmployeeNotes ON Employees(EmployeeID);
GO

--Step two Create FullText Index
CREATE FULLTEXT INDEX ON Employees(Notes Language 1033)
	KEY INDEX EmployeeNOtes ON NorthwindCatalog
GO

SELECT EmployeeId, NOtes
FROM Employees
WHERE CONTAINS(Notes, 'Degree')