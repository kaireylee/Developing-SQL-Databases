USE LabData;
GO

CREATE TABLE dbo.Employee 
(
	EmployeeID INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	HireDate SMALLDATETIME
);

CREATE NONCLUSTERED INDEX NCIX_HireDate ON Employee
(
	HireDate
);

CREATE NONCLUSTERED INDEX NCIX_FullName ON Employee
(
	LastName,
	FirstName
); 

DROP INDEX NCIX_HireDate ON EMPLOYEE;
DROP INDEX NCIX_FullName ON EMPLOYEE; --dropping table will drop everything

DROP TABLE Employee;