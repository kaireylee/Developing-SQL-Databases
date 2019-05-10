---READ COMMITTED will block untill committed Data. 
Use LabData;
Go

BEGIN TRAN
	UPDATE  TestIsolationLevels 
	SET     EmpSalary = 30000
	WHERE   EmpID = 2900

--RollBack
Commit
