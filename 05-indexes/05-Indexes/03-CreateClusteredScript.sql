USE LabData;  
GO  

CREATE TABLE dbo.CustomerClustered --heap with unique identifier default newid = creates new guid for user
(
	CustomerID INT IDENTITY PRIMARY KEY,
	CompanyName VARCHAR(25),
	FirstName VARCHAR(25),
	LastName VARCHAR(25)
);

GO 
 
CREATE TABLE dbo.EmployeeClustered --heap with unique identifier default newid = creates new guid for user
(
	EmployeeID INT,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	HireDate SMALLDATETIME
);

--Insert records
INSERT INTO EmployeeClustered
	VALUES(104, 'Bilbo', 'Baggins', '2019-01-04');
INSERT INTO EmployeeClustered
	VALUES(102, 'Samwise', 'Gamgee', '2019-01-04');
INSERT INTO EmployeeClustered
	VALUES(103, 'Gandalf', 'Grey', '2019-01-04');

SELECT * FROM EmployeeClustered;

-- Create a clustered index 
CREATE CLUSTERED INDEX Employee_Index
	ON dbo.EmployeeClustered(EmployeeID);

INSERT INTO EmployeeClustered
	VALUES(101, 'Legolas', 'Greenleaf', '2019-01-04');

SELECT * FROM EmployeeClustered; 

--Drop Table EmployeeClustered;
DROP TABLE EmployeeClustered;
DROP TABLE CustomerClustered;


