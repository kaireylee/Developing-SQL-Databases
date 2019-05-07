USE LabData;
GO
--Step One
--------------------
CREATE TYPE Social
	FROM VARCHAR(9)

GO

CREATE TYPE UnitPrice
	FROM DECIMAL(5,2) 

CREATE TABLE Employee 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	[FirstName] VARCHAR(25) NOT NULL,
	[LastName] VARCHAR(25) NOT NULL,
	SSN Social,
	Sales UnitPrice
);
GO


INSERT INTO Employee(FirstName, LastName, SSN, Sales)
	VALUES('Frodo', 'Baggins', '123456789', 123.58);

INSERT INTO Employee(FirstName, LastName, SSN, Sales)
	VALUES('Samwise', 'Gamgee', '123456789', 143.58);

SELECT * FROM Employee; 
DELETE FROM Employee; --Truncate does not save records whereas Delete stores history in logs


--Step Two / Rename vs Dropping
DROP TABLE Employee;

--All tables that involve this datatype must be dropped migrate table SSIS
EXEC sp_Rename 'Social','SocialSecurity','USERDATATYPE';
EXEC sp_droptype SocialSecurity;
EXEC sp_droptype UnitPrice;
--------------------

