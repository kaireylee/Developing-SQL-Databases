USE Northwind
GO

SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Title,
	HomePhone,
	HireDate	
FROM Employees
ORDER BY LastName, FirstName
FOR XML AUTO;

GO 

--Turn fields into attributes not elements
SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Title,
	HomePhone,
	HireDate	
FROM Employees
ORDER BY LastName, FirstName
FOR XML RAW('Employee'), ROOT('Employees'), ELEMENTS;

--SCHEMA to show data types
GO

SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Title,
	HomePhone,
	HireDate	
FROM Employees
ORDER BY LastName, FirstName
FOR XML RAW('Employee'), ROOT('Employees'), ELEMENTS, XMLSCHEMA;
