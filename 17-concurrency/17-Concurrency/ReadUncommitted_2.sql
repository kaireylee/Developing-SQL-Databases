Use LabData;
Go

Set Transaction Isolation Level Read Uncommitted;
GO

SELECT EmpID, EmpName, EmpSalary
FROM dbo.TestIsolationLevels
WHERE EmpID = 2900