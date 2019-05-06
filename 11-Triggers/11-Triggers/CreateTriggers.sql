Use LabDB;
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
