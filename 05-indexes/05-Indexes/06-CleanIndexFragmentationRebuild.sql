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

CREATE NONCLUSTERED INDEX NCIX_FullName ON Employee
(
	LastName, 
	FirstName
) --WITH (FILLFACTOR = 70); 70% gives 30% room to grow for the data, don't want to give too much room bc that bloats the disk
-- Job can dynamically trigger a rebuild / fill factor 
GO

 --*****************************
 --Step Two; Check Fragmentation
 --*****************************
 --From object Explorer Point and Click on index and got to properties: Fragmentation - fullness / page fragmentation
 
--******************************
--Step Three; DML insert/update that will cause fragmentation 
--*****************************
INSERT INTO Employee VALUES ('Jason', 'Bourne', '20190101');
GO 1000

SELECT * FROM Employee;

--*****************************
--Step Four -Check Fragmentation
--*****************************
--From obect Explorer Point and Click When the page fills the the page will be splitting
UPDATE Employee 
	SET FirstName = '1234567890123456789012345'

SELECT * FROM Employee;
--*****************************
--Step Five - Fix Fragment Allocation Issue
--*****************************
ALTER INDEX NCIX_FullName ON Employee REBUILD WITH (FILLFACTOR = 70);
GO
 --*****************************
 --Step Four -Check Fragmentation
 --*****************************
 --From obect Explorer Point and Click
 DROP TABLE Employee;