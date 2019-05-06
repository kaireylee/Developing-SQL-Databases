Use LabData;
Go

Create Schema Marketing;
Go
Create Schema HR;
Go

Create Table General(GeneralID int);
Create Table Marketing.Events(EventID int);
Create Table HR.Employees (EmployeeID int);
Go

--Transfer General Table From .dbo to .HR
------------------------------------------
exec sp_tables;
Alter Schema HR Transfer dbo.General;
exec sp_tables;

Drop Table HR.General;

Drop Table Marketing.Events;
Drop Schema Marketing;

Drop Table Hr.Employees;
Drop Schema Hr;

