USE LabData;
GO
-----------------------------------------------------------
--RUN EACH STEP SEPARATELY
-----------------------------------------------------------
--Step One
----------------------------------------------------------
CREATE TABLE PersonHeap --every table is a heap the raw form in which data is entered
(
	PersonID UNIQUEIDENTIFIER DEFAULT NewID(),
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	City VARCHAR(25),
	[State] CHAR(2)
);
GO

EXEC spForwardPointers 'PersonHeap'

--CRUD Create Read Update Delete, Pages will be filled what happens when the page has more data than it can hold

--Step Two insert data
----------------------------------------------------------
Insert Into PersonHeap Values
(NewID(), 'Frodo', 'Baggins', 'Sacramento', 'CA');
GO 1000

EXEC spForwardPointers 'PersonHeap'
SELECT TOP(20) * FROM PersonHeap;

--Step Three Update to max
----------------------------------------------------------
UPDATE PersonHeap 
	SET City = '1234567890123456789012345';
EXEC spForwardPointers 'PersonHeap'
SELECT TOP(20) * FROM PersonHeap;

--Step Four / Fix Forward Pointers
---------------------------------------------------------
ALTER TABLE PersonHeap REBUILD; --Do not want to be doing this too often it is very intensive
EXEC spForwardPointers 'PersonHeap'; 

--Drop Table
DROP TABLE PersonHeap;