USE LabData;
GO

CREATE SEQUENCE Course_Sequence
AS INT
	START WITH 100
	Increment BY 10;
GO

CREATE TABLE NextSequenceTable
(
	RowID INT IDENTITY PRIMARY KEY,
	CourseNo INT UNIQUE NOT NULL,
	[Desc] VARCHAR(MAX)
);
GO

INSERT INTO NextSequenceTable --no field list as long as the order is correct 
	VALUES (NEXT VALUE FOR Course_Sequence, 'Programming SQL'); 

INSERT INTO NextSequenceTable 
	VALUES (NEXT VALUE FOR Course_Sequence, 'Querying SQL'); 

INSERT INTO NextSequenceTable 
	VALUES (NEXT VALUE FOR Course_Sequence, 'SQL Administration'); 

SELECT * FROM NextSequenceTable;

DROP TABLE NextSequenceTable;
DROP SEQUENCE Course_Sequence; 