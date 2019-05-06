Use LabData;
Go

Create Table Employee 
(
	EmployeeId int,
	FirstName varchar(25),
	LastName Varchar(25),
	Age int
);

Select * From Employee;

--Add Field
Alter Table Employee
	Add Title varchar(50);

--Modify the Type
Alter Table Employee
	Alter Column EmployeeId BigInt;

Select * From Employee;

--Remove Age
Alter Table Employee
	Drop Column Age;

Select * From Employee;

Drop Table Employee;