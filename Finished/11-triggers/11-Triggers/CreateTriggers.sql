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

Create Trigger trgAfterUpdate On CourseQuestion
After Update 
As
Begin
	Declare @Course VarChar(50) = 'Updated Record / After Update Trigger';
	Insert Into CourseQuestionAnswered (Course,Question,Answer)
		Select
			@Course + i.Course, i.Question, i.Answer
		From inserted i;
End
Go

Create Trigger trgAfterDelete On CourseQuestion
After Delete
As
Begin
	Declare @Course VarChar(50) = 'Deleted Record / After Delete Trigger';
	Insert Into CourseQuestionAnswered (Course,Question,Answer)
		Select
			@Course + d.Course, d.Question, d.Answer
		From deleted d;
End
Go