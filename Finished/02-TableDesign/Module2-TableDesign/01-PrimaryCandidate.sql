USE Schools;
GO
----Create Test Table for with default columns values
CREATE TABLE PrimaryCandidateKeys
(
	EmployeeID int,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    PRIMARY KEY (EmployeeID)
)
GO

INSERT INTO PrimaryCandidateKeys(EmployeeID, LastName, FirstName)
VALUES (100, 'Mouse', 'Mickey');

Select * From PrimaryCandidateKeys

Drop Table PrimaryCandidateKeys;
GO

