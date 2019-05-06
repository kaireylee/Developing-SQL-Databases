Use LabData;
Go

Create Table Employee (
	EmployeeId int,
	FirstName varchar(25),
	LastName varchar(25),
	Age tinyint
);

Select * From Employee; 
Insert Into Employee (EmployeeId, FirstName, LastName, Age)
	Values (100, 'Robin', 'Hood', 28)
Select * From Employee; 

Alter Table Employee
	Drop Column Age; 

Alter Table Employee
	Add JobTitle varchar(25);

Select * From Employee; 

Alter Table Employee
	Alter Column EmployeeId int;

Drop Table Employee