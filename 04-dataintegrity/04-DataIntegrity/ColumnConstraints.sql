--Business logic / rules that can be applied to the data also called constraints
USE LabData;
GO

CREATE TABLE Course
(
	ID INT IDENTITY(100,10) PRIMARY KEY,
	CourseCode VARCHAR(7) NOT NULL UNIQUE, --Entity Integrity
	[Description] VARCHAR(MAX)
	Price SMALLMONEY CHECK (Price >= 0 AND Price < 1000) Domain Integrity,
	Active BIT DEFAULT 1,
	Deleted BIT DEFAULT 0 --A way to save previously deleted data
);

--ALTER TABLE Course
--	ADD Price SMALLMONEY; 

--ALTER TABLE Course
--	ADD CHECK (Price >= 0 AND Price < 1000);

GO

INSERT INTO Course (CourseCode, [Description], Price)
	VALUES('SQL-123', 'SQL Development', 10022);	 

INSERT INTO Course (CourseCode, [Description], Price)
	VALUES('CSH-123', 'C# Programming', -1);

SELECT * FROM Course; 

DROP TABLE Course;