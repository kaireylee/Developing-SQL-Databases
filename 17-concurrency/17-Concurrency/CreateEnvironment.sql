use LabData;
go

-- init
SET NOCOUNT OFF
ALTER DATABASE LabData SET READ_COMMITTED_SNAPSHOT ON
GO
CREATE TABLE dbo.TestIsolationLevels (
	EmpID INT NOT NULL,
	EmpName VARCHAR(100),
	EmpSalary MONEY
	CONSTRAINT pk_EmpID PRIMARY KEY(EmpID) )
GO
INSERT INTO dbo.TestIsolationLevels 
	VALUES 
	(2322, 'Dave Smith', 35000),
	(2900, 'John West', 22000),
	(2219, 'Melinda Carlisle', 40000),
	(2950, 'Adam Johns', 18000) 
GO