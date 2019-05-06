Use LabData;
Go

--Temporary Table
-- # Local
-- ## Global
Create Table #Employee 
(
	EmployeeId int,
	FullName varchar(25)
);
Go

Insert Into #Employee (EmployeeID,FullName) Values (1,'Mickey Mouse');
Insert Into #Employee (EmployeeID,FullName) Values (2,'Minnie Mouse');
Insert Into #Employee (EmployeeID,FullName) Values (3,'Donald Duck');

Select * From #Employee;

Drop Table #Employee;