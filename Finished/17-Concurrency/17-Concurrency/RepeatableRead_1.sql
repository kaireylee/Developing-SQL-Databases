Use ConcurrencyLab;
Go
--The REPEATABLE READ isolation level is similar to the READ COMMITTED isolation level, 
--  in that it guarantees the output of uncommitted transactions won't be read by other 
--  concurrent transactions.

-- 1st
--SET TRANSACTION ISOLATION LEVEL Read Committed;

--2nd
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;


SET NOCOUNT ON
GO
BEGIN TRAN
SELECT  EmpID, EmpName, EmpSalary
FROM    dbo.TestIsolationLevels 
WHERE   EmpID = 2900

WAITFOR DELAY '00:00:10'
SELECT  EmpID, EmpName, EmpSalary
FROM    dbo.TestIsolationLevels 
WHERE   EmpID = 2900

COMMIT