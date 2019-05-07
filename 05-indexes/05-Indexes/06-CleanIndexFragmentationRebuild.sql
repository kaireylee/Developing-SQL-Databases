USE LabData;
GO
 --****************************
 --Step One; DDL
 --****************************
 CREATE TABLE dbo.Employee 
(
	EmployeeID INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	HireDate SMALLDATETIME
);

GO

CREATE NONCLUSTERED INDEX FullName ON Employee
(
	LastName, 
	FirstName
);

GO

INSERT INTO Employee VALUES ('Jason', 'Bourne', '20190101');
GO 100

SELECT * FROM Employee;

 --*****************************
 --Step Two; Check Fragmentation
 --*****************************
 --From object Explorer Point and Click on index and got to properties: Fragmentation - fullness / page fragmentation
 
--******************************
 --Step Three; DML Update that will cause fragmentation 
 --*****************************

 --*****************************
 --Step Four -Check Fragmentation
 --*****************************
 --From obect Explorer Point and Click

--*****************************
--Step Five - Fix Fragment Allocation Issue
--*****************************

 --*****************************
 --Step Four -Check Fragmentation
 --*****************************
 --From obect Explorer Point and Click
 DROP TABLE Employee;