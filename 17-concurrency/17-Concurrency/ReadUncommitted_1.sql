---READ UNCOMMITTED is the most optimistic concurrency isolation option 
--  available in SQL Server. It allows a transaction to get the value in a 
--  row even when locks are present on the row/object or it hasn't yet been committed to disk. 
Use LabData;
Go

BEGIN TRAN
	UPDATE  TestIsolationLevels 
	SET     EmpSalary = 30000
	WHERE   EmpID = 2900

--RollBack