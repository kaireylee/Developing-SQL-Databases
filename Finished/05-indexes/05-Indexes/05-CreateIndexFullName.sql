USE LabData;
GO

CREATE TABLE Person
(
	PersonID int Identity(1,1),
	FirstName VarChar(25) NOT NULL,
	LastName VarChar(25) NOT NULL,
	Address VarChar(50) NULL,
	City VarChar(25) NULL,
	State VarChar(2) NOT NULL,
	ZipCode VarChar(25) NULL,
    PRIMARY KEY (PersonID)
)
GO

CREATE NONCLUSTERED INDEX [FullName_Index] ON [dbo].[Person]
(
	[LastName] ASC,
	[FirstName] ASC
); 
GO

--DROP INDEX [FullName_Index] ON Person;
--Drop Table Employee;