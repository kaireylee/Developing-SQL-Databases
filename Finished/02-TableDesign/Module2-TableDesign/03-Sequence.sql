Use LabData;

CREATE SEQUENCE ID AS int
	START WITH 1
	INCREMENT BY 1;
	--START WITH 100
	--INCREMENT BY 10;
Go


CREATE TABLE SequenceKeys
(
	ID int,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    PRIMARY KEY (ID)
)
GO

INSERT INTO SequenceKeys(ID, FirstName, LastName)
VALUES
	(NEXT VALUE FOR ID, 'Mickey','Mouse'),
	(NEXT VALUE FOR ID, 'Minnie','Mouse');
GO

Select * From SequenceKeys;

Drop Table SequenceKeys;
Drop Sequence ID;



