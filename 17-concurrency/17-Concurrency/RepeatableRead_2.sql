Use LabData;
Go

BEGIN TRAN
UPDATE  dbo.TestIsolationLevels 
SET     EmpSalary = 13000
WHERE   EmpID = 2900
COMMIT