USE LabData;
GO
 --****************************
 --Step One; DDL
 --****************************
 CREATE TABLE FragPerson
(
	PersonID int Identity(1,1),
	FirstName VarChar(50) NOT NULL,
	LastName VarChar(50) NOT NULL,
	City VarChar(50) NULL,
	State VarChar(2) NOT NULL,
	ZipCode VarChar(25) NULL,
    PRIMARY KEY (PersonID)
)
GO

CREATE NONCLUSTERED INDEX [FullName_Index] ON [dbo].FragPerson
(
	[LastName] ASC,
	[FirstName] ASC
) With (FillFactor = 70); 
GO 
 --*****************************
 --Step Two; Check Fragmentation
 --*****************************
 --From obect Explorer Point-and-Click

 
--******************************
 --Step Three; DML
 --*****************************
INSERT INTO FragPerson VALUES
('Mickey', 'Mouse', 'Sacramento', 'CA', '95830')
GO 1000

Select * From  FragPerson;

 --*****************************
 --Step Four -Check Fragmentation
 --*****************************
 --From obect Explorer Point-and-Click
 UPDATE FragPerson
SET LastName = '123456789012345678901234567890'
WHERE LastName = 'Mouse';
Select * From  FragPerson;

--*****************************
--Step Five - Fix Fragment Allocation Issue
--*****************************
ALTER INDEX FullName_Index ON FragPerson REBUILD With (FillFactor = 70);
GO

 --*****************************
 --Step Four -Check Fragmentation
 --*****************************
 --From obect Explorer Point and Click

 Drop Table FragPerson;