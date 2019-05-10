Use LabData; 
Go


BEGIN TRAN
INSERT INTO dbo.TestIsolationLevels 
	VALUES (3427, 'Phantom Employee', 30000)
COMMIT

--DELETE FROM TestIsolationLevels
--WHERE EmpID = 3427