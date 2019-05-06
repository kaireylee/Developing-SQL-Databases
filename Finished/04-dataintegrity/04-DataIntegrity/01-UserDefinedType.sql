USE LabData;
GO
--Step One
--------------------
CREATE TYPE Social
	FROM varchar(9);
Go
Create Type UnitPrice
	From Decimal(5,2);
Go 

CREATE TABLE Employee
(
Id INT Identity(1,1) Primary Key,
Name nvarchar(30),
Ssn Social NOT NULL,
Sales UnitPrice
);
GO

INSERT INTO Employee(Name, Ssn, Sales) 
	VALUES('Mickey Mouse','911122233',123.56);
INSERT INTO Employee(Name, Ssn, Sales) 
	VALUES('Donald Duck','944455566',1999.99);

SELECT * FROM Employee;

--Step Two
--------------------
DROP TABLE Employee
EXEC sp_Rename 'Social','SocialSec','USERDATATYPE';
EXEC sp_DropType SocialSec;
EXEC sp_DropType UnitPrice;

GO

