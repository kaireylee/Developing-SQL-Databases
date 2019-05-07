USE LabData;
GO

/*
	Clustered Index creates a uniform way of sorting the data
	Nonclustered allows for increases in efficiency in searches and filtering 
*/

CREATE TABLE dbo.Employee 
(
	EmployeeID INT IDENTITY PRIMARY KEY, --Primary Key Automatically creates a clustered index
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

--ALTER INDEX NCIX_FullName ON Employee DISABLE if the index is not effective and is taking up space
--ALTER INDEX NCIX_FullName ON Employee REBUILD re-enable index
DROP INDEX NCIX_HireDate ON EMPLOYEE;
DROP INDEX NCIX_FullName ON EMPLOYEE; --dropping table will drop everything

DROP TABLE Employee;