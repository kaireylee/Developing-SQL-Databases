Use LabData;
Go

Create Table CourseQuestion
(
	ID Int Identity(1,1) Primary Key,
	Course VarChar(50),
	Question Varchar(Max),
	Answer VarChar(Max)	
);

Create Table CourseQuestionAnswered
(
	ID Int Identity(1,1) Primary Key,
	Course VarChar(50),
	Question Varchar(Max),
	Answer VarChar(Max)	
);
Go

Create Table CourseQuestionDeleted
(
	ID Int Identity(1,1) Primary Key,
	Course VarChar(50),
	Question Varchar(Max),
	Answer VarChar(Max)	
);
Go

CREATE TRIGGER trgUpdateQuestion ON CourseQuestion
	AFTER Update
AS 
	BEGIN
		DECLARE @Course varchar(50) = 'Updated Record for ';
		INSERT INTO CourseQuestionAnswered(Course, Question, Answer)
			SELECT @Course + i.Course, i.Question, i.Answer
			FROM inserted AS i --sql server table that has a buffer of inserted records
	END
GO

CREATE TRIGGER trgDeleteQuestion ON CourseQuestion
	AFTER Delete
AS 
	BEGIN
		DECLARE @Course varchar(50) = 'Deleted Record for ';
		INSERT INTO CourseQuestionDeleted(Course, Question, Answer)
			SELECT @Course + d.Course, d.Question, d.Answer
			FROM deleted AS d --sql server table that has a buffer of deleted records
	END
GO
