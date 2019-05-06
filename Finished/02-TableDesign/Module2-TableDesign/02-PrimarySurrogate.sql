USE LabData;
GO
----Create Test Table for with default columns values
CREATE TABLE PrimarySurrogateKeys
(
	EmployeeID int identity(1,1),
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    PRIMARY KEY (EmployeeID)
)
GO

INSERT INTO PrimarySurrogateKeys(LastName, FirstName)
VALUES ('Mouse', 'Mickey');
Select SCOPE_IDENTITY() As LatestID;

Select * From PrimarySurrogateKeys

Drop Table PrimarySurrogateKeys;
GO
