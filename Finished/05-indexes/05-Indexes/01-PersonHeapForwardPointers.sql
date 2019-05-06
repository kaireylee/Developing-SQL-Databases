USE LabData;
GO
-----------------------------------------------------------
--RUN EACH STEP SEPARATELY
-----------------------------------------------------------
--Step One
----------------------------------------------------------
CREATE TABLE PersonHeap
(
	PersonID uniqueidentifier DEFAULT NEWID(),
	FirstName VarChar(25) NOT NULL,
	LastName VarChar(25) NOT NULL,
	Address VarChar(50) NULL,
	City VarChar(25) NULL,
	State VarChar(2) NOT NULL,
	ZipCode VarChar(25) NULL,
)
GO
Exec spForwardPointers 'PersonHeap';

--Step Two
----------------------------------------------------------
INSERT INTO PersonHeap VALUES
(NewID(), 'Mickey', 'Mouse', '123 Main Street', 'Sacramento', 'CA', '95830');
GO 1000
Select Top 10 * From PersonHeap

Exec spForwardPointers 'PersonHeap';

--Step Three
----------------------------------------------------------
UPDATE PersonHeap
SET Address = '123456789012345678901234567890', City= '1234567890123456789012345'
WHERE LastName = 'Mouse';
GO
Select Top 10 * From PersonHeap

Exec spForwardPointers 'PersonHeap';


--Step Four / Fix Forward Pointers
---------------------------------------------------------
Alter table PersonHeap rebuild
Exec spForwardPointers 'PersonHeap';

Drop Table PersonHeap
