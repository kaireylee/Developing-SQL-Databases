Use LabData;
Go

Create Table Course 
(
	ID int Identity(100,10),
	CourseCode int Not Null Unique,
	[Description] varchar(max),
	Year int Not Null
		Check (Year Between 2017 and 2020)
);

Alter Table Course 
	Add Price SmallMoney

Alter Table Course
	Add Check (Price>=0)

Drop Table Course;
