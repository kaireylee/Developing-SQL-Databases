
Use ConcurrencyLab;
Go

Set Transaction Isolation Level Read Committed;
GO

SELECT EmpID, EmpName, EmpSalary
FROM dbo.TestIsolationLevels
WHERE EmpID = 2900