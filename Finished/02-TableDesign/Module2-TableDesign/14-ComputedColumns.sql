Use LabData;
Go

Create Table Employee 
(
	EmployeeId int Identity(1,1),
	FirstName varchar(25),
	LastName Varchar(25),
	FullName As (FirstName + ' ' + LastName) Persisted
);

Insert Into Employee (FirstName, LastName) Values('Mickey','Mouse');
Insert Into Employee (FirstName, LastName) Values('Minnie','Mouse');

Select * From Employee;

Drop Table Employee;